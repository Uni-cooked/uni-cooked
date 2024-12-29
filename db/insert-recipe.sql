DELETE FROM Preparazione;
DELETE FROM Utilizzo_Ingrediente;
DELETE FROM Ricetta;
DELETE FROM Ingrediente;

-- caprese
INSERT INTO Ricetta(nome,categoria,tipo_piatto,tempo_sec,descrizione,data,immagine,prezzo) VALUES
("Caprese",
"pendolare",
"primo",
300,
"Piatto semplice, utile per giornate mhe",
"2024-12-28",
"../asset/img/recipe/default.jpg",
5);

INSERT IGNORE INTO Ingrediente(nome) VALUES
("pomodori da insalata"),
("mozzarelle"),
("origano");

INSERT INTO Utilizzo_Ingrediente(ingrediente,ricetta,quanto_basta,quantita,unita_misura,descrizione) VALUES
("pomodori da insalata","Caprese",FALSE,2,"num_elementi",NULL),
("mozzarelle","Caprese",FALSE,2,"num_elementi",NULL),
("origano","Caprese",TRUE,NULL,NULL,NULL);

INSERT INTO Preparazione(numero,ricetta,descrizione) VALUES
(1,"Caprese","Prendi i due pomodori e lavali bene sotto l'acqua corrente per togliere eventuali pesticidi presenti sulla superficie"),
(2,"Caprese","Dall'angolo cose da non toccare, prendi un tagliere e un coltello dalla lama non arrotondata. Prendi i due pomodori e tagliali a fette: non devono essere né troppo grandi, né troppo fine: il giusto insomma."),
(3,"Caprese","Prendi un piatto e poggia sopra le fette di pomodoro avendo cura di non sovrapporle"),
(4,"Caprese","Prendi una mozzarella e, avendo cura di porti sopra il lavello per evitare di dover poi pulire per terra, apri la confezione aiutandoti con l'utilizzo di una forbice o di un coltello, avendo cura di non tagliarti le dita (hai una laurea da prendere, ricordalo...)"),
(5,"Caprese","Dopo aver sgocciolato la mozzarella, ponila sopra il tagliere e tagliala a fette anche queste non troppo spesse."),
(6,"Caprese","Poni ciascuna fetta di mozzarella sopra ad una fetta di pomodoro"),
(7,"Caprese","Fai lo stesso con la seconda mozzarella"),
(8,"Caprese","Prendi l'origano e spargilo sopra il piatto: complimenti, la tua caprese è pronta da gustare. Stappa una bottiglia di aranciata e buon appetito!");

-- Riso Venere con verdure

INSERT INTO Ricetta(nome,categoria,tipo_piatto,tempo_sec,descrizione,data,immagine,prezzo) VALUES
("Riso Venere con verdure",
"in_sede",
"primo",
2700,
"Un piatto leggero e colorato, che combina la ricchezza del riso Venere con la freschezza delle verdure. Il riso, dal caratteristico colore scuro e dal gusto intenso, viene cotto al dente e saltato con verdure fresche come zucchine e carote. Un piatto nutriente e bilanciato ideale per chi cerca un’opzione sana e saporita. Perfetto da gustare anche a temperatura ambiente quando si deve passare la pausa pranzo in aula.",
"2024-12-28",
"../asset/img/recipe/default.jpg",
7);

INSERT IGNORE INTO Ingrediente(nome) VALUES
("riso venere"),
('zucchina'),
('carota'),
("mais"),
("pomodorini"),
("olio di oliva"),
("sale grosso"),
("sale fino");

INSERT INTO Utilizzo_Ingrediente(ingrediente,ricetta,quanto_basta,quantita,unita_misura,descrizione) VALUES
("riso venere","Riso Venere con verdure",FALSE,80,"g",NULL),
("zucchina","Riso Venere con verdure",FALSE,1,"num_elementi",'(piccola, 40 <abbr title="grammi>gr</abbr>")'),
("carota","Riso Venere con verdure",FALSE,1,"num_elementi",'(piccola, 40 <abbr title="grammi>gr</abbr>")'),
("mais","Riso Venere con verdure",FALSE,80,"g",NULL),
("pomodorini","Riso Venere con verdure",FALSE,3,"num_elementi",NULL),
("olio di oliva","Riso Venere con verdure",TRUE,NULL,NULL,NULL),
("sale grosso","Riso Venere con verdure",TRUE,NULL,NULL,NULL),
("sale fino","Riso Venere con verdure",TRUE,NULL,NULL,NULL);

