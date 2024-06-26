create database ProjektiSemestralDb

use ProjektiSemestralDb

create table Shteti (
		Shteti_ID int primary key identity(1,1),
		Emri varchar(50),
)
create table Qyteti (
		Qyteti_ID int primary key identity(1,1),
		Emri varchar(50),
		Shteti int foreign key references Shteti(Shteti_ID) 
)

create table Puntoret (
		Puntoret_ID int primary key identity(1,1),
		EmriPuntorit varchar(50),
		MbiemriPuntorit varchar(50),
		Mosha int,
		Gjinia char(1),
		Qyteti int foreign key references Qyteti(Qyteti_ID),
		Shteti int foreign key references Shteti(Shteti_ID)
)
create table Klienti (
		klienti_ID int primary key identity(1,1),
		emriKlientit varchar(50),
		mbiemriKlienti varchar(50),
		Gjinia char(1),
		Qyteti int foreign key references Qyteti(Qyteti_ID),
		Shteti int foreign key references Shteti(Shteti_ID)
)
create table Artisti (
		artisti_ID int primary key identity (1,1),
		emri_artistit varchar (50)
)
create table VepraArti (
		vepraArti_ID int primary key identity (1,1),
		emri_veprave varchar (50) foreign key references Artisti(artisti_ID),
		artisti_ID int,
		cmimi Decimal(10,2)
)
create table Shitja_Veprave (
		Puntoret_ID int foreign key references Puntoret(Puntoret_ID),
		vepraArti_ID int foreign key references VepraArti(vepraArti_ID),
		data_shitjes datetime primary key (Puntoret_ID, vepraArti_ID)
)
create table Ekspozita (
		ekspozita_ID int primary key identity(1,1),
		emri_ekspozites varchar(50),
		Qyteti int foreign key references Qyteti(Qyteti_ID),
		data_fillimit datetime,
		data_mbarimit datetime,
)

create table Transaksioni (
		transaksioni_ID int primary key identity (1,1),
		Klienti int foreign key references Klienti(Klienti_ID),
		vepraArti int foreign key references VepraArti(vepraArti_ID),
		data_transaksionit datetime,
		cmimi decimal(8,2)
)

INSERT INTO Shteti(Emri)
VALUES ('Kosove'),
	   ('Shqiperi'),
	   ('Maqedoni'),
	   ('Mali i Zi')

INSERT INTO Qyteti(Emri, Shteti)
VALUES ('Prishtine',1),
	   ('Vushtrri',1),
	   ('Kukes',2),
	   ('Tirane',2),
	   ('Struge',3),
	   ('Shkup',3),
	   ('Podgorice',4),
	   ('Ulqin',4)

INSERT INTO Puntoret(EmriPuntorit,MbiemriPuntorit,Mosha,Gjinia,Shteti,Qyteti)
VALUES ('Punetori 1','Punetori 1', 25,'M',1,1),
	   ('Punetori 2','Punetori 2', 30,'F',2,4),
	   ('Punetori 3','Punetori 3', 28,'M',3,5),
	   ('Punetori 4','Punetori 4', 26,'F',4,7),
	   ('Punetori 5','Punetori 5', 33,'M',4,8),
	   ('Punetori 6','Punetori 6', 35,'F',3,6),
	   ('Punetori 7','Punetori 7', 24,'M',1,2),
	   ('Punetori 8','Punetori 8', 37,'F',2,3),
	   ('Punetori 9','Punetori 9', 34,'M',3,5),
	   ('Punetori 10','Punetori 10', 27,'F',1,1)

INSERT INTO Klienti(emriKlientit,mbiemriKlienti,Gjinia,Qyteti,Shteti)
VALUES ('Klienti 1','Klienti 1','F',1,1),
	   ('Klienti 2','Klienti 2','M',2,1),
	   ('Klienti 3','Klienti 3','F',3,2),
	   ('Klienti 4','Klienti 4','M',4,2),
	   ('Klienti 5','Klienti 5','F',3,3),
	   ('Klienti 6','Klienti 6','M',4,3),
	   ('Klienti 7','Klienti 7','F',7,4),
	   ('Klienti 8','Klienti 8','F',6,3),
	   ('Klienti 9','Klienti 9','F',5,3),
	   ('Klienti 10','Klienti 10','F',8,4)

INSERT INTO Artisti(emri_artistit)
VALUES ('Van Gogh'),
	   ('Leonardo da Vinci'),
	   ('Pablo Picasso'),
	   ('Claude Monet'),
	   ('Andy Warhol')

INSERT INTO VepraArti(emri_veprave,artisti_ID,cmimi)
VALUES ('Mona Liza',1,3450.85),
		('Nature Beauty', 2, 437.58),
		('The Starry Night', 3, 508.56),
		('Girl with a pearl Earring',4,705.35),
		('Treehouse Crafts', 5, 888.96)

INSERT INTO Shitja_Veprave(Puntoret_ID,vepraArti_ID,data_shitjes)
VALUES (1,1,'2023-05-13 14:47:35'),
	   (2,2,'2023-05-17 11:00:00'),
	   (3,3,'2023-04-27 12:20:20'),
	   (4,4,'2023-05-08 16:45:01'),
	   (5,5,'2023-05-05 10:03:29')

INSERT INTO Ekspozita(emri_ekspozites,Qyteti,data_fillimit,data_mbarimit)
VALUES ('Paper Threads', 2,'2023-05-05 14:47:35','2023-05-10 00:00:00'),
	   ('The Art City', 7,'2023-05-17 11:00:00','2023-05-20 00:00:00'),
	   ('Context House', 5,'2023-04-27 12:20:20','2023-04-30 00:00:00')

INSERT INTO Transaksioni(Klienti,vepraArti,data_transaksionit,cmimi)
VALUES (1,1,'2023-05-05 10:03:29', 250.75),
	   (2,5,'2023-04-27 12:20:20', 750.25),
	   (3,4,'2023-05-17 11:00:00', 550.65),
	   (4,3,'2023-05-08 16:45:01', 150.05),
	   (7,2,'2023-05-13 14:47:35', 500.00)

SELECT * FROM Artisti
SELECT * FROM Ekspozita
SELECT * FROM Klienti
SELECT * FROM Puntoret
SELECT * FROM Qyteti
SELECT * FROM Shitja_Veprave
SELECT * FROM Shteti
SELECT * FROM Transaksioni
SELECT * FROM VepraArti




	   
	



