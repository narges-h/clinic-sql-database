
--فانکشنی که کد ملی بیمار رو بگیره و ساعت و روز نوبتشو بده

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



