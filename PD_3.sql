    1.Napisz w języku SQL zapytania wyświetlające następujące informacje z bazy danych czek:
	
        a)miasta oraz liczbę klientów z tych miast, gdzie jest przynajmniej trzech klientów,
		select miasto, 
			count(id_klienta) as 'Liczba klientów' 
		from czek.klienci 
		group by miasto 
		having count(id_klienta) > 3;
		
        b) liczbę czekoladek wykonanych z czekolady mlecznej,
		select count(id_czek) as 'Liczba mlecznych' 
		from czek.czekoladki 
		where rodzaj_czekolady = 'Mleczna';
		
        c) dla każdego zamówienia podaj numer zamówienia, datę zamówienia, imię i nazwisko klienta, posortowane malejąco względem daty zamówienia,
		select z.id_zam, 
			z.data_zam, 
			k.imie, 
			k.nazwisko 
		from czek.zamowienia z 
			join czek.klienci k 
				on z.id_klienta = k.id_klienta 
		order by z.data_zam DESC;
		
        d) dla każdego zamówienia podaj numer zamówienia, datę zamówienia, imię i nazwisko klienta, imię i nazwisko dostawcy. Kolumnom nadaj odpowiednie nagłówki.
		select z.id_zam, 
			z.data_zam, 
			k.imie as 'Imię klienta', 
			k.nazwisko as 'Nazwisko klienta', 
			d.imie as 'Imię dostawcy', 
			d.nazwisko as 'Nazwisko dostawcy' 
		from czek.zamowienia z 
			join czek.klienci k 
				on z.id_klienta = k.id_klienta 
			join czek.dostawcy d 
				on z.id_dostawcy = d.id_dostawcy 
		order by id_zam ASC;
		
        e) podaj liczbę zamówień złożonych każdego dnia (tylko dla tych dni, kiedy było coś zamawiane). Dane posortuj względem liczby złożonych zamówień.
		select count(id_zam) as 'Liczba zamówień', 
			data_zam 
		from czek.zamowienia 
		group by data_zam 
		having count(id_zam) >=1 
		order by count(id_zam) DESC;
		
        f) wyświetl pełną informację o zawartości pudełek: nazwę pudełka, nazwę czekoladki oraz liczbę sztuk czekoladek w pudełku. Dane posortuj względem nazwy pudełka oraz nazwy czekoladki.
        select p.nazwa as 'Nazwa pudełka', 
			c.nazwa as 'Nazwa czekoladki', 
			op.l_sztuk as 'Liczba sztuk czekoladek w pudełku' 
		from czek.pudelka p 
			join czek.o_pudelkach op 
				on p.id_pudelka = op.id_pudelka 
			join czek.czekoladki c 
				on op.id_czek = c.id_czek
		order by p.nazwa, c.nazwa;
		
		g) dla każdego identyfikatora pudełka podaj łączną liczbę (sumę) czekoladek w pudełku,
		select id_pudelka, 
			sum(l_sztuk) 
		from czek.o_pudelkach 
		group by id_pudelka;
	
        h) identyfikatory zamówień, na których łączna liczba zamówionych pudełek jest >5,
		select id_zam, 
			sum(ile_sztuk) 
		from czek.szczegolowe_zam 
		group by id_zam 
		having sum(ile_sztuk) > 5;
		
        i) dla zamówień, które opłacono gotówką ('g') podaj ile zamówień złożono każdym ze sposobów zamawiania.
		select count(id_zam), 
			sposob_zam 
		from czek.zamowienia 
		where forma_zaplaty = 'g' 
		group by sposob_zam;
