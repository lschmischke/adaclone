with Gtk.Main; use Gtk.Main;
with Gtk.Button; use Gtk.Button;
with Glib;           use Glib;
with Glib.Object;    use Glib.Object;

with Ada.Text_IO; use Ada.Text_IO;
with Gtk.GEntry; use Gtk.GEntry;
with Gtk.Status_Bar; use Gtk.Status_Bar;
with Gtk.Tree_View;            use Gtk.Tree_View;
with Glib.Values; use Glib.Values;
with Gtk.Cell_Renderer_Text;   use Gtk.Cell_Renderer_Text;
with Gtk.Frame; use Gtk.Frame;
with Gtk.Cell_Renderer_Toggle; use Gtk.Cell_Renderer_Toggle;
with Gtk.Text_View;

use Gtk; with Gtk;
with Gtk.Enums; use Gtk.Enums;
with Gtk.List_Store; use Gtk.List_Store;
with Gtk.Tree_View; use Gtk.Tree_View;
with Gtk.Tree_Model; use Gtk.Tree_Model;
with Gtk.Tree_Store; use Gtk.Tree_Store;
with Gtk.Tree_View_Column; use Gtk.Tree_View_Column;
with Gtk.Cell_Renderer_Text; use Gtk.Cell_Renderer_Text;
with Gtk.Tree_Selection; use Gtk.Tree_Selection;
with Gtk.Scrolled_Window; use Gtk.Scrolled_Window;
with Gtk.Menu; use Gtk.Menu;
with Gtk.Spin_Button; use Gtk.Spin_Button;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with dataTypes; use dataTypes;

with Gtk.Text_View; use Gtk.Text_View;
with Gtk.Combo_Box; use Gtk.Combo_Box;

with Gtk.Menu_Tool_Button; use Gtk.Menu_Tool_Button;
--------------------------------

with Gtk.Text_Mark; use Gtk.Text_Mark;
with Gtk.Text_Buffer; use Gtk.Text_Buffer;
with Gtk.Text_Iter; use Gtk.Text_Iter;

with Gtk.Menu_Item; use Gtk.Menu_Item;
with GNAT.Sockets; use GNAT.Sockets;

with GNAT;use GNAT;

with Ada.Calendar; use Ada.Calendar;
with GNAT.Calendar.Time_IO;

