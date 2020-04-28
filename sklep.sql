CREATE DATABASE IF NOT EXISTS Sklep;
CREATE SCHEMA sklep;

CREATE TABLE IF NOT EXISTS sklep.produkty (
IdProduktu VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
NazwaProduktu VARCHAR(50),
CenaNetto DOUBLE(10),
CenaBrutto DOUBLE(10)
);

CREATE TABLE IF NOT EXISTS sklep.dostawcy (
IdDostawcy VARCHAR(5) PRIMARY KEY UNIQUE NOT NULL,
Dostawca VARCHAR(50),
Miejscowosc VARCHAR(20),
KodPocztowy VARCHAR(6),
Ulica VARCHAR(30),
NrBudynku VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS sklep.zamowienie (
IdZamowienia INT PRIMARY KEY UNIQUE NOT NULL,
IdProduktu VARCHAR(4) REFERENCES sklep.produkty(IdProduktu),
IdDOstawcy VARCHAR(4) REFERENCES sklep.dostawcy(IdDostawcy)
);

INSERT INTO sklep.produkty VALUES 
('MN1',	'Makaron Nitki', 130, 150),
('KP2',	'Keczup pikantny', 200, 220),
('SP3', 'Sos pomidorowy', 89, 110);

INSERT INTO sklep.dostawcy VALUES
('MP', 'Makarony Polskie', 'Kraków', '31-435', 'Turystyczna', '40'),
('PP', 'Polskie przetwory',	'Kraków', '31-342', 'Wojska Polskiego',	'44a'),
('LM', 'Lubelski Makaron', 'Lublin', '04-242', 'Piłsudskiego', '332a'),
('PPom', 'Przetwory pomidorowe', 'Tarnów', '30-243', 'Rolnicza', '22/4'),
('MS', 'Małopolskie smaki',	'Nowy Targ', '35-434', 'Mickiewicza', '223/77');

INSERT INTO sklep.zamowienie VALUES
(1, 'MN1', 'MP'),
(2,	'KP2', 'PP'),
(3, 'SP3', 'PP'),
(4,	'MN1', 'LM'),
(5,	'KP2', 'PPom'),
(6,	'SP3', 'MS');