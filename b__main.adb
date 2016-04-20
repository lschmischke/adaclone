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
   E224 : Short_Integer; pragma Import (Ada, E224, "ada__containers_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "ada__io_exceptions_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "ada__strings_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__strings__maps_E");
<<<<<<< HEAD
   E245 : Short_Integer; pragma Import (Ada, E245, "ada__strings__maps__constants_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__tags_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "ada__streams_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "interfaces__c_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "interfaces__c__strings_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exceptions_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__file_control_block_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "ada__streams__stream_io_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__file_io_E");
=======
   E254 : Short_Integer; pragma Import (Ada, E254, "ada__strings__maps__constants_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__tags_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "ada__streams_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "interfaces__c_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "interfaces__c__strings_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__exceptions_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "system__file_control_block_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "ada__streams__stream_io_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "system__file_io_E");
>>>>>>> origin/feature/server_logic
   E086 : Short_Integer; pragma Import (Ada, E086, "system__finalization_root_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "ada__finalization_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "system__storage_pools_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__finalization_masters_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "system__storage_pools__subpools_E");
<<<<<<< HEAD
   E183 : Short_Integer; pragma Import (Ada, E183, "system__task_info_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "system__assertions_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__pool_global_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "gnat__sockets_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__pool_size_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__secondary_stack_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "ada__strings__unbounded_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "gnat__sockets__thin_common_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "gnat__sockets__thin_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "gnat__string_split_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__strings__stream_ops_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "system__tasking__initialization_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "ada__real_time_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "ada__text_io_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "system__tasking__protected_objects_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "system__tasking__protected_objects__entries_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "system__tasking__queuing_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "system__tasking__stages_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "client_logic_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "client_ui_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "datatypes_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "protocol_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "concrete_client_logic_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "server_logic_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "user_databases_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "concrete_server_logic_E");
=======
   E128 : Short_Integer; pragma Import (Ada, E128, "system__task_info_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "gnat__secure_hashes_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "gnat__secure_hashes__sha2_common_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "gnat__secure_hashes__sha2_64_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "system__assertions_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "system__pool_global_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "gnat__sockets_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "system__pool_size_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "system__secondary_stack_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "ada__strings__unbounded_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "gnat__sha512_E");
   E221 : Short_Integer; pragma Import (Ada, E221, "gnat__sockets__thin_common_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "gnat__sockets__thin_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "gnat__string_split_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "system__strings__stream_ops_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "system__tasking__initialization_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "ada__real_time_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "ada__text_io_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "system__tasking__protected_objects_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__tasking__protected_objects__entries_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__tasking__queuing_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__tasking__stages_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "client_logic_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "client_ui_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "datatypes_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "protocol_E");
   E243 : Short_Integer; pragma Import (Ada, E243, "server_logic_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "server_ui_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "user_databases_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "concrete_server_logic_E");
>>>>>>> origin/feature/server_logic

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E165 := E165 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "concrete_server_logic__finalize_spec");
      begin
         F1;
      end;
<<<<<<< HEAD
      E236 := E236 - 1;
=======
      E245 := E245 - 1;
>>>>>>> origin/feature/server_logic
      declare
         procedure F2;
         pragma Import (Ada, F2, "user_databases__finalize_spec");
      begin
         F2;
      end;
      E126 := E126 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "concrete_client_logic__finalize_spec");
      begin
         F3;
      end;
      E231 := E231 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "datatypes__finalize_spec");
      begin
         F4;
      end;
      E207 := E207 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F5;
      end;
      E128 := E128 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "ada__text_io__finalize_spec");
      begin
<<<<<<< HEAD
=======
         E216 := E216 - 1;
>>>>>>> origin/feature/server_logic
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gnat__sockets__finalize_body");
      begin
         E099 := E099 - 1;
         F7;
      end;
      E044 := E044 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "ada__strings__unbounded__finalize_spec");
      begin
         F8;
      end;
<<<<<<< HEAD
=======
      E075 := E075 - 1;
      E071 := E071 - 1;
      E223 := E223 - 1;
>>>>>>> origin/feature/server_logic
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__file_io__finalize_body");
      begin
         E132 := E132 - 1;
         F9;
      end;
      E075 := E075 - 1;
      E071 := E071 - 1;
      E113 := E113 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__pool_size__finalize_spec");
      begin
         F10;
      end;
<<<<<<< HEAD
=======
      E206 := E206 - 1;
>>>>>>> origin/feature/server_logic
      declare
         procedure F11;
         pragma Import (Ada, F11, "gnat__sockets__finalize_spec");
      begin
         F11;
      end;
      E120 := E120 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__pool_global__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__storage_pools__subpools__finalize_spec");
      begin
         F13;
      end;
<<<<<<< HEAD
=======
      E212 := E212 - 1;
>>>>>>> origin/feature/server_logic
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__finalization_masters__finalize_spec");
      begin
         F14;
      end;
      E157 := E157 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "ada__streams__stream_io__finalize_spec");
      begin
         F15;
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
      E224 := E224 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E084 := E084 + 1;
      Ada.Strings'Elab_Spec;
      E042 := E042 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
