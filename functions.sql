select * from barnamePezashk
select * from Doctor
select * from tashkhiesBimari
select * from tasviehHesab
select * from Patient
select * from visit
select * from bimeh
select * from bimehShode

--چهار رقم آخر کد ملی
SELECT SUBSTRING(codeMeli,7,4) FROM Patient;

--اسم بیمار در ایمیل ان بکار رفته باشد
SELECT idParvande, CHARINDEX('narges',email) FROM Patient;

--بجای اسم رضا علیرضا باشد
SELECT REPLACE(fname,'reza', 'alireza') FROM Doctor;

 --اسم ها با حروف بزرگ باشند
SELECT UPPER(fname) FROM Patient;

--دو حرف سمت راست
SELECT right(fname, 2) FROM Patient;

--جایگذاری
SELECT STUFF(email, 7, 3, '.70') FROM Patient;





