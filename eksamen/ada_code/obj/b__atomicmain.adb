pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__atomicmain.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__atomicmain.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E071 : Short_Integer; pragma Import (Ada, E071, "system__os_lib_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "ada__exceptions_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exception_table_E");
   E040 : Short_Integer; pragma Import (Ada, E040, "ada__containers_E");
   E067 : Short_Integer; pragma Import (Ada, E067, "ada__io_exceptions_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings__maps_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings__maps__constants_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "interfaces__c_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "system__exceptions_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__object_reader_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__dwarf_lines_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__soft_links__initialize_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__strings__utf_encoding_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "ada__tags_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "ada__strings__text_buffers_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "interfaces__c__strings_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "ada__streams_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__file_control_block_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__finalization_root_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "ada__finalization_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "system__file_io_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "system__task_info_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar__delays_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "ada__real_time_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "ada__text_io_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "system__tasking__initialization_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "system__tasking__protected_objects_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "system__tasking__protected_objects__entries_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "system__tasking__queuing_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "system__tasking__stages_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "atomic_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "atomic__finalize_body");
      begin
         E159 := E159 - 1;
         F1;
      end;
      E167 := E167 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F2;
      end;
      E143 := E143 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ada__text_io__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__file_io__finalize_body");
      begin
         E153 := E153 - 1;
         F4;
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
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

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
   pragma Favor_Top_Level (No_Param_Proc);

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
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

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
           False, False, False, False, False, False, False, False, 
           True, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (True, False, False, False, True, True, False, False, 
           False, False, False, True, True, True, True, False, 
           False, False, False, True, False, False, True, True, 
           False, True, True, False, True, True, True, True, 
           False, False, False, False, False, True, False, False, 
           True, False, False, False, True, True, False, True, 
           False, True, False, False, False, True, False, False, 
           False, False, False, True, False, False, True, False, 
           True, True, True, False, False, True, False, True, 
           True, True, False, True, True, False, True, True, 
           True, True, False, False, False, False, False, False, 
           False, False, True, False, False, True, False, True, 
           False),
         Count => (0, 0, 0, 4, 0, 0, 1, 0, 1, 0),
         Unknown => (False, False, False, False, False, False, True, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E027 := E027 + 1;
      Ada.Containers'Elab_Spec;
      E040 := E040 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E067 := E067 + 1;
      Ada.Strings'Elab_Spec;
      E052 := E052 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E054 := E054 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E058 := E058 + 1;
      Interfaces.C'Elab_Spec;
      E077 := E077 + 1;
      System.Exceptions'Elab_Spec;
      E028 := E028 + 1;
      System.Object_Reader'Elab_Spec;
      E079 := E079 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E047 := E047 + 1;
      System.Os_Lib'Elab_Body;
      E071 := E071 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E023 := E023 + 1;
      E015 := E015 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      E010 := E010 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E131 := E131 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E137 := E137 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      Ada.Strings.Text_Buffers'Elab_Body;
      E129 := E129 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E109 := E109 + 1;
      Ada.Streams'Elab_Spec;
      E145 := E145 + 1;
      System.File_Control_Block'Elab_Spec;
      E157 := E157 + 1;
      System.Finalization_Root'Elab_Spec;
      System.Finalization_Root'Elab_Body;
      E156 := E156 + 1;
      Ada.Finalization'Elab_Spec;
      E154 := E154 + 1;
      System.File_Io'Elab_Body;
      E153 := E153 + 1;
      System.Task_Info'Elab_Spec;
      E119 := E119 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E008 := E008 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E006 := E006 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E103 := E103 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E143 := E143 + 1;
      System.Tasking.Initialization'Elab_Body;
      E171 := E171 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E161 := E161 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E167 := E167 + 1;
      System.Tasking.Queuing'Elab_Body;
      E179 := E179 + 1;
      System.Tasking.Stages'Elab_Body;
      E185 := E185 + 1;
      atomic'elab_body;
      E159 := E159 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_atomicmain");

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
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   D:\Local_code_projects\Sanntid\eksamen\ada_code\obj\atomic.o
   --   D:\Local_code_projects\Sanntid\eksamen\ada_code\obj\atomicMain.o
   --   -LD:\Local_code_projects\Sanntid\eksamen\ada_code\obj\
   --   -LD:\Local_code_projects\Sanntid\eksamen\ada_code\obj\
   --   -LD:/gnat/lib/gcc/x86_64-w64-mingw32/10.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
