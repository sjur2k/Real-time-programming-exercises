with Ada.Text_IO; use Ada.Text_IO;
with atomic;

procedure atomicMain is
task type w1;
task type w2;
task type w3;
num3: Integer;

task body w1 is
begin
   atomic.firstProcedure (2);
end w1;
T1:w1;

task body w2 is
begin
   atomic.secondProcedure (3);
end w2;
T2:w2;

task body w3 is
begin
   atomic.thirdProcedure(num3);
   Put_Line (Integer'Image(num3));
end w3;
T3:w3;

begin
   null;
end atomicMain;