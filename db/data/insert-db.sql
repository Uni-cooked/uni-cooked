-- ********************************************************************
-- STARE ATTENTI ALLE PAROLE INGLESI, AGGIUNGERE LA LINGUA COME POSTFISSO (TIPO "hamburger_EN")
-- PSW E NOME DEGLI ACCOUNT SONO UGUALI
-- I NOMI DEGLI ACCOUNT NON HANNO SPAZI
-- FARE ATTENZIONE AI PROCEDIMENTI DELLE RICETTE, GLI APOSTROFI NON IN MONOSPACE E I PUNTI A FINE FRASE
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
INSERT INTO Utente VALUES ("Ombretto", "ombretto420@chiocciola.com", "05768cff5ca101d08cc4d96c3e4c256349d1bbd55658ec2d8b6df6fc8bcdd7f5", "2025-01-08", "23 anni\nUniPD psicologia\nHo una sorella che si chiama Ombretta, ai nostri genitori piaceva così tanto il nome che con me lo hanno mantenuto ma al maschile.", "fuorisede", NULL);
INSERT INTO Utente VALUES ("Ombretta", "ombretta@trisdombra.com", "bbd4f5c57bf40819a2a7295b5f7b7ae7e686cdbfcdcaef66f24ee7e8de4a4a31", "2025-01-02", "Ciao sono Ombretta, non so come io sia finita qui ma visto che le mie sorelle mi obbligano sempre a cucinare ho deciso di iscrivermi a questo servizio.\n", "pendolare", "user_profiles/Ombretta/Ombretta.png");
INSERT INTO Utente VALUES ("MasterMaurizio", "maurizio@salame.com", "464528fd22e94659a438dfe5db674580379b695db48b2cbe9c5763105fe77bac", "2025-01-31", "Insegnante di italiano delle elementari, Viva il salame.", "dad", "user_profiles/MasterMaurizio/MasterMaurizio.png");
INSERT INTO Utente VALUES ("Jay", "jay@pain.com", "346067b7ba670aec3a50c8a7bde31ed6b7c4a5adfb26a0ac6e6790602aaca1d2", "2025-01-01", "Cosa ne sai di rotolare giù nel profondo?\nQuando il tuo cervello si intorpidisce, puoi chiamarlo congelamento mentale\nQuando queste persone parlano troppo.", "fuorisede", "user_profiles/Jay/Jay.png");
INSERT INTO Utente VALUES ("Murphy", "murphy@marchiori.com", "346067b7ba670aec3a50c8a7bde31ed6b7c4a5adfb26a0ac6e6790602aaca1d2", "2024-03-12", "EhEh metti in salvo i tuoi bit altrimenti te li cambio.", "dad", "user_profiles/Murphy/Murphy.png");
INSERT INTO Utente VALUES ("Oca", "horca@loca.com", "346067b7ba670aec3a50c8a7bde31ed6b7c4a5adfb26a0ac6e6790602aaca1d2", "2025-01-12", "HORCA LOCA salve,\n Sono oca, mi piace molto mangiare e giudicare le persone che non sono al mio livello.", "in_sede", "user_profiles/Oca/Oca.png");
INSERT INTO Utente VALUES ("UgoFantozzi", "ugofantozzi@fozzaitalia.com", "b32993a4736c9b371503215352c3130c0e2946a810da08a2bf0f1b694e65d44a", "2025-01-13", "Sveglia e caffè... barba e bidè... presto che perdo il tram... Se il cartellino... non timbrerò...", "fuorisede", "user_profiles/UgoFantozzi/UgoFantozzi.png");
INSERT INTO Utente VALUES ("Tony","dinozzo@misteryreference.com","c5a8d95238cd3ee8c28a86b7ef8553a7c27ac016577c7717b52c69fa4f721b7f","2025-01-12", "Solo un semplice ex agente speciale...\nDi che agenzia? È un segreto... (triplo 7 su ogni cosa)","in_sede",NULL);

-- INGREDIENTE ====================================

INSERT INTO Ingrediente VALUES ("pasta");
INSERT INTO Ingrediente VALUES ("grana padano");
INSERT INTO Ingrediente VALUES ("panna da cucina");
INSERT INTO Ingrediente VALUES ("pancetta a cubetti");
INSERT INTO Ingrediente VALUES ("uova");
INSERT INTO Ingrediente VALUES ("pesto");
INSERT INTO Ingrediente VALUES ("vino bianco da cucina");
INSERT INTO Ingrediente VALUES ("cipolla");
INSERT INTO Ingrediente VALUES ("farina di semola");
INSERT INTO Ingrediente VALUES ("merluzzo");
INSERT INTO Ingrediente VALUES ("bresaola");
INSERT INTO Ingrediente VALUES ("rucola");
INSERT INTO Ingrediente VALUES ("salame");
INSERT INTO Ingrediente VALUES ("olio di girasole");
INSERT INTO Ingrediente VALUES ("olio");
INSERT INTO Ingrediente VALUES ("sale fino");
INSERT INTO Ingrediente VALUES ("sale grosso");
INSERT INTO Ingrediente VALUES ("pepe");
INSERT INTO Ingrediente VALUES ("cespo di insalata");
INSERT INTO Ingrediente VALUES ("pomodori da insalata");
INSERT INTO Ingrediente VALUES ("pane in cassetta");
INSERT INTO Ingrediente VALUES ("prosciutto cotto");
INSERT INTO Ingrediente VALUES ("maionese");
INSERT INTO Ingrediente VALUES ("mozzarella");
INSERT INTO Ingrediente VALUES ("origano");
INSERT INTO Ingrediente VALUES ("cotoletta impanata");
INSERT INTO Ingrediente VALUES ("pomodorini");
INSERT INTO Ingrediente VALUES ("pane");
INSERT INTO Ingrediente VALUES ("hamburger_EN");
INSERT INTO Ingrediente VALUES ("riso Basmati");
INSERT INTO Ingrediente VALUES ("riso Venere");
INSERT INTO Ingrediente VALUES ("petto di pollo");
INSERT INTO Ingrediente VALUES ("piselli");
INSERT INTO Ingrediente VALUES ("latte di cocco");
INSERT INTO Ingrediente VALUES ("curry_EN in polvere");
INSERT INTO Ingrediente VALUES ("burger_EN vegetale");
INSERT INTO Ingrediente VALUES ("spezie aromatiche");
INSERT INTO Ingrediente VALUES ("zucchine");
INSERT INTO Ingrediente VALUES ("carote");
INSERT INTO Ingrediente VALUES ("mais");
INSERT INTO Ingrediente VALUES ("couscous_EN");
INSERT INTO Ingrediente VALUES ("peperoni dolci");
INSERT INTO Ingrediente VALUES ("olive");
INSERT INTO Ingrediente VALUES ("albicocche secche");


