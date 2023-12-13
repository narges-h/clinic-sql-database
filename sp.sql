  use DB_clinic GO

  --ویزیت شدند و بیمه ی آسیا دارندd1 تا d2 کدملی بیمارانی که در بازه ی 
  CREATE PROCEDURE sp_asia
  @date1 VARCHAR(10),
  @date2 VARCHAR(10),
  @result nvarchar(50) output
AS
BEGIN
  set @result = ( SELECT codeMeli
  FROM Patient 
  INNER JOIN visit ON Patient.idParvande = visit.idParvande
  INNER JOIN bimehShode ON visit.idParvande = bimehShode.idParvande 
  INNER JOIN bimeh ON bimehShode.codeBimeh = bimeh.codeBimeh
  WHERE bimeh.onvan LIKE 'asia' 
  AND visit.Date BETWEEN @date1 AND @date2)
END

declare @res NVARCHAR(50)
exec sp_asia '1402/05/05','1402/06/26',@res output 
select @res

select * from Patient
select * from visit
select * from bimeh
select * from bimehShode



CREATE PROCEDURE sp_asia2
    @date1 VARCHAR(10),
    @date2 VARCHAR(10),
    @result NVARCHAR(50) OUTPUT
AS
BEGIN
    SELECT Patient.idParvande, fname, lname 
    INTO #tempTable
    FROM Patient 
    INNER JOIN visit ON Patient.idParvande = visit.idParvande
    INNER JOIN bimehShode ON visit.idParvande = bimehShode.idParvande 
    INNER JOIN bimeh ON bimehShode.codeBimeh = bimeh.codeBimeh
    WHERE bimeh.onvan LIKE 'asia' 
    AND visit.Date BETWEEN @date1 AND @date2

    SET @result = (
        SELECT idParvande, fname, lname 
        FROM #tempTable
    )
    DROP TABLE #tempTable
END
DECLARE @output1 NVARCHAR(50), @output2 INT, @output3 VARCHAR(20)
EXEC sp_asia2 '1402/05/05','1402/06/26', @output1 OUTPUT
SELECT @output1 AS Result




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
Exec sp_barname 2, @res output
Print(@res)


