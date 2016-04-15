pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2015 (20150428-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#965d0206#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#fbff4c67#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#f72f352b#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00005, "ada__stringsS");
   u00006 : constant Version_32 := 16#f4ce8c3a#;
   pragma Export (C, u00006, "systemS");
   u00007 : constant Version_32 := 16#393398c1#;
   pragma Export (C, u00007, "system__exception_tableB");
   u00008 : constant Version_32 := 16#5ad7ea2f#;
   pragma Export (C, u00008, "system__exception_tableS");
   u00009 : constant Version_32 := 16#a207fefe#;
   pragma Export (C, u00009, "system__soft_linksB");
   u00010 : constant Version_32 := 16#af945ded#;
   pragma Export (C, u00010, "system__soft_linksS");
   u00011 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00011, "system__parametersB");
   u00012 : constant Version_32 := 16#8ae48145#;
   pragma Export (C, u00012, "system__parametersS");
   u00013 : constant Version_32 := 16#b19b6653#;
   pragma Export (C, u00013, "system__secondary_stackB");
   u00014 : constant Version_32 := 16#5faf4353#;
   pragma Export (C, u00014, "system__secondary_stackS");
   u00015 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00015, "system__storage_elementsB");
   u00016 : constant Version_32 := 16#d90dc63e#;
   pragma Export (C, u00016, "system__storage_elementsS");
   u00017 : constant Version_32 := 16#b612ca65#;
   pragma Export (C, u00017, "ada__exceptionsB");
   u00018 : constant Version_32 := 16#1d190453#;
   pragma Export (C, u00018, "ada__exceptionsS");
   u00019 : constant Version_32 := 16#a46739c0#;
   pragma Export (C, u00019, "ada__exceptions__last_chance_handlerB");
   u00020 : constant Version_32 := 16#3aac8c92#;
   pragma Export (C, u00020, "ada__exceptions__last_chance_handlerS");
   u00021 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00021, "system__exceptionsB");
   u00022 : constant Version_32 := 16#9cade1cc#;
   pragma Export (C, u00022, "system__exceptionsS");
   u00023 : constant Version_32 := 16#37d758f1#;
   pragma Export (C, u00023, "system__exceptions__machineS");
   u00024 : constant Version_32 := 16#b895431d#;
   pragma Export (C, u00024, "system__exceptions_debugB");
   u00025 : constant Version_32 := 16#472c9584#;
   pragma Export (C, u00025, "system__exceptions_debugS");
   u00026 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00026, "system__img_intB");
   u00027 : constant Version_32 := 16#f6156cf8#;
   pragma Export (C, u00027, "system__img_intS");
   u00028 : constant Version_32 := 16#b98c3e16#;
   pragma Export (C, u00028, "system__tracebackB");
   u00029 : constant Version_32 := 16#6af355e1#;
   pragma Export (C, u00029, "system__tracebackS");
   u00030 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00030, "system__traceback_entriesB");
   u00031 : constant Version_32 := 16#f4957a4a#;
   pragma Export (C, u00031, "system__traceback_entriesS");
   u00032 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00032, "system__wch_conB");
   u00033 : constant Version_32 := 16#efb3aee8#;
   pragma Export (C, u00033, "system__wch_conS");
   u00034 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00034, "system__wch_stwB");
   u00035 : constant Version_32 := 16#c2a282e9#;
   pragma Export (C, u00035, "system__wch_stwS");
   u00036 : constant Version_32 := 16#92b797cb#;
   pragma Export (C, u00036, "system__wch_cnvB");
   u00037 : constant Version_32 := 16#e004141b#;
   pragma Export (C, u00037, "system__wch_cnvS");
   u00038 : constant Version_32 := 16#6033a23f#;
   pragma Export (C, u00038, "interfacesS");
   u00039 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00039, "system__wch_jisB");
   u00040 : constant Version_32 := 16#60740d3a#;
   pragma Export (C, u00040, "system__wch_jisS");
   u00041 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00041, "system__stack_checkingB");
   u00042 : constant Version_32 := 16#7a71e7d2#;
   pragma Export (C, u00042, "system__stack_checkingS");
   u00043 : constant Version_32 := 16#f78329ae#;
   pragma Export (C, u00043, "ada__strings__unboundedB");
   u00044 : constant Version_32 := 16#e303cf90#;
   pragma Export (C, u00044, "ada__strings__unboundedS");
   u00045 : constant Version_32 := 16#d22169ac#;
   pragma Export (C, u00045, "ada__strings__searchB");
   u00046 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00046, "ada__strings__searchS");
   u00047 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00047, "ada__strings__mapsB");
   u00048 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00048, "ada__strings__mapsS");
   u00049 : constant Version_32 := 16#41937159#;
   pragma Export (C, u00049, "system__bit_opsB");
   u00050 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00050, "system__bit_opsS");
   u00051 : constant Version_32 := 16#699628fa#;
   pragma Export (C, u00051, "system__unsigned_typesS");
   u00052 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00052, "ada__charactersS");
   u00053 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00053, "ada__characters__latin_1S");
   u00054 : constant Version_32 := 16#12c8cd7d#;
   pragma Export (C, u00054, "ada__tagsB");
   u00055 : constant Version_32 := 16#ce72c228#;
   pragma Export (C, u00055, "ada__tagsS");
   u00056 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00056, "system__htableB");
   u00057 : constant Version_32 := 16#700c3fd0#;
   pragma Export (C, u00057, "system__htableS");
   u00058 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00058, "system__string_hashB");
   u00059 : constant Version_32 := 16#d25254ae#;
   pragma Export (C, u00059, "system__string_hashS");
   u00060 : constant Version_32 := 16#b44f9ae7#;
   pragma Export (C, u00060, "system__val_unsB");
   u00061 : constant Version_32 := 16#793ec5c1#;
   pragma Export (C, u00061, "system__val_unsS");
   u00062 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00062, "system__val_utilB");
   u00063 : constant Version_32 := 16#586e3ac4#;
   pragma Export (C, u00063, "system__val_utilS");
   u00064 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00064, "system__case_utilB");
   u00065 : constant Version_32 := 16#d0c7e5ed#;
   pragma Export (C, u00065, "system__case_utilS");
   u00066 : constant Version_32 := 16#5b9edcc4#;
   pragma Export (C, u00066, "system__compare_array_unsigned_8B");
   u00067 : constant Version_32 := 16#5dcdfdb7#;
   pragma Export (C, u00067, "system__compare_array_unsigned_8S");
   u00068 : constant Version_32 := 16#5f72f755#;
   pragma Export (C, u00068, "system__address_operationsB");
   u00069 : constant Version_32 := 16#e7c23209#;
   pragma Export (C, u00069, "system__address_operationsS");
   u00070 : constant Version_32 := 16#6a859064#;
   pragma Export (C, u00070, "system__storage_pools__subpoolsB");
   u00071 : constant Version_32 := 16#e3b008dc#;
   pragma Export (C, u00071, "system__storage_pools__subpoolsS");
   u00072 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00072, "system__address_imageB");
   u00073 : constant Version_32 := 16#55221100#;
   pragma Export (C, u00073, "system__address_imageS");
   u00074 : constant Version_32 := 16#b5b2aca1#;
   pragma Export (C, u00074, "system__finalization_mastersB");
   u00075 : constant Version_32 := 16#80d8a57a#;
   pragma Export (C, u00075, "system__finalization_mastersS");
   u00076 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00076, "system__img_boolB");
   u00077 : constant Version_32 := 16#0117fdd1#;
   pragma Export (C, u00077, "system__img_boolS");
   u00078 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00078, "system__ioB");
   u00079 : constant Version_32 := 16#6a8c7b75#;
   pragma Export (C, u00079, "system__ioS");
   u00080 : constant Version_32 := 16#b7ab275c#;
   pragma Export (C, u00080, "ada__finalizationB");
   u00081 : constant Version_32 := 16#19f764ca#;
   pragma Export (C, u00081, "ada__finalizationS");
   u00082 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00082, "ada__streamsB");
   u00083 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00083, "ada__streamsS");
   u00084 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00084, "ada__io_exceptionsS");
   u00085 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00085, "system__finalization_rootB");
   u00086 : constant Version_32 := 16#bb3cffaa#;
   pragma Export (C, u00086, "system__finalization_rootS");
   u00087 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00087, "system__storage_poolsB");
   u00088 : constant Version_32 := 16#01950bbe#;
   pragma Export (C, u00088, "system__storage_poolsS");
   u00089 : constant Version_32 := 16#63f11652#;
   pragma Export (C, u00089, "system__storage_pools__subpools__finalizationB");
   u00090 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00090, "system__storage_pools__subpools__finalizationS");
   u00091 : constant Version_32 := 16#e5ac57f8#;
   pragma Export (C, u00091, "system__atomic_countersB");
   u00092 : constant Version_32 := 16#39b218f0#;
   pragma Export (C, u00092, "system__atomic_countersS");
   u00093 : constant Version_32 := 16#fb75f7f4#;
   pragma Export (C, u00093, "system__machine_codeS");
   u00094 : constant Version_32 := 16#f4e1c091#;
   pragma Export (C, u00094, "system__stream_attributesB");
   u00095 : constant Version_32 := 16#221dd20d#;
   pragma Export (C, u00095, "system__stream_attributesS");
   u00096 : constant Version_32 := 16#46084743#;
   pragma Export (C, u00096, "client_logicS");
   u00097 : constant Version_32 := 16#81548b0d#;
   pragma Export (C, u00097, "communication_objectsS");
   u00098 : constant Version_32 := 16#401d7087#;
   pragma Export (C, u00098, "client_uiB");
   u00099 : constant Version_32 := 16#80f42b28#;
   pragma Export (C, u00099, "client_uiS");
   u00100 : constant Version_32 := 16#00ff54ce#;
   pragma Export (C, u00100, "communication_objects__filesS");
   u00101 : constant Version_32 := 16#d1833866#;
   pragma Export (C, u00101, "communication_objects__messagesB");
   u00102 : constant Version_32 := 16#79d9a6ce#;
   pragma Export (C, u00102, "communication_objects__messagesS");
   u00103 : constant Version_32 := 16#06cb2950#;
   pragma Export (C, u00103, "system__strings__stream_opsB");
   u00104 : constant Version_32 := 16#55d4bd57#;
   pragma Export (C, u00104, "system__strings__stream_opsS");
   u00105 : constant Version_32 := 16#a71b0af5#;
   pragma Export (C, u00105, "ada__streams__stream_ioB");
   u00106 : constant Version_32 := 16#31fc8e02#;
   pragma Export (C, u00106, "ada__streams__stream_ioS");
   u00107 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00107, "interfaces__c_streamsB");
   u00108 : constant Version_32 := 16#8bb5f2c0#;
   pragma Export (C, u00108, "interfaces__c_streamsS");
   u00109 : constant Version_32 := 16#845f5a34#;
   pragma Export (C, u00109, "system__crtlS");
   u00110 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00110, "system__communicationB");
   u00111 : constant Version_32 := 16#edaed9e8#;
   pragma Export (C, u00111, "system__communicationS");
   u00112 : constant Version_32 := 16#431faf3c#;
   pragma Export (C, u00112, "system__file_ioB");
   u00113 : constant Version_32 := 16#53bf6d5f#;
   pragma Export (C, u00113, "system__file_ioS");
   u00114 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00114, "interfaces__cB");
   u00115 : constant Version_32 := 16#4a38bedb#;
   pragma Export (C, u00115, "interfaces__cS");
   u00116 : constant Version_32 := 16#ee0f26dd#;
   pragma Export (C, u00116, "system__os_libB");
   u00117 : constant Version_32 := 16#d7b69782#;
   pragma Export (C, u00117, "system__os_libS");
   u00118 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00118, "system__stringsB");
   u00119 : constant Version_32 := 16#8a719d5c#;
   pragma Export (C, u00119, "system__stringsS");
   u00120 : constant Version_32 := 16#09511692#;
   pragma Export (C, u00120, "system__file_control_blockS");
   u00121 : constant Version_32 := 16#018ebcf4#;
   pragma Export (C, u00121, "communication_objects__messages__connectB");
   u00122 : constant Version_32 := 16#734aac9e#;
   pragma Export (C, u00122, "communication_objects__messages__connectS");
   u00123 : constant Version_32 := 16#a2ec75a5#;
   pragma Export (C, u00123, "communication_objects__messages__disconnectB");
   u00124 : constant Version_32 := 16#619da8aa#;
   pragma Export (C, u00124, "communication_objects__messages__disconnectS");
   u00125 : constant Version_32 := 16#aa791357#;
   pragma Export (C, u00125, "communication_objects__messages__refuseB");
   u00126 : constant Version_32 := 16#fc5aefc5#;
   pragma Export (C, u00126, "communication_objects__messages__refuseS");
   u00127 : constant Version_32 := 16#36f20dae#;
   pragma Export (C, u00127, "communication_objects__messages__userlistB");
   u00128 : constant Version_32 := 16#70e9a888#;
   pragma Export (C, u00128, "communication_objects__messages__userlistS");
   u00129 : constant Version_32 := 16#0a5d4836#;
   pragma Export (C, u00129, "data_typesB");
   u00130 : constant Version_32 := 16#68d97f1b#;
   pragma Export (C, u00130, "data_typesS");
   u00131 : constant Version_32 := 16#5e196e91#;
   pragma Export (C, u00131, "ada__containersS");
   u00132 : constant Version_32 := 16#1767a79e#;
   pragma Export (C, u00132, "system__assertionsB");
   u00133 : constant Version_32 := 16#3943a0ae#;
   pragma Export (C, u00133, "system__assertionsS");
   u00134 : constant Version_32 := 16#e34550ca#;
   pragma Export (C, u00134, "system__pool_globalB");
   u00135 : constant Version_32 := 16#c88d2d16#;
   pragma Export (C, u00135, "system__pool_globalS");
   u00136 : constant Version_32 := 16#2bce1226#;
   pragma Export (C, u00136, "system__memoryB");
   u00137 : constant Version_32 := 16#adb3ea0e#;
   pragma Export (C, u00137, "system__memoryS");
   u00138 : constant Version_32 := 16#7d9d31ea#;
   pragma Export (C, u00138, "concrete_server_logicB");
   u00139 : constant Version_32 := 16#1d765b03#;
   pragma Export (C, u00139, "concrete_server_logicS");
   u00140 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00140, "system__concat_2B");
   u00141 : constant Version_32 := 16#f66e5bea#;
   pragma Export (C, u00141, "system__concat_2S");
   u00142 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00142, "system__concat_3B");
   u00143 : constant Version_32 := 16#ffbed09f#;
   pragma Export (C, u00143, "system__concat_3S");
   u00144 : constant Version_32 := 16#a83b7c85#;
   pragma Export (C, u00144, "system__concat_6B");
   u00145 : constant Version_32 := 16#2609a188#;
   pragma Export (C, u00145, "system__concat_6S");
   u00146 : constant Version_32 := 16#608e2cd1#;
   pragma Export (C, u00146, "system__concat_5B");
   u00147 : constant Version_32 := 16#7390cf14#;
   pragma Export (C, u00147, "system__concat_5S");
   u00148 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00148, "system__concat_4B");
   u00149 : constant Version_32 := 16#8aaaa71a#;
   pragma Export (C, u00149, "system__concat_4S");
   u00150 : constant Version_32 := 16#30bb6e97#;
   pragma Export (C, u00150, "system__taskingB");
   u00151 : constant Version_32 := 16#8d6ada58#;
   pragma Export (C, u00151, "system__taskingS");
   u00152 : constant Version_32 := 16#01715bc2#;
   pragma Export (C, u00152, "system__task_primitivesS");
   u00153 : constant Version_32 := 16#f4bb5b54#;
   pragma Export (C, u00153, "system__os_interfaceS");
   u00154 : constant Version_32 := 16#2c7d263c#;
   pragma Export (C, u00154, "interfaces__c__stringsB");
   u00155 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00155, "interfaces__c__stringsS");
   u00156 : constant Version_32 := 16#1716ff24#;
   pragma Export (C, u00156, "system__win32S");
   u00157 : constant Version_32 := 16#e2725713#;
   pragma Export (C, u00157, "system__task_primitives__operationsB");
   u00158 : constant Version_32 := 16#12291044#;
   pragma Export (C, u00158, "system__task_primitives__operationsS");
   u00159 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00159, "system__float_controlB");
   u00160 : constant Version_32 := 16#1432cf06#;
   pragma Export (C, u00160, "system__float_controlS");
   u00161 : constant Version_32 := 16#da8ccc08#;
   pragma Export (C, u00161, "system__interrupt_managementB");
   u00162 : constant Version_32 := 16#c90ea50e#;
   pragma Export (C, u00162, "system__interrupt_managementS");
   u00163 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00163, "system__multiprocessorsB");
   u00164 : constant Version_32 := 16#cc621349#;
   pragma Export (C, u00164, "system__multiprocessorsS");
   u00165 : constant Version_32 := 16#f4bb3578#;
   pragma Export (C, u00165, "system__os_primitivesB");
   u00166 : constant Version_32 := 16#441f0013#;
   pragma Export (C, u00166, "system__os_primitivesS");
   u00167 : constant Version_32 := 16#0881bbf8#;
   pragma Export (C, u00167, "system__task_lockB");
   u00168 : constant Version_32 := 16#9544bb54#;
   pragma Export (C, u00168, "system__task_lockS");
   u00169 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00169, "system__win32__extS");
   u00170 : constant Version_32 := 16#77769007#;
   pragma Export (C, u00170, "system__task_infoB");
   u00171 : constant Version_32 := 16#232885cd#;
   pragma Export (C, u00171, "system__task_infoS");
   u00172 : constant Version_32 := 16#ab9ad34e#;
   pragma Export (C, u00172, "system__tasking__debugB");
   u00173 : constant Version_32 := 16#f1f2435f#;
   pragma Export (C, u00173, "system__tasking__debugS");
   u00174 : constant Version_32 := 16#d0432c8d#;
   pragma Export (C, u00174, "system__img_enum_newB");
   u00175 : constant Version_32 := 16#95828afa#;
   pragma Export (C, u00175, "system__img_enum_newS");
   u00176 : constant Version_32 := 16#118e865d#;
   pragma Export (C, u00176, "system__stack_usageB");
   u00177 : constant Version_32 := 16#00bc3311#;
   pragma Export (C, u00177, "system__stack_usageS");
   u00178 : constant Version_32 := 16#3cc73d8e#;
   pragma Export (C, u00178, "system__tasking__rendezvousB");
   u00179 : constant Version_32 := 16#71fce298#;
   pragma Export (C, u00179, "system__tasking__rendezvousS");
   u00180 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00180, "system__restrictionsB");
   u00181 : constant Version_32 := 16#efa60774#;
   pragma Export (C, u00181, "system__restrictionsS");
   u00182 : constant Version_32 := 16#72d3cb03#;
   pragma Export (C, u00182, "system__tasking__entry_callsB");
   u00183 : constant Version_32 := 16#e903595c#;
   pragma Export (C, u00183, "system__tasking__entry_callsS");
   u00184 : constant Version_32 := 16#92d5df45#;
   pragma Export (C, u00184, "system__tasking__initializationB");
   u00185 : constant Version_32 := 16#d9930fa8#;
   pragma Export (C, u00185, "system__tasking__initializationS");
   u00186 : constant Version_32 := 16#001f972c#;
   pragma Export (C, u00186, "system__soft_links__taskingB");
   u00187 : constant Version_32 := 16#e47ef8be#;
   pragma Export (C, u00187, "system__soft_links__taskingS");
   u00188 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00188, "ada__exceptions__is_null_occurrenceB");
   u00189 : constant Version_32 := 16#9a9e8fd3#;
   pragma Export (C, u00189, "ada__exceptions__is_null_occurrenceS");
   u00190 : constant Version_32 := 16#d89f9b67#;
   pragma Export (C, u00190, "system__tasking__task_attributesB");
   u00191 : constant Version_32 := 16#952bcf5e#;
   pragma Export (C, u00191, "system__tasking__task_attributesS");
   u00192 : constant Version_32 := 16#5933ea28#;
   pragma Export (C, u00192, "system__tasking__protected_objectsB");
   u00193 : constant Version_32 := 16#63b50013#;
   pragma Export (C, u00193, "system__tasking__protected_objectsS");
   u00194 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00194, "system__tracesB");
   u00195 : constant Version_32 := 16#06d3e490#;
   pragma Export (C, u00195, "system__tracesS");
   u00196 : constant Version_32 := 16#3ea9332d#;
   pragma Export (C, u00196, "system__tasking__protected_objects__entriesB");
   u00197 : constant Version_32 := 16#7671a6ef#;
   pragma Export (C, u00197, "system__tasking__protected_objects__entriesS");
   u00198 : constant Version_32 := 16#6f8919f6#;
   pragma Export (C, u00198, "system__tasking__protected_objects__operationsB");
   u00199 : constant Version_32 := 16#eb67f071#;
   pragma Export (C, u00199, "system__tasking__protected_objects__operationsS");
   u00200 : constant Version_32 := 16#94c4f9d9#;
   pragma Export (C, u00200, "system__tasking__queuingB");
   u00201 : constant Version_32 := 16#3117b7f1#;
   pragma Export (C, u00201, "system__tasking__queuingS");
   u00202 : constant Version_32 := 16#c6ee4b22#;
   pragma Export (C, u00202, "system__tasking__utilitiesB");
   u00203 : constant Version_32 := 16#ea41a805#;
   pragma Export (C, u00203, "system__tasking__utilitiesS");
   u00204 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00204, "system__traces__taskingB");
   u00205 : constant Version_32 := 16#3fb127e5#;
   pragma Export (C, u00205, "system__traces__taskingS");
   u00206 : constant Version_32 := 16#d6fbdf05#;
   pragma Export (C, u00206, "system__tasking__stagesB");
   u00207 : constant Version_32 := 16#f8a082a4#;
   pragma Export (C, u00207, "system__tasking__stagesS");
   u00208 : constant Version_32 := 16#91613c5c#;
   pragma Export (C, u00208, "ada__real_timeB");
   u00209 : constant Version_32 := 16#87ade2f4#;
   pragma Export (C, u00209, "ada__real_timeS");
   u00210 : constant Version_32 := 16#1f99af62#;
   pragma Export (C, u00210, "system__arith_64B");
   u00211 : constant Version_32 := 16#d4b08bf7#;
   pragma Export (C, u00211, "system__arith_64S");
   u00212 : constant Version_32 := 16#e753e265#;
   pragma Export (C, u00212, "ada__characters__conversionsB");
   u00213 : constant Version_32 := 16#761d31b0#;
   pragma Export (C, u00213, "ada__characters__conversionsS");
   u00214 : constant Version_32 := 16#28f088c2#;
   pragma Export (C, u00214, "ada__text_ioB");
   u00215 : constant Version_32 := 16#1a9b0017#;
   pragma Export (C, u00215, "ada__text_ioS");
   u00216 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00216, "gnatS");
   u00217 : constant Version_32 := 16#b183acf5#;
   pragma Export (C, u00217, "gnat__socketsB");
   u00218 : constant Version_32 := 16#d351939f#;
   pragma Export (C, u00218, "gnat__socketsS");
   u00219 : constant Version_32 := 16#f8b8cc5a#;
   pragma Export (C, u00219, "gnat__sockets__linker_optionsS");
   u00220 : constant Version_32 := 16#b0532f13#;
   pragma Export (C, u00220, "gnat__sockets__thinB");
   u00221 : constant Version_32 := 16#7cbf3246#;
   pragma Export (C, u00221, "gnat__sockets__thinS");
   u00222 : constant Version_32 := 16#0a2632e6#;
   pragma Export (C, u00222, "gnat__sockets__thin_commonB");
   u00223 : constant Version_32 := 16#5de24e36#;
   pragma Export (C, u00223, "gnat__sockets__thin_commonS");
   u00224 : constant Version_32 := 16#994daa60#;
   pragma Export (C, u00224, "system__pool_sizeB");
   u00225 : constant Version_32 := 16#f5e0c463#;
   pragma Export (C, u00225, "system__pool_sizeS");
   u00226 : constant Version_32 := 16#7ebd8839#;
   pragma Export (C, u00226, "system__val_intB");
   u00227 : constant Version_32 := 16#bc6ba605#;
   pragma Export (C, u00227, "system__val_intS");
   u00228 : constant Version_32 := 16#2e610ef3#;
   pragma Export (C, u00228, "system__os_constantsS");
   u00229 : constant Version_32 := 16#dbf24c7a#;
   pragma Export (C, u00229, "gnat__string_splitB");
   u00230 : constant Version_32 := 16#00425e4a#;
   pragma Export (C, u00230, "gnat__string_splitS");
   u00231 : constant Version_32 := 16#53853d1b#;
   pragma Export (C, u00231, "protocolB");
   u00232 : constant Version_32 := 16#8e1c2cd2#;
   pragma Export (C, u00232, "protocolS");
   u00233 : constant Version_32 := 16#46899fd1#;
   pragma Export (C, u00233, "system__concat_7B");
   u00234 : constant Version_32 := 16#0809d725#;
   pragma Export (C, u00234, "system__concat_7S");
   u00235 : constant Version_32 := 16#4b37b589#;
   pragma Export (C, u00235, "system__val_enumB");
   u00236 : constant Version_32 := 16#4fd4ceaf#;
   pragma Export (C, u00236, "system__val_enumS");
   u00237 : constant Version_32 := 16#e5480ede#;
   pragma Export (C, u00237, "ada__strings__fixedB");
   u00238 : constant Version_32 := 16#a86b22b3#;
   pragma Export (C, u00238, "ada__strings__fixedS");
   u00239 : constant Version_32 := 16#2b93a046#;
   pragma Export (C, u00239, "system__img_charB");
   u00240 : constant Version_32 := 16#68fad4dd#;
   pragma Export (C, u00240, "system__img_charS");
   u00241 : constant Version_32 := 16#184d62c5#;
   pragma Export (C, u00241, "server_logicS");
   u00242 : constant Version_32 := 16#af01ab11#;
   pragma Export (C, u00242, "data_types_testB");
   u00243 : constant Version_32 := 16#9f27f552#;
   pragma Export (C, u00243, "data_types_testS");
   u00244 : constant Version_32 := 16#9094876d#;
   pragma Export (C, u00244, "ada__assertionsB");
   u00245 : constant Version_32 := 16#538f1e95#;
   pragma Export (C, u00245, "ada__assertionsS");
   u00246 : constant Version_32 := 16#6c3536aa#;
   pragma Export (C, u00246, "server_uiB");
   u00247 : constant Version_32 := 16#7a9843ab#;
   pragma Export (C, u00247, "server_uiS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.conversions%s
   --  ada.characters.latin_1%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.arith_64%s
   --  system.atomic_counters%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_char%s
   --  system.img_char%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.atomic_counters%b
   --  system.multiprocessors%s
   --  system.os_primitives%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.task_lock%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.arith_64%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  system.soft_links%s
   --  system.task_lock%b
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.val_enum%s
   --  system.val_int%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_int%b
   --  system.val_enum%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.concat_7%s
   --  system.concat_7%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.fixed%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.multiprocessors%b
   --  interfaces.c.strings%s
   --  system.communication%s
   --  system.communication%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  ada.streams.stream_io%s
   --  system.file_io%s
   --  ada.streams.stream_io%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.os_constants%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.win32%s
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  system.win32.ext%s
   --  system.task_primitives.operations%b
   --  system.os_primitives%b
   --  system.assertions%s
   --  system.assertions%b
   --  ada.assertions%s
   --  ada.assertions%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  gnat.sockets%s
   --  gnat.sockets.linker_options%s
   --  system.pool_size%s
   --  system.pool_size%b
   --  system.secondary_stack%s
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  system.file_io%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.fixed%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  ada.characters.conversions%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  gnat.sockets.thin_common%s
   --  gnat.sockets.thin_common%b
   --  gnat.sockets.thin%s
   --  gnat.sockets.thin%b
   --  gnat.sockets%b
   --  gnat.string_split%s
   --  gnat.string_split%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.tasking.entry_calls%s
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.utilities%s
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  system.tasking.initialization%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%b
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.rendezvous%b
   --  system.tasking.entry_calls%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  client_ui%s
   --  client_ui%b
   --  communication_objects%s
   --  client_logic%s
   --  communication_objects.files%s
   --  communication_objects.messages%s
   --  communication_objects.messages%b
   --  communication_objects.messages.connect%s
   --  communication_objects.messages.connect%b
   --  communication_objects.messages.disconnect%s
   --  communication_objects.messages.disconnect%b
   --  communication_objects.messages.refuse%s
   --  communication_objects.messages.refuse%b
   --  data_types%s
   --  data_types%b
   --  communication_objects.messages.userlist%s
   --  communication_objects.messages.userlist%b
   --  data_types_test%s
   --  data_types_test%b
   --  protocol%s
   --  protocol%b
   --  server_logic%s
   --  concrete_server_logic%s
   --  concrete_server_logic%b
   --  server_ui%s
   --  server_ui%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
