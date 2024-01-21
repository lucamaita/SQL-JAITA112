/*
ESERCIZIO LAVORO AUTONOMO
Creare il DB Negozio
Creare la tabella Merci, che avrà id int PK AI, nome varchar, categoria varchar, dataScadenza date, quantità int, prezzo double
Creare la tabella Ordini, che avrà id int PK AI, dataAcquisto date, pezzi int, idMerce int
Che relazione c'è tra le due tabelle? Serve una colonna FK o esiste già tra quelle elencate?
Voglio poi vedere:
Solo le merci in esaurimento (5 pezzi o meno in magazzino)
Solo le merci con il prezzo maggiore
Il prezzo medio delle merci per ogni categoria
Il prezzo medio degli ordini acquistati
Il prezzo medio degli ordini acquistati in base alla categoria
Gli ordini con una spesa totale superiore alla media
Il numero di ordini di merci scadute
Il nome dei prodotti scaduti
Il nome dei prodotti in scadenza (entro 3 giorni dalla data odierna)
Il numero di ordini effettuati per ogni mese
*/

-- Creare il DB Negozio
CREATE DATABASE Negozio;
USE Negozio;

-- Creare la tabella Merci, che avrà id int PK AI, nome varchar, categoria varchar, dataScadenza date, quantità int, prezzo double
CREATE TABLE Merci
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    categoria VARCHAR(150),
    dataScadenza DATE,
    quantita INT,
    prezzo DOUBLE
);

-- Creare la tabella Ordini, che avrà id int PK AI, dataAcquisto date, pezzi int, idMerce int
CREATE TABLE Ordini
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    dataAquisto DATE,
    pezzi INT,
    idMerce INT
);

-- Che relazione c'è tra le due tabelle? Serve una colonna FK o esiste già tra quelle elencate?
# N-N, Una Merce puo essere contenuta in molti ordini, e un ordine puo contenere piu merci.
# Abbiamo gia una FK, ovvero la colonna idMerce nella tabella Ordini

INSERT INTO Merci (nome, categoria, dataScadenza, quantita, prezzo)
VALUES
("Riso Basmati", "Alimenti", '2023-06-30', 50, 2.99),
("Detersivo Liquido", "Pulizia", '2024-02-15', 30, 4.49),
("Olio Extra Vergine di Oliva", "Alimenti", '2023-12-31', 20, 8.99),
("Shampoo Antiforfora", "Bellezza", '2024-05-20', 40, 3.79),
("Batterie AAA", "Elettronica", NULL, 100, 1.99),
("Pasta Penne", "Alimenti", '2023-09-15', 40, 1.29),
("Carta Igienica", "Casa", '2024-04-10', 25, 2.79),
("Sapone Liquido", "Bellezza", '2024-03-01', 35, 1.49),
("Detergente Multiuso", "Pulizia", '2024-06-30', 15, 5.99),
("Acqua Minerale", "Bevande", '2023-08-10', 60, 0.99),
("Caffè in Grani", "Alimenti", '2023-11-30', 25, 6.99),
("Vino Rosso", "Bevande", '2025-02-28', 15, 12.99),
("Cioccolato Fondente", "Dolci", '2024-07-15', 30, 3.49),
("Dentifricio sbiancante", "Bellezza", '2024-04-30', 20, 2.29),
("Pomodori Pelati", "Alimenti", '2023-10-20', 35, 1.79),
("Balsamo per Capelli", "Bellezza", '2024-05-15', 25, 4.99),
("Salmone Affumicato", "Alimenti", '2023-09-10', 15, 9.99),
("Detersivo Lavatrice", "Pulizia", '2024-03-15', 20, 6.49),
("Coca-Cola", "Bevande", '2023-12-01', 5, 1.49),
("Patatine Classiche", "Snack", '2023-11-15', 40, 1.29),
("Deodorante Spray", "Bellezza", '2024-04-20', 30, 2.99);

INSERT INTO Ordini (dataAquisto, pezzi, idMerce) 
VALUES
('2024-01-01', 5, 1),
('2024-01-02', 3, 2),
('2024-01-03', 10, 3),
('2024-01-04', 8, 4),
('2024-01-05', 2, 5),
('2024-01-06', 6, 6),
('2024-01-07', 4, 7),
('2024-01-08', 12, 8),
('2024-01-09', 7, 9),
('2024-01-10', 9, 10);

-- Solo le merci in esaurimento (5 pezzi o meno in magazzino)
SELECT * 
FROM Merci
WHERE Merci.Quantita <= 5;

-- Solo le merci con il prezzo maggiore
SELECT *
FROM Merci
HAVING prezzo = (SELECT MAX(prezzo) FROM Merci);

-- Il prezzo medio delle merci per ogni categoria
SELECT Categoria, AVG(prezzo)
FROM Merci
GROUP BY Categoria;

-- Il prezzo medio degli ordini acquistati
SELECT AVG (Merci.prezzo) AS PrezzoMedio
FROM Ordini
JOIN Merci ON Ordini.idMerce = Merci.id;
