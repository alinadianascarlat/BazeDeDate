 DROP TABLE angajati;

CREATE TABLE angajati(
IdAngajat int NOT NULL PRIMARY KEY,
NUME varchar(20) NOT NULL,
PRENUME varchar(20) NOT NULL,
DataN datetime,
Adresa varchar(50),
Salariu decimal DEFAULT 2800,
IdSectie int
);

DROP TABLE sectii;

CREATE TABLE sectii(
IdSectie int NOT NULL PRIMARY KEY,
Nume varchar(50) NOT NULL,
Buget decimal,
);
ALTER TABLE angajati ADD CONSTRAINT fk_angajati FOREIGN KEY(IdSectie) REFERENCES Sectii(IdSectie);
--restrictie integritate diferentiala

INSERT INTO sectii VALUES(1,'Productie',1400);
INSERT INTO sectii VALUES(2,'Contabilitate',1200);
INSERT INTO sectii VALUES(3,'Vanzari',3000);

INSERT INTO angajati VALUES(100,'Ion','Viorel','02/21/1990','Craiova',2100,1);
INSERT INTO angajati VALUES(101,'Ana','Popa','01/01/1990','Bals',2200,2);
INSERT INTO angajati VALUES(102,'Nicu','Adrian','05/07/1989','Craiova',1800,1);
INSERT INTO angajati VALUES(103,'Gigel','Catel','09/03/1990','Slatina',1600,3);
 
 
DROP TABLE angajati1;

CREATE TABLE angajati1(
IdAngajat int NOT NULL PRIMARY KEY,
NUME varchar(20) NOT NULL,
PRENUME varchar(20) NOT NULL,
DataN datetime,
Adresa varchar(50),
Salariu decimal DEFAULT 2800,
IdSectie int
);


INSERT INTO angajati1 VALUES(100,'Ion','Viorel','02/21/1990','Craiova',2100,1);
INSERT INTO angajati1 VALUES(101,'Ana','Popa','01/01/1990','Bals',2200,2);
INSERT INTO angajati1 VALUES(104,'Fota','Lidia','04/03/1994','Turceni',2300,2);
INSERT INTO angajati1 VALUES(105,'Dragomir','Georgica','09/12/1994','Slatina',2700,3);

SELECT *FROM angajati1;

SELECT * FROM angajati 
UNION 
SELECT * FROM angajati1;

SELECT * FROM angajati 
UNION ALL
SELECT * FROM angajati1;

SELECT * FROM angajati
INTERSECT
SELECT * FROM angajati1;

SELECT * FROM angajati
EXCEPT
SELECT * FROM angajati1;

SELECT * FROM angajati
WHERE IdSectie=1 AND Adresa='Craiova';


SELECT IdAngajat, NUME, Adresa FROM angajati;


SELECT * FROM angajati,sectii; --produs cartezian

SELECT * FROM angajati,sectii
WHERE angajati.IdSectie=sectii.IdSectie; -- join
  
SELECT * FROM angajati a
WHERE IdSectie=1;

SELECT a.IdAngajat,a.Adresa,s.IdSectie,s.NUME,s.Buget FROM angajati a, sectii s
WHERE a.IdSectie=s.IdSectie; 

SELECT angajati.NUME,PRENUME,DataN,Salariu FROM sectii, angajati WHERE sectii.IdSectie=angajati.IdSectie AND sectii.Nume='Productie';

SELECT * FROM angajati WHERE IdSectie IN (SELECT IdSectie FROM sectii WHERE IdSectie=1); --imbricare

SELECT * FROM angajati WHERE IdSectie IN (SELECT IdSectie FROM sectii WHERE IdSectie>1); --imbricare


drop table ACHIZITII
create table ACHIZITII(
idAchizitie int PRIMARY KEY,
idFurnizor int,
idComponenta int,
idAngajat int,
Data DateTime,
NrComponente int,
PretUnitar decimal(8,2)
);

drop table FURNIZORI
create table FURNIZORI(
idFurnizor int PRIMARY KEY,
Nume varchar(20),
Prenume varchar(20),
Adresa varchar(20));

