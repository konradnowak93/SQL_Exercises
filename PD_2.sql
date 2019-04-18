Napisz w języku SQL zapytania wyświetlające następujące informacje z bazy danych czek:

a)identyfikator zamówienia i liczbę pełnych dni, jakie upłynęły od daty tego zamówienia,
select id_zam, 
	datediff(curdate(), 
	data_zam) as 'Dni od zamówienia' 
from czek.zamowienia;

b)dla każdego zamówienia z października, które opłacono przelewem, wyświetlić identyfikatory zamówienia, dostawcy i klienta,
select id_zam, 
	id_klienta, 
	id_dostawcy, 
	forma_zaplaty 
from czek.zamowienia 
where extract(month from data_zam) = 10 
	and forma_zaplaty = 'p';

c)imiona i nazwiska klientów, którzy mieszkają w mieście o kodzie zaczynającym się na 70 lub zaczynającym się i kończącym na 1,
select imie, 
	nazwisko, 
	miasto, 
	kod 
from czek.klienci 
where kod like '70%' 
	or kod like '1____1';

d)miasta, z których pochodzą klienci - bez powtórzeń,
select distinct miasto 
from czek.klienci;

e)maksymalną, minimalną oraz średnią cenę pudełek z czekoladkami
select max(cena_pudelka) as 'Maksymalna cena pudełka', 
	min(cena_pudelka) as 'Minimalna cena pudełka', 
	avg(cena_pudelka) as 'Średnia cena pudełka' 
from czek.pudelka;

f)średni koszt czekoladek, w których opisie występuje słowo 'migdał',
select avg(koszt) as 'Średni koszt czekoladek ze słowem migdał' 
from czek.czekoladki 
where opis like '%migdał%';

g)nazwy regionów i liczbę klientów z tych regionów uporządkowane alfabetycznie według regionów,
select region, 
	count(*) as 'Liczba klientów' 
from czek.klienci 
group by region;

h)identyfikatory klientów i liczbę złożonych przez nich zamówień.
select id_klienta, 
	count(*) as 'Liczba zamówień' 
from czek.zamowienia 
group by id_klienta;