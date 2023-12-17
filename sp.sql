use DB_clinic GO
select * from bimeh
select * from visit
select * from bimehShode
  --ویزیت شدند و بیمه ی آسیا دارندd1 تا d2 کدملی بیمارانی و فامیلی بیمارانی که در بازه ی 
  CREATE PROCEDURE sp_asia
  @date1 VARCHAR(10),
  @date2 VARCHAR(10),
  @result1 nvarchar(50) output,
  @result2 nvarchar(50) output
AS
BEGIN
  set @result1 = ( SELECT codeMeli
  FROM Patient 
  INNER JOIN visit ON Patient.idParvande = visit.idParvande
  INNER JOIN bimehShode ON visit.idParvande = bimehShode.idParvande 
  INNER JOIN bimeh ON bimehShode.codeBimeh = bimeh.codeBimeh
  WHERE bimeh.onvan LIKE 'asia' 
  AND visit.Date BETWEEN @date1 AND @date2)
  set @result2 = ( SELECT lname
  FROM Patient 
  INNER JOIN visit ON Patient.idParvande = visit.idParvande
  INNER JOIN bimehShode ON visit.idParvande = bimehShode.idParvande 
  INNER JOIN bimeh ON bimehShode.codeBimeh = bimeh.codeBimeh
  WHERE bimeh.onvan LIKE 'asia' 
  AND visit.Date BETWEEN @date1 AND @date2)
END

declare @res1 NVARCHAR(50),@res2 NVARCHAR(50)
exec sp_asia '1401/05/05','1401/06/26',@res1 output ,@res2 output 
select @res1,@res2
-------------------------------------------------------------------------------------
--پروسیجری که روز هفته رو بگیره وفامیلی دکترهای اون روزو بده

CREATE procedure sp_barname
@roz int ,
@res NVARCHAR(50) output
AS
BEGIN
	    select distinct lname,Profession from Doctor inner join barnamePezashk on Doctor.idD = barnamePezashk.idD
		where daysWeek = @roz
END

Declare @res NVarChar(50)
Exec sp_barname 4, @res output
Print(@res)
---------------------------------------------------------------------
--داده های جدید اضافه کند به جدول بیمار
Create Procedure inserting
@codeMeli varchar(10) , @email varchar(50), @password varchar(30) ,
@fname nvarchar(50) ,@lname nvarchar(50),@address nvarchar(60),
@phoneNumber varchar(11) ,@gender varchar(20),@birthDate varchar(10)
AS
Begin
		insert into Patient([codeMeli],[email],[password],[fname],[lname],[address],[phoneNumber],[gender],[birthDate])
		values (@codeMeli,@email,@password,@fname,@lname,@address,@phoneNumber,@gender,@birthDate)
		print('successfully inserting '+@fname +' '+@lname)
End;

Exec inserting '0562145879','setareez25@gmail.com','se30tare','setareh','ezabadi','emamHoseini17','09154782536','0','1381/03/27';




select * from barnamePezashk
select * from Doctor
select * from tashkhiesBimari
select * from tasviehHesab
select * from Patient
select * from visit
select * from bimeh
select * from bimehShode