drop table COMPONENTE
create table COMPONENTE(
idComponenta int PRIMARY KEY,
Denumire varchar(20),
Descriere varchar(20));

drop table PRODUSE
create table PRODUSE(
idProdus int PRIMARY KEY,
Denumire varchar(20),
Descriere varchar(20));

drop table CLIENTI
create table CLIENTI(
idClient int PRIMARY KEY,
Nume varchar(20),
Prenume varchar(20),
Adresa varchar(20));

drop table PROIECTE
create table PROIECTE(
idProiect int PRIMARY KEY,
Denumire varchar(20),
Termen DateTime,
Buget int);

drop table VANZARI
create table VANZARI(
idVanzare int PRIMARY KEY,
idProdus int,
idClient int,
idAngajat int,
Data datetime,
NumarProdus int);

drop table ACTIVITATI;
create table ACTIVITATI(
idProiect int,
idAngajat int,
Ore int,
Constraint x1 PRIMARY KEY(idProiect,idAngajat));

drop table COMPOZITII
create table COMPOZITII(
idComponenta int,
idProdus int,
NrComponente int,
Constraint x2 PRIMARY KEY(idComponenta,idProdus));

drop table INGINERI
create table INGINERI(
idAngajat int,
idSpecialitatea int,
Constraint cheiePrimaraIngineri PRIMARY KEY(idAngajat));

drop table specialitatea;
create table specialitatea (
idspecialitatea int,
nume varchar(100),
Constraint cheiePrimara PRiMARY KEY(idspecialitatea)
);

drop table dependenti;
create table dependenti(
idAngajat int ,
nume varchar(100),
prenume varchar(100),
DataNasterii datetime,
GradRudenie varchar(100),
Constraint cheiePrimaraD PRIMARY KEY(idAngajat,nume,prenume)
);



alter table ACHIZITII add Constraint f1 foreign key(idFurnizor) REFERENCES Furnizori(idFurnizor);

alter table ACHIZITII add Constraint f2 foreign key(idComponenta) REFERENCES Componente(idComponenta);

alter table ACHIZITII add Constraint f3 foreign key(idAngajat) REFERENCES Angajati(idAngajat);

alter table COMPOZITII add Constraint f4 foreign key(idComponenta) REFERENCES Componente(idComponenta);

alter table COMPOZITII add Constraint f5 foreign key(idProdus) REFERENCES Produse(idProdus);

alter table VANZARI add Constraint f6 foreign key(idProdus) REFERENCES PRODUSE(idProdus);

alter table VANZARI add Constraint f7 foreign key(idClient) REFERENCES Clienti(idClient);

alter table ACTIVITATI add Constraint f8 foreign key(idPROIECT) REFERENCES Proiecte(idProiect);

alter table ACTIVITATI add Constraint f9 foreign key(idAngajat) REFERENCES Angajati(idAngajat);

alter table VANZARI add Constraint f10 foreign key(idAngajat) REFERENCES Angajati(idAngajat);



alter table SECTII add Constraint f11 foreign key(idSectie) REFERENCES Proiecte(idProiecte);
alter table SECTII add Constraint f12 foreign key(idAngajat) REFERENCES Angajati(idAngajat);

alter table INGINERI add Constraint f13 foreign key(idAngajat) REFERENCES Specialitatea(IdSpecialitatea);
alter table INGINERI add Constraint f14 foreign key(idAngajat) REFERENCES Angajati(idAngajat);

alter table FURNIZORI add Constraint f15 foreign key(idFurnizor) REFERENCES Achizitii(idAchizitie);
alter table FURNIZOR add Constraint f17 foreign key(idAngajat) REFERENCES ANGAJATI(idAngajat);
alter table ACHIZITII add Constraint f18 foreign key(idAchizitie) REFERENCES Angajati(idAngajat);

alter table DEPENDENTI add Constraint f21 foreign key(idAngajat) REFERENCES Angajati(idAngajat);

alter table INGINERI add Constraint f22 foreign key(idAngajat)  REFERENCES Angajati(idAngajat);

