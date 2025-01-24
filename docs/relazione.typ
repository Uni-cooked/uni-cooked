#import "./utility.typ": *
#import "@preview/treet:0.1.1": *

#show: doc => copertina(doc)

#set text(10pt, font: "DejaVu Serif")

= Abstract
Il progetto consiste in un sito web che tratta un ricettario dedicato per universitari. Presenta una esperienza leggermente personalizzata per ogni tipologia di universitario:
- *Fuorisede* è lo studente che si è trasferito nella sede dell'università, deve centellinare le spese e il tempo a disposizione.
- *Pendolare* è lo studente che perde a causa dei trasporti e torna a casa a orari scomodi.
- *In sede* è lo studente che abita relativamente vicino all'università e che ha più tempo a disposizione.
- *DAD (Didattica A Distanza)* è lo studente che rimane a casa e si guarda il materiale delle lezioni da casa, ha quindi flessibilità ampie di tempo.

Ogni ricetta è abbinata a una categoria considerando la stima del costo, la difficoltà e il tempo di preparazione. Può essere valutata dagli utenti in una modalità simile da una prova d'esame: viene assegnata un voto da 1 a 30 e un commento che motiva la valutazione.

Ogni utente registrato possiede un proprio profilo con dei dati che può personalizzare. Le ricette salvate come preferite sono visibili nella pagina profilo.

Nella pagina dedicata ai contatti dei proprietari del sito è presente anche un campo di testo nel quale ogni utente può suggerire un piatto da aggiungere al sito. Questo messaggio viene salvato nel database e in uno scenario più ampio del progetto verrebbe inviata una notifica ai proprietari del sito.

= Analisi

== Tipologie di utente
Sono state individuate due tipologie di utente:
- *Utente non autenticato* è l'utente che non ha eseguito l'accesso al sistema. Può navigare nel sito, usufruire delle funzionalità di ricerca delle ricette e inviare dei suggerimenti dalla pagina dei contatti.
- *Utente autenticato* è l'utente che ha eseguito l'accesso al sistema (in seguito quindi alla registrazione). Tale utente avrà scelto in fase di registrazione la categoria che ritiene essere a lui più appropriata tra:

  - *dad*: ovvero *d*\idattica *a* *d*\istanza, rappresentante uno studente che segue le lezioni da casa;
  - *pendolare*: ovvero uno studente che quotidianamente prende i mezzi pubblici per recarsi in Università;
  - *in sede*: ovvero uno studente che abita vicino alla sede Universitaria;
  - *fuorisede*: ovvero uno studente molto lontano dalla sede Universitaria, e che dunque ha probabilmente un appartamento preso in affitto;

 L'utente autenticato è accompagnato da una esperienza personalizzata nella ricerca delle ricette: a parità di valutazione viene visualizzata prima la ricetta che appartiene alla categoria dell'utente così da invogliarlo con piatti pensati per le sue esigenze.
 Tutti gli utenti autenticati possono inoltre assegnare valutazioni (una per ricetta) e salvare le ricette tra i preferiti.

Tutti gli utenti, autenticati e non, hanno poi la possibilità di rilasciare suggerimenti nella pagina "Contatti".

== Esigenze dell'utenza

In base alla *metafora della pesca*, il gruppo ha predisposto i seguenti strumenti per rispondere alle esigenze di ciascuno:

