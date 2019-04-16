Napisz w języku SQL zapytania wyświetlające następujące informacje z bazy danych czek:

	a) imiona i nazwiska klientów z Katowic posortowane malejąco względem nazwiska;
	select imie, nazwisko 
	from czek.klienci 
	where miasto = "Katowice" 
	order by nazwisko desc;

	b) imiona i nazwiska klientów nieposiadających telefonu;
	select imie, nazwisko 
	from czek.klienci 
	where telefon is null;

	c) nazwy, ceny i liczby sztuk w magazynie pudełek, których cena jest większa niż 30 lub jest ich w magazynie przynajmniej 500 sztuk;
	select nazwa, cena_pudelka, sztuk_w_magazynie 
	from czek.pudelka 
	where cena_pudelka > 30 or sztuk_w_magazynie >= 500;

	d) wszystkie informacje o zamówieniach złożonych przez klientów o numerach 7, 30, 44, 50;
	select * 
	from czek.zamowienia 
	where id_klienta in ("7", "30", "44", "50");

	e) nazwy czekoladek z nadzieniem marcepanowym, wykonane z czekolady mlecznej lub białej,
	select nazwa, rodzaj_czekolady, rodzaj_nadzienia 
	from czek.czekoladki 
	where rodzaj_nadzienia = "Marcepan" and (rodzaj_czekolady in ("Biała", "Mleczna"));
	/*or*/
	select nazwa, rodzaj_czekolady, rodzaj_nadzienia 
	from czek.czekoladki 
	where rodzaj_nadzienia = "Marcepan" and (rodzaj_czekolady = "Biała" or rodzaj_czekolady = "Mleczna");

	f) identyfikatory, nazwy i liczby sztuk w magazynie tych pudełek, których liczba sztuk zawiera się w przedziale [200,300],
	select id_pudelka, nazwa, sztuk_w_magazynie 
	from czek.pudelka 
	where sztuk_w_magazynie BETWEEN 200 and 300;

	g) identyfikatory, nazwy i koszt czekoladek oraz nową cenę czekoladek, w przypadku podwyżki o 20% (ostatniej kolumnie nadaj odpowiednią nazwę).
	select id_czek, nazwa, koszt, koszt*1.2 as "Koszt po 20% podwyżki" 
	from czek.czekoladki;