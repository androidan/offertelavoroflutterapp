# Offerte Lavoro Flutter

Questo progetto Flutter, che partecipa all'hackathon promosso da [Fudeo](https://www.fudeo.it/blog/hackathon-flutter-offertelavoroflutter) mostra su piattaforma mobile gli annunci di lavoro del sito [Offertelavoroflutter.it](www.offertelavoroflutter.it), il servizio italiano di annunci di lavoro su Flutter.

## Struttura applicazione
L'applicazione è composta da un menu principale di 3 voci:
- annunci di lavoro per **dipendenti**
- annunci di lavoro per **freelance**
- le liste dei **preferiti** divise per dipendenti e freelance

in ogni maschera sono presenti:
- una lista dei **filtri** che rispecchiano quelli della versione WEB
- la funzione **dark mode**. 
Una volta scelto un annuncio tramite tap, compare il dettaglio dell'annuncio con il titolo, la descrizione, le macrocategorie dell'annuncio, l'azienda che propone l'impiego e l'eventuale offerta economica. 

per ogni dettaglio annuncio sono possibili 4 CTA:
- aggiunta alla lista preferiti
- condivisione con tutti gli strumenti standard del dispositivo mobile
- tasto di **CANDIDATURA**
- funzione "copia url" per effettare una "candidatura manuale"

## Punti di Forza
- Il tasto **CANDIDATURA** secondo noi è una funzione molto utile poichè, analizza il testo contenuto nel campo del JSON "come candidarsi" e in base al fatto che contiene una email o un link ad un sito, apre il client di posta oppure il browser del device, in quest'ultimo caso reindirizzando sull'eventuale app installata sul device stesso (vedi il caso di _linkedin_).
Abbiamo comunque lasciato, alla fine della descrizione, l'url della candidatura per permettere all'utente di copiarla e usarla per effettuare una candidatura con gli strumenti che meglio crede.
- ogni schermata (liste e dettagli) ha la possibilità di aggiungere l'annuncio ai preferiti

## TODO
- manca la paginazione
- mancano i test  
- refactoring e ottimizzazione del codice


