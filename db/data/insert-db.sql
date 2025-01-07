-- ********************************************************************
-- STARE ATTENTI ALLE PAROLE INGLESI, AGGIUNGERE LA LINGUA COME POSTFISSO (TIPO "hamburger_EN")
-- PSW E NOME DEGLI ACCOUNT SONO UGUALI
-- I NOMI DEGLI ACCOUNT NON HANNO SPAZI
-- FARE ATTENZIONE AI PROCEDIMENTI DELLE RICETTE, GLI OPOSTROFI NON IN MONOSPACE E I PUNTI A FINE FRASE
-- FARE ATTENZIONE QUANDO SI AGGIUNGE UN INGREDIENTE, CERCARE DI NON AGGIUNGERE DUPLICATI (TIPO "OLIO" E "OLIO D'OLIVA")
-- ********************************************************************


DELETE FROM Preferenza_Ricetta;
DELETE FROM Valutazione;
DELETE FROM Preparazione;
DELETE FROM Utilizzo_Ingrediente;
DELETE FROM Suggerimento;
DELETE FROM Ricetta;
DELETE FROM Utente;
DELETE FROM Ingrediente;

-- UTENTE ====================================

INSERT INTO Utente VALUES ("GGGaggi", "GGGaggi@gmail.com", "75dfa00dce8e56f1227b1dda76f53349809836d50867fd94c1ea6c7d6205ecf9", "2025-01-02", "Speleologa di 49 anni, adoro i gatti e il fucsia. Mi è tornata la passione dello studio e mi sono iscritta a odontoiatria a Padova.", "pendolare", NULL);
INSERT INTO Utente VALUES ("JoeTrump", "iamtherealpresident@sus.us", "d71ccf9f3232ed4edf193a057426b2bbc5ec161f3611e4eef54a5c74dbc3e575", "2025-01-04", "Presidente degli USA dal 2026 al 2025, sono bravo a far divertire la gente perché ormai non capisco nemmeno io quando sono serio.\n\nMAKE BURKINA FASO GREAT AGAIN", "dad", NULL);
INSERT INTO Utente VALUES ("OmbrettaGatti", "ombretta.loves.gatti@realistico.com", "b0285e1748112f22f9ca981d064ce20906a902662a47b6a0cc14c2d399a531b2", "2025-01-09", "Sono una gattara anche a giovane età, studio veterinaria a Palermo.", "in_sede", NULL);


-- INGREDIENTE ====================================

INSERT INTO Ingrediente VALUES ("olio");
INSERT INTO Ingrediente VALUES ("sale fino");
INSERT INTO Ingrediente VALUES ("cespo di insalata");
INSERT INTO Ingrediente VALUES ("pomodoro da insalata");
INSERT INTO Ingrediente VALUES ("pane in cassetta");
INSERT INTO Ingrediente VALUES ("prosciutto cotto");
INSERT INTO Ingrediente VALUES ("maionese");
INSERT INTO Ingrediente VALUES ("mozzarella");
INSERT INTO Ingrediente VALUES ("origano");
INSERT INTO Ingrediente VALUES ("cotoletta impanata");
INSERT INTO Ingrediente VALUES ("pomodorini");
INSERT INTO Ingrediente VALUES ("pane");
INSERT INTO Ingrediente VALUES ("hamburger_EN");
-- INSERT INTO Ingrediente VALUES ("riso basmati");
-- INSERT INTO Ingrediente VALUES ("petto di pollo");
-- INSERT INTO Ingrediente VALUES ("piselli");
-- INSERT INTO Ingrediente VALUES ("latte di cocco");
-- INSERT INTO Ingrediente VALUES ("curry_EN in polvere");


-- RICETTA ====================================

-- FUORISEDE

