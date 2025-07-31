package body monitor is
   protected body M is
      entry lock when not locked is
      begin
         locked:=True;
      end lock;
      procedure unlock is
      begin
         locked:=False;
      end unlock;
      entry reg_for_wait when locked and not released is
      begin
         locked := False;
         num_waiting :=+ 1;
      end reg_for_wait;
      entry wait when not released is
      begin
         num_waiting :=- 1;
         if num_waiting = 0 then
            released := false;
         end if;
         locked := True;
      end wait;
      procedure notifyAll is
      begin
         released := True;
      end notifyAll;
   end M;
end monitor;