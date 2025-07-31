with Ada.Text_IO; use Ada.Text_IO;

package body atomic is
   protected actionController is
      entry first;
      entry second;
      entry third;
      entry finished;
      function getPrivNum return Integer;
      procedure setPrivNum(num: in Integer);
      procedure addToPrivNum(num: in Integer);
   private
      firstHere: Boolean := False;
      secondHere: Boolean := False;
      thirdHere: Boolean := False;
      release: Boolean := False;
      privNum: Integer := 0;
   end actionController;

   protected body actionController is
      entry first when not firstHere is
      begin
         firstHere := True;
      end first;
      entry second when not secondHere is
      begin
         secondHere := True;
      end second;
      entry third when not thirdHere is
      begin
         thirdHere := True;
      end third;
      entry finished when release or finished'Count = 3 is
      begin
         if finished'Count = 0 then
            release := False;
            firstHere := False;
            secondHere := False;
            thirdHere := False;
         else
            release := True;            
         end if;
      end finished;
      
      function getPrivNum return Integer is
      begin
         return privNum;
      end getPrivNum;

      procedure setPrivNum(num: in Integer) is
      begin
         privNum := num;
      end setPrivNum;

      procedure addToPrivNum(num: in Integer) is
      begin
         privNum := privNum + num;
      end addToPrivNum;

   end actionController;
   
   procedure firstProcedure(num1: in Integer) is
   begin
      actionController.first;
         actionController.setPrivNum(num1);
      actionController.finished;
   end firstProcedure;

   procedure secondProcedure(num2: in Integer) is
   begin
      actionController.second;
         actionController.addToPrivNum(num2);
      actionController.finished;
   end secondProcedure;

   procedure thirdProcedure(num3: out Integer) is
   begin
      actionController.third;
         num3 := actionController.getPrivNum;
      actionController.finished;
   end thirdProcedure;
end atomic;