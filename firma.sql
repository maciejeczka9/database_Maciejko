CREATE DATABASE firma
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Polish_Poland.1250'
    LC_CTYPE = 'Polish_Poland.1250'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Database: firma

-- DROP DATABASE firma;

	
CREATE TABLE IF NOT EXISTS firma.pracownicy
(
id_pracownika serial PRIMARY KEY NOT NULL,
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(30) NOT NULL,
adres VARCHAR(50),
telefon VARCHAR(12)
);

CREATE TABLE IF NOT EXISTS firma.godziny
(
id_godziny serial PRIMARY KEY NOT NULL,
data DATE,
liczba_godzin FLOAT,
id_pracownika INT NOT NULL
);

CREATE TABLE IF NOT EXISTS firma.pensje
(
id_pensja serial PRIMARY KEY NOT NULL,
stanowisko VARCHAR(30),
kwota FLOAT,
id_premii INT NOT NULL
);

CREATE TABLE IF NOT EXISTS firma.premie
(
id_premii serial PRIMARY KEY NOT NULL,
rodzaj VARCHAR(30),
kwota FLOAT
);

INSERT INTO firma.pracownicy(id_pracownika,imie,nazwisko,adres,telefon) VALUES
(1, 'Wright','Fred','3232 48th St. New York','+48125557474'),
(2,	'Bailey',	'Sandra',	'5132 Livingston Dr. Long Beach','+48213555104'),
(3, 'Martinez',	'Ric',	'4818 Allendale Ave. Santa Fe','+48505555322'),
(4, 'Peters',	'Kimberly',	'12300 N. Elm St. Dallas','+48214555603'),
(5, 'Yamada',	'George J.',	'7500 Santa Monica Blvd. Los Angeles','+48135554300'),
(6, 'Timmons',	'Gene',		'310-2090 Comex St. Vancouver','+48604557644'),
(7, 'Maxwell',	'Florence',	'8506 Habana Ave. Tampa','+48815555522'),
(8, 'Beckman',	'Riener',	'332 S. Michigan Ave. Pasadena','+48818555384'),
(9, 'Black', 'David', '34a Santa Martins St. New York', '+48934564563'),
(10, 'Rose', 'Katherina', '345 Blue Sky St. Florida', '+48954542234');

INSERT INTO firma.godziny VALUES
(1,'2020-03-14',11,2),
(2,'2020-03-23',10,1),
(3,'2020-03-24',4,7),
(4,'2020-03-21',3,8),
(5,'2020-03-16',17,6),
(6,'2020-03-24',9,10),
(7,'2020-03-22',11,3),
(8,'2020-03-23',2,4),
(9,'2020-03-11',0,5),
(10,'2020-03-15',6,9);

INSERT INTO firma.pensje VALUES
(1,'kierownik',7000,5),
(2,'sekretarz',2500,3),
(3,'ksiegowy',3500,1),
(4,'sprzatacz',2500,6),
(5,'manadżer',5000,9),
(6,'pracownik zewnetrzny',3200,10),
(7,'pracownik zewnetrzny',3200,7),
(8,'konsultant',4000,2),
(9,'konsultant do spraw sprzedazy',4000,4),
(10,'pomocnik',3000,8);

INSERT INTO firma.premie VALUES
(1,'uznaniowa',300),
(2,'motywacyjna',500),
(3,'miesieczna',200),
(4,'okolicznosciowa',1000),
(5,'uznaniowa',300),
(6,'motywacyjna',500),
(7,'okolicznosciowa',1000),
(8,'frekfencyjna',250),
(9,'kwartalna',700),
(10,'uznaniowa',300);

ALTER TABLE godziny ADD CONSTRAINT id_pracownika FOREIGN KEY(id_pracownika) REFERENCES pracownicy(id_pracownika);
ALTER TABLE pensje ADD CONSTRAINT id_premii FOREIGN KEY(id_premii) REFERENCES premie(id_premii)