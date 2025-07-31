package body POSIX_mutex is
   protected body M is
      entry lock when not Locked is
      begin
         locked := True;
      end lock;

      procedure unlock is
      begin
         locked := False;
      end unlock;
   end M;
end POSIX_mutex;
