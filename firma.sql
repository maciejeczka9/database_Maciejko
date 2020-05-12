-- tworzenie bazy danych
CREATE DATABASE IF NOT EXISTS firma;
-- tworzenie schematu ksiegowosc
CREATE SCHEMA ksiegowosc;

-- towrzenie tabeli pracownicy
CREATE TABLE IF NOT EXISTS ksiegowosc.pracownicy (
id_pracownika VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
imie VARCHAR(20),
nazwisko VARCHAR(30),
adres VARCHAR(50),
telefon VARCHAR(12)
);

-- tworzneie tabeli godziny
CREATE TABLE IF NOT EXISTS ksiegowosc.godziny (
id_godziny INT PRIMARY KEY UNIQUE NOT NULL,
data DATE,
liczba_godzin INT,
id_pracownika VARCHAR(5) REFERENCES ksiegowosc.pracownicy(id_pracownika)
);

-- tworzneie tabeli pensja
CREATE TABLE IF NOT EXISTS ksiegowosc.pensja (
id_pensji VARCHAR(3) PRIMARY KEY UNIQUE NOT NULL,
stanowisko VARCHAR(50),
kwota FLOAT(10)
);

-- tworzneie tabeli premia
CREATE TABLE IF NOT EXISTS ksiegowosc.premia (
id_premii INT PRIMARY KEY UNIQUE NOT NULL,
rodzaj VARCHAR(30),
kwota FLOAT(7)
);

-- tworzneie tabeli wynagrodzenie
CREATE TABLE IF NOT EXISTS ksiegowosc.wynagrodzenie (
id_wynagrodzenia INT PRIMARY KEY UNIQUE NOT NULL,
data DATE,
id_pracownika VARCHAR(5) REFERENCES ksiegowosc.pracownicy(id_pracownika),
id_godziny INT REFERENCES ksiegowosc.godziny(id_godziny),
id_pensji VARCHAR(3) REFERENCES ksiegowosc.pensja(id_pensji),
id_premii INT REFERENCES ksiegowosc.premia(id_premii)
);

-- wczytanie danych do tabeli pracownicy
INSERT INTO ksiegowosc.pracownicy VALUES
('S1011', 'Maria',  'Nowak','34-350 Katowice ul. Kasztanowa 23','982515462'),
('S1024', 'Jan', 'Kowalski','45-210 Warszawa ul. Wiejska 56a','515289264'),
('S1045', 'Anna',  'Jabłońska','34-350 Katowice ul. Maślana 345','462982515'),
('P100', 'Anna', 'Jeleń','44-456 Gdańsk ul. Martwa 34d ','829456215'),
('P105', 'Jarosław', 'Nicpoń','33-531 Tychy ul. Zielona 2','215654928'),
('P108', 'Joanna', 'Nosek','32-281 Kraków ul. Miła 13a','829215564'),
('P120', 'Jan', 'Kałuża','45-321 Wrocław ul. Długa 14b','465251289'),
('P130', 'Jerzy', 'Lis','21-978 Zielona Góra ul. Szeroka 321','928515462'),
('P123', 'Olga', 'Nowacka','21-978 Zielona Góra ul. Biała 33','426928515'),
('S1034',	'Marek', 'Potocki','33-351 Tychy ul. Komedii 321','825264515');

-- wczytanie danych do tabeli godziny
INSERT INTO ksiegowosc.godziny VALUES
(1,'2020-03-14',11,'S1024'),
(2,'2020-03-23',10,'S1011'),
(3,'2020-03-24',4,'P123'),
(4,'2020-03-21',3,'P120'),
(5,'2020-03-16',17,'S1045'),
(6,'2020-03-24',9,'P130'),
(7,'2020-03-22',11,'P100'),
(8,'2020-03-23',2,'P105'),
(9,'2020-03-11',0,'S1034'),
(10,'2020-03-15',6,'P108');

-- wczytanie danych do tabeli pensja
INSERT INTO ksiegowosc.pensja VALUES
('K01','kierownik',7000),
('K02','sekretarz',2500),
('K03','ksiegowy',3500),
('K04','sprzatacz',2500),
('K05','manadżer',5000),
('K06','pracownik zewnetrzny',3200),
('K07','kontroler jakosci',2700),
('K08','konsultant',4000),
('K09','konsultant do spraw sprzedazy',4000),
('K10','pomocnik',3000);

-- wczytanie danych do tabeli premia
INSERT INTO ksiegowosc.premia VALUES
(1,'uznaniowa',300),
(2,'motywacyjna',500),
(3,'miesieczna',200),
(4,'okolicznosciowa',1000),
(5,'frekwencyjna',300),
(6,'wczasy pod grusza',500),
(7,'mundurowka',1000),
(8,'trzynastka',250),
(9,'kwartalna',700),
(10,'swiateczna',300);

-- wczytanie danych do tabeli wynagrodzenie
INSERT INTO ksiegowosc.wynagrodzenie VALUES
(1,'2020-03-14','S1011',5,'K04',5),
(2,'2020-03-14','P123',4,'K03',3),
(3,'2020-03-14','P130',6,'K08',NULL),
(4,'2020-03-14','P105',1,'K05',3),
(5,'2020-03-14','S1024',2,'K02',8),
(6,'2020-03-14','P108',3,'K10',10),
(7,'2020-03-14','S1045',9,'K09',3),
(8,'2020-03-14','P100',10,'K06',NULL),
(9,'2020-03-14','S1034',7,'K07',1),
(10,'2020-03-14','P120',8,'K01',4);

