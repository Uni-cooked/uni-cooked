-- ********************************************************************
-- STARE ATTENTI ALLE PAROLE INGLESI, AGGIUNGERE LA LINGUA COME POSTFISSO (TIPO "hamburger_EN")
-- PSW E NOME DEGLI ACCOUNT SONO UGUALI
-- I NOMI DEGLI ACCOUNT NON HANNO SPAZI
-- FARE ATTENZIONE AI PROCEDIMENTI DELLE RICETTE, GLI APOSTROFI NON IN MONOSPACE E I PUNTI A FINE FRASE
-- FARE ATTENZIONE QUANDO SI AGGIUNGE UN INGREDIENTE, CERCARE DI NON AGGIUNGERE DUPLICATI
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
INSERT INTO Utente VALUES ("Perry","perry@agente.segretissimo","7e084d72f2939831570186b0ca6cb0c54a3e6b8b8b84964a0fadd2d7ff57351a","2025-01-09", "prrrr","dad",NULL);

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
INSERT INTO Ingrediente VALUES ("olio d'oliva");
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
INSERT INTO Ingrediente VALUES ("sfilacci di cavallo");
INSERT INTO Ingrediente VALUES ("gamberetti");
INSERT INTO Ingrediente VALUES ("basilico");
INSERT INTO Ingrediente VALUES ("salmone");
INSERT INTO Ingrediente VALUES ("costa di sedano");
INSERT INTO Ingrediente VALUES ("rametto di rosmarino");
INSERT INTO Ingrediente VALUES ("pecorino");
INSERT INTO Ingrediente VALUES ("prezzemolo");
INSERT INTO Ingrediente VALUES ("patate");
INSERT INTO Ingrediente VALUES ("confezione noodles");
INSERT INTO Ingrediente VALUES ("limone");
INSERT INTO Ingrediente VALUES ("aglio");
INSERT INTO Ingrediente VALUES ("tonno");
INSERT INTO Ingrediente VALUES ("caciotta");
INSERT INTO Ingrediente VALUES ("fesa di vitello");
INSERT INTO Ingrediente VALUES ("farina 00");
INSERT INTO Ingrediente VALUES ("burro");


-- RICETTA ====================================

-- FUORISEDE
INSERT INTO Ricetta VALUES ("Pasta-asciutta", "fuorisede", "primo", 0, 2, 
"Un piatto veloce e immediato proprio per lo studente che non ha né tempo né voglia di preparare un piatto completo. Essendo fuorisede e avendo magari un alloggio in affitto non si dispone del tempo e soldi per nemmeno accendere il fornello e aspettare che l'acqua inizi a bollire quindi perché non saltare tutti questi lunghi procedimenti. Questo piatto è ideale per un pranzo o cena leggera ma non troppo salutare, diciamocelo la salute arriva dopo lo studio.",
 "2025-01-09", "./asset/img/recipe/fuorisede/pasta-asciutta.jpg");
 
INSERT INTO Ricetta VALUES ("Pane e salame", "fuorisede", "primo", 5, 4, 
"Un piatto che non è un vero e proprio piatto perché comunemente consumato come antipasto o per fare una merenda a metà giornata ma in questo caso devi ricordarti che sei uno studente e anche fuorisede, ci dispiace… non puoi farci nulla. È uno tra le pietanze più facili e veloci da preparare, l’unico lato negativo è il costo.",
 "2025-01-09", "./asset/img/recipe/fuorisede/pane-triste.jpg");

INSERT INTO Ricetta VALUES ("Pasta panna e pancetta", "fuorisede", "primo", 15, 9, 
"Un piatto di pasta completo, ben condito e molto veloce da preparare, ottimo quindi per chi vuole un pranzo o una cena alternativa più sostanziosa.",
 "2025-01-09", "./asset/img/recipe/fuorisede/pancilli.jpg");

INSERT INTO Ricetta VALUES ("Riso e uova fritte", "fuorisede", "primo", 15, 8, 
"Un piatto cubano molto famoso perché è sostanzioso, economico e veloce da preparare, ideale per gli studenti con poco tempo e budget. Anche se il procedimento può sembrare lungo, la preparazione è più semplice di quanto possa sembrare.",
 "2025-01-09", "./asset/img/recipe/fuorisede/riso-uovo.jpg");

INSERT INTO Ricetta VALUES ("Frittatona", "fuorisede", "primo", 10, 5, 
"Ottimo piatto per quando si vuole guardare la nazionale di calcio italiana giocare (specialmente sabato 18 alle 20:25).\nCome disse un grande attore, per godersi appieno la partita bisogna avere: ''calze , mutande, vestaglione di flanella, tavolinetto di fronte al televisore frittatone di cipolle, familiare di peroni gelata, tifo indiavolato e rutto libero''\nPer rivivere l'esperienza, ti consigliamo di seguire queste indicazioni.",
 "2025-01-09", "./asset/img/recipe/fuorisede/frittatona.jpg");

INSERT INTO Ricetta VALUES ("Rucola e bresaola", "fuorisede", "primo", 5, 10, 
" Piatto tipico di chi vuole spendere poco e desidera un pranzo o una cena leggera, veloce e genuina. Può essere servito anche come antipasto per stupire i tuoi amici.",
 "2025-01-09", "./asset/img/recipe/fuorisede/breso.jpg");

INSERT INTO Ricetta VALUES ("Merluzzo in scaloppa", "fuorisede", "secondo", 15, 10, 
"Un gustosissimo piatto di pesce, alternativo alla solita carne che dopo un po' stufa, è ricco di Omega 3 e aiuta a studiare meglio. Anche se spesso un piatto di pesce è costoso, questa ricetta non ti farà spendere troppo.",
 "2025-01-09", "./asset/img/recipe/fuorisede/merluzzo.jpg");

INSERT INTO Ricetta VALUES ("Pasta al pesto", "fuorisede", "primo", 10, 5, 
"La classica pasta dello studente fuori sede che non ha voglia di preparare un sugo fatto in casa e di deve quindi affidare ai sughi già pronti",
 "2025-01-09", "./asset/img/recipe/fuorisede/pesto.jpg");

