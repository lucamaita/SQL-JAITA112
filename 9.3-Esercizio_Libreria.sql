CREATE DATABASE libreria;
USE libreria;

CREATE TABLE libri
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(100),
    genere VARCHAR(100),
    numero_pagine INT,
    casa_editrice VARCHAR(100),
    prezzo DOUBLE,
    idAutore INT,
    FOREIGN KEY(idAutore) REFERENCES Autori(id)
    ON UPDATE CASCADE ON DELETE SET NULL
);
DROP TABLE libri;
CREATE TABLE autori
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cognome VARCHAR(100),
    dob DATE,
    nazionalita VARCHAR(100),
    biografia TEXT
);
DROP TABLE autori;
SELECT * FROM libri;
SELECT * FROM autori;

INSERT INTO autori (nome, cognome, dob, nazionalita, biografia) VALUES
('J.K.', 'Rowling', '1965-07-31', 'Britannica', 'Joanne Rowling è una scrittrice britannica...'),
('Stephen', 'King', '1947-09-21', 'Americana', 'Stephen Edwin King è uno scrittore statunitense...'),
('Agatha', 'Christie', '1890-09-15', 'Britannica', 'Agatha Mary Clarissa Christie è stata una scrittrice...'),
('J.R.R.', 'Tolkien', '1892-01-03', 'Britannica', 'John Ronald Reuel Tolkien è stato un filologo...'),
('Gabriel', 'García Márquez', '1927-03-06', 'Colombiana', 'Gabriel José de la Concordia García Márquez...'),
('Jane', 'Austen', '1775-12-16', 'Britannica', 'Jane Austen è stata una scrittrice britannica...');

INSERT INTO libri (titolo, genere, numero_pagine, casa_editrice, prezzo, idAutore) VALUES
('Harry Potter e la Pietra Filosofale', 'Fantasy', 336, 'Salani Editore' ,20.50, 1),
('It', 'Horror', 1138, 'Mondadori', 25.99, 2),
('Assassinio sull''Orient Express', 'Mystery', 256,'Mondadori',18.75, 3),
('Il Signore degli Anelli', 'Fantasy', 1216,'Bompiani',32.00, 4),
('Cent\'anni di solitudine', 'Magic Realism', 417, 'Feltrinelli' ,22.95, 5),
('Orgoglio e pregiudizio', 'Romance', 279, 'Mondadori' ,16.99, 6);












