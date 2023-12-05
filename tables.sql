CREATE DATABASE DB_clinic;

CREATE TABLE Patient(
idParvande int PRIMARY KEY Identity(1,1),
codeMeli varchar(10) NOT NULL,
email varchar(50),
password varchar(30),
fname nvarchar(50) NOT NULL,
lname nvarchar(50) NOT NULL,
address nvarchar(60) NOT NULL,
phoneNumber varchar(11) NOT NULL,
gender varchar(20) NOT NULL,
birthDate varchar(8) NOT NULL
);
alter table Patient
alter column birthDate varchar(10);

CREATE TABLE Doctor(
idD int PRIMARY KEY Identity(1,1),
email varchar(50),
password varchar(30),
fname nvarchar(50) NOT NULL,
lname nvarchar(50) NOT NULL,
gender varchar(20) NOT NULL,
Profession nvarchar(50) NOT NULL,
Biography nvarchar(150),
MedicalCode nvarchar(10)
);

CREATE TABLE bimeh(
codeBimeh int PRIMARY KEY Identity(1,1),
onvan nvarchar(50) NOT NULL,
);

CREATE TABLE bimehShode(
codeBimehShode int PRIMARY KEY Identity(1,1),
codeBimeh int FOREIGN KEY REFERENCES bimeh(codeBimeh) NOT NULL,
idParvande int FOREIGN KEY REFERENCES Patient(idParvande) NOT NULL,
startDate varchar(8) NOT NULL,
endDate varchar(8) NOT NULL,
);
alter table bimehShode
alter column startDate varchar(10);
alter table bimehShode
alter column endDate varchar(10);

CREATE TABLE visit(
idV int PRIMARY KEY Identity(1,1),
idParvande int FOREIGN KEY REFERENCES Patient(idParvande) NOT NULL,
idD int FOREIGN KEY REFERENCES Doctor(idD) NOT NULL,
Date varchar(8) NOT NULL,
Time varchar(8) NOT NULL,
codeBimehShode int FOREIGN KEY REFERENCES bimehShode(codeBimehShode) NOT NULL,
sahmeBime varchar(10) NOT NULL,
hazine varchar(10) NOT NULL
);
alter table visit
alter column Date varchar(10);

CREATE TABLE tashkhiesBimari(
id int PRIMARY KEY Identity(1,1),
idParvande int FOREIGN KEY REFERENCES Patient(idParvande) NOT NULL,
idV int FOREIGN KEY REFERENCES visit(idV) NOT NULL,
bimari nvarchar(8) NOT NULL,
);
alter table tashkhiesBimari
alter column bimari varchar(20);

CREATE TABLE barnamePezashk(
id int PRIMARY KEY Identity(1,1),
idD int FOREIGN KEY REFERENCES Doctor(idD) NOT NULL,
startTime varchar(8) NOT NULL,
endTime varchar(8) NOT NULL,
daysWeek varchar(100) NOT NULL,
);


CREATE TABLE tasviehHesab(
codePardakht int PRIMARY KEY Identity(1,1),
idV int FOREIGN KEY REFERENCES visit(idV) NOT NULL,
tarikhePardakht varchar(8) NOT NULL
);
alter table tasviehHesab
alter column tarikhePardakht varchar(10);