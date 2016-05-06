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
with Gtk.Tool_Button; use Gtk.Tool_Button;
with Concrete_Server_Gui_Logic; use Concrete_Server_Gui_Logic;
with Concrete_Server_Logic; use Concrete_Server_Logic;
with GUI_to_Server_Communication; use GUI_to_Server_Communication;
with Server_To_GUI_Communication; use Server_To_GUI_Communication;
with Gtk.Text_View; use Gtk.Text_View;

--------------------------------

with Gtk.Text_Mark; use Gtk.Text_Mark;
with Gtk.Text_Buffer; use Gtk.Text_Buffer;
with Gtk.Text_Iter; use Gtk.Text_Iter;
with Gtk.Combo_Box; use Gtk.Combo_Box;
package body ServerGuiCallbacks is




   --PortGEntry : Gtk_GEntry;
   --InformationsTreeView : Gtk_Tree_View;
   --InformationsTreeStore: Gtk_Tree_Store;
   InformationsTreeViewIterator: Gtk_Tree_Iter;
   SecondLevelIterator: Gtk_Tree_Iter;
   --UserContextMenu: Gtk_Menu;
   --Val: Gint;
   Toolbutton_Server_Stop: Gtk_Tool_Button;
   Toolbutton_Server_Start: Gtk_Tool_Button;
   Port_Edit_Text: Gtk_Entry;
   MyServer: ServerPtr := new Concrete_Server;
   MyGui: GUIPtr := new Server_Gui;
   OnlineUserTreeView: Gtk_Tree_View;


OnlineUserTreeStore: Gtk_Tree_Store;

   KickUserComboBox: Gtk_Combo_Box;
    KickUserListStore: Gtk_List_Store;



   procedure InitializeGuiReferences(myBuilder: access Gtkada_Builder_Record'Class) is begin
      Toolbutton_Server_Start := Gtk_Tool_Button(myBuilder.Get_Object("toolbutton_start_server"));
      Toolbutton_Server_Stop := Gtk_Tool_Button(myBuilder.Get_Object("toolbutton_stop_server"));
      Port_Edit_Text := Gtk_Entry(myBuilder.Get_Object("config_port"));
     OnlineUserTreeView := Gtk_Tree_View(myBuilder.Get_Object("treeviewOnlineUser"));
      OnlineUserTreeStore := Gtk_Tree_Store(myBuilder.Get_Object("treestoreOnlineUser"));
       KickUserListStore := Gtk_List_Store(myBuilder.Get_Object("liststoreKickUser"));
       KickUserComboBox := Gtk_Combo_Box(myBuilder.Get_Object("comboboxKickUser"));
      end InitializeGuiReferences;




   procedure Quit (Object : access Gtkada_Builder_Record'Class) is
      pragma Unreferenced (Object);
   begin
      Gtk.Main.Main_Quit;
   end Quit;

 procedure rowHandler ( Object : access Gtkada_Builder_Record'Class) is
      pragma Unreferenced (Object);
   begin
      Put_Line("ROW");
   end rowHandler;





   procedure clicked_button_about ( Object : access Gtkada_Builder_Record'Class) is

   begin



  Put_Line("Todo");

   end clicked_button_about;

   procedure clicked_button_server_start ( Object : access Gtkada_Builder_Record'Class) is begin
      MyServer.startServer(ipAdress => "127.0.0.1",
                         port     => Integer'Value(Port_Edit_Text.Get_Text));
       MyGui.printInfoMessage("Server started!");
      Toolbutton_Server_Start.Set_Sensitive(Sensitive => False);
      Toolbutton_Server_Stop.Set_Sensitive(Sensitive => True);
   end clicked_button_server_start;

   procedure clicked_button_server_stop ( Object : access Gtkada_Builder_Record'Class) is begin
       MyServer.stopServer;
       MyGui.printInfoMessage("Server stopped!");
      Toolbutton_Server_Start.Set_Sensitive(Sensitive => True);
      Toolbutton_Server_Stop.Set_Sensitive(Sensitive => False);
      end clicked_button_server_stop;

   procedure kickSelectedUser ( Object : access Gtkada_Builder_Record'Class) is
      selection : Gtk_Tree_Selection;
      selectedIter : Gtk_Tree_Iter;
      selectedModel : Gtk_Tree_Model;
   begin
      Put_Line(KickUserComboBox.Get_Active_Text);
     selection := Gtk_Tree_Selection(Object.Get_Object("treeview-selection3"));
      selection.Get_Selected(selectedModel, selectedIter);


   Put_Line("Kick!");
   end kickSelectedUser;







end ServerGuiCallbacks;
