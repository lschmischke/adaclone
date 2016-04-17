package body Concrete_Server_Logic is

   Server : Concrete_Server_Ptr;

-----------------------------------------------------------------------------

   procedure StartServer (This : in out Concrete_Server_Ptr) is
   begin
      -- # Erzeugte Serverintanz global setzen, damit sie im Package ueberall bekannt ist #
      Server := This;

      -- # Datenbank laden #
      User_Databases.loadUserDatabase (Server.UserDatabase);
      Put_Line ("User database loadad.");

      --#Sockets aufbauen
      InitializeServer (This);

      --# Infrastruktur aufsetzen

   end StartServer;

   -----------------------------------------------------------------------------

   function getNextChatRoomID (server : in out Concrete_Server_Ptr) return Natural is
      id : Natural;
   begin
      id                       := server.chatRoomIDCounter;
      server.chatRoomIDCounter := server.chatRoomIDCounter + 1;
      return id;
   end getNextChatRoomID;

-----------------------------------------------------------------------------

   procedure InitializeServer (This : in out Concrete_Server_Ptr) is
      SubServer      : Concrete_Client_Ptr := new Concrete_Client;
      connectMessage : MessageObject;
   begin

      -- # Erzeugung und Konfiguration des Server-Sockets #
      Create_Socket (Socket => Server.Socket);
      -- this.SocketAddress.Family := Gnat.Sockets.Family_Inet; -- Diskriminanten-Fehler, ka wie loesen!
      Server.SocketAddress.Addr := Inet_Addr ("127.0.0.1");
      Server.SocketAddress.Port := 12321;
      Bind_Socket (Socket => Server.Socket, Address => Server.SocketAddress);
      Listen_Socket (Socket => Server.Socket);

      -- # Server starten #
      Ada.Text_IO.Put_Line ("Server initialization successful, starting Server Listener Task...");
      Main_Server_Task.Start;

      -- # Erzeugung des SubServer-Sockets #
      Create_Socket (Socket => SubServer.Socket);
      -- # SubServer mit Server verbinden, Server wartet mit Accept - SubServer fragt mit Connect an #

      Connect_Socket (Socket => SubServer.Socket, Server => Server.SocketAddress);
      connectMessage :=
        createMessage
          (messagetype => Protocol.Connect,
           sender      => To_Unbounded_String ("server"),
           receiver    => 0,
           content     => To_Unbounded_String ("passwort"));

      writeMessageToStream (SubServer.Socket, connectMessage);

   exception
      when Error : Socket_Error =>
         Put ("Socket_Error in InitializeServer: ");
         Put_Line (Exception_Information (Error));
      when Error : others =>
         Put ("Unexpected exception in InitializeServer: ");
         Put_Line (Exception_Information (Error));
   end InitializeServer;

-----------------------------------------------------------------------------

   procedure dummy3 (This : in out Concrete_Server_Ptr) is null;

-----------------------------------------------------------------------------

   task body Main_Server_Task is
   begin
      accept Start;

      -- # Abhoerroutine auf Aktivitaet am Server-Socket #
      loop
         declare
            Client : Concrete_Client_Ptr := new Concrete_Client;
         begin
            -- # Auf Verbindungsanfrage warten, annehmen, Client-Socket erzeugen und neue Adresse an diesen binden #
            Ada.Text_IO.Put_Line ("Ready to accept incoming Conncetions...");
            Accept_Socket
              (Server  => Server.Socket,
               Socket  => Client.Socket,
               Address => Client.SocketAddress); -- Blockierender Aufruf
            Ada.Text_IO.Put_Line ("Incoming Connection from " & GNAT.Sockets.Image (Client.SocketAddress) & " accepted");

            -- # Neuen Kommunikationstask f�r Client erzeugen, hinterlegen und starten #
            Client.CommunicationTask := new Client_Task;
            Client.CommunicationTask.Start (Client);
         end;
      end loop;

   exception
      when Error : Socket_Error =>
         Put ("Socket_Error in Main_Server_Task: ");
         Put_Line (Exception_Information (Error));
      when Error : others =>
         Put ("Unexpected exception in Main_Server_Task: ");
         Put_Line (Exception_Information (Error));
   end Main_Server_Task;

