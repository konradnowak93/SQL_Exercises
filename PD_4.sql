Napisz w języku SQL zapytania wyświetlające następujące informacje z bazy danych czek:

	a) nazwę pudełka oraz liczbę zamówień, na których występuje,
	select p.nazwa, count(sz.id_zam) as 'Liczba zamówień' 
	from czek.pudelka p join czek.szczegolowe_zam sz on p.id_pudelka = sz.id_pudelka 
	group by p.nazwa;
	
	b) imiona i nazwiska dostawców wraz z liczbą dostarczonych zamówień, dla tych dostawców, którzy obsłużyli przynajmniej 15 zamówień,
	select d.imie, d.nazwisko, count(z.id_zam) as 'Liczba obsłużonych zamówień' 
	from czek.dostawcy d join czek.zamowienia z on d.id_dostawcy = z.id_dostawcy 
	group by z.id_dostawcy 
	having count(id_zam) >= 15; 
	
	c) imiona i nazwiska klientów wraz z liczbą złożonych zamówień. Wypisz także klientów, którzy nie złożyli żadnego zamówienia.
	select k.imie, k.nazwisko, count(z.id_zam) as 'Liczba złożonych zamówień'
	from czek.klienci k left join czek.zamowienia z on k.id_klienta = z.id_klienta
	group by k.id_klienta;
	
	d) dla pudełka o nazwie 'Kolekcja alpejska' wypisz nazwy czekoladek, które znajdują się w tym pudełku,
	select p.nazwa as 'Nazwa pudełka', cz.nazwa as 'Nazwa czekoladek znajdujących się w pudełku'
	from czek.pudelka p 
	left join czek.o_pudelkach op on p.id_pudelka = op.id_pudelka 
	left join czek.czekoladki cz on op.id_czek = cz.id_czek
	where p.nazwa = 'Kolekcja alpejska';
	
	e) nazwy i stan pudełek, których jest najmniej w magazynie,
	select nazwa, sztuk_w_magazynie
	from czek.pudelka
	where sztuk_w_magazynie = (select min(sztuk_w_magazynie) from czek.pudelka);
	
	
	f) identyfikatory, imiona i nazwiska klientów, którzy nie złożyli żadnego zamówienia,
	select k.id_klienta, k.imie, k.nazwisko, count(z.id_zam) as 'Liczba zamówien'
	from czek.klienci k
	left join czek.zamowienia z on k.id_klienta = z.id_klienta
	group by k.id_klienta
	having count(z.id_zam) = 0;
	
	
	g) identyfikatory zamówień na najtańsze pudełko,
	select z.id_zam, p.cena_pudelka 
	from czek.zamowienia z join czek.szczegolowe_zam sz on z.id_zam = sz.id_zam 
	join czek.pudelka p on czek.sz.id_pudelka = p.id_pudelka 
	where p.cena_pudelka = (select min(cena_pudelka) from czek.pudelka);
	
	h) nazwy i koszt czekoladek oraz rodzaj czekolady, dla najdroższych czekoladek z każdego rodzaju czekolady,
	select nazwa as 'Nazwa czekoladek', koszt as 'Koszt najdroższych czekoladek danego rodzaju', rodzaj_czekolady as 'Rodzaj czekolady'
	from czek.czekoladki
	where (rodzaj_czekolady, koszt) in (select rodzaj_czekolady, max(koszt) from czek.czekoladki group by rodzaj_czekolady)
	
	i) maksymalną liczbę sztuk (sumę) zamówionych pudełek z poszczególnych zamówień.
	select id_zam, sum(ile_sztuk) 
	from szczegolowe_zam 
	group by id_zam;
	
	
	
	