INSERT INTO Preparazione(numero,ricetta,descrizione) VALUES
(1,"Riso Venere con verdure","Riempi una pentola di acqua e falla bollire, poi butta del sale grosso e il riso. Cuoci a fuoco medio-alto per il tempo indicato sulla confezione mescolando ogni tanto."),
(2,"Riso Venere con verdure","Nel mentre pela la carota e tagliala e striscioline, mettile in padella con un filo d'olio, un po' di acqua e un pizzico di sale fino. Accendi il fuoco basso e copri con un coperchio, le carote ci mettono un pochino di più a cucinarsi."),
(3,"Riso Venere con verdure","Senza perdere tempo che per noi studenti è prezioso lava la zucchina e tagliala a rondelle o pezzetti piccoli (fa' un po' come ti pare). Aggiungila alle carote nella padella con un pizzico di sale. Ogni tanto girale e aggiungi un po' d'acqua se vedi che è evaporata per non farle attaccare alla padella. Cucina a fuoco medio-basso per circa 8-10 minuti."),
(4,"Riso Venere con verdure", "Occhio al riso."),
(5,"Riso Venere con verdure","Lava i pomodorini e tagliali a piccoli spicchi."),
(6,"Riso Venere con verdure","Se pensi di riuscire a finire tutto questo bel piattone apri anche una scatola di mais e scolala così da avere tutto pronto sul tavolo."),
(7,"Riso Venere con verdure","Quando il riso, le zucchine e le carote sono pronte versa tutto in un piatto insieme ai pomodorini e il mais. Condisci con un filo d'olio e assapora il gusto di chi può permettersi certe prelibatezze.");

-- Pollo al curry con riso e piselli

INSERT INTO Ricetta(nome,categoria,tipo_piatto,tempo_sec,descrizione,data,immagine,prezzo) VALUES
("Pollo al curry con riso e piselli",
"in_sede",
"secondo",
2400,
"Un piatto aromatico e completo che porta in tavola i sapori dell'Oriente. Il pollo, cucinato in una salsa cremosa al curry e latte di cocco, si sposa perfettamente con il riso basmati che ne assorbe i profumi intensi e speziati. I piselli freschi aggiungono una nota dolce e un tocco di colore rendendo il piatto ancora più appetitoso. Perfetto per chi ama le spezie e desidera un piatto unico ricco di sapore e ben bilanciato.",
"2024-12-28",
"../asset/img/recipe/in-sede/pollo-curry.jpg",
8);

INSERT IGNORE INTO Ingrediente(nome) VALUES
("riso basmati"),
('petto di pollo'),
('piselli'),
("latte di cocco"),
("sale grosso"),
("sale fino"),
("curry in polvere"),
("olio");

INSERT INTO Utilizzo_Ingrediente(ingrediente,ricetta,quanto_basta,quantita,unita_misura,descrizione) VALUES
("riso basmati","Pollo al curry con riso e piselli",FALSE,70,"g",NULL),
("petto di pollo","Pollo al curry con riso e piselli",FALSE,80,"g",NULL),
("latte di cocco","Pollo al curry con riso e piselli",FALSE,70,"ml",NULL),
("sale grosso","Pollo al curry con riso e piselli",TRUE,NULL,NULL,NULL),
("sale fino","Pollo al curry con riso e piselli",TRUE,NULL,NULL,NULL),
("curry in polvere","Pollo al curry con riso e piselli",TRUE,NULL,NULL,NULL),
("olio","Pollo al curry con riso e piselli",TRUE,NULL,NULL,NULL);

INSERT INTO Preparazione(numero,ricetta,descrizione) VALUES
(1,"Pollo al curry con riso e piselli","Metti l'acqua a bollire per il riso in una pentola. Una volta che fa le bolle versa del sale grosso e poi il riso, abbassa il fuoco a medio-alto e cucina per il tempo indicato sulla confezione."),
(2,"Pollo al curry con riso e piselli","Nel mentre metti i piselli in un pentolino, versa un po' di acqua per cuocerli ma non annegarli, un pizzico di sale fino e un goccio d'olio. Accendi il fuoco medio-basso e cucina per 12 minuti col coperchio (assaggia e regolati in base al gusto e alla consistenza)."),
(3,"Pollo al curry con riso e piselli","Taglia i petti di pollo a straccetti, mettili in una padella con un filo d'olio giusto per non farli troppo attaccare e accendi il fuoco medio-basso. Cospargili di curry abbondando pure ché poi verrà diluito. Dopo circa 7 minuti, giusto un po' prima di quando sembrano cotti, aggiungi il latte di cocco e se ti sembra poco giallo aggiungi del curry (non è mai troppo). Spegni il fuoco e mescola un po' così da non formare grumi con la polvere del curry."),
(4,"Pollo al curry con riso e piselli","Prendi un bel piatto e componi il tutto tenendo ben separati il riso, i piselli e il pollo. Contempla questa opera culinaria e mescola tutto in modo da creare un marasma di colori così da assaporare sempre tutti i gusti ad ogni boccone. Non dimenticarti di versare tutto il latte di cocco in modo da amalgamare ancora meglio gli ingredienti.");