alter table CLIENTI add Constraint f24 foreign key(idClient)  REFERENCES VANZARI(idVanzare);






INSERT INTO FURNIZORI VALUES (1,'ALECU','ION','CRAIOVA');
INSERT INTO FURNIZORI VALUES (2,'IANCU','DAN','BALS');
INSERT INTO FURNIZORI VALUES (3,'STOICA','NICU','BUCURESTI');

INSERT INTO PRODUSE VALUES (1,'TRICOU','ROSU');
INSERT INTO PRODUSE VALUES (2,'CAMASA','ALBA');
INSERT INTO PRODUSE VALUES (3,'SAPCA','NEAGRA');
INSERT INTO PRODUSE VALUES (4,'PANTOFI','MARO');

INSERT INTO COMPONENTE VALUES (1,'NASTURI','MARI');
INSERT INTO COMPONENTE VALUES (2,'ATA','SUBTIRE');
INSERT INTO COMPONENTE VALUES (3,'BENTITA','ALBA');

INSERT INTO CLIENTI VALUES (1,'ILIESCU','ION','RAHOVA');
INSERT INTO CLIENTI VALUES (2,'UDREA','ELENA','JILAVA');
INSERT INTO CLIENTI VALUES (3,'COCOS','DORIN','GHERLA');

SELECT * FROM CLIENTI;

INSERT INTO PROIECTE VALUES (1,'DNA','03/23/2015',2000);
INSERT INTO PROIECTE VALUES (2,'DIICOT','05/20/2015',1500);
INSERT INTO PROIECTE VALUES (3,'CSM','11/21/2015',2500);

INSERT INTO ACHIZITII VALUES (1,1,1,100,'03/24/2015',5,3);
INSERT INTO ACHIZITII VALUES (2,2,3,102,'03/25/2015',6,4);
INSERT INTO ACHIZITII VALUES (3,3,2,100,'03/26/2015',10,18);
INSERT INTO ACHIZITII VALUES (4,2,1,103,'03/15/2015',7,10);

INSERT INTO COMPOZITII VALUES (1,1,5);
INSERT INTO COMPOZITII VALUES (2,2,3);
INSERT INTO COMPOZITII VALUES (3,3,1);
INSERT INTO COMPOZITII VALUES (2,4,1);

INSERT INTO VANZARI VALUES (1,2,3,101,'03/23/2015',3);
INSERT INTO VANZARI VALUES (2,4,2,100,'03/10/2015',1);
INSERT INTO VANZARI VALUES (3,2,1,102,'03/05/2015',2);
INSERT INTO VANZARI VALUES (4,3,1,100,'03/06/2015',1);

INSERT INTO ACTIVITATI VALUES (1,100,150);
INSERT INTO ACTIVITATI VALUES (1,101,120);
INSERT INTO ACTIVITATI VALUES (2,102,130);
INSERT INTO ACTIVITATI VALUES (2,103,100);
INSERT INTO ACTIVITATI VALUES (2,104,100);


insert into specialitatea values(1, 'Electronica');


INSERT INTO INGINERI VALUES(100, 1);
INSERT INTO INGINERI VALUES(101, 1);
INSERT INTO INGINERI VALUES(102, 1);


INSERT INTO DEPENDENTI VALUES(100,'MARIA','POPESCU','03/03/1981','fiu');
INSERT INTO DEPENDENTI VALUES(101,'MIHAI','GEICA','04/02/1979','fiu');
INSERT INTO DEPENDENTI VALUES(102,'MIRCEA','ION','01/01/1883','fiu');
INSERT INTO DEPENDENTI VALUES(1000,'MIR','IO','01/01/1883','fiu');


Select * from DEPENDENTI;


SELECT Nume,Prenume FROM FURNIZORI WHERE Adresa='BUCURESTI'
UNION
SELECT Nume,Prenume FROM CLIENTI where adresa='RAHOVA';


SELECT FURNIZORI.Nume, FURNIZORI.Prenume FROM FURNIZORI,ACHIZITII
WHERE
FURNIZORI.idFurnizor=ACHIZITII.idFurnizor AND NrComponente>4;


