 USE DB_clinic GO
--فانکشنی که کد ملی بیمار رو بگیره و ساعت  نوبتشو بده

CREATE FUNCTION visit_time (@codemeli VARCHAR(10))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @result NVARCHAR(255)
    SET @result = (
	    -- تضمین می‌کند که فقط یک مقدار از زیرپرس و جو برگردانده می‌شود.
        SELECT TOP 1 Time 
        FROM visit 
        INNER JOIN patient ON visit.idParvande = Patient.idParvande
        WHERE codeMeli = @codemeli
    )
    RETURN @result
END

SELECT dbo.visit_time('0592556898');
----------------------------------------------------------------------
select * from barnamePezashk
select * from Doctor
select * from tashkhiesBimari
select * from tasviehHesab
select * from Patient
select * from visit
select * from bimeh
select * from bimehShode
--------------------------------------------------------
--تابعی که درصد بیمه را از هزینه ی ویزیت کم کند

CREATE FUNCTION hazine(@codemeli VARCHAR(10))
RETURNS int
AS
BEGIN
    DECLARE @result int
    SET @result = (
        SELECT TOP 1 hazine - (hazine/100)*sahmeBime
        FROM visit 
        INNER JOIN patient ON visit.idParvande = Patient.idParvande
        WHERE codeMeli = @codemeli
    )
    RETURN @result
END


SELECT dbo.hazine('0592556898');
------------------------------------------------------------------
--آیدی دکتر را بگیرد و بگوید چند روز در هفته این دکتر کار دارد

CREATE FUNCTION RozeKari(@idD int)
RETURNS int
AS
BEGIN
    DECLARE @result int
    SET @result = (
        SELECT COUNT(idD)
        FROM barnamePezashk 
        WHERE idD = @idD
		group by idD
    )
    RETURN @result
END

select * from barnamePezashk
SELECT dbo.RozeKari(3);