- *Tiro Perfetto*: per rispondere alle esigenze dell'utenza con un'idea ben specifica, il gruppo ha predisposto una barra di ricerca nella sezione "Ricette", così da rendere veloce la ricerca della ricetta specifica;
- *Trappola per Aragoste*: per rispondere alle esigenze dell'utenza con un'idea non precisa, il gruppo ha implementato dei filtri nella sezione "Ricette", adottando dunque una struttura a faccette. In seguito al filtro, l'utente può inoltre sceglie in che ordine visualizzare i risultati, questo sempre con l'intento di affinare la ricerca. Infine, i piatti sono divisi per *primi* e *secondi* e in base alla categoria (*dad*, *pendolare*, *in sede* e *fuorisede*), aiutando dunque le esigenze di ricerca;
- *Pesca con Rete*: per aiutare l'utenza che non ha affatto un'idea, il gruppo ha predisposto nella pagina principale la descrizione approfondita di ciascuna categoria, con, in aggiunta, un link diretto per visualizzare le ricette della suddetta categoria. La pagina "Ricette", inoltre, mostra comunque sempre l'intero catalogo, così da aiutare l'utente nel suo percorso di esplorazione;
- *Boa di Segnalazione*: l'utente, se autenticato, ha la possibilità di aggiungere una ricetta ai preferiti, con la possibilità di visualizzarla in seguito nella pagina personale del suo profilo.

== funzionalità desiderabili

Con lo scopo di migliorare l'esperienza utente, è stato previsto che l'utente registrato possa personalizzare il proprio profilo cambiandone immagine, nome utente, categoria, biografia e password. Per futuri scopi (esempio di notifica per nuove ricette), in fase di registrazione viene richiesta anche l'email dell'utente, la cui modifica richiederebbe però l'invio di una mail di conferma al precedente indirizzo e non è stata perciò implementata.

L'utente può inoltre cambiare la propria password in qualsiasi momento sempre dal suo profilo personale, dalla quale può inoltre cancellare tutti i preferiti e il suo account, previa apposita conferma.

Seppur il nome utente sia case-sensitive, non è permesso la registrazione di due nomi utente aventi gli stessi caratteri (es. Tony e tony non possono coesistere).

Infine, il profilo di ogni utente è pubblico: nei commenti è presente un link al profilo che lo ha pubblicato e, di tale utente, è possibile visualizzare nome utente, foto profilo, data di registrazione, categoria, biografia e, infine, le sue ricette preferite.

Come anticipato, è inoltre possibile a tutti gli utenti scrivere un suggerimento al gruppo mediante il form disponibile nella pagina "Contatti".

Per migliorare l'esperienza nell'uso della breadcrum nella pagina di una ricetta specifica, questa cambia la posizione "di partenza" a seconda che si arrivi da un preferito o dal catalogo delle ricette.

== SERP ranking

= Progettazione

== Metodologia di sviluppo
Nonostante la maggior parte dell'utenza derivi dal mobile, abbiamo deciso di cominciare dallo sviluppo del sito da desktop per facilitare la fase di design. Dovendo comunque completare la visualizzazione sia per desktop che per mobile ci è sembrato più utile adottare un approccio che agevolasse il lavoro pur mantenendo il medesimo obiettivo.

== Separazione contenuto, presentazione e comportamento
Abbiamo provveduto a separare il contenuto, la presentazione e il comportamento realizzati rispettivamente con `HTML5`, `CSS` e `JavaScript`/`PHP`. Abbiamo adottato quindi le seguenti misure:
- Attribuire lo stile tramite file `CSS` importati nei documenti `HTML5` senza mai assegnare regole inline o embedded.
- JS E PHP?????

== Risoluzioni e dispositivi
Valutando gli elementi delle pagine abbiamo ritenuto opportuno dividere gli schermi secondo le seguenti risoluzioni:
- *inferiore a 480px* per mobile.
- *tra 480px e 768 px* per schermi di dimensioni medie (ad esempio tablet).
- *superiore a 768px* per schermi grandi (ad esempio monitor). Nel file `CSS` dedicato è presente una classe che limita il contenuto a 1200px in modo da gestire anche gli schermi più larghi.
In ogni fascia di risoluzione è sempre stato adottato uno design misto limitando l'uso di unità di misura fisse (utilizzate solo per i bordi) e il display grid (sfruttato solo nella pagina dei contatti).

