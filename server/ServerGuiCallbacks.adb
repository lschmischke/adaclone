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
package body ServerGuiCallbacks is




   PortGEntry : Gtk_GEntry;
   InformationsTreeView : Gtk_Tree_View;
   InformationsTreeStore: Gtk_Tree_Store;
   InformationsTreeViewIterator: Gtk_Tree_Iter;
   SecondLevelIterator: Gtk_Tree_Iter;
   UserContextMenu: Gtk_Menu;
   Val: Gint;








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

   procedure Append_Error (message: String) is
   begin
      InformationsTreeStore.Append(Iter   => InformationsTreeViewIterator,
                       Parent => Null_Iter);
      InformationsTreeStore.Set(Iter   => InformationsTreeViewIterator,
                    Column => 1 ,
                                Value  => "Fehler" );
      InformationsTreeStore.Set(Iter   => InformationsTreeViewIterator,
                    Column => 0 ,
                    Value  => message );
     end Append_Error;

   procedure Append_Information (message: String) is
   begin
      InformationsTreeStore.Append(Iter   => InformationsTreeViewIterator,
                       Parent => Null_Iter);
      InformationsTreeStore.Set(Iter   => InformationsTreeViewIterator,
                    Column => 1 ,
                                Value  => "Information" );
      InformationsTreeStore.Set(Iter   => InformationsTreeViewIterator,
                    Column => 0 ,
                    Value  => message );
     end Append_Information;


   procedure clicked_button_about ( Object : access Gtkada_Builder_Record'Class) is
   begin
      Append_Error("Mein Fehler1!");


   end clicked_button_about;


   procedure InitializeGuiReferences(Builder : access Gtkada_Builder_Record'Class) is
      InitParent: Gtk_Tree_Iter;
   begin
      Put_Line("Init Gui Components");
      PortGEntry := Gtk_GEntry(Builder.Get_Object("config_port"));
      PortGEntry.Set_Text("12321");
      InformationsTreeView := Gtk_Tree_View(Builder.Get_Object("informationsTreeView"));
      InformationsTreeStore := Gtk_Tree_Store(Builder.Get_Object("treestore1"));
      UserContextMenu := Gtk_Menu(Builder.Get_Object("menu1"));

     -- InformationsTreeViewListStore.Append(InformationsTreeViewIterator);
     --InformationsTreeViewListStore.Set(InformationsTreeViewIterator,0,"Test");
     -- Column 1: Nachrichtentyp
     -- Column 0: Nachricht

      InformationsTreeStore.Append(Iter   => SecondLevelIterator,
                       Parent => InformationsTreeViewIterator);
      InformationsTreeStore.Set(Iter   => SecondLevelIterator,
                    Column => 0 ,
                    Value  => "Test456" );





      Put_Line("Initialization complete!");
     end InitializeGuiReferences;








end ServerGuiCallbacks;
