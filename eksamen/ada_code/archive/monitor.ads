package monitor is
   protected type M is
      entry lock;
      procedure unlock;
      entry reg_for_wait;
      entry wait;
      procedure notifyAll;
   private
      locked: Boolean := False;
      released: Boolean := False;
      num_waiting: Integer := 0;
   end M;
end monitor;