-- RICETTA ====================================

-- FUORISEDE
INSERT INTO Ricetta VALUES ("Pasta-asciutta", "fuorisede", "primo", 0, 2, 
"Un piatto veloce e immediato proprio per lo studente che non ha né tempo né voglia di preparare un piatto completo. Essendo fuorisede e avendo magari un alloggio in affitto non si dispone del tempo e soldi per nemmeno accendere il fornello e aspettare che l'acqua inizi a bollire quindi perché non saltare tutti questi lunghi procedimenti. Questo piatto è ideale per un pranzo o cena leggera ma non troppo salutare, diciamocelo la salute arriva dopo lo studio.",
 "2025-01-09", "../asset/img/recipe/pendolare/pasta-asciutta.jpg");
 
INSERT INTO Ricetta VALUES ("Pane e salame", "fuorisede", "primo", 5, 4, 
"Un piatto che non è un vero e proprio piatto perché comunemente consumato come antipasto o per fare una merenda a metà giornata ma in questo caso devi ricordarti che sei uno studente e anche fuorisede, ci dispiace… non puoi farci nulla. È uno tra le pietanze più facili e veloci da preparare, l’unico lato negativo è il costo.",
 "2025-01-09", "../asset/img/recipe/pendolare/pane-triste.jpg");

INSERT INTO Ricetta VALUES ("Pasta panna e pancetta", "fuorisede", "primo", 15, 9, 
"Un piatto di pasta completo, ben condito e molto veloce da preparare, ottimo quindi per chi vuole un pranzo o una cena alternativa più sostanziosa.",
 "2025-01-09", "../asset/img/recipe/pendolare/pancilli.jpg");

INSERT INTO Ricetta VALUES ("Riso e uova fritte", "fuorisede", "primo", 15, 8, 
"Un piatto cubano molto famoso perché è sostanzioso, economico e veloce da preparare, ideale per gli studenti con poco tempo e budget. Anche se il procedimento può sembrare lungo, la preparazione è più semplice di quanto possa sembrare.",
 "2025-01-09", "../asset/img/recipe/pendolare/riso-uovo.jpg");

INSERT INTO Ricetta VALUES ("Frittatona", "fuorisede", "primo", 10, 5, 
"Ottimo piatto per quando si vuole guardare la nazionale di calcio italiana giocare (specialmente sabato 18 alle 20:25).\nCome disse un grande attore, per godersi appieno la partita bisogna avere: ''calze , mutande, vestaglione di flanella, tavolinetto di fronte al televisore frittatone di cipolle, familiare di peroni gelata, tifo indiavolato e rutto libero''\nPer rivivere l'esperienza, ti consigliamo di seguire queste indicazioni.",
 "2025-01-09", "../asset/img/recipe/pendolare/frittatona.jpg");

INSERT INTO Ricetta VALUES ("Rucola e bresaola", "fuorisede", "primo", 5, 10, 
" Piatto tipico di chi vuole spendere poco e desidera un pranzo o una cena leggera, veloce e genuina. Può essere servito anche come antipasto per stupire i tuoi amici.",
 "2025-01-09", "../asset/img/recipe/pendolare/breso.jpg");

INSERT INTO Ricetta VALUES ("Merluzzo in scaloppa", "fuorisede", "secondo", 15, 10, 
"Un gustosissimo piatto di pesce, alternativo alla solita carne che dopo un po' stufa, è ricco di Omega 3 e aiuta a studiare meglio. Anche se spesso un piatto di pesce è costoso, questa ricetta non ti farà spendere troppo.",
 "2025-01-09", "../asset/img/recipe/pendolare/merluzzo.jpg");

INSERT INTO Ricetta VALUES ("Pasta al pesto", "fuorisede", "primo", 10, 5, 
"La classica pasta dello studente fuori sede che non ha voglia di preparare un sugo fatto in casa e di deve quindi affidare ai sughi già pronti",
 "2025-01-09", "../asset/img/recipe/pendolare/pesto.jpg");