SELECT angajati.nume,angajati.prenume from COMPONENTE,angajati,ACHIZITII
WHERE
(achizitii.idAngajat=angajati.IdAngajat AND
ACHIZITII.idComponenta=COMPONENTE.idComponenta) and
COMPONENTE.Denumire='ATA';


SELECT FURNIZORI.Nume, FURNIZORI.Prenume, FURNIZORI.Adresa from
COMPONENTE,ACHIZITII,FURNIZORI
WHERE
(FURNIZORI.idFurnizor=ACHIZITII.idFurnizor and
ACHIZITII.idComponenta=COMPONENTE.idComponenta) and
COMPONENTE.Denumire='NASTURI';



SELECT FURNIZORI.Nume, FURNIZORI.Prenume, FURNIZORI.Adresa from
COMPONENTE,ACHIZITII,FURNIZORI
WHERE
(FURNIZORI.idFurnizor=ACHIZITII.idFurnizor and
ACHIZITII.idComponenta=COMPONENTE.idComponenta) and
COMPONENTE.Denumire='NASTURI' AND NrComponente >=3;



SELECT CLIENTI.Nume,CLIENTI.Prenume,CLIENTI.Adresa from
PRODUSE,VANZARI,CLIENTI
WHERE
(VANZARI.idPRODUS = PRODUSE.idPRODUS and
VANZARI.idCLIENT = CLIENTI.idCLIENT)and
PRODUSE.Denumire = 'CAMASA' AND VANZARI.NumarProdus >2;



SELECT ANGAJATI.Nume,ANGAJATI.Prenume from
 ANGAJATI,VANZARI,PRODUSE
WHERE
(ANGAJATI.idAngajat = VANZARI.idAngajat and
VANZARI.idProdus = PRODUSE.idProdus) and
PRODUSE.Denumire = 'CAMASA' ;



SELECT ANGAJATI.Nume,ANGAJATI.Prenume,ANGAJATI.DataN from
ANGAJATI,ACTIVITATI,PROIECTE
WHERE
ANGAJATI.idAngajat = ACTIVITATI.idAngajat and
ACTIVITATI.idProiect = PROIECTE.idProiect and
PROIECTE.Denumire ='DNA';



SELECT sectii.nume from
ANGAJATI,ACTIVITATI,PROIECTE,sectii
WHERE
ANGAJATI.idAngajat = ACTIVITATI.idAngajat and
ACTIVITATI.idProiect = PROIECTE.idProiect and
PROIECTE.Denumire ='DNA' and
angajati.IdSectie = sectii.IdSectie;



SELECT angajati.Nume, angajati.Prenume,angajati.DataN from
angajati, INGINERI, specialitatea
WHERE
INGINERI.idAngajat = ANGAJATI.idAngajat and
INGINERI.idSpecialitatea = specialitatea.idspecialitatea and
specialitatea.nume = 'Electronica';



select angajati.Nume,angajati.Prenume from
angajati,achizitii,furnizori
WHERE
furnizori.idFurnizor = achizitii.idFurnizor and
achizitii.idAngajat = angajati.idAngajat and
furnizori.nume = 'ALECU';



select angajati.Nume,angajati.Prenume from
angajati,vanzari,clienti
WHERE
clienti.idClient = vanzari.idClient and
vanzari.idAngajat = angajati.idAngajat and
clienti.nume = 'ILIESCU';



select angajati.nume,angajati.prenume from
angajati,sectii,dependenti
WHERE
sectii.idSectie = angajati.idSectie and
sectii.nume = 'PRODUCTIE' and
angajati.idAngajat = dependenti.idAngajat and
dependenti.GradRudenie='fiu' and 
dependenti.prenume = 'ION';


select  distinct produse.denumire from
produse,compozitii,componente,achizitii,furnizori,angajati
WHERE
produse.idProdus = compozitii.idProdus and
compozitii.idComponenta =componente.idComponenta and
componente.idComponenta = achizitii.idComponenta  and
achizitii.idComponenta = furnizori.IdFurnizor and
furnizori.nume = 'STOICA';













