package POSIX_mutex is
   protected M is
      entry lock;
      procedure unlock;
   private
      locked : Boolean := False;
   end M;
end POSIX_mutex;