DELETE FROM Preferenza_Ricetta;
DELETE FROM Valutazione;
DELETE FROM Preparazione;
DELETE FROM Utilizzo_Ingrediente;
DELETE FROM Suggerimento;
DELETE FROM Ricetta;
DELETE FROM Utente;
DELETE FROM Ingrediente;

-- UTENTE

INSERT INTO Utente VALUES ("GGGaggi", "GGGaggi@gmail.com", "75dfa00dce8e56f1227b1dda76f53349809836d50867fd94c1ea6c7d6205ecf9", "2025-01-02", "Speleologa di 49 anni, adoro i gatti e il fucsia. Mi è tornata la passione dello studio e mi sono iscritta a odontoiatria a Padova.", "pendolare", NULL);


-- INGREDIENTE

INSERT INTO Ingrediente VALUES ("cespo di insalata");
INSERT INTO Ingrediente VALUES ("pomodoro da insalata");
INSERT INTO Ingrediente VALUES ("olio");
INSERT INTO Ingrediente VALUES ("sale fino");
INSERT INTO Ingrediente VALUES ("pane in cassetta");
INSERT INTO Ingrediente VALUES ("prosciutto cotto");
INSERT INTO Ingrediente VALUES ("maionese");
INSERT INTO Ingrediente VALUES ("mozzarella");
INSERT INTO Ingrediente VALUES ("origano");


-- RICETTA

-- FUORISEDE

-- PENDOLARE
INSERT INTO Ricetta VALUES ("Insalata pigra", "pendolare", "secondo", 5, 3, "Hai dormito 5 ore per finire di studiare e, tornando dall'università, non hai voglia di prepararti da mangiare? Suvvia, non trascurare il pranzo: fatti un'insalata", "2025-01-01", "../asset/img/recipe/pendolare/insalata-pigra.jpg");
INSERT INTO Ricetta VALUES ("Tramezzini prosciutto e maionese", "pendolare", "secondo", 5, 1, "TEOOOOOO", "2025-01-01", "../asset/img/recipe/pendolare/tramezzini.jpg");
INSERT INTO Ricetta VALUES ("Caprese", "pendolare", "secondo", 5, 5, "Piatto semplice, utile per giornate mhe", "2025-01-01", "../asset/img/recipe/pendolare/caprese.jpg");

-- IN SEDE

-- DAD


-- PREFERENZA RICETTA

INSERT INTO Preferenza_Ricetta VALUES ("Insalata pigra", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Caprese", "GGGaggi");


-- UTILIZZO INGREDIENTE

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

-- IN SEDE

-- DAD


-- PREPARAZIONE

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
INSERT INTO Preparazione VALUES ("Insalata pigra", 9, "Condisci con olio e sale e voilà: il pranzo è servito");

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

-- IN SEDE

-- DAD


-- VALUTAZIONE

-- FUORISEDE
INSERT INTO Valutazione VALUES ("Insalata pigra", "GGGaggi", "2025-01-05", 28, "Abbinamento spaziale, super consigliato.");
INSERT INTO Valutazione VALUES ("Caprese", "GGGaggi", "2025-01-08", 30, "Ancora meglio dell'insalata pigra, valutate molto positivamente entrambe.");

-- PENDOLARE

-- IN SEDE

-- DAD


-- SUGGERIMENTO

INSERT INTO Suggerimento VALUES ("GGGaggi", "2025-01-10", "Non ho un piatto da consigliarvi, volevo solo dirvi che avete fatto un ottimo lavoro!");
