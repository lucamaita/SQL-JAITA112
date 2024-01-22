#		RELAZIONE 1-1

# L'idea di base e di avere un record della tabella 1 che abbia una sola corrispondenza con un solo record della tabella 2

CREATE DATABASE Azienda;
USE Azienda;

CREATE TABLE Persone
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cognome VARCHAR(150),
    dob DATE,
    residenza VARCHAR(200),
    codiceFiscale VARCHAR(17),
    genere CHAR
);

SELECT * FROM Persone;

INSERT INTO Persone (nome, cognome, dob, residenza, codiceFiscale, genere) VALUES
('Mario', 'Rossi', '1990-05-15', 'Roma', 'RSSMRA90M15H501D', 'M'),
('Giulia', 'Verdi', '1985-12-08', 'Milano', 'VRDGLI85T08H501A', 'F'),
('Luca', 'Bianchi', '1995-07-23', 'Napoli', 'BNCLUA95L23H501F', 'M'),
('Alessia', 'Neri', '1980-03-10', 'Firenze', 'NRALSS80C10H501C', 'F'),
('Paolo', 'Gialli', '1988-09-18', 'Torino', 'GLLPLA88P18H501Z', 'M'),
('Elena', 'Rosa', '1993-11-30', 'Palermo', 'RSAELN93M30H501X', 'F'),
('Riccardo', 'Azzurri', '1975-06-05', 'Bologna', 'ZZRRCD75H05H501L', 'M'),
('Martina', 'Verdi', '1987-02-14', 'Genova', 'VRDMTN87B14H501K', 'F'),
('Marco', 'Gialli', '1992-04-25', 'Catania', 'GLLMRC92D25H501I', 'M'),
('Laura', 'Rossi', '1983-08-20', 'Venice', 'RSSLRA83M20H501Y', 'F');

CREATE TABLE Dipendenti
(
	id INT PRIMARY KEY,
    mansione VARCHAR(150),
    anniEsperienza INT,
    stipendio DECIMAL(7,2),
    reparto VARCHAR(150),
    tipoContratto VARCHAR(100),
    FOREIGN KEY(id) REFERENCES Persone(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO Dipendenti (id, mansione, anniEsperienza, stipendio, reparto, tipoContratto) VALUES
(1, 'Programmatore', 5, 60000.00, 'Sviluppo Software', 'Tempo Indeterminato'),
(2, 'Marketing Specialist', 7, 55000.00, 'Marketing', 'Tempo Indeterminato'),
(3, 'Amministrativo', 10, 65000.00, 'Amministrazione', 'Tempo Indeterminato'),
(4, 'Responsabile Progetti', 8, 70000.00, 'Gestione Progetti', 'Tempo Indeterminato'),
(5, 'Risorse Umane', 6, 50000.00, 'Risorse Umane', 'Tempo Indeterminato'),
(6, 'Analista Finanziario', 9, 75000.00, 'Finanza', 'Tempo Indeterminato'),
(7, 'Programmatore', 3, 55000.00, 'Sviluppo Software', 'Tempo Indeterminato'),
(8, 'Risorse Umane', 5, 48000.00, 'Risorse Umane', 'Tempo Indeterminato'),
(9, 'Responsabile Progetti', 12, 80000.00, 'Gestione Progetti', 'Tempo Indeterminato'),
(10, 'Amministrativo', 8, 62000.00, 'Amministrazione', 'Tempo Indeterminato');

SELECT * FROM Dipendenti;

DROP TABLE Dipendenti;

# Voglio vedere tutti i dati complessivi di ogni persona
SELECT *
FROM Persone LEFT JOIN Dipendenti ON Persone.id = Dipendenti.id;

# Voglio vedere il nominativo della persona piu anziana
SELECT 	CONCAT(nome," ",cognome) AS Nominativo,
		TRUNCATE(DATEDIFF(NOW(),dob)/365.25,0) AS Eta
FROM 	Persone
WHERE 	dob = (SELECT MIN(dob) FROM Persone);

# Voglio vedere il nominativo della persona con lo stipendio maggiore
SELECT	CONCAT(nome," ",cognome) AS Nominativo
FROM 	Persone LEFT JOIN Dipendenti ON Persone.id = Dipendenti.id
WHERE	Dipendenti.stipendio = (SELECT MAX(stipendio) FROM Dipendenti);

# Voglio vedere lo stipendio medio in base alla mansione
SELECT 	Dipendenti.mansione, AVG(stipendio)
FROM 	Dipendenti
GROUP BY mansione;

# Voglio vedere il numero di persone in base al loro tipo di contratto
SELECT 		tipoContratto, COUNT(id)
FROM 		dipendenti
GROUP BY	tipoContratto;

# Voglio vedere il nominativo e il numero di anni che mancano alla pensione (la pensione avviene a 70 anni compiuti o a 45 lavorati)
SELECT 	CONCAT(nome," ",cognome) AS Nominativo,
		TRUNCATE(DATEDIFF(NOW(),dob)/365.25,0) AS Eta,
        anniEsperienza,
        LEAST(70 - TRUNCATE(DATEDIFF(CURDATE(), dob) / 365.25,0), 45 - anniEsperienza) AS anniMancantiPensione
FROM 	Persone LEFT JOIN Dipendenti ON Persone.id = Dipendenti.id;

# Voglio vedere lo stipendio medio in base al genere
-- Le medie in questo caso specifico coincidono, ma sono due calcoli separati, facendo un update degli stipendi si puo controllare.
SELECT Genere, AVG(Dipendenti.stipendio) AS Media_Stipendio
FROM Persone LEFT JOIN Dipendenti ON Persone.id = Dipendenti.id
GROUP BY Genere;	

# Voglio vedere il nominativo della persona che prende lo stipendio maggiore in base alla mansione
 
# Voglio vedere quante persone prendono uno stipendio inferiore allo stipendio medio generale

# Voglio vedere l'eta media in base alla tipologia di contratto

