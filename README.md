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

## Librerie usate
- **auto_route:** gestisce la navigazione tra pagine
- **sliding_up_panel:** usato per il dettaglio degli annunci
- **flutter_offline:** controllo se device è connesso al wifi o connessione dati
- **flutter_bloc:** per la gestione dello stato
- **hydrated_bloc:** per la dark mode
- **url_launcher:** apertura app esterne da Uri
- **shimmer:** per la gestione del caricamento dati
- **share_plus:** per la condivisione con le altre app
- **shared_preferences:** per la persistenza dei preferiti

## Configurazione
dopo aver effettuato il clean e il caricamento delle librerie esterne tramite i comandi standard:
```
flutter clean
flutter pub get
```

è necessario sostituire nella cartella "ios" del progetto, nel file "Podfile" generato, l'ultima sezione "post_install" con la seguente:
```
post_install do |installer|
  installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
             end
        end
 end
    installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
  end
end
```

## Dispositivi testati

### Emulatori
- iOS versione 16.4
  - iPhone 8
  - iPhone SE (terza gen)
  - iPhone 14/14 pro max

- Android


### Device fisici
- IOS 16.3.1
  - iPhone 13/13 mini

- Android 13 Tiramisù
  - Google Pixel 7 pro


## TODO
- manca la paginazione
- mancano i test  
- refactoring e ottimizzazione del codice


