
INSERT INTO Patient(codeMeli, email, password, fname, lname, address, phoneNumber, gender, birthDate)
VALUES ('0592556898','narges.80.hoseini@gmil.com','narges8080','narges','hoseini','saveh-kargar18','09905826595','0','1380/07/26'),
('1254783365','amirbigdel@gmil.com','big_70_am','amir','bigdeli','mazandaran-nor','09336751448','1','1381/09/09'),
('1122334455','saraa8822@gmil.com','sarakarimi','sara','karimi','gorgan-shahrakEmam','09195686785','0','1388/04/22'),
('7896541233','zahradeh75@gmil.com','dehghaaan','zahra','dehghan','mashhad-ghaen','09015751362','0','1363/07/03');

INSERT INTO Doctor(email, password, fname, lname, gender, Profession, Biography, MedicalCode)
VALUES ('karimian.60.hosein@gmil.com','n-hosein-k','hosein','karimian','1','bihoshi',null,'13800726'),
('holakoei@gmil.com','reza50h','reza','holakoei','1','ghalb',null,'145287932'),
('fatemeAkbari@gmil.com','fatemaAkbari','fateme','akbari','0','zanan',null,'2200114');

INSERT INTO bimeh(onvan) VALUES ('iran'),('dana'),('asia'),('ma'),('pasargad');

INSERT INTO bimehShode(codeBimeh, idParvande, startDate, endDate)
VALUES (1,2,'1398/07/07','1401/07/07'),
(2,5,'1400/01/05','1401/01/05'),
(1,3,'1398/10/25','1401/10/25'),
(3,4,'1389/05/26','1395/05/26');

INSERT INTO visit(idParvande, idD, Date, Time, codeBimehShode, sahmeBime, hazine)
VALUES (2,3,'1402/05/06','12:20',6,'5%','20000'),
(3,1,'1402/05/07','14:15',8,'7%','22000'),
(2,2,'1402/06/26','15:30',6,'5%','20000'),
(4,1,'1402/06/20','17:00',9,'2%','15000'),
(5,2,'1402/06/10','19:00',7,'10%','30000');


INSERT INTO tashkhiesBimari(idParvande, idV, bimari)
VALUES (2,2,'bardar'),
(2,4,'orogh'),
(5,6,'riye'),
(3,3,'amaleCheshm'),
(4,5,'zayeman');


INSERT INTO tasviehHesab(idV, tarikhePardakht)
VALUES (2,'1402/05/06'),
(3,'1402/05/07'),
(4,'1402/06/26'),
(5,'1402/06/20'),
(6,'1402/06/10');


INSERT INTO barnamePezashk(idD, startTime, endTime, daysWeek)
VALUES (1,'09:00','17:00','1'),
(1,'07:00','12:00','3'),
(1,'09:00','17:00','5'),
(2,'08:00','11:00','1'),
(2,'15:00','18:00','1'),
(2,'10:00','14:00','2'),
(2,'08:30','13:30','4'),
(3,'09:00','17:00','6'),
(3,'11:00','17:00','3'),
(3,'09:00','17:00','2');




