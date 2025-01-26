#import "./utility.typ": *
#import "@preview/treet:0.1.1": *

#show: doc => copertina(doc)

#set text(10pt, font: "DejaVu Serif")

= Abstract
Il progetto consiste in un sito web che tratta un ricettario dedicato per universitari. Vi sono quattro categorie di universitario per differenziare le esigenze di ognuno. Queste vengono utilizzate anche per suddividere le ricette considerando la stima del costo, la difficoltà e il tempo di preparazione. La ricetta può essere valutata dagli utenti in una modalità simile da una prova d'esame: viene assegnata un voto da 1 a 30 e un commento che motiva la valutazione.

Ogni utente registrato possiede un proprio profilo con dei dati che può personalizzare. Le ricette salvate come preferite sono visibili nella pagina profilo.

Nella pagina dedicata ai contatti dei proprietari del sito è presente anche un campo di testo nel quale ogni utente può suggerire un piatto da aggiungere al sito.

= Analisi

== Tipologie di utente
Sono state individuate due tipologie di utente:
- *Utente non autenticato* è l'utente che non ha eseguito l'accesso al sistema. Può navigare nel sito, usufruire delle funzionalità di ricerca delle ricette e inviare dei suggerimenti dalla pagina dei contatti.
- *Utente autenticato* è l'utente che ha eseguito l'accesso al sistema (in seguito quindi alla registrazione). Tale utente avrà scelto in fase di registrazione la categoria che ritiene essere a lui più appropriata:
  - *Fuorisede* è lo studente che si è trasferito nella sede dell'università, deve centellinare le spese e il tempo a disposizione.
  - *Pendolare* è lo studente che perde a causa dei trasporti e torna a casa a orari scomodi.
  - *In sede* è lo studente che abita relativamente vicino all'università e che ha più tempo a disposizione.
  - *DAD (Didattica A Distanza)* è lo studente che rimane a casa e si guarda il materiale delle lezioni da casa, ha quindi flessibilità ampie di tempo.
L'utente autenticato è accompagnato da una esperienza personalizzata nella ricerca delle ricette: a parità di valutazione viene visualizzata prima la ricetta che appartiene alla categoria dell'utente così da invogliarlo con piatti pensati per le sue esigenze.
Tutti gli utenti autenticati possono inoltre assegnare valutazioni (una per ricetta) e salvare le ricette tra i preferiti.

Tutti gli utenti, autenticati e non, hanno inoltre la possibilità di rilasciare suggerimenti nella pagina dei contatti.

== Esigenze dell'utenza
In base alla *metafora della pesca*, il gruppo ha predisposto i seguenti strumenti per rispondere alle esigenze di ciascuno:
- *Tiro Perfetto*: per rispondere alle esigenze dell'utenza con un'idea ben specifica, il gruppo ha predisposto una barra di ricerca nella pagina delle ricette.
- *Trappola per aragoste*: per rispondere alle esigenze dell'utenza con un'idea non precisa, il gruppo ha implementato dei filtri nella pagina delle ricette, adottando dunque una struttura a faccette. In seguito al filtro, l'utente può inoltre scegliere in che ordine visualizzare i risultati, questo sempre con l'intento di affinare la ricerca. Infine, i piatti sono divisi per *primi* e *secondi* e in base alla categoria (*DAD*, *pendolare*, *in sede* e *fuorisede*), aiutando dunque le esigenze di ricerca.
- *Pesca con rete*: per aiutare l'utenza che non ha un'idea di cosa cercare, il gruppo ha predisposto nella home la descrizione approfondita di ciascuna categoria. Ognuna è seguita da un link per visualizzare le ricette della categoria desiderata. L'utente viene quindi indirizzato alla pagina delle ricette con applicato il filtro della categoria selezionata.
- *Boa di Segnalazione*: l'utente, se autenticato, ha la possibilità di aggiungere una ricetta ai preferiti, con la possibilità di visualizzarla in seguito nella pagina personale del suo profilo.