-- PENDOLARE
INSERT INTO Ricetta VALUES ("Insalata pigra", "pendolare", "secondo", 5, 3, "Hai dormito 5 ore per finire di studiare e, tornando dall'università, non hai voglia di prepararti da mangiare? Suvvia, non trascurare il pranzo, fatti un'insalata.", "2025-01-01", "../asset/img/recipe/pendolare/insalata-pigra.jpg");
INSERT INTO Ricetta VALUES ("Tramezzini prosciutto e maionese", "pendolare", "secondo", 5, 3, "TEOOOOOO", "2025-01-01", "../asset/img/recipe/pendolare/tramezzini.jpg");
INSERT INTO Ricetta VALUES ("Caprese", "pendolare", "secondo", 5, 5, "Piatto semplice, utile per giornate mhe.", "2025-01-01", "../asset/img/recipe/pendolare/caprese.jpg");
INSERT INTO Ricetta VALUES ("Cotoletta", "pendolare", "secondo", 10, 5, "Secondo veloce da preparare, muoviti che poi devi studiare!", "2025-01-01", "../asset/img/recipe/pendolare/cotoletta.jpg");
INSERT INTO Ricetta VALUES ("Hamburger_EN", "pendolare", "secondo", 20, 7, "Vi sentite un po' premium: questa ricetta è il massimo che un pendolare possa realizzare, il treno purtroppo non si lascia aspettare.", "2025-01-01", "../asset/img/recipe/pendolare/hamburger.jpg");
INSERT INTO Ricetta VALUES ("Panino con prosciutto e pomodoro", "pendolare", "secondo", 5, 3, "Ci risiamo, anche quest'anno la segreteria ha ben deciso di piazzare le uniche due lezioni del giorno una alle 8.30 e l'altra alle 16.30. Non preoccuparti, nemmeno noi vogliamo andare in mensa, per questo ti diciamo come sopravvivere a pranzo.", "2025-01-01", "../asset/img/recipe/pendolare/panino.jpg");

-- IN SEDE
-- INSERT INTO Ricetta VALUES ("Pollo al curry_EN con riso e piselli", "in_sede", "secondo", 40, 8, "Un piatto aromatico e completo che porta in tavola i sapori dell'Oriente. Il pollo, cucinato in una salsa cremosa al curry e latte di cocco, si sposa perfettamente con il riso basmati che ne assorbe i profumi intensi e speziati. I piselli freschi aggiungono una nota dolce e un tocco di colore rendendo il piatto ancora più appetitoso. Perfetto per chi ama le spezie e desidera un piatto unico ricco di sapore e ben bilanciato.", "2025-01-01", "../asset/img/recipe/in-sede/pollo-curry.jpg");   -- EN

-- DAD


-- PREFERENZA RICETTA ====================================

