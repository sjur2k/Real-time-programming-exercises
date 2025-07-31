with Ada.Text_IO; use Ada.Text_IO;
procedure v24 is

protected M is
entry lock;
procedure unlock;
private
   locked: Integer := 0;
end M;

protected body M is
entry lock when (locked = 0) is
begin
   locked := 1;
end lock;
procedure unlock is
begin
   locked := 0;
end unlock;
end M;

task thread1 is
end thread1;

task body thread1 is
begin
null;
end thread1;

task thread2 is
end thread2;

task body thread2 is
begin
null;
end thread2;

begin
null;
end v24;