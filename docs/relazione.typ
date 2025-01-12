#import "./utility.typ": *

#show: doc => copertina(doc)

#set text(10pt, font: "DejaVu Serif")

= Abstract
Il progetto consiste in un sito web che tratta un ricettario dedicato per universitari. Presenta una esperienza leggermente personalizzata per ogni tipologia di universitario:
- *Fuorisede* è lo studente che si è trasferito nella sede dell'università, deve centellinare le spese e il tempo a disposizione.
- *Pendolare* è lo studente che perde a causa dei trasporti e torna a casa a orari scomodi.
- *In sede* è lo studente che abita relativamente vicino all'università e che ha più tempo a disposizione.
- *DAD (Didattica A Distanza)* è lo studente che rimane a casa e si guarda il materiale delle lezioni da casa, ha quindi flessibilità ampie di tempo.

Ogni ricetta è abbinata a una categoria considerando la stima del costo, la difficoltà e il tempo di preparazione. Può essere valutata dagli utenti in una modalità simile da una prova d'esame: viene assegnata un voto da 1 a 30 e un commento che motiva la valutazione.

Ogni utente registrato possiede un proprio profilo con dei dati che può personalizzare. Le ricette salvate come preferite saranno visibili nella pagina profilo.

Nella pagina dedicata ai contatti dei proprietari del sito è presente anche un campo di testo nel quale ogni utente può suggerire un piatto da aggiungere al sito. Questo messaggio viene salvato nel database e in uno scenario più ampio del progetto verrebbe inviata una notifica ai proprietari del sito.

= Analisi

== Tipologie di utente
Sono state individuate due tipologie di utente:
- *Utente non autenticato* è l'utente che non ha eseguito l'accesso al sistema. Può navigare nel sito, usufruire delle funzionalità di ricerca delle ricette e inviare dei suggerimenti dalla pagina dei contatti.
- *Utente autenticato* è l'utente che ha eseguito l'accesso al sistema (in seguito quindi alla registrazione). In aggiunta all'utente non autenticato è accompagnato da una esperienza personalizzata nella ricerca; viene cioè applicato in automatico il filtro per la categoria dell'utente se questo accede al catalogo in modo da invitarlo con ricette maggiormente pertinenti. Può inoltre assegnare le valutazioni alle ricette (una per ricetta).

== Esigenze dell'utenza
TODO: Metafora della pesca ???

= Struttura gerarchica
La struttura gerarchica del sito presenta un albero ampio e poco profondo per agevolare la navigazione.

== Home
La pagina principale presenta il sito ed espone le categorie nelle quali sono suddivisi i piatti e le ragioni delle scelte. L'utente è quindi immediatamente informato della struttura e dello scopo del sito. I link di ciascuna categoria nella home portano alla pagina delle ricette applicando automaticamente il filtro della categoria selezionata.

== Ricette
La pagina delle ricette strutturata in pagine. Si possono applicare dei filtri e cercare le ricette per nome o ingrediente (se presente nel titolo della ricetta). L'ordinamento senza applicazioni di filtri è per valutazione in ordine decrescente, vengono quindi prima visualizzate le ricette con valutazioni più alte. Le ricette senza valutazioni vengono contrassegnate con \"- / 30\" e sono sempre poste in fondo a qualsiasi ricerca, anche con filtri applicati. Così facendo vengono sempre esposte in modo da non renderle pressoché irraggiungibili, tuttavia si rispettano le preferenze dell'utente infatti sono sempre visualizzate in coda alla ricerca.

=== Ricetta
La pagina che presenta la ricetta selezionata seguita dalle valutazioni, se presenti.

== Contatti
La pagina relativa ai contatti degli amministratori del sito. Presenta un campo di testo per inviare dei suggerimenti riguardo delle ricette da modificare o da aggiungere.

== Profilo utente
La pagina dedicata al profilo dell'utente se autenticato. Presenta le informazioni obbligatorie alla registrazione, la biografia (facoltativa) e la lista delle ricette preferite.

=== Modifica profilo utente
La pagina nella quale l'utente autenticato può modificare i dati del proprio profilo e, se desidera, cancellare l'intero account.

== Registrazione e accesso
Se l'utente non è registrato viene indirizzato alla pagina di accesso dove, tramite un link, accede alla pagina di registrazione.

== Pagine di informazione
Le pagine che informano l'utente riguardo alcune operazioni:
- *Errore 404* per l'errore \"Pagina non trovata\".
- *Errore 500* per l'errore \"Errore lato server\".
- *Offline* per la mancata connessione a Internet.
- *Conferma* per chiedere conferma all'utente di alcune operazioni irreversibili quali rimozione della lista delle ricette preferite e cancellazione del profilo.
- *Ringraziamenti* per ringraziare l'utente di aver inviato un suggerimento tramite la pagina dei contatti.