INSERT INTO Preferenza_Ricetta VALUES ("Insalata pigra", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Tramezzini prosciutto e maionese", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Caprese", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Cotoletta", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Hamburger_EN", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Hamburger_EN", "JoeTrump");


-- UTILIZZO INGREDIENTE ====================================

-- FUORISEDE

-- PENDOLARE
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata pigra", "cespo di insalata", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata pigra", "pomodoro da insalata", FALSE, 1, "num_el", "quello grande");
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata pigra", "olio", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata pigra", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Tramezzini prosciutto e maionese", "pane in cassetta", FALSE, 1, "num_el", "morbido da tramezzino");
INSERT INTO Utilizzo_Ingrediente VALUES ("Tramezzini prosciutto e maionese", "prosciutto cotto", FALSE, 120, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Tramezzini prosciutto e maionese", "maionese", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Caprese", "pomodoro da insalata", FALSE, 2, "num_el", "quelli grandi");
INSERT INTO Utilizzo_Ingrediente VALUES ("Caprese", "mozzarella", FALSE, 2, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Caprese", "origano", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "cotoletta impanata", FALSE, 1, "num_el", "pre-confezionata");
INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "pomodorini", FALSE, 10, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "olio", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Hamburger_EN", "pane", FALSE, 1, "num_el", "meglio se da hamburger_EN");  -- EN
INSERT INTO Utilizzo_Ingrediente VALUES ("Hamburger_EN", "hamburger_EN", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Hamburger_EN", "olio", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Panino con prosciutto e pomodoro", "prosciutto cotto", FALSE, 35, "g", "o crudo se c'hai i soldi");
INSERT INTO Utilizzo_Ingrediente VALUES ("Panino con prosciutto e pomodoro", "pomodoro da insalata", FALSE, 1, "num_el", "quello grande");
INSERT INTO Utilizzo_Ingrediente VALUES ("Panino con prosciutto e pomodoro", "pane", FALSE, 1, "num_el", "meglio se da toast_EN");   -- EN

-- IN SEDE

-- DAD


-- PREPARAZIONE ====================================

-- FUORISEDE

-- PENDOLARE
INSERT INTO Preparazione VALUES ("Insalata pigra", 1, "Prendi il cespo di insalata e inizia a togliere le varie foglie (ti potrebbe essere utile, per fare in fretta, rimuovere dal basso il cuore del cespo: in internet ci sono molti life hacks a riguardo ;) )");
INSERT INTO Preparazione VALUES ("Insalata pigra", 2, "Dal reparto “cose che non credo di aver mai usato” prendi la centrifuga di insalata e mettila vicino al lavello, ci servirà in un attimo");
INSERT INTO Preparazione VALUES ("Insalata pigra", 3, "Blocca il lavello con il tappo e fallo riempire un poco d'acqua. Poni quindi le foglie nell'acqua e inizia a pulirle, eventualmente aiutandoti anche con l'acqua corrente se necessario. Lavata una foglia, ponila dentro la centrifuga");
INSERT INTO Preparazione VALUES ("Insalata pigra", 4, "Una volta lavate tutte le foglie svuota il lavello, quindi chiudi la centrifuga con il suo coperchio e, raccolte le poche forze che ti sono rimaste, aziona la centrifuga controllando periodicamente se le foglie sono asciutte ed eventualmente buttando via l'acqua in eccesso. Un buon indicatore è controllare quanta acqua si sia depositata nella centrifuga di volta in volta ;)");
INSERT INTO Preparazione VALUES ("Insalata pigra", 5, "Prendi una terrina per insalata e ponici le foglie lavate ed asciugate. Mettila da parte, la riprenderemo tra poco");
INSERT INTO Preparazione VALUES ("Insalata pigra", 6, "Prendi il pomodoro e puliscilo sotto l'acqua corrente. Fatto questo cerca un tagliere e un coltello, quindi poggia il pomodoro sul tagliere");
INSERT INTO Preparazione VALUES ("Insalata pigra", 7, "Affetta tutto il pomodoro cercando di non realizzare fette eccessivamente spesse");
INSERT INTO Preparazione VALUES ("Insalata pigra", 8, "Taglia le fette in pezzetti più piccoli, quindi versali nella terrina dove hai posto l'insalata");
INSERT INTO Preparazione VALUES ("Insalata pigra", 9, "Condisci con olio e sale e voilà_FR: il pranzo è servito");

INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 1, "Prendi una fetta di pane e tagliala a metà in senso obliquo");
INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 2, "Spalma un po' di maionese su entrambe le fette di pane");
INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 3, "Prendi il prosciutto e mettilo su una fetta di pane");
INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 4, "Prendi di nuovo la maionese e spalmala sopra il prosciutto");
INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 5, "Posiziona la fetta di pane senza prosciutto sopra l'altra fetta");

INSERT INTO Preparazione VALUES ("Caprese", 1, "Prendi i due pomodori e lavali bene sotto l'acqua corrente per togliere eventuali pesticidi presenti sulla superficie");
INSERT INTO Preparazione VALUES ("Caprese", 2, "Dall'angolo cose da non toccare, prendi un tagliere e un coltello dalla lama non arrotondata. Prendi i due pomodori e tagliali a fette: non devono essere né troppo grandi, né troppo fine: il giusto insomma");
INSERT INTO Preparazione VALUES ("Caprese", 3, "Prendi un piatto e poggia sopra le fette di pomodoro avendo cura di non sovrapporle");
INSERT INTO Preparazione VALUES ("Caprese", 4, "Prendi una mozzarella e, avendo cura di porti sopra il lavello per evitare di dover poi pulire per terra, apri la confezione aiutandoti con l'utilizzo di una forbice o di un coltello, avendo cura di non tagliarti le dita (hai una laurea da prendere, ricordalo...)");
INSERT INTO Preparazione VALUES ("Caprese", 5, "Dopo aver sgocciolato la mozzarella, ponila sopra il tagliere e tagliala a fette anche queste non troppo spesse");
INSERT INTO Preparazione VALUES ("Caprese", 6, "Poni ciascuna fetta di mozzarella sopra ad una fetta di pomodoro");
INSERT INTO Preparazione VALUES ("Caprese", 7, "Fai lo stesso con la seconda mozzarella");
INSERT INTO Preparazione VALUES ("Caprese", 8, "Prendi l'origano e spargilo sopra il piatto: complimenti, la tua caprese è pronta da gustare. Stappa una bottiglia di aranciata e buon appetito!");

