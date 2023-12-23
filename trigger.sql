
--تریگری که پیغام ثبت موفقیت آمیز بدهد
select * from bimeh
select * from log
Create Trigger TR_Insert
On bimeh
After Insert
As
Begin
	Print(N'رکورد جدید با موفقیت ثبت شد')

	declare @code int 
	select @code = inserted.codeBimeh from inserted

	insert into log(logTableName, logType, logKeyId, logDate)
	values('bimeh','insert',@code,GETDATE())
End

insert into bimeh values('ma')
select @@identity
select IDENT_CURRENT('visit')
------------------------------------------------------------
--نمایش محتوای تریگر
Exec sp_helptext TR_Insert
----------------------------------------------------------
--پیغام حذف یک رکورد
Create Trigger TR_Delete
On bimeh
After Delete
As
Begin
    Print(N'حذف با موفقیت انجام شد')
    declare @code int 
	select @code = deleted.codeBimeh from deleted

	insert into log(logTableName, logType, logKeyId, logDate)
	values('bimeh','delete',@code,GETDATE())

End

Select * From bimeh
Delete From bimeh Where codeBimeh=5
-------------------------------------------------------------
-- delete trigger
Drop Trigger If Exists TR_update
-----------------------------------------------------------
--اگر دکتر جدید اضافه شد،به برنامه پزشکان هم فیلدی با همان آیدی اضافه شود
Create Trigger TR_insertDoctor
On Doctor
After insert
As
Begin
	insert into barnamePezashk(idD) 
	select idD from inserted
End

insert into Doctor(email,password,fname,lname,gender,Profession) values
('banafshehh@gmail.com','banhash20','banafshe','hashemi','0','post')
-----------------------------------------------------------
Exec sp_helptext TR_insertDoctor
Select * From Doctor
Select * From barnamePezashk
------------------------------------------------------------------------
create table log(
logId int primary key identity(1,1),
logTableName varchar(50),
logType nvarchar(50),
logKeyId int,
logDate DateTime,
)
 

