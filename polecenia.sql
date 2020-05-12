--polecenia 
-- a) Wyświetl tylko id pracownika oraz jego nazwisko
SELECT kp.id_pracownika, kp.nazwisko FROM ksiegowosc.pracownicy kp
-- b) Wyświetl id pracowników, których płaca jest większa niż 1000.
SELECT kw.id_pracownika, kp.kwota FROM ksiegowosc.wynagrodzenie kw, ksiegowosc.pensja kp 
WHERE kw.id_pensji = kp.id_pensji AND kp.kwota > 1000
-- c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000.
SELECT kw.id_pracownika, kw.id_premii,kp.kwota FROM ksiegowosc.wynagrodzenie kw 
INNER JOIN ksiegowosc.pensja kp ON kw.id_pensji=kp.id_pensji AND kw.id_premii IS NULL AND kp.kwota > 2000
-- d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’.
SELECT * FROM ksiegowosc.pracownicy kpr WHERE kpr.imie LIKE 'J%'
-- e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
SELECT * FROM ksiegowosc.pracownicy kpr WHERE kpr.nazwisko LIKE '%n%' AND kpr.imie LIKE '%a'
-- f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie.
SELECT kp.imie, kp.nazwisko, (kg.liczba_godzin * 20 - 160) as nadgodziny FROM ksiegowosc.pracownicy kp , ksiegowosc.godziny kg 
WHERE kp.id_pracownika = kg.id_pracownika
-- g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 PLN.
SELECT kp.imie, kp.nazwisko FROM ksiegowosc.pracownicy kp 
JOIN ksiegowosc.wynagrodzenie kw ON kw.id_pracownika = kp.id_pracownika 
JOIN ksiegowosc.pensja kpen ON kw.id_pensji = kpen.id_pensji 
WHERE kpen.kwota between 1500 AND 3000 
-- h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT kp.imie, kp.nazwisko FROM ksiegowosc.pracownicy kp 
JOIN ksiegowosc.wynagrodzenie kw ON kw.id_pracownika = kp.id_pracownika 
JOIN ksiegowosc.godziny kg ON kg.id_pracownika = kp.id_pracownika 
WHERE (kg.liczba_godzin * 20 - 160) > 0 AND kw.id_premii IS NULL 
-- i) Uszereguj pracowników według pensji.
SELECT kw.id_pracownika FROM ksiegowosc.pensja kpen, ksiegowosc.wynagrodzenie kw WHERE kpen.id_pensji = kw.id_pensji ORDER BY kpen.kwota 
-- j) Uszereguj pracowników według pensji i premii malejąco.
SELECT kw.id_pracownika, kpen.kwota, kpr.kwota FROM ksiegowosc.pensja kpen 
JOIN ksiegowosc.wynagrodzenie kw ON kpen.id_pensji = kw.id_pensji 
JOIN ksiegowosc.premia kpr ON kw.id_premii = kpr.id_premii
ORDER BY kpen.kwota DESC, kpr.kwota DESC
-- k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.
SELECT COUNT(*),  kpen.stanowisko FROM ksiegowosc.pensja kpen
GROUP BY kpen.stanowisko
-- l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).
SELECT MIN(kpen.kwota) AS minimalna,MAX(kpen.kwota) AS maksymalna, AVG(kpen.kwota) AS średnia FROM ksiegowosc.pensja kpen
WHERE kpen.stanowisko = 'kierownik' 
-- m) Policz sumę wszystkich wynagrodzeń.
SELECT SUM(COALESCE(kpr.kwota,0))+ SUM(COALESCE(kpen.kwota,0)) AS wynagrodznie FROM ksiegowosc.wynagrodzenie kw 
LEFT JOIN ksiegowosc.pensja kpen ON kw.id_pensji = kpen.id_pensji
LEFT JOIN ksiegowosc.premia kpr ON kw.id_premii = kpr.id_premii 
-- n) Policz sumę wynagrodzeń w ramach danego stanowiska.
SELECT SUM(COALESCE(kpr.kwota,0))+ SUM(COALESCE(kpen.kwota,0)) as wynagrodzenie, kpen.stanowisko FROM ksiegowosc.wynagrodzenie kw 
LEFT JOIN ksiegowosc.pensja kpen ON kw.id_pensji = kpen.id_pensji
LEFT JOIN ksiegowosc.premia kpr ON kw.id_premii = kpr.id_premii GROUP BY kpen.stanowisko
-- o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
SELECT COUNT(kw.id_premii) as ilosc_premii, kpen.stanowisko FROM ksiegowosc.wynagrodzenie kw
JOIN ksiegowosc.pensja kpen ON kw.id_pensji=kpen.id_pensji
GROUP BY kpen.stanowisko
-- p) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.
DELETE
FROM  ksiegowosc.wynagrodzenie kw    
USING ksiegowosc.pensja kpen 
WHERE kpen.kwota <1200 AND kw.id_pensji = kpen.id_pensji 
 /*
DELETE 
FROM ksiegowosc.pracownicy kp 
USING 
ksiegowosc.wynagrodzenie kw, ksiegowosc.pensja kpen
WHERE kpen.kwota <3000 AND kp.id_pracownika = kw.id_pracownika 
AND kw.id_pensji = kpen.id_pensji  
*/