== Possibili ricerche e ranking
Ogni pagina possiede adeguate keywords per aumentare il livello di trustness. In particolare è sempre presente \"Uni Cooked\" in quanto viene ripresa nel tag title, nella descrizione e nella intestazione di livello 1 nell'header. In questo modo se l'utente conosce già il nome del sito (o se lo ricorda in parte) è molto probabile esca tra i primi risultati del motore di ricerca.

Da notare la pagina della ricetta che, con l'ausilio di `PHP`, contiene il nome della ricetta nel tag title, nella descrizione e nelle keywords. Nel nome sono presenti gli ingredienti principali (ad esempio \"Pasta zucchine e gamberetti\"). In questo modo si viene incontro anche all'utente che cerca delle ricette secondo ingredienti chiave.

Infine abbiamo cercato di inserire una \"call to action\" in ogni descrizione in modo sia da coinvolgere maggiormente l'utente sia da migliorare il ranking del motore di ricerca.

== Funzionalità desiderabili
Per futuri scopi (ad esempio di notifica per nuove ricette), in fase di registrazione verrebbe richiesta anche l'e-mail dell'utente. La modifica della stessa richiederebbe però l'invio di una e-mail di conferma, funzionalità che non abbiamo potuto implementare.

Il suggerimento condiviso dagli utenti dalla pagina dei contatti è solamente salvato nel database. Per un motivo analogo al cambio password dell'utente non abbiamo potuto notificare agli amministratori la ricezione di un nuovo suggerimento.

Il profilo utente è visibile a tutti. Sarebbe desiderabile rendere disponibile all'utente l'opzione di rendere le informazioni del proprio profilo, o parte di esse, private.

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
Abbiamo provveduto a limitare l'azione di `JavaScript` ai controlli sugli input, all'aggiornamento di due valori nei filtri della pagina di ricerca e a funzionalità minori. In questo modo limitiamo al minimo i disagi provocati dalla mancanza di `JavaScript`. Sono stati quindi realizzati interamente con `CSS` il menu ad hamburger per mobile e le animazioni delle carte nella home. Le funzionalità dipendenti da `JavaScript` sono le seguenti:
- Controllo lato client degli input.
- Disabilitazione dei pulsanti submit in caso i requisiti minimi degli input non siano soddisfatti.
- Aggiornamento dei paragrafi sotto gli slider del filtro nelle ricette con il valore dell'input.
- Aggiornamento immediato della foto profilo nella pagina di modifica profilo utente quando viene cambiata.
- Animazione delle ricette quando vengono caricate in seguito ad una ricerca.

Lato server abbiamo provveduto ad eseguire tutti i controlli necessari riguardo i dati inseriti dall'utente e PAGINE TEO. Ogni connessione al database è chiusa immediatamente dopo il recupero dei dati.

// == Controlli sui dati
// TEO CONTROLLA !!!!!!! \
// Tutti i dati di input sono controllati lato client per gli errori sintattici. Gli stessi controlli sono ripetuti lato server per garantire la sicurezza integrati da altri controlli eseguibili solo dal back-end.

== Emotional design
Poiché l'utenza target sono giovani studenti abbiamo pensato di adottare un vocabolario molto colloquiale e familiare. L'intenzione è quella di avvicinare l'utente facendolo sentire come se stesse parlando con un compagno di corso. Per questo motivo abbiamo dirottato l'immagine comune di un ricettario in uno scenario universitario dove le ricette sono gli esami e l'utente è il professore. Per coinvolgere appieno l'utente si fa largo uso delle \"call to action\" sia nelle descrizioni che nel contenuto delle pagine.

Per rendere il sito più accattivante e originale abbiamo personalizzato il menu ad hamburger in modo che richiamasse il tema della cucina. Sono state aggiunte inoltre delle animazioni semplici per rendere l'esperienza più fluida e piacevole, facendo attenzione però a non recare disturbo a utenti con difficoltà nel mantenimento dell'attenzione.