-- PENDOLARE
INSERT INTO Ricetta VALUES ("Insalata veloce", "pendolare", "secondo", 5, 3, "Com'è dura la vita del pendolare: vai a lezione, torni a casa dopo l'ennesimo ritardo dei treni, pranzi, studi e vai a riscuotere le tue cinque ore di sonno guadagnate. Al mattino però ti ricordi che avrai lezione anche al pomeriggio e che la sera prima dovevi prepararti il pranzo: cosa puoi fare? Non preoccuparti, con la nostra \"Insalata veloce\" anche il più fiero degli studenti in sede sarà invidioso della semplicità e gustosità che l'insalata unita al succoso pomodoro sa dare!", "2025-01-01", "./asset/img/recipe/pendolare/insalata-veloce.jpg");
INSERT INTO Ricetta VALUES ("Tramezzini prosciutto e maionese", "pendolare", "secondo", 5, 6, "Stai per arrivare a casa dall'Università in (ovviamente) ritardo causa treno? Vuoi però consolarti preparandoti un buon pranzetto? UNI <span lang=\"en\">COOKED</span> ha quello che fa per te? Prepara i nostri fantastici Tramezzini prosciutto e maionese e vedrai che sarai stupito dalla loro bontà!", "2025-01-01", "./asset/img/recipe/pendolare/tramezzini.jpg");
INSERT INTO Ricetta VALUES ("Caprese", "pendolare", "secondo", 5, 5, "La Caprese, il tipico piatto semplice negli ingredienti ma ricco nel gusto... Rendi invidiosi i tuoi amici che abitano in sede e sono impegnati nella preparazione di complessi piatti a loro detta sopraffini con la rapidità e la gustosità che solo la Caprese può offrire. Adatta ad ogni occasione, prepara pomodori, mozzarelle e origano: è ora di mettere alla prova il cuoco che è in te!", "2025-01-01", "./asset/img/recipe/pendolare/caprese.jpg");
INSERT INTO Ricetta VALUES ("Cotoletta", "pendolare", "secondo", 10, 5, "Ti stai preparando per la sessione e devi studiare anche la sera? Cerchi un piatto facile da preparare e che sia pronto in fretta? Non temere, la tua ricerca è terminata: ti presentiamo il miglior amico delle cene veloci, la Cotoletta! Un piatto semplice e veloce che saprà stupirti per la sua gustosità, specie se accompagnato da pomodorini di contorno... Ai fornelli!", "2025-01-01", "./asset/img/recipe/pendolare/cotoletta.jpg");
INSERT INTO Ricetta VALUES ("Hamburger_EN", "pendolare", "secondo", 15, 7, "Sei alla ricerca di una ricetta per festeggiare l'esito di un esame appena ricevuto? Stavi cercando di prendere qualcosa a domicilio ma ti sei ricordato che tra due ore hai un treno da prendere? Non preoccuparti, ci siamo qua noi! Ti presentiamo la ricetta perfetta per i pendolari che hanno voglia di festeggiare: l'<span lang=\"en\">Hamburger</span>: vedrai che esplosione di sapore con la nostra ricetta!", "2025-01-01", "./asset/img/recipe/pendolare/hamburger.jpg");
INSERT INTO Ricetta VALUES ("Panino con prosciutto e pomodoro", "pendolare", "secondo", 5, 3, "
Ci risiamo, anche quest'anno la segreteria ha deciso di mettere le uniche due lezioni del giorno una alle 8.30 e l'altra alle 16.30...
Non preoccuparti, non sei costretto ad andare in mensa: segui questi passaggi per realizzare un ottimo panino con prosciutto e pomodoro! Vedrai che ti saprà dare le giuste energie per arrivare alla seconda lezione con il suo gusto sopraffino!", "2025-01-01", "./asset/img/recipe/pendolare/panino.jpg");

-- IN SEDE
INSERT INTO Ricetta VALUES ("Pollo al curry_EN con riso e piselli", "in_sede", "secondo", 40, 8, "Un piatto aromatico e completo che porta in tavola i sapori dell'Oriente. Il pollo, cucinato in una salsa cremosa al curry_EN e latte di cocco, si sposa perfettamente con il riso basmati che ne assorbe i profumi intensi e speziati. I piselli freschi aggiungono una nota dolce e un tocco di colore rendendo il piatto ancora più appetitoso. Perfetto per chi ama le spezie e desidera un piatto unico ricco di sapore e ben bilanciato.", "2025-01-01", "./asset/img/recipe/in-sede/pollo-curry.jpg");
INSERT INTO Ricetta VALUES ("Burger_EN vegetale con piselli", "in_sede", "secondo", 25, 5, "Non fare storie solo perché non c'è la ciccia, questo è un piatto saporito e bilanciato perfetto per chi desidera un'alternativa vegetale gustosa! Croccante fuori e tenero dentro, questo burger_EN è accompagnato da piselli al vapore leggermente conditi con un filo d'olio d'oliva e un pizzico di sale per un accompagnamento delicato che esalta la freschezza del piatto.", "2025-01-01", "./asset/img/recipe/in-sede/burger-vegetale.jpg");
INSERT INTO Ricetta VALUES ("Riso e pollo", "in_sede", "primo", 30, 6, "Un classico piatto adatto ai palestrati, abbastanza triste quanto ricco di proteine e carboidrati ma un must per chi non vuole allenare solo la mente. Il riso offre un letto soffice per gli straccetti di pollo teneri e dorati insaporiti da spezie aromatiche. Un piatto semplice ma che ti riempie ad ogni boccone.", "2025-01-01", "./asset/img/recipe/in-sede/riso-pollo.jpg");
INSERT INTO Ricetta VALUES ("Riso Venere con verdure", "in_sede", "primo", 45, 7, "Un piatto leggero e colorato, che combina la ricchezza del riso Venere con la freschezza delle verdure. Il riso, dal caratteristico colore scuro e dal gusto intenso, viene cotto al dente e saltato con verdure fresche come zucchine e carote. Un piatto nutriente e bilanciato ideale per chi cerca un'opzione sana e saporita. Perfetto da gustare anche a temperatura ambiente quando si deve passare la pausa pranzo in aula.", "2025-01-01", "./asset/img/recipe/in-sede/riso-venere.jpg");
INSERT INTO Ricetta VALUES ("Couscous_EN con verdure", "in_sede", "primo", 30, 10, "Un piatto colorato e nutriente, perfetto per chi ama i sapori mediterranei e la cucina leggera. Questo couscous alle verdure è un'esplosione di freschezza e benessere, arricchito da una varietà di verdure come zucchine, peperoni, carote e pomodorini, che aggiungono dolcezza e croccantezza ad ogni boccone. Ideale anche a temperatura ambiente per chi deve trascorrere una giornata intera tra le aule dell'Uni si adatta a qualsiasi palato potendoci aggiungere o togliere qualsiasi contorno si voglia.","2025-01-01","./asset/img/recipe/in-sede/couscous.jpg");
INSERT INTO Ricetta VALUES ("Pasta sfilacci e pomodorini", "in_sede", "primo", 20, 8, "Un piatto dal sapore deciso, la pasta con sfilacci di cavallo e pomodorini è perfetta per chi ama gusti robusti ma equilibrati. Gli sfilacci di cavallo, teneri e saporiti, si combinano perfettamente con la dolcezza dei pomodorini freschi, creando un contrasto irresistibile. Un primo piatto ottimo per la fine del secondo semestre quando il caldo e l'ansia per gli esami si fanno sentire.","2025-01-01","./asset/img/recipe/in-sede/pasta-sfilacci-pomodorini.jpg");
INSERT INTO Ricetta VALUES ("Pasta zucchine e gamberetti", "in_sede", "primo", 35, 8, "Un piatto raffinato e leggero, perfetto per chi cerca una miscela di sapori freschi e delicati. Le zucchine incontrano la dolcezza dei gamberetti, creando un equilibrio armonioso, il tutto avvolto da una spolverata di prezzemolo fresco per esaltare i sapori del mare. Questa pasta è ideale per chi vuole unire semplicità e gusto, senza però spendere un occhio della testa!", "2025-01-01", "./asset/img/recipe/in-sede/pasta-zucchine-gamberetti.jpg");
INSERT INTO Ricetta VALUES ("Pasta zucchine e salmone", "in_sede", "primo", 15, 7, "Un piatto gustoso e bilanciato che unisce la cremosità delle zucchine con la delicatezza del salmone. Perfetto per chi cerca un pasto nutriente e saporito, questa combinazione di ingredienti offre un tocco di freschezza e raffinatezza. Le zucchine unite al salmone creano un mix di sapori che si fondono ad ogni boccone. Ideale per un pranzo leggero o per una cena veloce ma senza risparmiare sul gusto.", "2025-01-01", "./asset/img/recipe/in-sede/pasta-zucchine-salmone.jpg");

-- DAD
INSERT INTO Ricetta VALUES ("Arista di maiale", "dad", "secondo", 70, 10, "Un ottimo secondo piatto ricco di ciccia che in cottura sfrigola e regala un sapore davvero delizioso. Si può cucinare sia in forno che allo spiedo, o addirittura stracotta in casseruola", "2025-01-15", "./asset/img/recipe/dad/arista-di-maiale.jpg");
INSERT INTO Ricetta VALUES ("Frittata di patate e cipolla", "dad","secondo", 25, 5, "Si ha un piatto completo quando le uova incontrano le patate e le cipolle. Un piatto che si adatta a qualsiasi stagione e occasione.", "2025-01-15", "./asset/img/recipe/dad/frittata-patate-cipolla.jpg");
INSERT INTO Ricetta VALUES ("Noodles con i gamberetti", "dad", "primo", 20, 5, "I noodles con gamberetti sono un buonissimo primo piatto in cui gli spaghetti orientali sono protagonisti insieme a pochi altri ingredienti.", "2025-01-15", "./asset/img/recipe/dad/noodles-gamberetti.jpg");
INSERT INTO Ricetta VALUES ("Pasta caciotta e tonno in crema di peperoni", "dad", "primo", 35, 8, "La pasta con crema di peperoni, caciotta e tonno è un primo piatto davvero squisito. Colorato e semplice da preparare, piacerà a tutti.", "2025-01-15", "./asset/img/recipe/dad/pasta-caciotta-tonno-cremapeperoni.jpg");
INSERT INTO Ricetta VALUES ("Scaloppina al limone", "dad", "secondo", 25, 9, "La scaloppina al limone è una ricetta semplice e veloce da preparare, ma allo stesso tempo raffinata e gustosa. La delicatezza della carne si sposa perfettamente con l'acidità del limone, creando un mix di sapori davvero irresistibile.", "2025-01-15", "./asset/img/recipe/dad/scaloppina-limone.jpg");
-- PREFERENZA RICETTA ====================================

INSERT INTO Preferenza_Ricetta VALUES ("Insalata veloce", "GGGaggi");
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
INSERT INTO Preferenza_Ricetta VALUES ("Pasta zucchine e salmone","Tony");



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
INSERT INTO Utilizzo_Ingrediente VALUES ("Rucola e bresaola", "olio d'oliva", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "merluzzo", FALSE, 100, "g", "preferibilmente surgelato (costa meno)");
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "farina di semola", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "vino bianco da cucina", FALSE, 20, "ml", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "pepe", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Merluzzo in scaloppa", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta al pesto", "pasta", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta al pesto", "pesto", FALSE, 60, "g", "preferibilmente gia` pronto");

-- PENDOLARE
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata veloce", "cespo di insalata", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata veloce", "pomodori da insalata", FALSE, 1, "num_el", "quelli grande");
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata veloce", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Insalata veloce", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Tramezzini prosciutto e maionese", "pane in cassetta", FALSE, 1, "num_el", "morbido da tramezzino");
INSERT INTO Utilizzo_Ingrediente VALUES ("Tramezzini prosciutto e maionese", "prosciutto cotto", FALSE, 120, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Tramezzini prosciutto e maionese", "maionese", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Caprese", "pomodori da insalata", FALSE, 2, "num_el", "quelli grandi");
INSERT INTO Utilizzo_Ingrediente VALUES ("Caprese", "mozzarella", FALSE, 2, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Caprese", "origano", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "cotoletta impanata", FALSE, 1, "num_el", "pre-confezionata");
INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "pomodorini", FALSE, 10, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Cotoletta", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Hamburger_EN", "pane", FALSE, 1, "num_el", "meglio se da hamburger_EN");
INSERT INTO Utilizzo_Ingrediente VALUES ("Hamburger_EN", "hamburger_EN", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Hamburger_EN", "olio d'oliva", TRUE, NULL, NULL, NULL);

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
INSERT INTO Utilizzo_Ingrediente VALUES ("Pollo al curry_EN con riso e piselli", "olio d'oliva", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Burger_EN vegetale con piselli", "burger_EN vegetale", FALSE, 120, "g", "dipende da dove lo prendi");
INSERT INTO Utilizzo_Ingrediente VALUES ("Burger_EN vegetale con piselli", "piselli", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Burger_EN vegetale con piselli", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Burger_EN vegetale con piselli", "olio d'oliva", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "riso Basmati", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "petto di pollo", FALSE, 120, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "spezie aromatiche", TRUE, NULL, NULL, "a piacere");
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "sale grosso", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso e pollo", "olio d'oliva", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "riso Venere", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "zucchine", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "carote", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "mais", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "pomodorini", FALSE, 4, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "sale grosso", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Riso Venere con verdure", "olio d'oliva", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "couscous_EN", FALSE, 60, "g", "senza esagerare poiché si gonfia molto");
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "zucchine", FALSE, 40, "g", "una piccola");
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "carote", FALSE, 40, "g", "una piccola");
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "peperoni dolci", FALSE, 30, "g", "preferire quelli piccoli");
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "pomodorini", FALSE, 30, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "olive", FALSE, 15, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "albicocche secche", FALSE, 10, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Couscous_EN con verdure", "sale fino", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta sfilacci e pomodorini", "pasta", FALSE, 150, "g", "tipologia a scelta ma consigliata corta");
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta sfilacci e pomodorini", "pomodorini", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta sfilacci e pomodorini", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta sfilacci e pomodorini", "sale grosso", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e gamberetti", "pasta", FALSE, 150, "g", "tipologia a scelta ma consigliata corta");
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e gamberetti", "zucchine", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e gamberetti", "gamberetti", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e gamberetti", "sale grosso", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e gamberetti", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e gamberetti", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e gamberetti", "basilico", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e salmone", "pasta", FALSE, 120, "g", "tipologia a scelta ma consigliata corta");
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e salmone", "zucchine", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e salmone", "salmone", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e salmone", "sale grosso", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e salmone", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES ("Pasta zucchine e salmone", "olio d'oliva", TRUE, NULL, NULL, NULL);

-- DAD
INSERT INTO Utilizzo_Ingrediente VALUES("Arista di maiale", "cipolla", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Arista di maiale", "carote", FALSE, 2, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Arista di maiale", "costa di sedano", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Arista di maiale", "vino bianco da cucina", FALSE, 40, "ml", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Arista di maiale", "sale grosso", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Arista di maiale", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Arista di maiale", "acqua", FALSE, 120, "ml", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Arista di maiale", "rametto di rosmarino", FALSE, 1, "num_el", NULL);

INSERT INTO Utilizzo_Ingrediente VALUES("Frittata di patate e cipolla", "cipolla", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Frittata di patate e cipolla", "uova", FALSE, 3, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Frittata di patate e cipolla", "pecorino", FALSE, 30, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Frittata di patate e cipolla", "patate", FALSE, 200, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Frittata di patate e cipolla", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Frittata di patate e cipolla", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Frittata di patate e cipolla", "pepe", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Frittata di patate e cipolla", "prezzemolo", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES("Noodles con i gamberetti", "confezione noodles", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Noodles con i gamberetti", "gamberetti", FALSE, 100, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Noodles con i gamberetti", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Noodles con i gamberetti", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Noodles con i gamberetti", "pepe", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Noodles con i gamberetti", "limone", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES("Pasta caciotta e tonno in crema di peperoni", "aglio", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Pasta caciotta e tonno in crema di peperoni", "pasta", FALSE, 80, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Pasta caciotta e tonno in crema di peperoni", "tonno", FALSE, 35, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Pasta caciotta e tonno in crema di peperoni", "peperoni dolci", FALSE, 125, "g", "peperoni rossi o gialli");
INSERT INTO Utilizzo_Ingrediente VALUES("Pasta caciotta e tonno in crema di peperoni", "caciotta", FALSE,150, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Pasta caciotta e tonno in crema di peperoni", "sale fino", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Pasta caciotta e tonno in crema di peperoni", "olio d'oliva", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Pasta caciotta e tonno in crema di peperoni", "pepe", TRUE, NULL, NULL, NULL);

INSERT INTO Utilizzo_Ingrediente VALUES("Scaloppina al limone", "fesa di vitello", FALSE, 120, "g", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Scaloppina al limone", "limone", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Scaloppina al limone", "farina 00", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Scaloppina al limone", "burro", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Scaloppina al limone", "aglio", FALSE, 1, "num_el", NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Scaloppina al limone", "sale grosso", TRUE, NULL, NULL, NULL);
INSERT INTO Utilizzo_Ingrediente VALUES("Scaloppina al limone", "olio d'oliva", TRUE, NULL, NULL, NULL);

-- PREPARAZIONE ====================================

-- FUORISEDE
INSERT INTO Preparazione VALUES ("Pasta-asciutta", 1, "Prendi il pacco di pasta.");
INSERT INTO Preparazione VALUES ("Pasta-asciutta", 2, "Aprilo, sapendo che tra 2 giorni dovrai andare di nuovo al supermercato per comprare un altro pacco e spendere altri soldi, ma non piangere (ancora).");
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
INSERT INTO Preparazione VALUES ("Insalata veloce", 1, "Prendi il cespo di insalata e inizia a togliere le varie foglie (ti potrebbe essere utile, per fare in fretta, rimuovere dal basso il cuore del cespo).");
INSERT INTO Preparazione VALUES ("Insalata veloce", 2, "Dal reparto “cose che non credo di aver mai usato”, prendi la centrifuga di insalata e mettila vicino al lavello: ci servirà tra un attimo.");
INSERT INTO Preparazione VALUES ("Insalata veloce", 3, "Blocca il lavello con il tappo e lascialo riempire un poco di acqua. Poni quindi le foglie di insalata nell’acqua e inizia a pulirle. Lavata una foglia, ponila dentro la centrifuga.");
INSERT INTO Preparazione VALUES ("Insalata veloce", 4, "Una volta lavate tutte le foglie svuota il lavello, quindi chiudi la centrifuga con il suo coperchio e azionala. Controlla periodicamente se le foglie sono asciutte e svuota l’acqua che si accumula.");
INSERT INTO Preparazione VALUES ("Insalata veloce", 5, "Prendi il tuo box pranzo e ponici le foglie lavate ed asciugate. Metti il tutto da parte, lo riprenderemo tra poco!");
INSERT INTO Preparazione VALUES ("Insalata veloce", 6, "Prendi il pomodoro e puliscilo sotto l’acqua corrente. Fatto questo, cerca un tagliere e un coltello: poggia dunque il pomodoro sul tagliere.");
INSERT INTO Preparazione VALUES ("Insalata veloce", 7, "Affetta tutto il pomodoro cercando di non realizzare fette eccessivamente spesse.");
INSERT INTO Preparazione VALUES ("Insalata veloce", 8, "Taglia le fette di pomodoro in pezzetti più piccoli, quindi versali nel box pranzo assieme all'insalata.");
INSERT INTO Preparazione VALUES ("Insalata veloce", 9, "Condisci con olio e sale: il pranzo è servito.");

INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 1, "Prendi una fetta di pane e tagliala a metà in senso obliquo.");
INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 2, "Spalma un po' di maionese su entrambe le fette di pane.");
INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 3, "Prendi il prosciutto e mettilo su una fetta di pane.");
INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 4, "Prendi di nuovo la maionese e spalmala sopra il prosciutto");
INSERT INTO Preparazione VALUES ("Tramezzini prosciutto e maionese", 5, "Posiziona la fetta di pane senza prosciutto sopra l'altra fetta.");

INSERT INTO Preparazione VALUES ("Caprese", 1, "Prendi i due pomodori e lavali bene sotto l'acqua corrente per togliere eventuali pesticidi presenti sulla superficie.");
INSERT INTO Preparazione VALUES ("Caprese", 2, "Dall'angolo \"cose da non toccare\", prendi un tagliere e un coltello dalla lama non arrotondata. Prendi i due pomodori e tagliali a fette: non devono essere né troppo grandi, né troppo fine, il giusto insomma.");
INSERT INTO Preparazione VALUES ("Caprese", 3, "Prendi un piatto e poggiaci sopra le fette di pomodoro avendo cura di non sovrapporle.");
INSERT INTO Preparazione VALUES ("Caprese", 4, "Prendi una mozzarella e, avendo cura di porti sopra il lavello (per evitare di dover poi pulire per terra), apri la confezione aiutandoti con una forbice o un coltello. Stai attento a non tagliarti le dita!");
INSERT INTO Preparazione VALUES ("Caprese", 5, "Dopo aver sgocciolato la mozzarella, ponila sopra il tagliere e tagliala a fette anche queste non troppo spesse.");
INSERT INTO Preparazione VALUES ("Caprese", 6, "Poni ciascuna fetta di mozzarella sopra ad una fetta di pomodoro.");
INSERT INTO Preparazione VALUES ("Caprese", 7, "Ripeti i passi precedenti con la seconda mozzarella.");
INSERT INTO Preparazione VALUES ("Caprese", 8, "Prendi l’origano e spargilo sopra il piatto: complimenti, la tua caprese è pronta da gustare!");

INSERT INTO Preparazione VALUES ("Cotoletta", 1, "Cerca un tagliere per tagliare i pomodorini.");
INSERT INTO Preparazione VALUES ("Cotoletta", 2, "Prendi dal frigo i pomodorini, apri l’acqua del lavello e inizia a pulirli uno ad uno per togliere eventuali residui presenti sulla superficie.");
INSERT INTO Preparazione VALUES ("Cotoletta", 3, "Poggia i pomodorini puliti sopra il tagliere. Prendi quindi un coltello e inizia ad affettare i pomodorini in due o tre parti ciascuno.");
INSERT INTO Preparazione VALUES ("Cotoletta", 4, "Poggia i pomodorini tagliati su un piatto e condiscili con olio e sale.");
INSERT INTO Preparazione VALUES ("Cotoletta", 5, "Prendi una padella sufficientemente grande per ospitare la cotoletta e versaci un filo d’olio: questo eviterà che la cotoletta si attacchi!");
INSERT INTO Preparazione VALUES ("Cotoletta", 6, "Prendi dal frigo la cotoletta impanata pre-confezionata e mettila un attimo da parte.");
INSERT INTO Preparazione VALUES ("Cotoletta", 7, "Accendi il fuoco e fai riscaldare la padella per qualche secondo, quindi metti la cotoletta sulla padella.");
INSERT INTO Preparazione VALUES ("Cotoletta", 8, "Fai cuocere per cinque minuti rigirando la pietanza ambo le parti, in maniera che venga scaldata uniformemente.");
INSERT INTO Preparazione VALUES ("Cotoletta", 9, "Impiatta assieme ai pomodori: la cena è servita!");

INSERT INTO Preparazione VALUES ("Hamburger_EN", 1, "Prendi una padella e ungila d’olio, ponila sul fuoco e lasciala riscaldare. Attenzione: meglio non esagerare con la quantità d’olio!");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 2, "Prendi dal frigo l’Hamburger e togli eventuali rivestimenti che coprono la carne.");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 3, "Poni la carne sulla padella avendo cura di non schizzarti con l’olio caldo (sono dolori, parliamo per esperienza). La carne deve cuocere per un massimo 10 minuti, facendola girare ogni 2/3 per fare in modo che la cottura risulti uniforme.");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 4, "Mentre aspetti qualche minuto per poi girare la carne, prendi il pane e taglialo a metà. Cerca quindi il tostapane e usalo per scaldare il pane appena tagliato.");
INSERT INTO Preparazione VALUES ("Hamburger_EN", 5, "Passati 10 minuti spegni il fuoco e contolla che la carne al suo interno sia ben cotta. Prendi quindi un piatto, poggiaci una fetta di pane caldo, metti quindi l’<span lang=\"en\">Hamburger</span> e chiudi con la seconda fetta: l’<span lang=\"en\">Hamburger</span> è pronto, buon appetito!");

INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 1, "Prendi il tostapane e attacca la spina alla presa di corrente (sì, quella in cucina impossibile da raggiungere).");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 2, "Dopo aver accuratamente controllato di non esserti slogato la spalla, prendi le due fette di pane da toast e inseriscile dentro il tostapane. Accendi quindi il tostapane e lascia che il pane scaldi.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 3, "Nel mentre, prendi il pomodoro e lavalo sotto l’acqua corrente per togliere i residui di pesticidi.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 4, "Prendi un tagliere e poggiaci sopra il pomodoro appena lavato. Taglia quindi quattro fette di pomodoro e metti la parte che avanza in frigo.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 5, "Prendi una fetta di pane caldo, poggia due fette di pomodoro, il prosciutto e quindi le rimanenti due fette di pomodoro. Chiudi con l’altra fetta di pane.");
INSERT INTO Preparazione VALUES ("Panino con prosciutto e pomodoro", 6, "Il tuo panino è pronto: buon appetito!");

-- IN SEDE
INSERT INTO Preparazione VALUES ("Pollo al curry_EN con riso e piselli", 1, "Metti l'acqua a bollire per il riso in una pentola. Una volta che fa le bolle versa del sale grosso e poi il riso, abbassa il fuoco a medio-alto e cucina per il tempo indicato sulla confezione.");
INSERT INTO Preparazione VALUES ("Pollo al curry_EN con riso e piselli", 2, "Nel mentre metti i piselli in un pentolino, versa un po' di acqua per cuocerli ma non annegarli, un pizzico di sale fino e un goccio d'olio d'oliva. Accendi il fuoco medio-basso e cucina per 12 minuti col coperchio (assaggia e regolati in base al gusto e alla consistenza).");
INSERT INTO Preparazione VALUES ("Pollo al curry_EN con riso e piselli", 3, "Taglia i petti di pollo a straccetti, mettili in una padella con un filo d'olio d'oliva giusto per non farli troppo attaccare e accendi il fuoco medio-basso. Cospargili di curry_EN abbondando pure ché poi verrà diluito. Dopo circa 7 minuti, giusto un po' prima di quando sembrano cotti, aggiungi il latte di cocco e se ti sembra poco giallo aggiungi del curry_EN (non è mai troppo). Spegni il fuoco e mescola un po' così da non formare grumi con la polvere del curry_EN.");
INSERT INTO Preparazione VALUES ("Pollo al curry_EN con riso e piselli", 4, "Prendi un bel piatto e componi il tutto tenendo ben separati il riso, i piselli e il pollo. Contempla questa opera culinaria e mescola tutto in modo da creare un marasma di colori così da assaporare sempre tutti i gusti ad ogni boccone. Non dimenticarti di versare tutto il latte di cocco in modo da amalgamare ancora meglio gli ingredienti.");

INSERT INTO Preparazione VALUES ("Burger_EN vegetale con piselli", 1, "Metti i piselli in un pentolino con un filo d'olio d'oliva e un pizzico di sale fino.");
INSERT INTO Preparazione VALUES ("Burger_EN vegetale con piselli", 2, "Riempi il pentolino di acqua fino a coprire per metà i piselli a meno che tu non li voglia annacquati, cucina per circa 15 minuti a fuoco medio e chiudi con un coperchi. Consigliamo di assaggiare ogni tanto per controllare la salatura e la cottura, se invece vuoi andare a sensazione come quegli esercizi che non ti vengono fai pure.");
INSERT INTO Preparazione VALUES ("Burger_EN vegetale con piselli", 3, "Metti un goccio d'olio d'oliva su una padella così sarà più facile lavarla e cucina il burger_EN a fuoco medio per il tempo indicato sulla confezione. Gira spesso il burger_EN per non farlo attaccare e per avere una cottura uniforme.");
INSERT INTO Preparazione VALUES ("Burger_EN vegetale con piselli", 4, "Una volta cotto il burger_EN e i piselli metti tutto su un piatto e assapora il gusto della finta ciccia che a noi amanti della carne fa ancora strano. Se te lo vuoi portare a lezione e non sei attrezzato come uno scout ti consigliamo di tagliarlo a pezzi a casa così sarà più facile da mangiare.");

INSERT INTO Preparazione VALUES ("Riso e pollo", 1, "Metti l'acqua a bollire, dopodiché aggiungi il sale grosso e il riso. Cucina a fuoco medio-alto per il tempo indicato sulla confezione ricordandoti di mescolare ogni tanto.");
INSERT INTO Preparazione VALUES ("Riso e pollo", 2, "Taglia i petti di pollo a straccetti, mettili in una padella con un pizzico di sale e delle spezie a piacere. Cucina a fuoco medio per 10-12 minuti girandoli ogni tanto per non farli attaccare.");
INSERT INTO Preparazione VALUES ("Riso e pollo", 3, "Una volta cotto il riso e il pollo mischiali in un piatto con un filo d'olio d'oliva per amalgamare il tutto.");

INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 1, "Riempi una pentola di acqua e falla bollire, poi butta del sale grosso e il riso. Cuoci a fuoco medio-alto per il tempo indicato sulla confezione mescolando ogni tanto.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 2, "Nel mentre pela la carota e tagliala e striscioline, mettile in padella con un filo d'olio d'oliva, un po' di acqua e un pizzico di sale fino. Accendi il fuoco basso e copri con un coperchio, le carote ci mettono un pochino di più a cucinarsi.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 3, "Senza perdere tempo che per noi studenti è prezioso lava la zucchina e tagliala a rondelle o pezzetti piccoli (fa' un po' come te pare). Aggiungila alle carote nella padella con un pizzico di sale. Ogni tanto girale e aggiungi un po' d'acqua se vedi che è evaporata per non farle attaccare alla padella. Cucina a fuoco medio-basso per circa 8-10 minuti.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 4, "Occhio al riso.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 5, "Lava i pomodorini e tagliali a piccoli spicchi.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 6, "Se pensi di riuscire a finire tutto questo bel piattone apri anche una scatola di mais e scolala così da avere tutto pronto sul tavolo.");
INSERT INTO Preparazione VALUES ("Riso Venere con verdure", 7, "Quando il riso, le zucchine e le carote sono pronte versa tutto in un piatto insieme ai pomodorini e il mais. Condisci con un filo d'olio d'oliva e assapora il gusto di chi può permettersi certe prelibatezze.");

INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 1, "Pela e taglia la carota a rondelle sottili o piccoli spicchi, mettili in una padella abbastanza grande che possa contenere tutti gli ingredienti e versa un filo d'olio d'oliva.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 2, "Lava i peperoni dolci, aprili con un coltello, togli i semi e tagliali a striscioline. Aggiungili nella padella con un goccio d'acqua e un pizzico di sale, ora puoi accendere il fuoco basso e chiudere con un coperchio.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 3, "Lava la zucchina e tagliala a piccoli spicchi (tanto per cambiare). Aggiungila alle altre verdure in cottura e girale ogni tanto così da non farle attaccare. Se l'acqua è evaporata aggiungine un goccio. Cucinale per 10 minuti ma assaggia ogni tanto mi raccomando, sempre assaggiare!");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 4, "Taglia a pezzetti le albicocche secche e mettile in mezzo bicchiere d'acqua così da reidratarle un pochino e renderle più morbide. Daranno quel tocco dolce e fresco al piatto che non hai idea.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 5, "Lava e taglia a spicchi i pomodorini");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 6, "Taglia a metà le olive giusto per dare l'impressione di averne di più, se non hai voglia lascia stare tanto il sapore è uguale.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 7, "Una volta pronte le verdure versa un bicchiere d'acqua nella padella, poi il couscous, i pomodorini, le albicocche e le olive (spero la padella fosse abbastanza grande). Mescola bene e spegni il fuoco così da lasciar riposare il couscous.");
INSERT INTO Preparazione VALUES ("Couscous_EN con verdure", 8, "Ora potrai andare a lezione sfoggiando un piatto saporito e pieno di colori alla faccia dei tuoi compagni che si portano la solita pasta in bianco e dei grissini per pranzo.");

INSERT INTO Preparazione VALUES ("Pasta sfilacci e pomodorini", 1, "Metti a bollire l'acqua e nel mentre lava e taglia i pomodorini a spicchi o a fette: così ottimizzi i tempi, che noi studenti non ne abbiamo molto.");
INSERT INTO Preparazione VALUES ("Pasta sfilacci e pomodorini", 2, "Quando vedi l'acqua bollire butta il sale grosso e poi la pasta, cuoci a fuoco medio-alto per il tempo indicato nella confezione della pasta.");
INSERT INTO Preparazione VALUES ("Pasta sfilacci e pomodorini", 3, "Una volta pronta scolala, versa la pasta in un contenitore che ti porterai a lezione o in un piatto se la mangi a casa. Aggiungi i pomodorini, gli sfilacci e, se ti va, anche un filo d'olio.");

INSERT INTO Preparazione VALUES ("Pasta zucchine e gamberetti", 1, "Se hai preso i gamberetti già pronti surgelati continua al punto seguente, altrimenti, se li hai presi freschi perché pensi di meritarteli, allora stacca la testa, togli il guscio ed estrai il filamento nero interno aiutandoti con uno stuzzicadenti."); 
INSERT INTO Preparazione VALUES ("Pasta zucchine e gamberetti", 2, "Metti i gamberetti in una padella con un filo d'olio e un po' d'acqua e cucinali a fuoco medio-basso per 3-4 minuti.");
INSERT INTO Preparazione VALUES ("Pasta zucchine e gamberetti", 3, "Lava le zucchine e tagliale a pezzetti, fette sottili o come ti pare.");
INSERT INTO Preparazione VALUES ("Pasta zucchine e gamberetti", 4, "Mettile in una padella sempre con un filo d'olio, un po' d'acqua e un pizzico di sale fino per risaltarne il sapore. Cucina a fuoco medio-alto per 10 minuti col coperchio e muovile ogni tanto per evitare che si attacchino e ti tocchi poi scrostare il bruciato (se si è asciugata tutta l'acqua puoi aggiungerne un po', senza annegarle ovviamente).");
INSERT INTO Preparazione VALUES ("Pasta zucchine e gamberetti", 5, "Metti a bollire l'acqua per la pasta: quando bolle aggiungi un po' di sale grosso e quindi la pasta. Tieni il fuoco medio-alto per il tempo indicato sulla confezione (in genere ci azzeccano ma ti consigliamo di assaggiare ogni tanto).");
INSERT INTO Preparazione VALUES ("Pasta zucchine e gamberetti", 6, "Una volta pronta la pasta scolala, versala in un contenitore che ti porterai a lezione o in un piatto se la mangi a casa, aggiungi le zucchine e i gamberetti. Aggiungi un pizzico di basilico per dargli un tocco di classe e fare un figurone coi tuoi compagni fuorisede.");

INSERT INTO Preparazione VALUES ("Pasta zucchine e salmone", 1, "Metti a bollire l'acqua per la pasta in una pentola, quando senti borbottare il coperchio aggiungi il sale grosso, aggiungi la pasta e cucina a fuoco medio-alto per il tempo indicato sulla confezione.");
INSERT INTO Preparazione VALUES ("Pasta zucchine e salmone", 2, "Nel mentre lava le zucchine e tagliale alla <span lang=\"fr\">julienne</span> (se lo dici ai tuoi amici sembrerai quasi uno chef serio). Mettile in una padella con un filo d'olio, un po' d'acqua e del sale fino, chiudi con un coperchio e cucina per 10 minuti a fuoco medio-basso. Girale ogni tanto e aggiungi dell'acqua se vedi che nel frattempo è evaporata per non farle attaccare.");
INSERT INTO Preparazione VALUES ("Pasta zucchine e salmone", 3, "Taglia il salmone a pezzetti: servirà a condire per bene la pasta.");
INSERT INTO Preparazione VALUES ("Pasta zucchine e salmone", 4, "Quando la pasta e le zucchine sono pronte versa tutto su un piatto, aggiungi il salmone e condisci con un filo d'olio. Fai una foto e mandala ai tuoi amici che si devono mangiare un misero panino finita lezione giusto per fargli un po' di invidia.");

-- DAD
INSERT INTO Preparazione VALUES ("Arista di maiale", 1, "Lega l'arista con uno spago da cucina.");
INSERT INTO Preparazione VALUES ("Arista di maiale", 2, "Metti il rametto di rosmarino sulla carne, trita la cipolla, la carota e il sedano.");
INSERT INTO Preparazione VALUES ("Arista di maiale", 3, "In una casseruola metti il trito di verdure con l'olio.");
INSERT INTO Preparazione VALUES ("Arista di maiale", 4, "Fai soffriggere per qualche minuto mescolando.");
INSERT INTO Preparazione VALUES ("Arista di maiale", 5, "Metti l'arista in pentola e falla rosolare su tutti i lati.");
INSERT INTO Preparazione VALUES ("Arista di maiale", 6, "Aggiungi il vino e l'acqua in pentola, chiudi il tutto con un coperchio e lascia cuocere l'arista a fuco lento per circa un'ora girando ogni tanto la carne.");
INSERT INTO Preparazione VALUES ("Arista di maiale", 7, "Quando la carne è cotta toglila dalla pentola e spostala in un tagliere per farla raffreddare.");
INSERT INTO Preparazione VALUES ("Arista di maiale", 8, "Frulla il trito di verdure fino ad ottenere una crema.");
INSERT INTO Preparazione VALUES ("Arista di maiale", 9, "Impiatta la carne e mettici sopra la crema ottenuta.");

INSERT INTO Preparazione VALUES ("Frittata di patate e cipolla", 1, "Spella la cipolla, tritala e mettila in una padella con un po' d'olio.");
INSERT INTO Preparazione VALUES ("Frittata di patate e cipolla", 2, "Rosola la cipolla e mettici dentro le patate e cuoci il tutto per circa 10 minuti.");
INSERT INTO Preparazione VALUES ("Frittata di patate e cipolla", 3, "Sguscia le uova e mettile in una ciotola.");
INSERT INTO Preparazione VALUES ("Frittata di patate e cipolla", 4, "Aggiungi alle uova il pecorino, il prezzemolo, il pepe, il sale e poi sbatti il tutto con una forchetta.");
INSERT INTO Preparazione VALUES ("Frittata di patate e cipolla", 5, "Unisci le patate e la cipolla con le preparato appena sbattuto.");
INSERT INTO Preparazione VALUES ("Frittata di patate e cipolla", 6, "Riscalda un po' d'olio nella prima padella.");
INSERT INTO Preparazione VALUES ("Frittata di patate e cipolla", 7, "Versa il composto nella padella e fai cuocere per circa 8 minuti a fuoco lento.");
INSERT INTO Preparazione VALUES ("Frittata di patate e cipolla", 8, "Poggia un piatto sopra la padella e capovolgi il contenuto, rimetti la padella sul fuoco per cuocere per 2-3 minuti il lato opposto.");
INSERT INTO Preparazione VALUES ("Frittata di patate e cipolla", 9, "Togli dal fuoco, magna e tasi.");

INSERT INTO Preparazione VALUES("Noodles con i gamberetti", 1, "Metti in una padella un po' d'olio, i gamberetti e falli saltare su fiamma vivace.");
INSERT INTO Preparazione VALUES("Noodles con i gamberetti", 2, "Quando mancano 5 minuti alla cottura dei gamberitti metti a bollire dell'acqua a fuoco alto.");
INSERT INTO Preparazione VALUES("Noodles con i gamberetti", 3, "Apri il coperchio dei noodles e versaci dentro l'acqua.");
INSERT INTO Preparazione VALUES("Noodles con i gamberetti", 4, "Chiudere il coperchio e attendere 3-4 minuti.");
INSERT INTO Preparazione VALUES("Noodles con i gamberetti", 5, "Regola di sale, pepe e limone i gamberetti.");
INSERT INTO Preparazione VALUES("Noodles con i gamberetti", 6, "Solleva il coperchio dei noodles e buttali in padella con i gamberetti, poi impiatta.");

INSERT INTO Preparazione VALUES ("Pasta caciotta e tonno in crema di peperoni", 1, "Mondare il peperone eliminando la calotta, i semi e i filamenti interni, infine tagliare il peperone in pezzetti.");
INSERT INTO Preparazione VALUES ("Pasta caciotta e tonno in crema di peperoni", 2, "Mettere sul fuoco una pentola con acqua salata (servirà per la cottura della pasta).");
INSERT INTO Preparazione VALUES ("Pasta caciotta e tonno in crema di peperoni", 3, "Versare un po' d'olio in una padella, aggiungere lo spicchio d'aglio schiacciato e lasciare rosolare per circa 2 minuti.");
INSERT INTO Preparazione VALUES ("Pasta caciotta e tonno in crema di peperoni", 4, "Aggiungere i pezzi di peperone e lasciate cuocere per circa 10 minuti.");
INSERT INTO Preparazione VALUES ("Pasta caciotta e tonno in crema di peperoni", 5, "Quando l'acqua bolle buttare la pasta.");
INSERT INTO Preparazione VALUES ("Pasta caciotta e tonno in crema di peperoni", 6, "Togliere l'aglio dalla padella e trasferire i peperoni in un bicchiere aggiungendoci circa 10 g di olio EVO. Frullare il tutto fino ad ottenere una crema.");
INSERT INTO Preparazione VALUES ("Pasta caciotta e tonno in crema di peperoni", 7, "Scolare la pasta, metterla in un piatto, versare la crema di peperoni e mescolare.");
INSERT INTO Preparazione VALUES ("Pasta caciotta e tonno in crema di peperoni", 8, "Sgocciolare il tonno e unirlo alla pasta.");
INSERT INTO Preparazione VALUES ("Pasta caciotta e tonno in crema di peperoni", 9, "Grattuggiare la caciotta sulla pasta.");

INSERT INTO Preparazione VALUES ("Scaloppina al limone", 1, "Taglia a fettine la fesa di vitello.");
INSERT INTO Preparazione VALUES ("Scaloppina al limone", 2, "Passa la carne nella farina facendola aderire da entrambi i lati.");
INSERT INTO Preparazione VALUES ("Scaloppina al limone", 3, "Lascia sciogliere in un tegame (meglio se antiaderente) una noce di burro, un po' d'olio e uno spicchio d'aglio.");
INSERT INTO Preparazione VALUES ("Scaloppina al limone", 4, "Sistema la carne nel tegame e lasciala rosolare per qualche istante.");
INSERT INTO Preparazione VALUES ("Scaloppina al limone", 5, "Dividi il limone a metà e spremilo in una ciotolina.");
INSERT INTO Preparazione VALUES ("Scaloppina al limone", 6, "Dopo un paio di minuti gira la carne e lasciala rosolare anche dall'altra parte.");
INSERT INTO Preparazione VALUES ("Scaloppina al limone", 7, "Aggiusta di sale e sfuma le scaloppine con il succo di limone.");
INSERT INTO Preparazione VALUES ("Scaloppina al limone", 8, "Prosegui la cottura su fiamma dolce per 2-3 minuti.");
INSERT INTO Preparazione VALUES ("Scaloppina al limone", 9, "Togli la carne dal tegame, impiatta e magna.");

-- VALUTAZIONE ====================================

-- FUORISEDE
INSERT INTO Valutazione VALUES ("Rucola e bresaola", "Ombretta", "2025-01-05", 28, "Wow, buonissimo devo consigliarlo alle mie sorelle");
INSERT INTO Valutazione VALUES ("Pane e salame", "MasterMaurizio", "2025-02-02", 30, "Ragazzi complimenti, una delle ricette che piú apprezzo. Forza pane e salame");
INSERT INTO Valutazione VALUES ("Pasta-asciutta", "Jay", "2025-01-05", 24, "Non ho tempo per descrivere questa ricetta dó e vado a studiare");
INSERT INTO Valutazione VALUES ("Insalata veloce", "Murphy", "2025-01-05", 28, "Abbinamento spaziale, super consigliato.");
INSERT INTO Valutazione VALUES ("Riso e uova fritte", "Oca", "2025-01-05", 14, "Piatto povero di gusti, emozioni e non molto salutare quindi non si merita nemmeno la sufficienza");
INSERT INTO Valutazione VALUES ("Frittatona", "UgoFantozzi", "2025-01-05", 29, "Buonissima, soprattutto accompagnata da una Peroni gelata");


-- PENDOLARE
INSERT INTO Valutazione VALUES ("Insalata veloce", "GGGaggi", "2025-01-05", 28, "Abbinamento spaziale, super consigliato.");
INSERT INTO Valutazione VALUES ("Insalata veloce", "OmbrettaGatti", "2025-01-12", 26, "Concordo con GGGaggi, piatto leggero (si vede che siamo sulla stessa onda).");
INSERT INTO Valutazione VALUES ("Caprese", "GGGaggi", "2025-01-08", 30, "Ancora meglio dell'insalata veloce, valutate molto positivamente entrambe.");
INSERT INTO Valutazione VALUES ("Caprese", "JoeTrump", "2025-01-06", 12, "Piatto senza CARNE? unacceptable");
INSERT INTO Valutazione VALUES ("Hamburger_EN", "JoeTrump", "2025-01-12", 30, "Wonderful! finalmente un piatto come si deve della mia nazione");

-- IN SEDE
INSERT INTO Valutazione VALUES ("Pollo al curry_EN con riso e piselli", "JoeTrump", "2025-01-11", 30, "Pazzesco!!!!");
INSERT INTO Valutazione VALUES ("Burger_EN vegetale con piselli", "OmbrettaGatti", "2025-01-14", 24, "Mi piace che non si pensi solo alla carne, cambierei l'accostamento coi piselli però.");
INSERT INTO Valutazione VALUES ("Burger_EN vegetale con piselli", "GGGaggi", "2025-01-15", 25, "Concordo con Ombretta, comunque molto buono e facile da preparare.");


INSERT INTO Valutazione VALUES ("Couscous_EN con verdure", "Tony", "2025-01-12", 30, "Mai assaggiato piatto migliore!");

INSERT INTO Valutazione VALUES ("Pasta sfilacci e pomodorini", "Tony", "2025-01-12", 27, "Quasi ottimo!");
INSERT INTO Valutazione VALUES ("Pasta zucchine e salmone", "Tony", "2025-01-13", 30, "Consigliata, davvero molto buona!");
-- DAD


-- SUGGERIMENTO ====================================

INSERT INTO Suggerimento(utente,data,testo) VALUES ("GGGaggi", "2025-01-10", "Non ho un piatto da consigliarvi, volevo solo dirvi che avete fatto un ottimo lavoro!");
INSERT INTO Suggerimento(utente,data,testo) VALUES ("MasterMaurizio", "2025-02-03", "Un piatto che vorrei assolutamente vedere nel vostro ricettario è il platano fritto. Molto veloce da fare e ottimo per lo studente fuorisede");