<<<<<<< HEAD
      E245 := E245 + 1;
=======
      E254 := E254 + 1;
>>>>>>> origin/feature/server_logic
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
<<<<<<< HEAD
      E157 := E157 + 1;
=======
      E212 := E212 + 1;
>>>>>>> origin/feature/server_logic
      System.Finalization_Root'Elab_Spec;
      E086 := E086 + 1;
      Ada.Finalization'Elab_Spec;
      E081 := E081 + 1;
      System.Storage_Pools'Elab_Spec;
      E088 := E088 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      System.Task_Info'Elab_Spec;
<<<<<<< HEAD
      E183 := E183 + 1;
      System.Assertions'Elab_Spec;
      E233 := E233 + 1;
      System.Pool_Global'Elab_Spec;
      E120 := E120 + 1;
      Gnat.Sockets'Elab_Spec;
      System.Pool_Size'Elab_Spec;
      E113 := E113 + 1;
=======
      E128 := E128 + 1;
      E195 := E195 + 1;
      E202 := E202 + 1;
      Gnat.Secure_Hashes.Sha2_64'Elab_Spec;
      E197 := E197 + 1;
      System.Assertions'Elab_Spec;
      E204 := E204 + 1;
      System.Pool_Global'Elab_Spec;
      E206 := E206 + 1;
      Gnat.Sockets'Elab_Spec;
      System.Pool_Size'Elab_Spec;
      E223 := E223 + 1;
>>>>>>> origin/feature/server_logic
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
      E193 := E193 + 1;
      Gnat.Sockets.Thin_Common'Elab_Spec;
<<<<<<< HEAD
      E108 := E108 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E102 := E102 + 1;
      Gnat.Sockets'Elab_Body;
      E099 := E099 + 1;
      Gnat.String_Split'Elab_Spec;
      E163 := E163 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E155 := E155 + 1;
=======
      E221 := E221 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E219 := E219 + 1;
      Gnat.Sockets'Elab_Body;
      E216 := E216 + 1;
      Gnat.String_Split'Elab_Spec;
      E228 := E228 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E210 := E210 + 1;
>>>>>>> origin/feature/server_logic
      System.Tasking.Initialization'Elab_Body;
      E195 := E195 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E219 := E219 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E128 := E128 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E203 := E203 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E207 := E207 + 1;
      System.Tasking.Queuing'Elab_Body;
      E211 := E211 + 1;
      System.Tasking.Stages'Elab_Body;
      E217 := E217 + 1;
      Client_Logic'Elab_Spec;
      E096 := E096 + 1;
      E124 := E124 + 1;
      Datatypes'Elab_Spec;
<<<<<<< HEAD
      E231 := E231 + 1;
      E139 := E139 + 1;
      Concrete_Client_Logic'Elab_Spec;
      Concrete_Client_Logic'Elab_Body;
      E126 := E126 + 1;
      Server_Logic'Elab_Spec;
      E234 := E234 + 1;
      User_Databases'Elab_Spec;
      E236 := E236 + 1;
=======
      E190 := E190 + 1;
      E230 := E230 + 1;
      Server_Logic'Elab_Spec;
      E243 := E243 + 1;
      E262 := E262 + 1;
      User_Databases'Elab_Spec;
      E245 := E245 + 1;
>>>>>>> origin/feature/server_logic
      Concrete_Server_Logic'Elab_Spec;
      Concrete_Server_Logic'Elab_Body;
      E165 := E165 + 1;
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
<<<<<<< HEAD
   --   E:\Development\Ada\Block_Projekt\ada_chat\client_logic.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\client_ui.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\datatypes.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\protocol.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\concrete_client_logic.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\server_logic.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\user_databases.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\concrete_server_logic.o
   --   E:\Development\Ada\Block_Projekt\ada_chat\main.o
   --   -LE:\Development\Ada\Block_Projekt\ada_chat\
   --   -LE:\Development\Ada\Block_Projekt\ada_chat\
   --   -LE:/programme/gnat/lib/gcc/i686-pc-mingw32/4.9.3/adalib/
=======
   --   C:\Users\Daniel Kreck\Documents\adachat\client_logic.o
   --   C:\Users\Daniel Kreck\Documents\adachat\client_ui.o
   --   C:\Users\Daniel Kreck\Documents\adachat\datatypes.o
   --   C:\Users\Daniel Kreck\Documents\adachat\protocol.o
   --   C:\Users\Daniel Kreck\Documents\adachat\server_logic.o
   --   C:\Users\Daniel Kreck\Documents\adachat\server_ui.o
   --   C:\Users\Daniel Kreck\Documents\adachat\user_databases.o
   --   C:\Users\Daniel Kreck\Documents\adachat\concrete_server_logic.o
   --   C:\Users\Daniel Kreck\Documents\adachat\main.o
   --   -LC:\Users\Daniel Kreck\Documents\adachat\
   --   -LC:\Users\Daniel Kreck\Documents\adachat\
   --   -LD:/gnat/2015/lib/gcc/i686-pc-mingw32/4.9.3/adalib/
>>>>>>> origin/feature/server_logic
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