-- PENDOLARE
INSERT INTO Ricetta VALUES ("Insalata pigra", "pendolare", "secondo", 5, 3, "Hai dormito 5 ore per finire di studiare e, tornando dall'università, non hai voglia di prepararti da mangiare? Suvvia, non trascurare il pranzo, fatti un'insalata.", "2025-01-01", "../asset/img/recipe/pendolare/insalata-pigra.jpg");
INSERT INTO Ricetta VALUES ("Tramezzini prosciutto e maionese", "pendolare", "secondo", 5, 3, "TEOOOOOO", "2025-01-01", "../asset/img/recipe/pendolare/tramezzini.jpg");
INSERT INTO Ricetta VALUES ("Caprese", "pendolare", "secondo", 5, 5, "Piatto semplice, utile per giornate mhe.", "2025-01-01", "../asset/img/recipe/pendolare/caprese.jpg");
INSERT INTO Ricetta VALUES ("Cotoletta", "pendolare", "secondo", 10, 5, "Secondo veloce da preparare, muoviti che poi devi studiare!", "2025-01-01", "../asset/img/recipe/pendolare/cotoletta.jpg");
INSERT INTO Ricetta VALUES ("Hamburger_EN", "pendolare", "secondo", 20, 7, "Vi sentite un po' premium: questa ricetta è il massimo che un pendolare possa realizzare, il treno purtroppo non si lascia aspettare.", "2025-01-01", "../asset/img/recipe/pendolare/hamburger.jpg");
INSERT INTO Ricetta VALUES ("Panino con prosciutto e pomodoro", "pendolare", "secondo", 5, 3, "Ci risiamo, anche quest'anno la segreteria ha ben deciso di piazzare le uniche due lezioni del giorno una alle 8.30 e l'altra alle 16.30. Non preoccuparti, nemmeno noi vogliamo andare in mensa, per questo ti diciamo come sopravvivere a pranzo.", "2025-01-01", "../asset/img/recipe/pendolare/panino.jpg");

-- IN SEDE
INSERT INTO Ricetta VALUES ("Pollo al curry_EN con riso e piselli", "in_sede", "secondo", 40, 8, "Un piatto aromatico e completo che porta in tavola i sapori dell'Oriente. Il pollo, cucinato in una salsa cremosa al curry_EN e latte di cocco, si sposa perfettamente con il riso basmati che ne assorbe i profumi intensi e speziati. I piselli freschi aggiungono una nota dolce e un tocco di colore rendendo il piatto ancora più appetitoso. Perfetto per chi ama le spezie e desidera un piatto unico ricco di sapore e ben bilanciato.", "2025-01-01", "../asset/img/recipe/in-sede/pollo-curry.jpg");
INSERT INTO Ricetta VALUES ("Burger_EN vegetale con piselli", "in_sede", "secondo", 25, 5, "Non fare storie solo perché non c'è la ciccia, questo è un piatto saporito e bilanciato perfetto per chi desidera un'alternativa vegetale gustosa! Croccante fuori e tenero dentro, questo burger_EN è accompagnato da piselli al vapore leggermente conditi con un filo d'olio e un pizzico di sale per un accompagnamento delicato che esalta la freschezza del piatto.", "2025-01-01", "../asset/img/recipe/in-sede/burger-vegetale.jpg");
INSERT INTO Ricetta VALUES ("Riso e pollo", "in_sede", "primo", 30, 6, "Un classico piatto adatto ai palestrati, abbastanza triste quanto ricco di proteine e carboidrati ma un must per chi non vuole allenare solo la mente. Il riso offre un letto soffice per gli straccetti di pollo teneri e dorati insaporiti da spezie aromatiche. Un piatto semplice ma che ti riempie ad ogni boccone.", "2025-01-01", "../asset/img/recipe/in-sede/riso-pollo.jpg");
INSERT INTO Ricetta VALUES ("Riso Venere con verdure", "in_sede", "primo", 45, 7, "Un piatto leggero e colorato, che combina la ricchezza del riso Venere con la freschezza delle verdure. Il riso, dal caratteristico colore scuro e dal gusto intenso, viene cotto al dente e saltato con verdure fresche come zucchine e carote. Un piatto nutriente e bilanciato ideale per chi cerca un'opzione sana e saporita. Perfetto da gustare anche a temperatura ambiente quando si deve passare la pausa pranzo in aula.", "2025-01-01", "../asset/img/recipe/in-sede/riso-venere.jpg");
INSERT INTO Ricetta VALUES ("Couscous_EN con verdure", "in_sede", "primo", 30, 10, "Un piatto colorato e nutriente, perfetto per chi ama i sapori mediterranei e la cucina leggera. Questo couscous alle verdure è un'esplosione di freschezza e benessere, arricchito da una varietà di verdure come zucchine, peperoni, carote e pomodorini, che aggiungono dolcezza e croccantezza ad ogni boccone. Ideale anche a temperatura ambiente per chi deve trascorrere una giornata intera tra le aule dell'Uni si adatta a qualsiasi palato potendoci aggiungere o togliere qualsiasi contorno si voglia.","2025-01-01","../asset/img/recipe/in-sede/couscous-con-verdure.jpg");
-- DAD


-- PREFERENZA RICETTA ====================================