-----------------------------------------------------------------------------

   task body Client_Task is
      client       : Concrete_Client_Ptr;
      user         : UserPtr;
      serverRoomID : Integer;
      serverStr    : Unbounded_String := To_Unbounded_String ("server");
   begin

-- # Info: waehrend dieser Aktivierungsphase wird der aufrufende Task blockiert
      accept Start (newClient : Concrete_Client_Ptr) do
         client := newClient;
      end Start; -- Jetzt laeuft dieser erst nebenlaeufig weiter! #

      Ada.Text_IO.Put_Line ("New Client Task for " & GNAT.Sockets.Image (client.SocketAddress) & " successfully started");

      -- InputChannel := Stream(ClientSocket);

      Ada.Text_IO.Put_Line ("Waiting for incoming data from " & GNAT.Sockets.Image (client.SocketAddress) & " ...");

      -- # Abhoerroutine2 auf Aktivitaet am Client-Socket #
      <<Continue>>
      loop
         declare
            incoming_message : MessageObject;
         begin

            -- # Nachricht liegt vor, nun wird diese verarbeitet und interpretiert #
            declare
            begin
               -- # Nachricht wird aus String erstellt #
               incoming_message := readMessageFromStream (ClientSocket => client.Socket);

               --Kann speater raus, Nachricht und deren Laenge anzeigen---------
               Protocol.printMessageToInfoConsole (message => incoming_message);
               Ada.Text_IO.Put_Line (messageObjectToString (incoming_message));
               -----------------------------------------------------------------

               case incoming_message.messagetype is
                  when Protocol.Connect => -- # connect:client:0:<passwort> #
                     declare

                        userNotFoundMessage : MessageObject :=
                          createMessage
                            (messagetype => Protocol.Refused,
                             sender      => serverStr,
                             receiver    => 0,
                             content     => To_Unbounded_String ("user not found in database"));
                        invalidPasswordMessage : MessageObject :=
                          createMessage
                            (messagetype => Protocol.Refused,
                             sender      => serverStr,
                             receiver    => 0,
                             content     => To_Unbounded_String ("invalid passwort"));

                        userpassword : Unbounded_String;
                     begin
                        -- # Pruefe ob Benutzer registriert und Passwort richtig #
                        user := Server.UserDatabase.getUser (username => incoming_message.sender);

                        if user = null then
                           writeMessageToStream (ClientSocket => client.Socket, message => userNotFoundMessage);
                        else
                           userpassword := getPassword (user);
                           if userpassword /= incoming_message.content then
                              writeMessageToStream (client.Socket, invalidPasswordMessage);
                           else
                              --# hole serverroomid zu diesem client vom server
                              declare
				 id                   : Natural       := getNextChatRoomID (Server);
				 chatroom : chatRoomPtr;
                                 connectAcceptMessage : MessageObject :=
                                   createMessage
                                     (messagetype => Protocol.Connect,
                                      sender      => serverStr,
                                      receiver    => id,
                                      content     => To_Unbounded_String ("ok"));

                              begin
                                 serverRoomID := id;
                                 chatRoom := createChatRoom (Server, serverRoomID, client.CommunicationTask);
                                 writeMessageToStream (client.Socket, connectAcceptMessage);
                              end;
                           end if;
                        end if;
                     end;

                  -- # Client in Verwaltungsliste suchen und Usernamen zur speateren Kommunikation setzen #

                  -- # Weise Client eine ServerRoomID zu #
                  -- # setze Client auf online #
                  -- # Sende online-Benachrichtigung an alle Kontakte des Clients#

                  when Protocol.Chat => -- # chat:client:<ChatRoomID>:Hi #

                     -- # Pruefe, ob Client in ChatRoom eingeschrieben #
                     -- # Hole Liste aller Cients in diesem ChatRoom #
                     -- # Sende Nachricht an alle Clients in diesem ChatRoom #

                     null;
                  when Protocol.Disconnect => -- # disconnect:client:<ServerRoomID>:<?> #
                     declare
                        disconnectMessage : MessageObject;
                     begin

                        -- # Pruefe, ob die ServerRoomID die ServerRoomID des Clients ist
                        -- # Sende Disconnect-Bestaetigung
                        disconnectMessage :=
                          createMessage
                            (messagetype => Protocol.Disconnect,
                             sender      => serverStr,
                             receiver    => serverRoomID,
                             content     => To_Unbounded_String ("ok"));
                        writeMessageToStream (client.Socket, disconnectMessage);
                        -- # Schliesse Socket zu Client #
                        -- # Setze User als offline #

                        -- # Sende Offline-Status an alle Kontakte vom Client # #

                     end;
                  when Protocol.Chatrequest => -- # chatrequest:clientA:<ServerRoomID>:clientB #
		     declare
			roomID : Natural := getNextChatRoomID(server);
                        requestingUser : UserPtr := getUser (Server.UserDatabase, incoming_message.sender);
			userToAdd      : UserPtr := getUser (Server.UserDatabase, incoming_message.content);
			clientToAdd : Client_Task_Ptr := server.Connected_Clients.Element(userToAdd);
			requestAcceptMessage : MessageObject := createMessage(messagetype => Protocol.Chatrequest,
							 sender      => serverStr,
							 receiver    => roomID,
							 content     => To_Unbounded_String("ok"));
			chatRoom : chatRoomPtr;
			--#TODO welcher content in requestAcceptMessage?
                     begin
                        chatRoom := createChatRoom
                          (server      => Server,
                           id          => roomID,
			   firstClient => client.CommunicationTask);
			writeMessageToStream(client.Socket,message => requestAcceptMessage);
			addClientToChatroom(room   => chatRoom,
		       client => clientToAdd);
                     end;
                  when Protocol.Leavechat => -- # leavechat:client:<ChatRoomID>:<?> #
                     null;

                  when Protocol.Register => -- # register:<username>:0:<passwort>
                     declare
                        registrationComplete : Boolean;
                        registrationAccepted : MessageObject :=
                          createMessage
                            (messagetype => Protocol.Register,
                             sender      => serverStr,
                             receiver    => 0,
                             content     => To_Unbounded_String ("ok"));
                        registrationFailed : MessageObject :=
                          createMessage
                            (messagetype => Protocol.Register,
                             sender      => serverStr,
                             receiver    => 0,
                             content     => To_Unbounded_String ("name in use"));
                     begin
                        registrationComplete :=
                          Server.UserDatabase.registerUser
                          (username => incoming_message.sender, password => incoming_message.content);
                        if registrationComplete = True then
                           writeMessageToStream (client.Socket, registrationAccepted);
                        else
                           writeMessageToStream (client.Socket, registrationFailed);
                        end if;
                     end;

                  when others => -- # Online/Offline/Userlist/Refused/Invalid/ #
                     null;
               end case;

            end;
         end;
      end loop;

   exception
      when Error : Socket_Error =>
         Put ("Socket_Error in Client_Task: ");
         Put_Line (Exception_Information (Error));
      when Error : others =>
         Put ("Unexpected exception in Client_Task: ");
         Put_Line (Exception_Information (Error));
   end Client_Task;

   ----------------------------------------------------------------------------------------

   function Hash (R : Natural) return Hash_Type is
   begin
      return Hash_Type (R);
   end Hash;

   ----------------------------------------------------------------------------------------

   procedure addClientToChatroom (room : in out chatRoomPtr; client : in Client_Task_Ptr) is
   begin
      room.clientList.Append (client);
   end addClientToChatroom;

   ----------------------------------------------------------------------------------------

   procedure removeClientFromChatroom (room : in out chatRoomPtr; clientToRemove : in Client_Task_Ptr) is
      pos : ClientTask_List.Cursor := room.clientList.Find (Item => clientToRemove);
   begin
      if room.clientList.Contains (clientToRemove) then
         room.clientList.Delete (Position => pos);
      end if;
   end removeClientFromChatroom;

   ----------------------------------------------------------------------------------------

   function createChatRoom (server : in out Concrete_Server_Ptr; id : in Natural; firstClient : in Client_Task_Ptr) return chatRoomPtr is
      room : chatRoomPtr := new chatRoom;
   begin
      room := new chatRoom;
      room.chatRoomID := id;
      addClientToChatroom (room => room, client => firstClient);
      server.chatRooms.Insert (Key => id, New_Item => room);
      return room;

   end createChatRoom;

   ----------------------------------------------------------------------------------------

   function userHash (userToHash : UserPtr) return Hash_Type is
   begin
      return Ada.Strings.Unbounded.Hash (getUsername (userToHash));
   end userHash;

   ----------------------------------------------------------------------------------------

end Concrete_Server_Logic;