= Requisiti per l'accessibilità
Per soddisfare i requisiti di accessibilità abbiamo adottato le seguenti misure:
- Aggiunto la breadcrumb in ogni pagina.
- Aggiunto gli aiuti alla navigazione in ogni pagina. I \"torna su\" sono posizionati sempre nel footer ma anche in sezioni lunghe come ad esempio le categorie nella home.
- Contrassegnato abbreviazioni, simboli e sigle con i corretti tag `HTML5`.
- Aggiunto l'attributo title ai link in modo da renderli più espressivi alla lettura con screen reader.
- Posizionato gli input dopo la relativa label e prima dell'eventuale messaggio di errore.
- Scelto i colori per sfondo, testo, link visitati e non visitati in almeno contrasto AA.
- Assegnato gli attributi alt a tutte le immagini lasciandoli vuoti se non necessari.
- Aggiunto l'attributo aria-label dove necessario.
- Nascosto gli elementi di aiuto agli screen reader.
- Eseguito l'image replacement dove necessario.
- Assegnato gli attributi aria-live e aria-atomic nelle categorie della home per avvisare lo screen reader dell'animazione della carta (l'attributo role=\"alert\" non è accettato da Total Validator).

= Controlli sul sito
== Strumenti
Per eseguire i controlli sono stati adottati i seguenti strumenti:
- *Total Validator* per assicurare la correttezza dei documenti html (completati da PHP).
- *WCAG color contrast checker* (estensione Chrome)
- Screen reader:
  - *Narrator* (Windows 11)
  - *Orca* (Ubuntu 22.04)
  - *NVDA*
- *Lighthouse*
Molti controlli sono stati svolti manualmente.

