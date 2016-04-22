pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E134 : Short_Integer; pragma Import (Ada, E134, "system__os_lib_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exception_table_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "ada__containers_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "ada__io_exceptions_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "ada__strings_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__strings__maps_E");
   E256 : Short_Integer; pragma Import (Ada, E256, "ada__strings__maps__constants_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__tags_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "ada__streams_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "interfaces__c_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "interfaces__c__strings_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exceptions_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__file_control_block_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "ada__streams__stream_io_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__file_io_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "system__finalization_root_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "ada__finalization_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "system__storage_pools_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__finalization_masters_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "system__storage_pools__subpools_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "system__task_info_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "gnat__secure_hashes_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "gnat__secure_hashes__sha2_common_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "gnat__secure_hashes__sha2_64_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "system__assertions_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__pool_global_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "gnat__sockets_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__pool_size_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__secondary_stack_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "ada__strings__unbounded_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "gnat__sha512_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "gnat__sockets__thin_common_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "gnat__sockets__thin_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "gnat__string_split_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__strings__stream_ops_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "system__tasking__initialization_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "ada__real_time_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "ada__text_io_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "system__tasking__protected_objects_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "system__tasking__protected_objects__entries_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "system__tasking__queuing_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "system__tasking__stages_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "client_logic_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "client_ui_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "datatypes_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "protocol_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "concrete_client_logic_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "serverguicommunication_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "user_databases_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "concrete_server_logic_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "concrete_server_logic__finalize_body");
      begin
         E181 := E181 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "concrete_server_logic__finalize_spec");
      begin
         F2;
      end;
      E247 := E247 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "user_databases__finalize_spec");
      begin
         F3;
      end;
      E126 := E126 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "concrete_client_logic__finalize_spec");
      begin
         F4;
      end;
      E139 := E139 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "datatypes__finalize_spec");
      begin
         F5;
      end;
      E223 := E223 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F6;
      end;
      E128 := E128 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "ada__text_io__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "gnat__sockets__finalize_body");
      begin
         E099 := E099 - 1;
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
         E132 := E132 - 1;
         F10;
      end;
      E075 := E075 - 1;
      E071 := E071 - 1;
      E113 := E113 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__pool_size__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "gnat__sockets__finalize_spec");
      begin
         F12;
      end;
      E120 := E120 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__pool_global__finalize_spec");
      begin
         F13;
      end;
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__storage_pools__subpools__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "system__finalization_masters__finalize_spec");
      begin
         F15;
      end;
      E157 := E157 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "ada__streams__stream_io__finalize_spec");
      begin
         F16;
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
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           True, False, False, False, False, False, False, False, 
           False, False, False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, True, True, False, False, False, 
           False, False, False, True, True, True, False, False, 
           True, False, False, True, True, False, True, True, 
           False, True, True, True, True, False, False, True, 
           False, True, False, False, True, False, True, False, 
           False, True, False, False, False, True, False, False, 
           True, True, False, True, True, False, False, False, 
           True, False, True, True, True, False, False, True, 
           False, False, True, False, True, True, False, True, 
           True, True, False, True, False, False, False, False, 
           False, True, True, False, False, False),
         Count => (0, 0, 0, 0, 0, 1, 1, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, True, False, False, False));
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
      E021 := E021 + 1;
      Ada.Containers'Elab_Spec;
      E140 := E140 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E084 := E084 + 1;
      Ada.Strings'Elab_Spec;
      E042 := E042 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E256 := E256 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E083 := E083 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E023 := E023 + 1;
      System.File_Control_Block'Elab_Spec;
      E137 := E137 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E157 := E157 + 1;
      System.Finalization_Root'Elab_Spec;
      E086 := E086 + 1;
      Ada.Finalization'Elab_Spec;
      E081 := E081 + 1;
      System.Storage_Pools'Elab_Spec;
      E088 := E088 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      System.Task_Info'Elab_Spec;
      E199 := E199 + 1;
      E144 := E144 + 1;
      E151 := E151 + 1;
      Gnat.Secure_Hashes.Sha2_64'Elab_Spec;
      E146 := E146 + 1;
      System.Assertions'Elab_Spec;
      E153 := E153 + 1;
      System.Pool_Global'Elab_Spec;
      E120 := E120 + 1;
      Gnat.Sockets'Elab_Spec;
      System.Pool_Size'Elab_Spec;
      E113 := E113 + 1;
      E071 := E071 + 1;
      System.Finalization_Masters'Elab_Body;
      E075 := E075 + 1;
      System.File_Io'Elab_Body;
      E132 := E132 + 1;
      E106 := E106 + 1;
      E104 := E104 + 1;
      Ada.Tags'Elab_Body;
      E055 := E055 + 1;
      E048 := E048 + 1;
      System.Soft_Links'Elab_Body;
      E011 := E011 + 1;
      System.Os_Lib'Elab_Body;
      E134 := E134 + 1;
      System.Secondary_Stack'Elab_Body;
      E015 := E015 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E044 := E044 + 1;
      Gnat.Sha512'Elab_Spec;
      E142 := E142 + 1;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E108 := E108 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E102 := E102 + 1;
      Gnat.Sockets'Elab_Body;
      E099 := E099 + 1;
      Gnat.String_Split'Elab_Spec;
      E179 := E179 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E155 := E155 + 1;
      System.Tasking.Initialization'Elab_Body;
      E211 := E211 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E235 := E235 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E128 := E128 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E219 := E219 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E223 := E223 + 1;
      System.Tasking.Queuing'Elab_Body;
      E227 := E227 + 1;
      System.Tasking.Stages'Elab_Body;
      E233 := E233 + 1;
      Client_Logic'Elab_Spec;
      E096 := E096 + 1;
      E124 := E124 + 1;
      Datatypes'Elab_Spec;
      E139 := E139 + 1;
      E159 := E159 + 1;
      Concrete_Client_Logic'Elab_Spec;
      Concrete_Client_Logic'Elab_Body;
      E126 := E126 + 1;
      Serverguicommunication'Elab_Spec;
      E245 := E245 + 1;
      User_Databases'Elab_Spec;
      E247 := E247 + 1;
      Concrete_Server_Logic'Elab_Spec;
      Concrete_Server_Logic'Elab_Body;
      E181 := E181 + 1;
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
   --   E:\Development\Ada\Block_Projekt\ada_chat\client_logic.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\client_ui.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\datatypes.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\protocol.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\concrete_client_logic.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\serverguicommunication.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\user_databases.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\concrete_server_logic.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\main.o
   --   -LE:\Development\Ada\Block_Projekt\ada_chat\
   --   -LE:\Development\Ada\Block_Projekt\ada_chat\
   --   -LE:/programme/gnat/lib/gcc/i686-pc-mingw32/4.9.3/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -lws2_32
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