INSERT INTO Preferenza_Ricetta VALUES ("Insalata pigra", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Tramezzini prosciutto e maionese", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Caprese", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Cotoletta", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Hamburger_EN", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Pollo al curry_EN con riso e piselli", "GGGaggi");
INSERT INTO Preferenza_Ricetta VALUES ("Hamburger_EN", "JoeTrump");
INSERT INTO Preferenza_Ricetta VALUES ("Pollo al curry_EN con riso e piselli", "JoeTrump");
INSERT INTO Preferenza_Ricetta VALUES ("Couscous_EN con verdure","Tony");
INSERT INTO Preferenza_Ricetta VALUES ("Pane e salame","MasterMaurizio");
INSERT INTO Preferenza_Ricetta VALUES ("Pasta al pesto","MasterMaurizio");
INSERT INTO Preferenza_Ricetta VALUES ("Pasta-asciutta","Jay");
INSERT INTO Preferenza_Ricetta VALUES ("Riso e uova fritte","Jay");
INSERT INTO Preferenza_Ricetta VALUES ("Pasta al pesto","Murphy");
INSERT INTO Preferenza_Ricetta VALUES ("Pasta al pesto","Ombretta");
INSERT INTO Preferenza_Ricetta VALUES ("Frittatona","UgoFantozzi");
INSERT INTO Preferenza_Ricetta VALUES ("Frittatona","MasterMaurizio");
INSERT INTO Preferenza_Ricetta VALUES ("Merluzzo in scaloppa","Oca");
INSERT INTO Preferenza_Ricetta VALUES ("Rucola e bresaola","Oca");



-- UTILIZZO INGREDIENTE ====================================

-- FUORISEDE
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta-asciutta", "pasta", FALSE, 120, "g", "preferibilmente corta");

INSERT INTO Utilizzo_Ingrediente VALUES ("Pane e salame", "pane", FALSE, 1, "num_el", "quello in cassetta");
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta panna e pancetta", "pasta", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta panna e pancetta", "panna da cucina", FALSE, 40, "ml", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta panna e pancetta", "pancetta a cubetti", FALSE, 60, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta panna e pancetta", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e uova fritte", "riso Basmati", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e uova fritte", "uova", FALSE, 2, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e uova fritte", "olio di girasole", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e uova fritte", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e uova fritte", "pepe", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Frittatona", "uova", FALSE, 3, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Frittatona", "olio di girasole", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Frittatona", "cipolla", FALSE, 10, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Frittatona", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Frittatona", "pepe", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Rucola e bresaola", "rucola", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Rucola e bresaola", "bresaola", FALSE, 50, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Rucola e bresaola", "grana padano", TRUE, NULL, NULL, "preferibilmente a scaglie");
INSERT INTO Utilizzo_Ingrediente VALUES ("Rucola e bresaola", "pepe", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Rucola e bresaola", "olio", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "merluzzo", FALSE, 100, "g", "preferibilmente surgelato (costa meno)");
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "farina di semola", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "vino bianco da cucina", FALSE, 20, "ml", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "olio", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "pepe", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta al pesto", "pasta", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta al pesto", "pesto", FALSE, 60, "g", "preferibilmente gia` pronto");

-- PENDOLARE
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata pigra", "cespo di insalata", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata pigra", "pomodori da insalata", FALSE, 1, "num_el", "quelli grande");
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata pigra", "olio", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata pigra", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Tramezzini prosciutto e maionese", "pane in cassetta", FALSE, 1, "num_el", "morbido da tramezzino");
INSERT INTO Utilizzo_Ingrediente VALUES ("Tramezzini prosciutto e maionese", "prosciutto cotto", FALSE, 120, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Tramezzini prosciutto e maionese", "maionese", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Caprese", "pomodori da insalata", FALSE, 2, "num_el", "quelli grandi");
INSERT INTO Utilizzo_Ingrediente VALUES ("Caprese", "mozzarella", FALSE, 2, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Caprese", "origano", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "cotoletta impanata", FALSE, 1, "num_el", "pre-confezionata");
INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "pomodorini", FALSE, 10, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "olio", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Hamburger_EN", "pane", FALSE, 1, "num_el", "meglio se da hamburger_EN");
INSERT INTO Utilizzo_Ingrediente VALUES ("Hamburger_EN", "hamburger_EN", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Hamburger_EN", "olio", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Panino con prosciutto e pomodoro", "prosciutto cotto", FALSE, 35, "g", "o crudo se c'hai i soldi");
INSERT INTO Utilizzo_Ingrediente VALUES ("Panino con prosciutto e pomodoro", "pomodori da insalata", FALSE, 1, "num_el", "quelli grande");
INSERT INTO Utilizzo_Ingrediente VALUES ("Panino con prosciutto e pomodoro", "pane", FALSE, 1, "num_el", "meglio se da toast_EN");

-- IN SEDE
INSERT INTO Utilizzo_Ingrediente VALUES ("Pollo al curry_EN con riso e piselli", "riso Basmati", FALSE, 70, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pollo al curry_EN con riso e piselli", "petto di pollo", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pollo al curry_EN con riso e piselli", "piselli", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pollo al curry_EN con riso e piselli", "latte di cocco", FALSE, 70, "ml", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pollo al curry_EN con riso e piselli", "curry_EN in polvere", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pollo al curry_EN con riso e piselli", "sale grosso", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pollo al curry_EN con riso e piselli", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pollo al curry_EN con riso e piselli", "olio", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Burger_EN vegetale con piselli", "burger_EN vegetale", FALSE, 120, "g", "dipende da dove lo prendi");
INSERT INTO Utilizzo_Ingrediente VALUES ("Burger_EN vegetale con piselli", "piselli", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Burger_EN vegetale con piselli", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Burger_EN vegetale con piselli", "olio", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "riso Basmati", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "petto di pollo", FALSE, 120, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "spezie aromatiche", TRUE, NULL, NULL, "a piacere");
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "sale grosso", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "olio", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "riso Venere", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "zucchine", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "carote", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "mais", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "pomodorini", FALSE, 4, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "sale grosso", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "olio", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "couscous_EN", FALSE, 60, "g", "senza esagerare poiché si gonfia molto");
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "zucchine", FALSE, 40, "g", "una piccola");
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "carote", FALSE, 40, "g", "una piccola");
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "peperoni dolci", FALSE, 30, "g", "preferire quelli piccoli");
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "pomodorini", FALSE, 30, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "olive", FALSE, 15, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "albicocche secche", FALSE, 10, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "olio", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "sale fino", TRUE, NULL, NULL, NULL);