== Accessibilità
Sono stati eseguiti i seguenti controlli per quanto riguarda l'accessibilità:
- Tutti gli elementi interattivi sono raggiungibili tramite \"tab\" o \"swipe\".
- Tutti gli input sono preceduti delle label e seguiti dall'eventuale errore (ad eccezione del menu ad hamburger).
- Tutte le pagine contengono le breadcrumb.
- Utilizzo di screen reader.
- Attributo alt ad ogni immagine (ove l'informazione non sia fornita dal contesto circostante).
- Attributo o tag abbr ad ogni abbreviazione o sigla.
- Link corretti per gli aiuti alla navigazione.
- Attributo lang con la lingua dei termini che seguono se sono stranieri.
- Resistenza degli elementi con ingrandimento del testo fino a 24px.

== Colori
Sono stati eseguiti i seguenti controlli per quanto riguarda i contrasti dei colori:
- Tutti i colori di sfondo e testo sono in contrasto AAA. Unica eccezione fatta per il testo \"Adatto per te se:\" nel lato posteriore delle carte nella home. In base a quanto riportato da WCAG color contrast checker l'intestazione è in contrasto AA in quanto considerato come testo grande. Tuttavia perde il contrasto AA quando il testo 1em raggiunge i 10px. Pensiamo quindi che tali numeri non siano adottati da un utente con difficoltà nella distinzione dei colori.
- Mantenendo i colori in palette non è stato possibile trovare i contrasti tra link visitati e non visitati (mantenendo i contrasti tra questi e lo sfondo). Abbiamo quindi optato per due differenti soluzioni:
  - I link inseriti nel testo o in elenchi sono sottolineati una volta se non visitati, due volte se visitati.
  - I link con uno sfondo dedicato, ad esempio i \"pulsanti\" ACCEDI nel menu o MODIFICA PROFILO nel profilo utente, sono contornati da un bordo dello stesso colore del link se visitati.
- COLORI LINK ???

== Struttura
Sono stati eseguiti i seguenti controlli per quanto riguarda la struttura:
- Ordine decrescente continuo dei titoli (senza salti ad esempio h1 e h3).
- Ordine dei tag che rispetta l'ordine di lettura indipendentemente dal layout.

== Usabilità
Sono stati eseguiti i seguenti controlli per quanto riguarda l'usabilità:
- Non esistono link circolari.
- Tutte le pagine sono raggiungibili.
- Gli errori 404 e 500 sono gestiti.
- Velocità di caricamento del sito e indice di accessibilità usando Lighthouse.
- Font senza grazie per il sito, con grazie per la versione stampata.

== Sicurezza
Sono stati eseguiti i seguenti controlli per quanto riguarda la sicurezza:
- Controllo della validità dei dati lato client e server.
- Password salvate in hash e non in chiaro.
- Query \"preparate\" in modo da evitare sql injection.

== Codice
Sono stati eseguiti i seguenti controlli per quanto riguarda il codice:
- `HTML5` e `CSS` validi. ??????????
- Tutte le funzionalità principali del sito sono valide senza `JavaScript`.

== Falsi positivi
Validando il sito con Total Validator vengono evidenziati i seguenti falsi positivi seguiti dalle motivazioni:
- L'aiuto alla navigazione \"salta al contenuto\" è stato messo dopo \"salta a dove ti trovi\" per mantenere la coerenza di ordine strutturale. Si fa notare che è stato omesso \"salta al menu\" perché posizionato appena dopo il titolo nell'header.
- Le label sono state posizionate prima degli input per questioni di accessibilità.
- Sebbene il tag nav sia usato sia per il menu che per la breadcrumb non è necessario segnare la seconda con un aria-label.
- Nella home la label \"scopri se fa per te\" è ripetuta perché l'azione è la medesima per tutte le quattro sezioni.
- Nella pagina delle ricette la form per l'ordinamento dei risultati non contiene il submit perché l'aggiornamento della vista è automatico alla modifica del valore della select.
- Per la ragione citata precedentemente `JavaScript` deve inserire onchange=\"this.form.submit()\".
- La destinazione \"\#top\" per i link \"torna su\" sono funzionanti e supportati (si veda #link("https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#target")[#underline("MDN web docs")] e #link("https://html.spec.whatwg.org/multipage/browsing-the-web.html#scroll-to-the-fragment-identifier")[#underline("HTML Living Standard")]).
- Nella pagina dei contatti non è necessaria una legend per la form dei suggerimenti perché è composta solo da una textarea che possiede la propria label.
- Nella pagina di modifica profilo non è necessaria una legend per la form di modifica password perché il compito è esplicito nel titolo e nelle label.

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

= Menzioni onorevoli
Di seguito sono riportate, per pagina, alcune funzionalità particolari che possono non risultare immediate da notare.

== Home
Le carte delle categorie sono animate solamente tramite `CSS` per rendere la funzionalità indipendente dalle preferenze dell'utente, il quale può disabilitare `JavaScript`. Per realizzarle è stato necessario utilizzare la pseudo-classe :has() supportata da tutti i browser dal 2023 (si veda #link("https://developer.mozilla.org/en-US/docs/Web/CSS/:has")[#underline("MDN web docs")]). Poiché può essere considerata una clausola relativamente recente abbiamo aggiunto delle regole di supporto che eliminano l'animazione e il relativo pulsante. L'utente non percepisce quindi un malfunzionamento del sito, solamente viene privato di alcune informazioni (nel retro della carta). Queste comunque non sono fondamentali per la descrizione della categoria, bensì sono pensate principalmente per suscitare divertimento ed esclusività nell'utente.

I link \"vai alle ricette\" delle carte delle categorie potrebbero risultare poco espressivi per un utente che usa lo screen reader. Per ovviare al problema abbiamo aggiunto l'attributo title con il nome della categoria in modo che, letto dopo la descrizione della carta, sembri un tutt'uno col testo.

Il menu ad hamburger è reso accessibile mediante una label che cambia testo dinamicamente a seconda dello stato del menu e di un link posto dopo l'ultima voce che riporta alla casella di controllo per chiuderlo. Quando il menu è aperto la porzione di sito visibile al di sotto viene offuscata in modo da impedire l'interazione col sito e concentrare l'attenzione dell'utente sul menu. Viene inoltre bloccato lo scorrimento verticale con la pseudo-classe :has(). Se nuovamente questa non è supportata l'utente può scorrere nella pagina ma questa rimane offuscata obbligandolo a chiudere il menu. L'utente che adopera lo screen reader può ignorare il link posto a fine menu e navigare senza troppi problemi nel sito, tuttavia confidiamo che il livello di esperienza di questa tipologia di utenza porti a non ignorare il suggerimento del link. Inoltre un utente con difficoltà visiva quasi totale o totale che utilizza lo screen reader con molta probabilità non è infastidito dal filtro che offusca le pagine. 

== Ricette
L'algoritmo di ricerca è stato soggetto di attenta analisi e sviluppo per garantire una esperienza personalizzata ad ogni tipologia di utenza:
- La ricerca per testo controlla delle corrispondenze nel nome delle ricette. ANDREA...
- A parità di costo viene visualizzata prima la ricetta con ANDREA ???
- ...
- Se l'utente è autenticato, a parità di valutazione viene visualizzata prima la ricetta della categoria dell'utente.
- Le ricette senza valutazioni vengono poste come ultime in qualsiasi ricerca.
- Nelle situazioni diverse da quelle citate l'ordine è casuale.

I link \"vai alla ricetta\" degli elementi della lista potrebbero risultare poco espressivi per un utente che usa lo screen reader. Per ovviare al problema abbiamo aggiunto l'attributo title con il nome della ricetta.

== Ricetta
Alla pagina di una ricetta ci si può arrivare dal catalogo delle ricette oppure dall'elenco delle ricette preferite di un utente. Per migliorare l'esperienza nell'uso della breadcrum, questa cambia pagina di provenienza a seconda che si arrivi dalla pagina delle ricette o da un preferito.

Per assegnare l'attributo della lingua correttamente alle parole straniere abbiamo creato una funzione apposita che racchiude i termini in un tag span. Nel database è sufficiente far seguire le parole straniere da \"\_XX\" dove XX indica il codice della lingua.

La sezione delle valutazioni può potenzialmente diventare molto lunga. Abbiamo quindi provveduto a limitare il numero di valutazioni visualizzate aggiungendo un pulsante per caricarne altri. Al termine delle valutazioni è posto anche un link per tornare rapidamente all'inizio della sezione. In ogni valutazione inoltre è presente il nome dell'utente sotto forma di link. In questo modo è possibile visitare il profilo degli altri utenti.

Il pulsante per aggiungere o togliere dai preferiti la ricetta è visibile solo se l'utente è autenticato.

== Profilo utente
Abbiamo scelto di rendere il nome utente univoco così da evitare disorientamento. Seppur quindi il nome utente sia case-sensitive, non è permessa la registrazione di due nomi utente aventi gli stessi caratteri (ad esempio Tony e tony non possono coesistere).

Riguardo ai link \"vai alla ricetta\" delle ricette preferite abbiamo adottato la stessa soluzione del catalogo delle ricette.

Riguardo la potenziale numerosità delle ricette preferite abbiamo adottato la stessa soluzione delle valutazioni.

= Lavoro e ruoli
Il lavoro è stato partizionato nel seguente modo tra i diversi membri del gruppo:

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
- Creazione del menu ad hamburger.
- Refactoring dei `.css`.
- Piccole correzioni e funzionalità dei `.php`.
- Creazione della struttura del database.
- Controlli vari per il sito.
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
- Creazione delle animazioni.
- Controlli vari per il sito.

*Matteo Schievano*
- Creazione delle prime versioni della pagina home (successivamente cambiata di design).
- Creazione dell'header e menu.
- Creazione del comportamento lato server della quasi totalità delle funzionalità.
- Creazione della struttura del database.
- Creazione del file `.htaccess`.
- Controlli vari per il sito.
- Redazione della relazione.

*Gabriele Magnelli*
- Creazione della struttura della pagina della ricetta (successivamente ristrutturata).
- Creazione del comportamento lato client.

Tutti i componenti hanno contribuito a popolare il database in modo equilibrato.
