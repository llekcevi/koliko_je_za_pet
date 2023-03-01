# Koliko je za pet?

Kad sam radio u školi, ovo pitanje čuo sam prije, za vrijeme i nakon svakog ispita. Kako bih si olakšao praćenje različitih ispita u različitim razredima, odlučio sam napraviti mobilnu aplikaciju koja pohranjuje ispite i podatke o bodovima potrebnima za određenu ocjenu.

 - Pregled ispita

	Tabovi s rednim brojevima označavaju razrede, pa tako možemo pregledati ispite koje smo unijeli za peti, sedmi ili osmi razred.
	![Pregled ispita - demo](https://github.com/llekcevi/koliko_je_za_pet/blob/offline/assets/demo-pregled.gif)

 - Dodavanje ispita
 - Brisanje ispita

## Tehnologija

Aplikacija je napisana u Dart programskom jeziku pomoću Flutter frameworka.

Za lokalnu pohranu podataka korištena je NoSQL baza podataka Hive 2.2.3.
Za state management korišten je Riverpod 2.0.

## Platforme

Aplikacija je osmišljena za iOS i Android operativne sustave.

## Trenutno stanje projekta

Aplikacija je u fazi testiranja prije objave prve verzije.

## Planovi za iduće verzije

Nakon objave prve funkcionalne verzije aplikacije na Google Play i AppStore trgovinama u planu je unaprjeđenje dizajna aplikacije.

Dugoročni cilj je uvođenje mogućnosti pohranjivanja sigurnosne kopije podataka pomoću Firebase Firestorea.