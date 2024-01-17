#
#		CONSEGNA
# Creare il database Mondadori
# Creare la tabella Libri che avra come colonne: id INT PK AI, titolo, autore, genere, numero_pagine
# Inserire almeno 5 libri
# Scrivere una query che vi permetta di vedere tutti i dati inseriti
# Aggiungete la colonna prezzo
# Riempite il prezzo di ogni libro, sapendo che il calcolo sara 3 + 0.0005 per ogni pagina
# Voglio poi vedere:
# 	- i titoli di tutti i libri di un genere a vostra scelta
# 	- I titoli dei libri che sono di genere horror e dell"autore King
# 	- I libri che hanno piu di 100 pagine
# 	- I libri che hanno un prezzo compreso tra 10 e 15 euro
#	- I titoli in ordine alfabetico per genere e autore 

# Creare il database Mondadori
CREATE DATABASE Mondadori;

USE Mondadori;

# Creare la tabella Libri che avra come colonne: id INT PK AI, titolo, autore, genere, numero_pagine
CREATE TABLE Libri
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    Titolo VARCHAR(50),
    Autore VARCHAR(50),
    Genere VARCHAR(50),
    Pagine INT
);

# Inserire almeno 5 libri
INSERT INTO Libri (titolo, autore, genere, pagine)
VALUES
("Il Grande Gatsby", "F. Scott Fitzgerald", "Romanzo", 180),
("Il signore degli anelli", "J.R.R. Tolkien", "Fantasy", 1178),
("1984", "George Orwell", "Dystopian", 328),
("Shining", "Stephen King", "Horror", 447),
("Cronache di Narnia", "C.S. Lewis", "Fantasy", 767),
("La ragazza con il drago tatuato", "Stieg Larsson", "Thriller", 658),
("It", "Stephen King", "Horror", 1138),
("La lunga marcia", "Stephen King (come Richard Bachman)", "Distopia", 384),
("Cime tempestose", "Emily Brontë", "Romanzo", 342),
("Il nome della rosa", "Umberto Eco", "Mistero", 552),
("Il codice Da Vinci", "Dan Brown", "Mistero", 592),
("Carrie", "Stephen King", "Horror", 290),
("Il miglio verde", "Stephen King", "Horror", 480),
("Don Chisciotte", "Miguel de Cervantes", "Romanzo", 1072),
("Orgoglio e pregiudizio", "Jane Austen", "Romanzo", 432),
("La zona morta", "Stephen King", "Horror", 594);

# Scrivere una query che vi permetta di vedere tutti i dati inseriti
SELECT * FROM Libri;

# Aggiungete la colonna prezzo
ALTER TABLE Libri
ADD COLUMN Prezzo DECIMAL (6,2);

# Riempite il prezzo di ogni libro, sapendo che il calcolo sara 3 + 0.0005 per ogni pagina
# Ho cambiato la moltiplicazione per il prezzo per testare la funzione prezzo >10 <15
UPDATE Libri
SET Prezzo = 3 + (0.05 * Pagine)
WHERE id;

# 	- i titoli di tutti i libri di un genere a vostra scelta
SELECT *
FROM Libri
WHERE Genere = "Horror";

# 	- I titoli dei libri che sono di genere horror e dell"autore King
SELECT *
FROM Libri
WHERE Genere = "Horror" AND Autore = "Stephen King";

# 	- I libri che hanno piu di 100 pagine
SELECT *
FROM Libri
WHERE Pagine > 100;

# 	- I libri che hanno un prezzo compreso tra 10 e 15 euro
SELECT *
FROM Libri
WHERE Prezzo >= 10 AND Prezzo <= 15;

#	- I titoli in ordine alfabetico per genere e autore 
SELECT *
FROM Libri
ORDER BY genere, autore;
