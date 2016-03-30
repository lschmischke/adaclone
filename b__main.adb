pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E117 : Short_Integer; pragma Import (Ada, E117, "system__os_lib_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "system__soft_links_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "system__exception_table_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__containers_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "ada__io_exceptions_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__strings_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__strings__maps_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__tags_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "ada__streams_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "interfaces__c_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__exceptions_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__file_control_block_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__streams__stream_io_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__file_io_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "system__finalization_root_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "ada__finalization_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "system__storage_pools_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__finalization_masters_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "system__storage_pools__subpools_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__assertions_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__pool_global_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "system__secondary_stack_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "ada__strings__unbounded_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "system__strings__stream_ops_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "ada__text_io_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "client_ui_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "communication_objects_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "client_logic_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "communication_objects__files_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "communication_objects__messages_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "communication_objects__messages__connect_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "communication_objects__messages__disconnect_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "communication_objects__messages__refuse_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "data_types_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "communication_objects__messages__userlist_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "data_types_test_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "server_logic_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "server_ui_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E128 := E128 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "communication_objects__messages__userlist__finalize_spec");
      begin
         F1;
      end;
      E130 := E130 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "data_types__finalize_spec");
      begin
         F2;
      end;
      E126 := E126 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "communication_objects__messages__refuse__finalize_spec");
      begin
         F3;
      end;
      E124 := E124 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "communication_objects__messages__disconnect__finalize_spec");
      begin
         F4;
      end;
      E122 := E122 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "communication_objects__messages__connect__finalize_spec");
      begin
         F5;
      end;
      E102 := E102 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "communication_objects__messages__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "communication_objects__files__finalize_spec");
      begin
         E100 := E100 - 1;
         F7;
      end;
      E143 := E143 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "ada__text_io__finalize_spec");
      begin
         F8;
      end;
      E044 := E044 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "ada__strings__unbounded__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__file_io__finalize_body");
      begin
         E113 := E113 - 1;
         F10;
      end;
      E075 := E075 - 1;
      E071 := E071 - 1;
      E135 := E135 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__pool_global__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__storage_pools__subpools__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__finalization_masters__finalize_spec");
      begin
         F13;
      end;
      E106 := E106 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "ada__streams__stream_io__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E008 := E008 + 1;
      Ada.Containers'Elab_Spec;
      E131 := E131 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E084 := E084 + 1;
      Ada.Strings'Elab_Spec;
      E005 := E005 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E083 := E083 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E022 := E022 + 1;
      System.File_Control_Block'Elab_Spec;
      E120 := E120 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E106 := E106 + 1;
      System.Finalization_Root'Elab_Spec;
      E086 := E086 + 1;
      Ada.Finalization'Elab_Spec;
      E081 := E081 + 1;
      System.Storage_Pools'Elab_Spec;
      E088 := E088 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      System.Assertions'Elab_Spec;
      E133 := E133 + 1;
      System.Pool_Global'Elab_Spec;
      E135 := E135 + 1;
      E071 := E071 + 1;
      System.Finalization_Masters'Elab_Body;
      E075 := E075 + 1;
      System.File_Io'Elab_Body;
      E113 := E113 + 1;
      E115 := E115 + 1;
      Ada.Tags'Elab_Body;
      E055 := E055 + 1;
      E048 := E048 + 1;
      System.Soft_Links'Elab_Body;
      E010 := E010 + 1;
      System.Os_Lib'Elab_Body;
      E117 := E117 + 1;
      System.Secondary_Stack'Elab_Body;
      E014 := E014 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E044 := E044 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E104 := E104 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E143 := E143 + 1;
      E099 := E099 + 1;
      Communication_Objects'Elab_Spec;
      E097 := E097 + 1;
      Client_Logic'Elab_Spec;
      E096 := E096 + 1;
      Communication_Objects.Files'Elab_Spec;
      E100 := E100 + 1;
      Communication_Objects.Messages'Elab_Spec;
      E102 := E102 + 1;
      Communication_Objects.Messages.Connect'Elab_Spec;
      E122 := E122 + 1;
      Communication_Objects.Messages.Disconnect'Elab_Spec;
      E124 := E124 + 1;
      Communication_Objects.Messages.Refuse'Elab_Spec;
      E126 := E126 + 1;
      Data_Types'Elab_Spec;
      E130 := E130 + 1;
      Communication_Objects.Messages.Userlist'Elab_Spec;
      E128 := E128 + 1;
      E139 := E139 + 1;
      Server_Logic'Elab_Spec;
      E144 := E144 + 1;
      E146 := E146 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\Daniel Kreck\Documents\adachat\client_ui.o
   --   C:\Users\Daniel Kreck\Documents\adachat\communication_objects.o
   --   C:\Users\Daniel Kreck\Documents\adachat\client_logic.o
   --   C:\Users\Daniel Kreck\Documents\adachat\communication_objects-files.o
   --   C:\Users\Daniel Kreck\Documents\adachat\communication_objects-messages.o
   --   C:\Users\Daniel Kreck\Documents\adachat\communication_objects-messages-connect.o
   --   C:\Users\Daniel Kreck\Documents\adachat\communication_objects-messages-disconnect.o
   --   C:\Users\Daniel Kreck\Documents\adachat\communication_objects-messages-refuse.o
   --   C:\Users\Daniel Kreck\Documents\adachat\data_types.o
   --   C:\Users\Daniel Kreck\Documents\adachat\communication_objects-messages-userlist.o
   --   C:\Users\Daniel Kreck\Documents\adachat\data_types_test.o
   --   C:\Users\Daniel Kreck\Documents\adachat\server_logic.o
   --   C:\Users\Daniel Kreck\Documents\adachat\server_ui.o
   --   C:\Users\Daniel Kreck\Documents\adachat\main.o
   --   -LC:\Users\Daniel Kreck\Documents\adachat\
   --   -LC:\Users\Daniel Kreck\Documents\adachat\
   --   -LD:/gnat/2015/lib/gcc/i686-pc-mingw32/4.9.3/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;