== Comportamento
Abbiamo provveduto a limitare l'azione di `JavaScript` ai controlli sugli input e all'aggiornamento di due valori nei filtri della pagina di ricerca. In questo modo limitiamo al minimo i disagi provocati dalla mancanza di `JavaScript`. Sono stati quindi realizzati interamente con `CSS` il menu ad hamburger per mobile e le animazioni delle carte nella home. ALTRO????

// == Controlli sui dati
// TEO CONTROLLA !!!!!!! \
// Tutti i dati di input sono controllati lato client per gli errori sintattici. Gli stessi controlli sono ripetuti lato server per garantire la sicurezza integrati da altri controlli eseguibili solo dal back-end.

== Emotional design
Poiché l'utenza target sono giovani studenti abbiamo pensato di adottare un vocabolario molto colloquiale e familiare. L'intenzione è quella di avvicinare l'utente facendolo sentire come se stesse parlando con un compagno di corso. Per questo motivo abbiamo dirottato l'immagine comune di un ricettario in uno scenario universitario dove le ricette sono gli esami e l'utente è il professore. Per coinvolgere appieno l'utente si fa largo uso delle \"call to action\" sia nelle descrizioni che nel contenuto delle pagine.
HAMBURGER

= Accessibilità
Per soddisfare i requisiti di accessibilità abbiamo adottato le seguenti misure:
- Aggiunto la breadcrumb in ogni pagina.
- Aggiunto gli aiuti alla navigazione in ogni pagina.
- Contrassegnato abbreviazioni, simboli e sigle con i corretti tag `HTML5`.
- Aggiunto l'attributo title ai link in modo da renderli più espressivi alla lettura con screen reader.
- Posizionato gli input dopo la relativa label e prima dell'eventuale messaggio di errore.
- Scelto i colori per sfondo, testo, link visitati e non visitati in almeno contrasto AA.
- Assegnato gli attributi alt lasciandoli vuoti se non necessari.
- ALTRO ????
- torna su
- aria-label dove server
- classe hide dove server (bUtton)

== Strumenti utilizzati

Sono stati utilizzati i seguenti strumenti:
- *Total Validator*: per assicurare la correttezza dei documenti html (completati da PHP);

