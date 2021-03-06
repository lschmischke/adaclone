with Gtk;            use Gtk;
with Gtk.Main;       use Gtk.Main;
with Glib.Error;     use Glib.Error;
with Gtk.Widget;     use Gtk.Widget;
with Gtk.Button;     use Gtk.Button;
with Ada.Text_IO;
with Gtkada.Builder; use Gtkada.Builder;
with Glib; use Glib;
with Glib.Error; use Glib.Error;
with Gtk.Window; use Gtk.Window;
with ServerGuiCallbacks; use ServerGuiCallbacks;
with Gtk.Main; use Gtk.Main;
with Gtk.Button; use Gtk.Button;
with Glib;           use Glib;
with Glib.Object;    use Glib.Object;
with Ada.Text_IO; use Ada.Text_IO;
with Gtk.GEntry; use Gtk.GEntry;
with Gtk.Status_Bar; use Gtk.Status_Bar;
with Gtk.Tree_View;            use Gtk.Tree_View;
with Glib.Values; use Glib.Values;
with Gtk.Tree_Model;           use Gtk.Tree_Model;
with Gtk.Tree_Selection;       use Gtk.Tree_Selection;
with Gtk.Tree_Sortable;        use Gtk.Tree_Sortable;
with Gtk.Tree_Store;           use Gtk.Tree_Store;
with Gtk.Tree_View_Column;     use Gtk.Tree_View_Column;
with Gtk.Scrolled_Window; use Gtk.Scrolled_Window;
with Gtk.Tree_Selection;       use Gtk.Tree_Selection;
with Gtk.Tree_Sortable;        use Gtk.Tree_Sortable;
with Gtk.Cell_Renderer_Text;   use Gtk.Cell_Renderer_Text;
with Gtk.Frame; use Gtk.Frame;
with Gtk.Cell_Renderer_Toggle; use Gtk.Cell_Renderer_Toggle;
with Gtk.Text_View;
with Gtk.Enums;                use Gtk.Enums;
use Gtk; with Gtk;
with Gtk.Handlers;             use Gtk.Handlers;
with ServerGuiCallbacks; use ServerGuiCallbacks;
with GUI_to_Server_Communication; use GUI_to_Server_Communication;
with Concrete_Server_Gui_Logic;

package body ServerGuiEntryPoint is

   procedure  ServerGuiEntryPoint is
      -- Ben�tigte Variablen
      Builder : Gtkada_Builder;
      ret : GUint;
      error : aliased GError;
      Win   : Gtk_Window;

      -- Server2: GUI_to_Server_Communication.Server
   begin
      -- GTK initialisieren und Glade Datei laden
      Gtk.Main.Init;
      Gtk_New (Builder);
      ret := Builder.Add_From_File ("server\ServerGui.glade", error'Access);

      -- Fehler abfangen
      if Error /= null then
         Ada.Text_IO.Put_Line ("Error : " & Get_Message (Error));
         Error_Free (Error);
         return;
      end if;
      -- Callbacks hinzuf�gen
      Register_Handler
        (Builder      => Builder,
         Handler_Name => "Main_Quit", -- from XML file <signal handler=..>
         Handler      => ServerGuiCallbacks.Quit'Access);


      Register_Handler
        (Builder      => Builder,
         Handler_Name => "clicked_button_server_start",
         Handler      => ServerGuiCallbacks.clicked_button_server_start'Access);
      Register_Handler
        (Builder      => Builder,
         Handler_Name => "clicked_button_server_stop",
         Handler      => ServerGuiCallbacks.clicked_button_server_stop'Access);
      Register_Handler
        (Builder      => Builder,
         Handler_Name => "kickUser",
         Handler      => ServerGuiCallbacks.kickSelectedUser'Access);

      Register_Handler
        (Builder      => Builder,
         Handler_Name => "clearChat",
         Handler      => ServerGuiCallbacks.clearChat'Access);




      Do_Connect (Builder);


      -- GUI Referenzen in der concrete_server_Gui_logic und der ServerGuiCallbacks setzen
      Concrete_Server_Gui_Logic.InitServerGui(myBuilder => Builder);
      ServerGuiCallbacks.InitializeGuiReferences(myBuilder => Builder);
      --  Find our main window, then display it and all of its children.
      -- Hauptfenster laden
      Win := Gtk_Window (Builder.Get_Object ("main_window_server"));
      -- Fenster anzeigen
      Win.Show_All;
      -- Ausf�hren
      Gtk.Main.Main;



      -- Builder freigeben da �bergeben & nicht mehr ben�tigt
      Unref (Builder);



   end ServerGuiEntryPoint;

end ServerGuiEntryPoint;

