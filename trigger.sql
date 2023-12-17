
--تریگری که پیغام ثبت موفقیت آمیز بدهد
select * from bimeh

Create Trigger TR_Insert
On bimeh
After Insert
As
Begin
	Print(N'رکورد جدید با موفقیت ثبت شد')
End

insert into bimeh values('salamat')
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
End

Select * From bimeh
Delete From bimeh Where codeBimeh=6
----------------------------------------------------------
--پیغام تاربخ به روز رسانی
Create Trigger TR_update
On bimeh
After Update
As
Begin
      select getdate()
end
update bimeh set onvan = 'salamat' where codeBimeh = 4
-------------------------------------------------------------
-- delete trigger
Drop Trigger If Exists TR_DeleteBime
-----------------------------------------------------------
-----------------------------------------------------------