== Test di accessibilità realizzati
Sono stati eseguiti i seguenti controlli per quanto riguarda l'accessibilità:
- Tutti gli elementi interattivi sono raggiungibili tramite \"tab\" o \"swipe\".
- Tutti gli input sono preceduti delle label e seguiti dall'eventuale errore.
- Tutte le pagine contengono le breadcrumb.
- Utilizzo di screen reader (QUALI ???)
- Attributo alt ad ogni immagine (ove l'informazione non sia fornita dal contesto circostante);
- Attributo o tag abbr ad ogni abbreviazione o sigla.
- Link corretti per gli aiuti alla navigazione.
- Attributo lang con la lingua dei termini che seguono se sono stranieri.

== Colori
Sono stati eseguiti i seguenti controlli per quanto riguarda i contrasti dei colori:
- Contrasto *AAA*:
  - QUASI TUTTO
- Contrasto *AA*:
  - QUASI NULLA

== Struttura
Sono stati eseguiti i seguenti controlli per quanto riguarda la struttura:
- Ordine decrescente continuo dei titoli (senza salti ad esempio h1 e h3).
- Ordine dei tag che rispetta l'ordine di lettura indipendentemente dal layout.

== Usabilità
Sono stati eseguiti i seguenti controlli per quanto riguarda l'usabilità:
- Non esistono link circolari.
- Tutte le pagine sono raggiungibili.
- Gli errori 404 e 500 sono gestiti.
- Velocità di caricamento del sito (COSA CON RESULTS)
- CHE FONT ABBIAMO ADOTTATO ???

== Sicurezza
Sono stati eseguiti i seguenti controlli per quanto riguarda la sicurezza:
- Controllo della validità dei dati inviati al server.
- PSW HASH
- QUERY PREPARATE (NO INJECTION)

== Codice
Sono stati eseguiti i seguenti controlli per quanto riguarda il codice:
- `HTML5` e `CSS` validi. ??????????
- Tutte le funzionalità del sito sono valide senza `JavaScript`.

== Falsi positivi
Validando il sito con Total Validator vengono evidenziati i seguenti falsi positivi seguiti dalle motivazioni:
- L'aiuto alla navigazione \"salta al contenuto\" è stato messo dopo \"salta a dove ti trovi\" per mantenere la coerenza di ordine strutturale. Si fa notare che è stato omesso \"salta al menu\" perché posizionato appena dopo il titolo nell'header.
- Le label sono state posizionate prima degli input per questioni di accessibilità.
- Sebbene il tag nav sia usato sia per il menu che per la breadcrumb non è necessario segnare la seconda con un aria-label.
- Nella home la label \"scopri se fa per te\" è ripetuta perché l'azione è la medesima per tutte le 4 sezioni.
- Nella pagina delle ricette la form per l'ordinamento dei risultati non contiene il submit perché l'aggiornamento della vista è automatico alla modifica del valore della select.
- Per la ragione citata sopra `JavaScript` deve inserire onchange=\"this.form.submit()\".
- La destinazione \"\#top\" per i link \"torna su\" sono funzionanti e supportati (si veda #link("https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#target")[#underline("fonte1")] e #link("https://html.spec.whatwg.org/multipage/browsing-the-web.html#scroll-to-the-fragment-identifier")[#underline("fonte2")]).
- Nella pagina dei contatti non è necessaria una legend per la form dei suggerimenti perché è composta solo da una textarea che possiede la propria label.

= Struttura gerarchica
La struttura gerarchica del sito presenta un albero ampio e poco profondo per agevolare la navigazione. Tutte le pagine sono raggiungibili con al più 2 click.

#v(5pt)
#tree-list()[
  - Home
  - Ricette
    - Ricetta
  - Contatti
  - Profilo utente
    - Modifica profilo utente
    - Ricetta (preferita)
  - Accedi
    - Registrati
]

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

= Lavoro e ruoli
Il lavoro è stato partizionato nel seguente modo tra i diversi membri del gruppo:

TODO: DA AGGIUNGERE I CONTROLLI

*Andrea Precoma*
- Creazione della struttura base degli `.html`.
- Creazione della struttura e del relativo stile delle seguenti pagine:
  - Ricette
  - Ricetta
  - Profilo utente
  - Errore 404
  - Errore 500
  - Conferma azione
  - Ringraziamenti
- Refactoring dei `.css`.
- Piccole correzioni e funzionalità dei `.php`.
- Creazione della struttura del database.
- Redazione della relazione.

*Andrea Soranzo*
- Principale ruolo nel design del sito.
- Creazione della struttura e del relativo stile delle seguenti pagine:
  - Home
  - Contatti
  - Accedi
  - Registrazione
  - Modifica profilo utente
  - Offline
- Creazione dello stile di stampa.
- Creazione della funzionalità di ricerca delle ricette.

*Matteo Schievano*
- Creazione delle prime versioni della pagina home (successivamente cambiata di design).
- Creazione dell'header e menu.
- Creazione del comportamento lato server della quasi totalità delle funzionalità.
- Creazione della struttura del database.

*Gabriele Magnelli*
- Creazione della struttura della pagina della ricetta (successivamente ristrutturata).
- Creazione del comportamento lato client.

Tutti i componenti hanno contribuito a popolare il database in modo equilibrato.









#v(100pt)
= NB nelle pagina

home card
- giallo su verde bene perché large (?)

ricette
- algo per ricerca
- link ricette diversi

ricetta
- breadcrumb dinamica
- carica altro
- aggiungi ai preferiti sparisce se non sei loggato
- span en

contatti
- suggerimento manda mail

user
- carica altro
- cambio mail non si può
- link ricette diversi