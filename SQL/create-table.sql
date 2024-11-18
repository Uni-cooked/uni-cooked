CREATE DOMAIN POSITIVE_INT AS INT CHECK (VALUE >=0);

CREATE TABLE Utente(
    Email VARCHAR(100) PRIMARY KEY,
    Nome VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(64) NOT NULL, --SHA256 restituisce sempre una stringa di 64 caratteri
    Data_iscrizione DATE NOT NULL,
);

CREATE TABLE Admin(
    Utente VARCHAR(100) PRIMARY KEY,
    Data_termine DATE, --NULL se ancora admin
    FOREIGN KEY Utente REFERENCES Utente(Email) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Visitatore(
    Utente VARCHAR(100) PRIMARY KEY,
    Visibilità VARCHAR(8) NOT NULL,
    --Controllo che la visibilità sia pubblica o privata
    CHECK(Visibilità="Pubblica" OR Visibilità="Privata"),
    Biografia VARCHAR(500) NOT NULL,
    Tipo_studente VARCHAR(9) NOT NULL,
    --Controllo che Tipo_studente sia DAD, Fuorisede, In sede, Pendolare
    CHECK(Tipo_studente="DAD" OR Tipo_studente="Fuorisede" OR Tipo_studente="In sede" OR Tipo_studente="Pendolare")
    Immagine VARCHAR(500) NOT NULL, --Ancora non sappiamo il tipo, per ora faccio finta sia una directory
    FOREIGN KEY Utente REFERENCES Utente(Email) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Ingrediente(
    Nome VARCHAR(20) PRIMARY KEY NOT NULL,
    Marca VARCHAR(50),
);

CREATE TABLE Ricetta(
    Nome VARCHAR(50) PRIMARY KEY,
    Categoria VARCHAR(9) NOT NULL,
    --Controllo che Categoria sia DAD, Fuorisede, In sede, Pendolare
    CHECK(Categoria="DAD" OR Categoria="Fuorisede" OR Categoria="In sede" OR Categoria="Pendolare")
    Tipo VARCHAR(7) NOT NULL,
    --Controllo che Tipo sia Primo o Secondo
    CHECK(Tipo="Primo" OR Tipo="Secondo")
    Descrizione VARCHAR(500) NOT NULL,
    Admin VARCHAR(100) NOT NULL,
    Data DATE NOT NULL,
    Immagine VARCHAR(500) NOT NULL, --Ancora non sappiamo il tipo, per ora faccio finta sia una directory
    FOREIGN KEY Admin REFERENCES Admin(Utente) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Preferenza(
    Ricetta VARCHAR(50) NOT NULL,
    Visitatore VARCHAR(100) NOT NULL,
    PRIMARY KEY (Ricetta, Visitatore),
    FOREIGN KEY Ricetta REFERENCES Ricetta(Nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY Visitatore REFERENCES Visitatore(Utente) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Utilizzo(
    Quantità POSITIVE_INT,
    Quanto_basta BOOLEAN,
    Unità_misura VARCHAR(2), --Da decidere le unità di misura
    --Controllo che se Quantità è diverso da NULL allora Unità_misura sia popolata e Quanto_basta sia NULL
    CHECK(Quantità IS NOT NULL AND Unità_misura IS NOT NULL AND Quanto_basta IS NULL),
    --Controllo che se Quantità è NULL allora Unità_misura sia NULL e Quanto_basta sia NOT NULL
    CHECK(Quantità IS NULL AND Unità_misura IS NULL and Quanto_basta IS NOT NULL),
    DESCRIZIONE VARCHAR(500),
    Ingrediente VARCHAR(20) NOT NULL,
    Ricetta VARCHAR(50) NOT NULL,
    FOREIGN KEY Ingrediente REFERENCES Ingrediente(Nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY Ricetta REFERENCES Ricetta(Nome) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(Ingrediente, Ricetta)
);

CREATE TABLE Preparazione(
    Numero POSITIVE_INT NOT NULL,
    Ricetta VARCHAR(50) NOT NULL,
    Descrizione VARCHAR(500) NOT NULL,
    PRIMARY KEY (Numero, Ricetta),
    FOREIGN KEY Ricetta REFERENCES Ricetta(Nome) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Valutazione(
    Ricetta VARCHAR(50) NOT NULL,
    Visitatore VARCHAR(100) NOT NULL,
    Commento VARCHAR(500) NOT NULL,
    Data DATE NOT NULL,
    Voto POSITIVE_INT NOT NULL,
    --Controllo che voto sia <= 30
    CHECK(Voto < 30 OR Voto=30),
    PRIMARY KEY (Ricetta, Visitatore),
    FOREIGN KEY Ricetta REFERENCES Ricetta(Nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY Visitatore REFERENCES Visitatore(Utente) ON DELETE CASCADE ON UPDATE CASCADE,
);