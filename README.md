# Koliko je za pet?

Kad sam radio u školi, ovo pitanje čuo sam prije, za vrijeme i nakon svakog ispita. Kako bih si olakšao praćenje različitih ispita u različitim razredima, odlučio sam napraviti mobilnu aplikaciju koja pohranjuje ispite i podatke o bodovima potrebnima za određenu ocjenu.

## Funkcije

 <b>1. Pregled ispita</b>

Tabovi s rednim brojevima označavaju razrede, pa tako možemo pregledati ispite koje smo unijeli za peti, sedmi ili osmi razred.

![Pregled ispita - demo](https://github.com/llekcevi/koliko_je_za_pet/blob/offline/assets/demo-pregled.gif)

 <b>2. Dodaj novi ispit</b>
 
Dodirom plave tipke na dnu ekrana dodajemo novi ispit. U okviru koji se pojavljuje upisujemo broj bodova, a zatim dodirnemo tipku "Nastavi". U novom zaslonu vidimo raspon bodova po ocjenama i unosimo naziv ispita i razred u kojem je održan.
 
 ![Dodavanje ispita - demo](https://github.com/llekcevi/koliko_je_za_pet/blob/offline/assets/demo-dodavanje.gif)
 
 <b>3. Brisanje ispita</b>

 U pregledu ispita odaberemo jedan ispit nakon čega vidimo pregled bodova po ocjenama te u donjem desnom kutu kartice tipku "Obriši". Pokazuje se okvir za provjeru gdje možemo potvrditi brisanje ili odustati od brisanja.
 
![Brisanje ispita - demo](https://github.com/llekcevi/koliko_je_za_pet/blob/offline/assets/demo-brisanje.gif)

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
