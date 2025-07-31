with Ada.Text_IO;    use Ada.Text_IO;
with POSIX_mutex;    use POSIX_mutex;
procedure Demo2 is
begin
   delay 1.0;
   Put_Line ("About to enter critical section...");
   M.lock;
   Put_Line ("[in critical section]");
   delay 3.0;
   M.unlock;
   Put_Line ("Left critical section.");
end Demo2;