with Gtk.Label; use Gtk.Label;
with Ada.Characters.Latin_1;
with Ada.Containers; use ada.Containers;
package body Concrete_Server_Gui_Logic is

   PortGEntry : Gtk_GEntry;

   InformationsTreeView : Gtk_Tree_View;
   InformationsListStore: Gtk_List_Store;
   InformationsTreeViewIterator: Gtk_Tree_Iter;

   ErrorsTreeView: Gtk_Tree_View;
   ErrorsListStore: Gtk_List_Store;
   ErrorsTreeViewIterator: Gtk_Tree_Iter;

   ChatMessageListStore: Gtk_List_Store;
   ChatMessageListStoreIterator: Gtk_Tree_Iter;
   ChatMessageTreeView: Gtk_Tree_View;

   SecondLevelIterator: Gtk_Tree_Iter;
   --Val: Gint;




   OnlineUserTreeStore: Gtk_Tree_Store;
   OnlineUserTreeView: Gtk_Tree_View;
   OnlineUserTreeIter: Gtk_Tree_Iter;

   KickUserListStore : Gtk_List_Store;
   KickUserComboBox :Gtk_Combo_Box;

   ChatroomTreeView : Gtk_Tree_View;
   ChatroomTreeStore :Gtk_Tree_Store;

   LabelStats: Gtk_Label;



   --------------------------------------------------------------------------------------------------------------------------------------------------------

   procedure printErrorMessage(thisGUI :  aliased in Server_Gui; errorMessage : String)
   is

      iter: Gtk_Text_Iter;
      Now : Time := Clock;
   begin
      ErrorsListStore.Insert(Iter => ErrorsTreeViewIterator,
                             Position => 0);
      ErrorsListStore.Set(Iter   => ErrorsTreeViewIterator,
                          Column => 0,
                          Value  => "(" & GNAT.Calendar.Time_Io.Image (Now, "%H:%M:%S") &") " &errorMessage);

   end printErrorMessage;
   --------------------------------------------------------------------------------------------------------------------------------------------------------
   procedure printInfoMessage(thisGUI : aliased in Server_Gui; infoMessage : String) is
      Now : Time := Clock;
   begin
      InformationsListStore.Insert(Iter => InformationsTreeViewIterator ,
                                   Position => 0);
      InformationsListStore.Set(Iter   => InformationsTreeViewIterator,
                                Column => 0,
                                Value  =>"(" & GNAT.Calendar.Time_Io.Image (Now, "%H:%M:%S") &") " & infoMessage);

   end printInfoMessage;
   --------------------------------------------------------------------------------------------------------------------------------------------------------
   procedure printChatMessage(thisGUI : aliased  in Server_Gui; chatMessage : MessageObject) is
      Now : Time := Clock;
   begin
      ChatMessageListStore.Append(Iter => ChatMessageListStoreIterator);
      ChatMessageListStore.Set(Iter   => ChatMessageListStoreIterator,
                               Column => 0,
                               Value  =>"(" & GNAT.Calendar.Time_Io.Image (Now, "%H:%M:%S") &") " & To_String(chatMessage.sender) & " -> " & Natural'Image(chatMessage.receiver) &": "  &To_String(chatMessage.content));

   end printChatMessage;
   --------------------------------------------------------------------------------------------------------------------------------------------------------
   procedure updateNumberOfContacts(thisGUI : aliased in Server_Gui; numberOfContact : Natural) is null;
   --------------------------------------------------------------------------------------------------------------------------------------------------------
   procedure updateOnlineUserOverview(thisGUI : aliased in Server_Gui; viewComponents : userViewOnlineList.List) is
      ContactsIterator : Gtk_Tree_Iter;
      SingleContactIterator: Gtk_Tree_Iter;
      IpAddressIterator: Gtk_Tree_Iter;
      TempIter: Gtk_Tree_Iter;
      ChatroomIterator: Gtk_Tree_Iter;
      SingleChatroomIterator: Gtk_Tree_Iter;
   begin

      OnlineUserTreeStore.Clear;
      KickUserListStore.Clear;



      For client of viewComponents loop
            OnlineUserTreeIter := Null_Iter;
            ContactsIterator := Null_Iter;
            SingleContactIterator := Null_Iter;

            OnlineUserTreeStore.Append(Iter   => OnlineUserTreeIter,
                                       Parent => Null_Iter );
            OnlineUserTreeStore.Set(Iter   => OnlineUserTreeIter,
                                    Column => 0 ,
                                    Value  => To_String(client.getUsernameOfClient));

            OnlineUserTreeStore.Append(Iter   => IpAddressIterator,
                                       Parent => OnlineUserTreeIter);
            OnlineUserTreeStore.Set(Iter   => IpAddressIterator,
                                    Column => 0,
                                    Value  => "IP-Adresse: " & Gnat.Sockets.Image(client.getSocketAddress) );


            KickUserListStore.Append(Iter => TempIter);
            KickUserListStore.Set(Iter   => TempIter,
                                  Column => 0,
                                  Value  => To_String(client.getUsernameOfClient));

            OnlineUserTreeStore.Append(Iter   => ContactsIterator,
                                       Parent => OnlineUserTreeIter);
            OnlineUserTreeStore.Set(Iter   => ContactsIterator,
                                    Column => 0,
                                    Value  => "Kontakte");


            For contact of client.getUser.getContacts loop
               OnlineUserTreeStore.Append(Iter   => SingleContactIterator,
                                          Parent => ContactsIterator);
               OnlineUserTreeStore.Set(Iter   => SingleContactIterator,
                                       Column =>0 ,
                                       Value  => To_String(contact.getUsername) );

            end loop;

            OnlineUserTreeStore.Append(Iter   => ChatroomIterator,
                                       Parent => OnlineUserTreeIter);
            OnlineUserTreeStore.Set(Iter   => ChatroomIterator,
                                    Column => 0,
                                    Value  => "Chatrooms");

            For chatroom of client.getChatroomList loop
               OnlineUserTreeStore.Append(Iter   => SingleChatroomIterator,
                                          Parent => ChatroomIterator);
               OnlineUserTreeStore.Set(Iter   => SingleChatroomIterator,
                                       Column =>0 ,
                                       Value  => Natural'Image(chatroom.getChatRoomID) );

            end loop;

      end loop;

       LabelStats.Set_Label(Str =>"Users online: " & Count_Type'Image(viewComponents.Length) & Ada.Characters.Latin_1.LF &"Server is running" );

   end updateOnlineUserOverview;
   --------------------------------------------------------------------------------------------------------------------------------------------------------
   procedure updateOfflineUserOverview(thisGUI : aliased in Server_Gui; viewComponents : userViewOfflineMap.Map)is null;
   --------------------------------------------------------------------------------------------------------------------------------------------------------
   procedure InitServerGui(myBuilder: Gtkada_Builder) is begin
      PortGEntry := Gtk_GEntry(myBuilder.Get_Object("config_port"));
      PortGEntry.Set_Text("12321");

      ChatMessageTreeView := Gtk_Tree_View(myBuilder.Get_Object("chatMessagesTreeView"));
      ChatMessageListStore := Gtk_List_Store(myBuilder.Get_Object("chatMessageListStore"));

      InformationsListStore := Gtk_List_Store(myBuilder.Get_Object("liststoreInformations"));
      InformationsTreeView := Gtk_Tree_View(myBuilder.Get_Object("treeviewInformations"));

      ErrorsListStore := Gtk_List_Store(myBuilder.Get_Object("liststoreErrors"));
      ErrorsTreeView := Gtk_Tree_View(myBuilder.Get_Object("treeviewErrors"));
      OnlineUserTreeView := Gtk_Tree_View(myBuilder.Get_Object("treeviewOnlineUser"));
      OnlineUserTreeStore := Gtk_Tree_Store(myBuilder.Get_Object("treestoreOnlineUser"));
      KickUserListStore := Gtk_List_Store(myBuilder.Get_Object("liststoreKickUser"));
      KickUserComboBox := Gtk_Combo_Box(myBuilder.Get_Object("comboboxKickUser"));

      ChatroomTreeStore := Gtk_Tree_Store(myBuilder.Get_Object("treestoreChatrooms"));
      ChatroomTreeView := Gtk_Tree_View(myBuilder.Get_Object("treeviewChatrooms"));

      LabelStats := Gtk_Label(myBuilder.Get_Object("labelStats"));


   End InitServerGui;

   procedure updateChatroomOverview(thisGUI : aliased in Server_Gui; viewComponents : chatRoomMap.Map) is
      ChatroomIter: Gtk_Tree_Iter;
      UserIter: Gtk_Tree_Iter;
   begin
      ChatroomTreeStore.Clear;
      for room of viewComponents loop
         ChatroomTreeStore.Append(Iter   => ChatroomIter,
                                  Parent => Null_Iter);
         ChatroomTreeStore.Set(Iter   => ChatroomIter,
                               Column => 0,
                               Value  => Natural'Image(room.getchatroomid));
         for user of room.getclientlist loop
            ChatroomTreeStore.Append(Iter   => UserIter,
                                     Parent => ChatroomIter );
            ChatroomTreeStore.Set(Iter   => UserIter,
                                  Column => 0 ,
                                  Value  => To_String(user.getUsernameOfClient) );
         end loop;
      end loop;
   end updateChatroomOverview;
end Concrete_Server_Gui_Logic;

