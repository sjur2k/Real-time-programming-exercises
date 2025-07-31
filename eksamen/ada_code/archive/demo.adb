with Ada.Text_IO;    use Ada.Text_IO;
with monitor; use monitor;
procedure Demo is
m: monitor.M;

procedure lock is
begin
   m.lock;
end lock;

procedure unlock is
begin
   m.unlock;
end unlock;

procedure wait is
begin
   m.reg_for_wait;
   m.wait;
end wait;

procedure notifyAll is
begin
   m.notifyAll;
end notifyAll;

task thread1 is
end thread1;
task body thread1 is
begin
   Put_Line ("Thread1 trying to enter critical section");
   lock;
   Put_Line ("Thread1 waiting");
   wait;
   Put_Line ("Thread1 in critical section");
   delay 2.0;
   Put_Line ("Thread1 left critical section");
   unlock;
   notifyAll;
   Put_Line ("Thread1 notifyAll");
end thread1;

task thread2 is
end thread2;
task body thread2 is
begin
   Put_Line ("Thread2 trying to enter critical section");
   lock;
   Put_Line ("Thread2 waiting");
   wait;
   Put_Line ("Thread2 in critical section");
   delay 2.0;
   Put_Line ("Thread2 left critical section");
   unlock;
   notifyAll;
   Put_Line ("Thread2 notifyAll");
end thread2;

begin
   null;
end Demo;