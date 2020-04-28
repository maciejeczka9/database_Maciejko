CREATE DATABASE IF NOT EXISTS Przychodnia;
CREATE SCHEMA przychodnia;

CREATE TABLE IF NOT EXISTS przychodnia.pracownicy(
IDPracownika VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
ImieLekarza VARCHAR(20),
NazwiskoLekarza VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS przychodnia.zabiegi(
IDZabiegu VARCHAR(4) PRIMARY KEY UNIQUE NOT NULL,
NazwaZabiegu VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS przychodnia.pacjenci(
IDPacjenta VARCHAR(4) PRIMARY KEY UNIQUE NOT NULL,
ImiePacjenta VARCHAR(20),
NazwiskoPacjenta VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS przychodnia.wizyty(
IDWizyty INT PRIMARY KEY NOT NULL,
DataWizyty DATE,
GodzinaWizyty TIME,
IDZabiegu VARCHAR(4) REFERENCES przychodnia.zabiegi(IDZabiegu),
IDPracownika VARCHAR(5) REFERENCES przychodnia.pracownicy(IDPracownika),
IDPacjenta VARCHAR(4) REFERENCES przychodnia.pacjenci(IDPacjenta)
);

INSERT INTO przychodnia.pracownicy VALUES
('S1011', 'Maria',  'Nowak'),
('S1024', 'Jan', 'Kowalski'),
('S1045', 'Anna',  'Jabłońska'),
('S1034',	'Marek', 'Potocki');

INSERT INTO przychodnia.zabiegi VALUES
('Z500', 'Borowanie'),
('Z496', 'Lakowanie'),
('Z503', 'Usuwanie kamienia');

INSERT INTO przychodnia.pacjenci VALUES
('P100', 'Anna', 'Jeleń'),
('P105', 'Jarosław', 'Nicpoń'),
('P108', 'Joanna', 'Nosek'),
('P120', 'Jan', 'Kałuża'),
('P130', 'Jerzy', 'Lis'),
('P123', 'Olga', 'Nowacka');

INSERT INTO przychodnia.wizyty VALUES
(1,	'12.03.2020', '10:00', 'Z500', 'S1011', 'P100'),
(2,	'12.03.2020', '13:00', 'Z496', 'S1011', 'P105'),
(3,	'14.03.2020', '10:00', 'Z500', 'S1011', 'P108'),
(4,	'16.03.2020', '17:00', 'Z503', 'S1024', 'P108'),
(5,	'18.03.2020', '09:00', 'Z500', 'S1045',	'P120'),
(6,	'20.03.2020', '08:00', 'Z496', 'S1034',	'P130'),
(7,	'12.03.2020', '15:00', 'Z503', 'S1034',	'P123');