DROP TABLE IF EXISTS Utente;
-- DROP TABLE IF EXISTS Admin;
-- DROP TABLE IF EXISTS Vistatore;
DROP TABLE IF EXISTS Ingrediente;
DROP TABLE IF EXISTS Ricetta;
DROP TABLE IF EXISTS Preferenza_Ricetta;
DROP TABLE IF EXISTS Utilizzo;
DROP TABLE IF EXISTS Preparazione;
DROP TABLE IF EXISTS Valutazione;

CREATE TABLE Utente(
    email VARCHAR(100) PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(64) NOT NULL,  -- SHA256 restituisce sempre una stringa di 64 caratteri
    data_iscrizione DATE NOT NULL,
    biografia VARCHAR(500) NOT NULL,
    tipo_studente enum ('fuorisede', 'pendolare', 'in_sede', 'dad') NOT NULL,
    immagine VARCHAR(500) NOT NULL -- Ancora non sappiamo il tipo, per ora faccio finta sia una directory
);

-- CREATE TABLE Admin(
--     utente VARCHAR(100) PRIMARY KEY,
--     data_termine DATE, -- NULL se ancora admin
--     FOREIGN KEY (utente) REFERENCES Utente(email) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- CREATE TABLE Visitatore(
--     utente VARCHAR(100) PRIMARY KEY,
--     biografia VARCHAR(500) NOT NULL,
--     tipo_studente enum ('fuorisede', 'pendolare', 'in_sede', 'dad') NOT NULL,
--     immagine VARCHAR(500) NOT NULL, -- Ancora non sappiamo il tipo, per ora faccio finta sia una directory
--     FOREIGN KEY (utente) REFERENCES Utente(email) ON DELETE CASCADE ON UPDATE CASCADE
-- );

CREATE TABLE Ingrediente(
    nome VARCHAR(20) PRIMARY KEY
);

CREATE TABLE Ricetta(
    nome VARCHAR(50) PRIMARY KEY,
    categoria enum ('fuorisede', 'pendolare', 'in_sede', 'dad') NOT NULL,
    tipo enum ('primo', 'secondo') NOT NULL,
    tempo INT NOT NULL,   -- tempo in secondi
    descrizione VARCHAR(500) NOT NULL,
    -- admin VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    immagine VARCHAR(500) NOT NULL -- Ancora non sappiamo il tipo, per ora faccio finta sia una directory
    -- FOREIGN KEY (admin) REFERENCES Admin(utente) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Preferenza_Ricetta(
    ricetta VARCHAR(50) NOT NULL,
    utente VARCHAR(100) NOT NULL,
    PRIMARY KEY (ricetta, utente),
    FOREIGN KEY (ricetta) REFERENCES Ricetta(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (utente) REFERENCES Utente(email) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Utilizzo(
    ingrediente VARCHAR(20) NOT NULL,
    ricetta VARCHAR(50) NOT NULL,
    quanto_basta BOOLEAN NOT NULL,
    quantita SMALLINT CHECK(quantita>=0),
    unita_misura enum ('g', 'ml', 'num_elementi'),
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
    utente VARCHAR(100),
    commento VARCHAR(500) NOT NULL,
    data DATE NOT NULL,
    voto TINYINT NOT NULL CHECK(voto>0 AND voto<=30),
    PRIMARY KEY (ricetta, utente),
    FOREIGN KEY (ricetta) REFERENCES Ricetta(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (utente) REFERENCES Utente(email) ON DELETE CASCADE ON UPDATE CASCADE
);