-- DAD


-- PREPARAZIONE ====================================

-- FUORISEDE
INSERT INTO Preparazione VALUES ("Pasta-asciutta", 1, "Prendi il pacco di pasta.");
INSERT INTO Preparazione VALUES ("Pasta-asciutta", 2, " Aprilo, sapendo che tra 2 giorni dovrai andare di nuovo al supermercato per comprare un altro pacco e spendere altri soldi, ma non piangere (ancora).");
INSERT INTO Preparazione VALUES ("Pasta-asciutta", 3, "Rovescia su un piatto la quantità di pasta che vorresti mangiare. Si consiglia di usare un piatto di plastica in modo da non sprecare il tempo sul lavaggio di stoviglie varie.");

INSERT INTO Preparazione VALUES ("Pane e salame", 1, "Prendi il pane e comincia ad affettarlo a fette grossolane, se invece hai preso quello in cassetta puoi riposare ancora per un po'.");
INSERT INTO Preparazione VALUES ("Pane e salame", 2, "Prendi il salame, spacchettarlo delicatamente e comincia a disporre le fette sul pane che hai davanti.");
INSERT INTO Preparazione VALUES ("Pane e salame", 3, "Se vuoi immedesimarti in un signore d'alto borgo prendi un tagliere e disponici i pezzi di pane farciti.");

INSERT INTO Preparazione VALUES ("Pasta panna e pancetta", 1, "Prendi una pentola riempila d'acqua e mettila a bollire su un fornello.");
INSERT INTO Preparazione VALUES ("Pasta panna e pancetta", 2, "Mentre aspetti tira fuori una pentola piccola e comincia ad abbrustolire 80 grammi di pancettta.");
INSERT INTO Preparazione VALUES ("Pasta panna e pancetta", 3, "Non appena vedi che l'acqua versa del sale e rovescia la pasta al suo interno. Se non hai pesato la pasta perché non hai una bilancia ti consigliamo di usare la tecnica del pugno, consiste di afferrare una quantità arbitraria di pasta con appunto un pugno e gettarla in acqua senza farsi troppe domande.");
INSERT INTO Preparazione VALUES ("Pasta panna e pancetta", 4, "Spegni il fuoco del pentolino contenente la pancetta, in modo tale da non bruciarla, prendi la panna, aprila e mettine una quantità a tuo piacimento nel pentolino.");
INSERT INTO Preparazione VALUES ("Pasta panna e pancetta", 5, "Una volta che la pasta é pronta scolala, mettila nel pentolino.");
INSERT INTO Preparazione VALUES ("Pasta panna e pancetta", 6, "Amalgama il il tutto con un cucchiaio.");
INSERT INTO Preparazione VALUES ("Pasta panna e pancetta", 7, "Servi su un piatto se vuoi sporcare altre stoviglie, altrimenti ti consigliamo di mangiare direttamente dal pentolino.");

INSERT INTO Preparazione VALUES ("Riso e uova fritte", 1, "Prendi un pentolino per la pasta e versaci 100 grammi di riso. Se non hai una bilancia 100 grammi equivalgono a due terzi di un normale bicchiere");
INSERT INTO Preparazione VALUES ("Riso e uova fritte", 2, "Sciacqua il riso sotto l'acqua corrente.");
INSERT INTO Preparazione VALUES ("Riso e uova fritte", 3, "Riempi d'acqua il pentolino ad un livello leggermente più alto rispetto al livello del riso.");
INSERT INTO Preparazione VALUES ("Riso e uova fritte", 4, "Accendi il fornello a livello medio e metti il riso a cuocere.");
INSERT INTO Preparazione VALUES ("Riso e uova fritte", 5, "Non appena l'acqua inizia a bollire metti il fornello al minimo e copri parzialmente il pentolino ricordandoti di mescolare ogni tanto per evitare che il riso si attacchi.");
INSERT INTO Preparazione VALUES ("Riso e uova fritte", 6, "Prendi una pentola mettici un po' d'olio di girasole.");
INSERT INTO Preparazione VALUES ("Riso e uova fritte", 7, "Quando l'olio è abbastanza caldo rompi 1 o 2 uova e buttale dentro a friggere.");
INSERT INTO Preparazione VALUES ("Riso e uova fritte", 8, "Quando il tuorlo è della consistenza da te desiderata spegni il fornello.");
INSERT INTO Preparazione VALUES ("Riso e uova fritte", 9, "Nel mentre il riso dovrebbe essere rimasto privo di acqua, se è questo il caso spegni anche quel fornello.");
INSERT INTO Preparazione VALUES ("Riso e uova fritte", 10, "Prendi quindi un piatto e mettici il riso e sopra stendi con molta cura le tue uova fritte.");