INSERT INTO Preparazione VALUES ("Cotoletta", 1, "Cerca un tagliere per tagliare i pomodorini");
INSERT INTO Preparazione VALUES ("Cotoletta", 2, "Prendi dal frigo i pomodorini, apri l'acqua del lavello e inizia a pulirli uno ad uno per togliere eventuali residui presenti sulla superficie");
INSERT INTO Preparazione VALUES ("Cotoletta", 3, "Lavati i pomodorini poggiali sopra il tagliere. Prendi dunque un coltello (preferibilmente non dalla punta arrotondata) e inizia ad affettare i pomodorini in due o tre parti");
INSERT INTO Preparazione VALUES ("Cotoletta", 4, "Poggia i pomodorini tagliati su un piatto e condiscili con olio e sale");
INSERT INTO Preparazione VALUES ("Cotoletta", 5, "Prendi una padella sufficientemente grande per ospitare la cotoletta e coprila con un filo d'olio per evitare che la cotoletta si attacchi");
INSERT INTO Preparazione VALUES ("Cotoletta", 6, "Fai cuocere per cinque minuti rigirando la pietanza ambo le parti, in maniera che venga scaldata uniformemente");
INSERT INTO Preparazione VALUES ("Cotoletta", 7, "Impiatta assieme ai pomodori e la cena è servita");

INSERT INTO Preparazione VALUES ("Hamburger_EN", 1, "Prendi una padella e ungila d'olio. Ponila sul fuoco e lasciala riscaldare. Attenzione: meglio non esagerare con la quantità d'olio.");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 2, "Prendi dal frigo l'hamburger_EN e togli eventuali rivestimenti che coprono la carne.");   -- EN
INSERT INTO Preparazione VALUES ("Hamburger_EN", 3, "Poni la carne sulla padella avendo cura di non schizzarti con l'olio caldo (sono dolori, dico per esperienza). La carne deve cuocere per un massimo 10 minuti, facendola girare ogni 2/3 per fare in modo si cuocia uniformemente.");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 4, "Mentre aspetti qualche minuto per girare la carne, prendi il pane e taglialo a metà. Cerca quindi il tostapane se ce l'hai e usalo per scaldare il pane appena tagliato.");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 5, "Passati i 10 minuti spegni il fuoco e contolla che la carne al suo interno sia ben cotta. Prendi quindi un piatto, poggiaci una fetta di pane caldo, poni in mezzo l'hamburger_EN e quindi chiudi con la seconda fetta: l'hamburger_EN è pronto, buon appetito!");   -- EN

INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 1, "Se possiedi un tostapane è ora di usarlo, prendilo e attaccalo alla corrente.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 2, "Dopo aver accuratamente controllato di non esserti slogato la spalla, prendi le due fette di pane da toast_EN e inseriscile dentro il tostapane. Accendi quindi il tostapane e lascia che il pane scaldi.");   -- EN
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 3, "Nel frattempo prendi il pomodoro e lavalo sotto l'acqua corrente per togliere residui di pesticidi e/o altro materiale dannoso.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 4, "Prendi un tagliere e poggiaci sopra il pomodoro lavato e profumato. Taglia quindi quattro fette di pomodoro e metti la parte avanzata in frigo.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 5, "Prendi una fetta di pane caldo, poggia due fette di pomodoro, il prosciutto e quindi le rimanenti due fette di pomodoro. Chiudi con l'altra fetta di pane.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 6, "Il tuo panino è pronto, buon appetito!");

-- IN SEDE

-- DAD


-- VALUTAZIONE ====================================

-- FUORISEDE
INSERT INTO Valutazione VALUES ("Insalata pigra", "GGGaggi", "2025-01-05", 28, "Abbinamento spaziale, super consigliato.");
INSERT INTO Valutazione VALUES ("Insalata pigra", "OmbrettaGatti", "2025-01-12", 26, "Concordo con GGGaggi, piatto leggero (si vede che siamo sulla stessa onda).");
INSERT INTO Valutazione VALUES ("Caprese", "GGGaggi", "2025-01-08", 30, "Ancora meglio dell'insalata pigra, valutate molto positivamente entrambe.");
INSERT INTO Valutazione VALUES ("Caprese", "JoeTrump", "2025-01-06", 12, "Piatto senza CARNE? unacceptable");
INSERT INTO Valutazione VALUES ("Hamburger_EN", "JoeTrump", "2025-01-12", 30, "Wonderful! finalmente un piatto come si deve della mia nazione");

-- PENDOLARE

-- IN SEDE

-- DAD


-- SUGGERIMENTO ====================================

INSERT INTO Suggerimento VALUES ("GGGaggi", "2025-01-10", "Non ho un piatto da consigliarvi, volevo solo dirvi che avete fatto un ottimo lavoro!");
