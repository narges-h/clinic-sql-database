use DB_clinic GO

Declare @Date varchar(10)
Declare cr Cursor
For(
     Select Date
     From visit
)
for update of Date
Open cr
     fetch next from cr into @Date
     while(@@FETCH_STATUS=0)
          begin
          update visit
          Set Date='1401/06/06'
          where codeBimehShode = 6 
          fetch next from cr into @Date
          end
Close cr
Deallocate cr


select * from visit

