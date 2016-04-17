with Server_Logic; use Server_Logic;
with Protocol; use Protocol;
with GNAT.Sockets; use GNAT.Sockets;
with Ada.Streams; use Ada.Streams;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
with Ada.Containers.Doubly_Linked_Lists;  use Ada.Containers;
with GNAT.String_Split; use GNAT.String_Split;
with Ada.Characters.Conversions;
with User_Databases; use User_Databases;
with dataTypes; use dataTypes;
with ada.containers.Indefinite_Hashed_Maps;
with Ada.Containers.Hashed_Maps;
with Ada.Strings.Unbounded.Hash;


-- Dieses Paket spiegelt die serverseitige Funktionalitaet der Chatanwendung wieder.
package Concrete_Server_Logic is

   -- Typ einer Serverinstanz. Diese haelt als Attribute ihren Socket, IP-Adresse
   -- und Port, sowieso eine Verwaltungsliste von allen angemeldeten  Clients.
   type Concrete_Server is private;
   type Concrete_Server_Ptr is access Concrete_Server;

   -- Diese Prozedur leitet die Initialisierung des Servers ein und startet
   -- diesen anschliessend. Dies bedeutet insbesondere, dass von nun an auf
   -- einkommende Verbindungsanfragen gelauscht wird und fuer neue Clients
   -- separate Tasks zur Verfuegung gestellt werden, die es ihnen ermoeglichen
   -- untereinander zu kommunizieren.
   procedure StartServer(This : in out Concrete_Server_Ptr);

   type Client_Task is limited private;
   type Client_Task_Ptr is access Client_Task;
   package ClientTask_List is new Doubly_Linked_Lists(Element_Type => Client_Task_Ptr);


   type chatRoom is tagged private;
   type chatRoomPtr is access chatRoom;

   procedure addClientToChatroom(room : in out ChatRoomPtr; client : in Client_Task_Ptr);
   procedure removeClientFromChatroom(room : in out chatRoomPtr; clientToRemove : in Client_Task_Ptr);
   function createChatRoom(server : in out Concrete_Server_Ptr; id : in Natural; firstClient : in Client_Task_Ptr) return chatRoomPtr ;


private

    type chatRoom is tagged
      record
	 chatRoomID : Natural;
	 clientList : ClientTask_List.List;
      end record;




   -- Typ einer Clientinstanz. Diese haelt als Attribute ihren Socket, IP-Adresse
   -- und Port, sowieso den Benutzernamen zu dem dieser Client gehoert und
   -- den Client-Task der ihm zugeordnet ist fest.
   type Concrete_Client is record
      Socket : Socket_Type;
      SocketAddress : Sock_Addr_Type;
      CommunicationTask : Client_Task_Ptr;
   end record;
   type Concrete_Client_Ptr is access Concrete_Client;


   -- Jede Instanz dieses Tasks ist pro Client fuer die eigentliche Kommunikation
   -- zwischen den Clients und die Interpretation der Nachrichten zustaendig.
   task type Client_Task is
      entry Start(newClient : Concrete_Client_Ptr);
   end Client_Task;

   function userHash (userToHash : UserPtr) return Hash_Type;
   package Client_List is new Ada.Containers.Hashed_Maps(Key_Type        => UserPtr,
							 Element_Type    => Client_Task_Ptr,
							 Hash            => userHash,
							 Equivalent_Keys => "=");


   function Hash (R : Natural) return Hash_Type;
   package chatRoomMap is new Ada.Containers.Hashed_Maps(Key_Type        => Natural,
						     Element_Type    => chatRoomPtr,
						     Hash            => Hash,
						     Equivalent_Keys => "=");

   -- type Concrete_Server is new Server_Interface with record
   type Concrete_Server is record
     Socket : Socket_Type;
      SocketAddress : Sock_Addr_Type;
      Connected_Clients : Client_List.Map;
      UserDatabase : User_Database;
      chatRoomIDCounter : Natural:= 1;
      chatRooms : chatRoomMap.Map;
   end record;

   -- gibt die n�chste ID f�r den Chatraum
   function getNextChatRoomID( server: in out Concrete_Server_Ptr) return Natural;

   -- Diese Prozedur nimmt eine zuvor erzeuge Serverinstanz entgegen und erstellt
   -- fuer diese einen Server-Socket, welchem eine IP-Adresse und Portnr.
   -- zugewiesen wird.
   procedure InitializeServer(This : in out Concrete_Server_Ptr);

   procedure dummy3(This : in out Concrete_Server_Ptr);

   -- Dieser Task lauscht auf einkommende Verbindungen von neuen Clients und
   -- erstellt fuer diese jeweils einen eigenen Socket und Task, in dem anschliessend
   -- parallel auf Nachrichten jeglicher Art von diesen Clients gelauscht wird.
   -- Die eigentliche Verbindungsanfrage (connect) wird ebenfalls erst in den
   -- Client-Tasks vorgenommen. Hier wird lediglich ein Kanal zur Erstkommunikation
   -- aufgebaut und zur Verfuegung gestellt. Es gibt nur eine Instanz von diesem Task.
   task Main_Server_Task is
      entry Start;
      -- entry Stop;
   end;



end Concrete_Server_Logic;
