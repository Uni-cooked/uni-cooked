DROP TABLE IF EXISTS Utente CASCADE;
DROP TABLE IF EXISTS Admin CASCADE;
DROP TABLE IF EXISTS Vistatore CASCADE;
DROP TABLE IF EXISTS Ingrediente CASCADE;
DROP TABLE IF EXISTS Ricetta CASCADE;
DROP TABLE IF EXISTS Preferenza_Ricetta CASCADE;
DROP TABLE IF EXISTS Utilizzo CASCADE;
DROP TABLE IF EXISTS Preparazione CASCADE;
DROP TABLE IF EXISTS Valutazione CASCADE;
DROP TABLE IF EXISTS Take_away CASCADE;
DROP TABLE IF EXISTS Preferenza_take_away CASCADE;

DROP DOMAIN IF EXISTS POSITIVE_SMALLINT;

DROP TYPE IF EXISTS VISIBILITA;
DROP TYPE IF EXISTS CATEGORIA;
DROP TYPE IF EXISTS TIPO_PIATTO;
DROP TYPE IF EXISTS UNITA_MISURA;

CREATE DOMAIN POSITIVE_SMALLINT AS SMALLINT CHECK (VALUE>=0);   -- 2 Byte

CREATE TYPE VISIBILITA AS enum ('privata', 'pubblica');
CREATE TYPE CATEGORIA AS enum ('fuorisede', 'in_sede', 'pendolare', 'dad', 'take_away');
CREATE TYPE TIPO_PIATTO AS enum ('primo', 'secondo');
CREATE TYPE UNITA_MISURA AS enum ('g', 'ml', 'num_elementi');

CREATE TABLE Utente(
    email VARCHAR(100) PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(64) NOT NULL,  -- SHA256 restituisce sempre una stringa di 64 caratteri
    data_iscrizione DATE NOT NULL
);

CREATE TABLE Admin(
    utente VARCHAR(100) PRIMARY KEY,
    data_termine DATE, -- NULL se ancora admin
    FOREIGN KEY (utente) REFERENCES Utente(email) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Visitatore(
    utente VARCHAR(100) PRIMARY KEY,
    visibilita VISIBILITA NOT NULL,
    biografia VARCHAR(500) NOT NULL,
    tipo_studente CATEGORIA NOT NULL,
    immagine VARCHAR(500) NOT NULL, -- Ancora non sappiamo il tipo, per ora faccio finta sia una directory
    FOREIGN KEY (utente) REFERENCES Utente(email) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Ingrediente(
    nome VARCHAR(20) PRIMARY KEY,
    marca VARCHAR(50)
);

CREATE TABLE Ricetta(
    nome VARCHAR(50) PRIMARY KEY,
    categoria CATEGORIA NOT NULL,
    tipo TIPO_PIATTO NOT NULL,
    descrizione VARCHAR(500) NOT NULL,
    admin VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    immagine VARCHAR(500) NOT NULL, -- Ancora non sappiamo il tipo, per ora faccio finta sia una directory
    FOREIGN KEY (admin) REFERENCES Admin(utente) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Preferenza_Ricetta(
    ricetta VARCHAR(50) NOT NULL,
    visitatore VARCHAR(100) NOT NULL,
    PRIMARY KEY (ricetta, visitatore),
    FOREIGN KEY (ricetta) REFERENCES Ricetta(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (visitatore) REFERENCES Visitatore(utente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Utilizzo(
    ingrediente VARCHAR(20) NOT NULL,
    ricetta VARCHAR(50) NOT NULL,
    quanto_basta BOOLEAN NOT NULL,
    quantita POSITIVE_SMALLINT,
    unita_misura UNITA_MISURA,
    CHECK(quanto_basta IS TRUE AND quantita IS NULL AND unita_misura IS NULL),
    CHECK(quanto_basta IS FALSE AND quantita IS NOT NULL AND unita_misura IS NOT NULL),
    descrizione VARCHAR(50),
    PRIMARY KEY(ingrediente, ricetta),
    FOREIGN KEY (ingrediente) REFERENCES Ingrediente(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ricetta) REFERENCES Ricetta(nome) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Preparazione(
    numero TINYINT,
    ricetta VARCHAR(50),
    descrizione VARCHAR(500) NOT NULL,
    PRIMARY KEY (numero, ricetta),
    FOREIGN KEY (ricetta) REFERENCES Ricetta(nome) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Valutazione(
    ricetta VARCHAR(50),
    visitatore VARCHAR(100),
    commento VARCHAR(500) NOT NULL,
    data DATE NOT NULL,
    voto TINYINT NOT NULL,
    CHECK(voto>0 AND voto<=30),
    PRIMARY KEY (ricetta, visitatore),
    FOREIGN KEY (ricetta) REFERENCES Ricetta(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (visitatore) REFERENCES Visitatore(utente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Take_away(
    nome_locale VARCHAR(100) PRIMARY KEY,
    admin VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(30) NOT NULL,
    civico SMALLINT NOT NULL,
    maps VARCHAR(500) NOT NULL,  -- Collegamento web per Maps
    sito VARCHAR(500),
    immagine VARCHAR(500) NOT NULL, -- Ancora non sappiamo il tipo, per ora faccio finta sia una directory
    descrizione VARCHAR(500) NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (admin) REFERENCES Admin(utente) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Preferenza_take_away(
    visitatore VARCHAR(100) NOT NULL,
    take_away VARCHAR(100) NOT NULL,
    PRIMARY KEY (visitatore, take_away),
    FOREIGN KEY (take_away) REFERENCES Take_away(nome_locale) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (visitatore) REFERENCES Visitatore(utente) ON DELETE CASCADE ON UPDATE CASCADE
);
