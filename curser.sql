use DB_clinic GO
--کرسری که در آن آپدیت انجام شود
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
          Set Date='1401/06/07'
          where codeBimehShode = 6 
          fetch next from cr into @Date
          end
Close cr
Deallocate cr
select * from visit

--------------------------------------------------------
--نمایش ایدی پرونده با نام خانوادگی بیماران زن
Declare @id int , @name nvarchar(15)
Declare CrName cursor
for
(
	select  idParvande, lname
	from Patient where gender = 0
)
open CrName
fetch next from CrName Into @id,@name
while(@@FETCH_STATUS=0)
    begin
		 Print(N'Information is: '+' '+cast(@id as nvarchar(5))+' '+@name)
		 fetch next from CrName Into @id,@name
	end
		
Close CrName
Deallocate CrName
select * from Patient
--------------------------------------------------------------