INSERT INTO Preparazione VALUES ("Frittatona", 1, "Prendi una pentola di grandezza media aggiungi un pò olio per evitare che la frittata si attacchi alla pentola.");
INSERT INTO Preparazione VALUES ("Frittatona", 2, "Prendi una scodella, apri e metti le 3 uova al suo interno e aggiungi del sale a pepe quanto basta.");
INSERT INTO Preparazione VALUES ("Frittatona", 3, "Taglia la cipolla a tuo piacimento anche se noi consigliamo di tagliarla a fettine piccole e sottili.");
INSERT INTO Preparazione VALUES ("Frittatona", 4, "Aggiungi la cipolla alla scodella e con una forchetta comincia ad amalgamare il tutto.");
INSERT INTO Preparazione VALUES ("Frittatona", 5, "Quando l'olio inizia a sfrigolare metti in pentola il contenuto della scodella e abbassa il fuoco.");
INSERT INTO Preparazione VALUES ("Frittatona", 6, "Dopo 3 minuti circa, cerca di capovolgerla utilizzando una forchetta o altrimenti di una spatola se ne hai una.");
INSERT INTO Preparazione VALUES ("Frittatona", 7, "Altri dopo 3 minuti spegni il fuoco e servi su un piatto piano");

INSERT INTO Preparazione VALUES ("Rucola e bresaola", 1, "Prendi un piatto piano e comincia a stendere delicatamente le fette di bresaola.\nSe non vuoi usare le mani sudice aiutati con una forchetta.");
INSERT INTO Preparazione VALUES ("Rucola e bresaola", 2, "Apri il sacco di rucola e cospargila sopra la bresaola.");
INSERT INTO Preparazione VALUES ("Rucola e bresaola", 3, "Aggiungi le scaglie di grana, pepe e un filo d'olio.");

INSERT INTO Preparazione VALUES ("Merluzzo in scaloppa", 1, "Prendi un piatto piano e mettici sopra della farina.");
INSERT INTO Preparazione VALUES ("Merluzzo in scaloppa", 2, "A uno ad uno impana i filetti di merluzzo nel piatto preparato precedentemente.");
INSERT INTO Preparazione VALUES ("Merluzzo in scaloppa", 3, "Prendi una padella, mettici dell'olio e aspetta che diventi caldo senza che inizi a friggere");
INSERT INTO Preparazione VALUES ("Merluzzo in scaloppa", 4, "Prendi i tuoi filetti impanati e mettili in pentola e abbassando di conseguenza il fuoco.");
INSERT INTO Preparazione VALUES ("Merluzzo in scaloppa", 5, "Aggiungi pepe e sale quanto basta.");
INSERT INTO Preparazione VALUES ("Merluzzo in scaloppa", 6, "Ogni 3 o 4 minuti ricordati di girare i filetti in modo da avere una cottura perfetta da entrambi i lati.");
INSERT INTO Preparazione VALUES ("Merluzzo in scaloppa", 7, "Non appena vedi che il filetto é cotto spegni il fuoco e impiatta.");

INSERT INTO Preparazione VALUES ("Pasta al pesto", 1, "Prendi una pentola riempila d'acqua e mettila a bollire su un fornello.");
INSERT INTO Preparazione VALUES ("Pasta al pesto", 2, "Non appena vedi che l'acqua versa del sale e rovescia la pasta al suo interno. Se non hai pesato la pasta perché non hai una bilancia ti consigliamo di usare la tecnica del pugno, consiste di afferrare una quantità arbitraria di pasta con appunto un pugno e gettarla in acqua senza farsi troppe domande.");
INSERT INTO Preparazione VALUES ("Pasta al pesto", 3, "Una volta che la pasta é pronta scolala e mettila in un piatto fondo.");
INSERT INTO Preparazione VALUES ("Pasta al pesto", 4, "Apri il barattolo contenente e condisci la tua pasta prendendo 2/3 cucchiaiate di sugo al pesto.");

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
INSERT INTO Preparazione VALUES ("Hamburger_EN", 2, "Prendi dal frigo l'hamburger_EN e togli eventuali rivestimenti che coprono la carne.");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 3, "Poni la carne sulla padella avendo cura di non schizzarti con l'olio caldo (sono dolori, dico per esperienza). La carne deve cuocere per un massimo 10 minuti, facendola girare ogni 2/3 per fare in modo si cuocia uniformemente.");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 4, "Mentre aspetti qualche minuto per girare la carne, prendi il pane e taglialo a metà. Cerca quindi il tostapane se ce l'hai e usalo per scaldare il pane appena tagliato.");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 5, "Passati i 10 minuti spegni il fuoco e contolla che la carne al suo interno sia ben cotta. Prendi quindi un piatto, poggiaci una fetta di pane caldo, poni in mezzo l'hamburger_EN e quindi chiudi con la seconda fetta: l'hamburger_EN è pronto, buon appetito!");

INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 1, "Se possiedi un tostapane è ora di usarlo, prendilo e attaccalo alla corrente.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 2, "Dopo aver accuratamente controllato di non esserti slogato la spalla, prendi le due fette di pane da toast_EN e inseriscile dentro il tostapane. Accendi quindi il tostapane e lascia che il pane scaldi.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 3, "Nel frattempo prendi il pomodoro e lavalo sotto l'acqua corrente per togliere residui di pesticidi e/o altro materiale dannoso.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 4, "Prendi un tagliere e poggiaci sopra il pomodoro lavato e profumato. Taglia quindi quattro fette di pomodoro e metti la parte avanzata in frigo.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 5, "Prendi una fetta di pane caldo, poggia due fette di pomodoro, il prosciutto e quindi le rimanenti due fette di pomodoro. Chiudi con l'altra fetta di pane.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 6, "Il tuo panino è pronto, buon appetito!");

-- IN SEDE
INSERT INTO Preparazione VALUES ("Pollo al curry_EN con riso e piselli", 1, "Metti l'acqua a bollire per il riso in una pentola. Una volta che fa le bolle versa del sale grosso e poi il riso, abbassa il fuoco a medio-alto e cucina per il tempo indicato sulla confezione.");
INSERT INTO Preparazione VALUES ("Pollo al curry_EN con riso e piselli", 2, "Nel mentre metti i piselli in un pentolino, versa un po' di acqua per cuocerli ma non annegarli, un pizzico di sale fino e un goccio d'olio. Accendi il fuoco medio-basso e cucina per 12 minuti col coperchio (assaggia e regolati in base al gusto e alla consistenza).");
INSERT INTO Preparazione VALUES ("Pollo al curry_EN con riso e piselli", 3, "Taglia i petti di pollo a straccetti, mettili in una padella con un filo d'olio giusto per non farli troppo attaccare e accendi il fuoco medio-basso. Cospargili di curry_EN abbondando pure ché poi verrà diluito. Dopo circa 7 minuti, giusto un po' prima di quando sembrano cotti, aggiungi il latte di cocco e se ti sembra poco giallo aggiungi del curry_EN (non è mai troppo). Spegni il fuoco e mescola un po' così da non formare grumi con la polvere del curry_EN.");
INSERT INTO Preparazione VALUES ("Pollo al curry_EN con riso e piselli", 4, "Prendi un bel piatto e componi il tutto tenendo ben separati il riso, i piselli e il pollo. Contempla questa opera culinaria e mescola tutto in modo da creare un marasma di colori così da assaporare sempre tutti i gusti ad ogni boccone. Non dimenticarti di versare tutto il latte di cocco in modo da amalgamare ancora meglio gli ingredienti.");

INSERT INTO Preparazione VALUES ("Burger_EN vegetale con piselli", 1, "Metti i piselli in un pentolino con un filo d'olio e un pizzico di sale fino.");
INSERT INTO Preparazione VALUES ("Burger_EN vegetale con piselli", 2, "Riempi il pentolino di acqua fino a coprire per metà i piselli a meno che tu non li voglia annacquati, cucina per circa 15 minuti a fuoco medio e chiudi con un coperchi. Consigliamo di assaggiare ogni tanto per controllare la salatura e la cottura, se invece vuoi andare a sensazione come quegli esercizi che non ti vengono fai pure.");
INSERT INTO Preparazione VALUES ("Burger_EN vegetale con piselli", 3, "Metti un goccio d'olio su una padella così sarà più facile lavarla e cucina il burger_EN a fuoco medio per il tempo indicato sulla confezione. Gira spesso il burger_EN per non farlo attaccare e per avere una cottura uniforme.");
INSERT INTO Preparazione VALUES ("Burger_EN vegetale con piselli", 4, "Una volta cotto il burger_EN e i piselli metti tutto su un piatto e assapora il gusto della finta ciccia che a noi amanti della carne fa ancora strano. Se te lo vuoi portare a lezione e non sei attrezzato come uno scout ti consigliamo di tagliarlo a pezzi a casa così sarà più facile da mangiare.");

INSERT INTO Preparazione VALUES ("Riso e pollo", 1, "Metti l'acqua a bollire, dopodiché aggiungi il sale grosso e il riso. Cucina a fuoco medio-alto per il tempo indicato sulla confezione ricordandoti di mescolare ogni tanto.");
INSERT INTO Preparazione VALUES ("Riso e pollo", 2, "Taglia i petti di pollo a straccetti, mettili in una padella con un pizzico di sale e delle spezie a piacere. Cucina a fuoco medio per 10-12 minuti girandoli ogni tanto per non farli attaccare.");
INSERT INTO Preparazione VALUES ("Riso e pollo", 3, "Una volta cotto il riso e il pollo mischiali in un piatto con un filo d'olio per amalgamare il tutto.");

INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 1, "Riempi una pentola di acqua e falla bollire, poi butta del sale grosso e il riso. Cuoci a fuoco medio-alto per il tempo indicato sulla confezione mescolando ogni tanto.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 2, "Nel mentre pela la carota e tagliala e striscioline, mettile in padella con un filo d'olio, un po' di acqua e un pizzico di sale fino. Accendi il fuoco basso e copri con un coperchio, le carote ci mettono un pochino di più a cucinarsi.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 3, "Senza perdere tempo che per noi studenti è prezioso lava la zucchina e tagliala a rondelle o pezzetti piccoli (fa' un po' come te pare). Aggiungila alle carote nella padella con un pizzico di sale. Ogni tanto girale e aggiungi un po' d'acqua se vedi che è evaporata per non farle attaccare alla padella. Cucina a fuoco medio-basso per circa 8-10 minuti.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 4, "Occhio al riso.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 5, "Lava i pomodorini e tagliali a piccoli spicchi.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 6, "Se pensi di riuscire a finire tutto questo bel piattone apri anche una scatola di mais e scolala così da avere tutto pronto sul tavolo.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 7, "Quando il riso, le zucchine e le carote sono pronte versa tutto in un piatto insieme ai pomodorini e il mais. Condisci con un filo d'olio e assapora il gusto di chi può permettersi certe prelibatezze.");

INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 1, "Pela e taglia la carota a rondelle sottili o piccoli spicchi, mettili in una padella abbastanza grande che possa contenere tutti gli ingredienti e versa un filo d'olio.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 2, "Lava i peperoni dolci, aprili con un coltello, togli i semi e tagliali a striscioline. Aggiungili nella padella con un goccio d'acqua e un pizzico di sale, ora puoi accendere il fuoco basso e chiudere con un coperchio.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 3, "Lava la zucchina e tagliala a piccoli spicchi (tanto per cambiare). Aggiungila alle altre verdure in cottura e girale ogni tanto così da non farle attaccare. Se l'acqua è evaporata aggiungine un goccio. Cucinale per 10 minuti ma assaggia ogni tanto mi raccomando, sempre assaggiare!");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 4, "Taglia a pezzetti le albicocche secche e mettile in mezzo bicchiere d'acqua così da reidratarle un pochino e renderle più morbide. Daranno quel tocco dolce e fresco al piatto che non hai idea.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 5, "Lava e taglia a spicchi i pomodorini");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 6, "Taglia a metà le olive giusto per dare l'impressione di averne di più, se non hai voglia lascia stare tanto il sapore è uguale.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 7, "Una volta pronte le verdure versa un bicchiere d'acqua nella padella, poi il couscous, i pomodorini, le albicocche e le olive (spero la padella fosse abbastanza grande). Mescola bene e spegni il fuoco così da lasciar riposare il couscous.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 8, "Ora potrai andare a lezione sfoggiando un piatto saporito e pieno di colori alla faccia dei tuoi compagni che si portano la solita pasta in bianco e dei grissini per pranzo.");

-- DAD


-- VALUTAZIONE ====================================

-- FUORISEDE
INSERT INTO Valutazione VALUES ("Rucola e bresaola", "Ombretta", "2025-01-05", 28, "Wow, buonissimo devo consigliarlo alle mie sorelle");
INSERT INTO Valutazione VALUES ("Pane e salame", "MasterMaurizio", "2025-02-02", 30, "Ragazzi complimenti, una delle ricette che piú apprezzo. Forza pane e salame");
INSERT INTO Valutazione VALUES ("Pasta-asciutta", "Jay", "2025-01-05", 24, "Non ho tempo per descrivere questa ricetta dó e vado a studiare");
INSERT INTO Valutazione VALUES ("Insalata pigra", "Murphy", "2025-01-05", 28, "Abbinamento spaziale, super consigliato.");
INSERT INTO Valutazione VALUES ("Riso e uova fritte", "Oca", "2025-01-05", 14, "Piatto povero di gusti, emozioni e non molto salutare quindi non si merita nemmeno la sufficienza");
INSERT INTO Valutazione VALUES ("Frittatona", "UgoFantozzi", "2025-01-05", 29, "Buonissima, soprattutto accompagnata da una Peroni gelata");


-- PENDOLARE
INSERT INTO Valutazione VALUES ("Insalata pigra", "GGGaggi", "2025-01-05", 28, "Abbinamento spaziale, super consigliato.");
INSERT INTO Valutazione VALUES ("Insalata pigra", "OmbrettaGatti", "2025-01-12", 26, "Concordo con GGGaggi, piatto leggero (si vede che siamo sulla stessa onda).");
INSERT INTO Valutazione VALUES ("Caprese", "GGGaggi", "2025-01-08", 30, "Ancora meglio dell'insalata pigra, valutate molto positivamente entrambe.");
INSERT INTO Valutazione VALUES ("Caprese", "JoeTrump", "2025-01-06", 12, "Piatto senza CARNE? unacceptable");
INSERT INTO Valutazione VALUES ("Hamburger_EN", "JoeTrump", "2025-01-12", 30, "Wonderful! finalmente un piatto come si deve della mia nazione");

-- IN SEDE
INSERT INTO Valutazione VALUES ("Pollo al curry_EN con riso e piselli", "JoeTrump", "2025-01-11", 30, "Pazzesco!!!!");
INSERT INTO Valutazione VALUES ("Burger_EN vegetale con piselli", "OmbrettaGatti", "2025-01-14", 24, "Mi piace che non si pensi solo alla carne, cambierei l'accostamento coi piselli però.");
INSERT INTO Valutazione VALUES ("Burger_EN vegetale con piselli", "GGGaggi", "2025-01-15", 25, "Concordo con Ombretta, comunque molto buono e facile da preparare.");


INSERT INTO Valutazione VALUES ("Couscous_EN con verdure", "Tony", "2025-01-12", 30, "Mai assaggiato piatto migliore!");

-- DAD


-- SUGGERIMENTO ====================================

INSERT INTO Suggerimento(utente,data,testo) VALUES ("GGGaggi", "2025-01-10", "Non ho un piatto da consigliarvi, volevo solo dirvi che avete fatto un ottimo lavoro!");
INSERT INTO Suggerimento(utente,data,testo) VALUES ("MasterMaurizio", "2025-02-03", "Un piatto che vorrei assolutamente vedere nel vostro ricettario e` il platano fritto. Molto veloce da fare e ottimo per lo studente fuorisede");
