#			Relazione N-N

# La relazinoe N-N in SQL non ESISTE nella realta.
# In  SQL la relazione N-N viene solo simulata, spezzandola in due relazioni 1-N.

# Quali relazioni esistono in SQL? 1-1 e 1-N (si puo simulare la relazione N-N con due relazioni 1-N)
# Quali relazioni esistono? 1-1, 1-N, e N-N

# In una relazione N-N ogni record della tabella 1 si collega a N record della tabella 2 e viceversa.

CREATE DATABASE Universita;
USE Universita;

CREATE TABLE Studenti
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    cognome VARCHAR(100),
    dob DATE,
    facolta VARCHAR(150)
);

CREATE TABLE Esami
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    crediti INT,
    modalita VARCHAR(100)
);

# TABELLA ASSOCIATIVA: Sara una tabella che colleghera Studenti a Esami simulando la relazione N-N
CREATE TABLE EsamiSostenuti
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    idStudente INT,
    idEsame INT,
    dataEsame DATE,
    voto INT,
    aula VARCHAR(100),
    professore VARCHAR(150),
    FOREIGN KEY(idStudente) REFERENCES Studenti(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    FOREIGN KEY(idEsame) REFERENCES Esami(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

INSERT INTO Studenti (nome, cognome, dob, facolta) VALUES
('Mario', 'Rossi', '2001-03-15', 'Ingegneria'),
('Giulia', 'Verdi', '1999-08-22', 'Medicina'),
('Luca', 'Bianchi', '1998-05-10', 'Economia'),
('Alessia', 'Neri', '2000-11-28', 'Ingegneria'),
('Paolo', 'Gialli', '1997-09-18', 'Economia'),
('Elena', 'Rosa', '2003-02-20', 'Medicina'),
('Riccardo', 'Azzurri', '1997-06-05', 'Lettere'),
('Martina', 'Verdi', '2002-01-14', 'Ingegneria'),
('Marco', 'Gialli', '2003-04-25', 'Lettere'),
('Laura', 'Rossi', '1999-08-20', 'Medicina'),
('Federico', 'Bianchi', '1997-12-03', 'Economia'),
('Valentina', 'Neri', '2000-07-30', 'Ingegneria');

SELECT * FROM Studenti;

INSERT INTO Esami (nome, crediti, modalita) VALUES
('Analisi Matematica I', 10, 'Scritto'),
('Biologia Molecolare', 8, 'Orale'),
('Economia Politica', 6, 'Scritto'),
('Storia dell''Arte', 5, 'Orale'),
('Programmazione Avanzata', 12, 'Scritto'),
('Anatomia Umana', 8, 'Scritto'),
('Statistica Applicata', 6, 'Scritto'),
('Letteratura Italiana', 7, 'Orale'),
('Fisica Quantistica', 10, 'Scritto'),
('Chimica Organica', 9, 'Orale');

SELECT * FROM Esami;

INSERT INTO EsamiSostenuti (idStudente, idEsame, dataEsame, voto, aula, professore) VALUES
(1, 1, '2023-01-15', 28, 'Aula 101', 'Prof. Rossi'),
(2, 4, '2022-12-10', 25, 'Aula 102', 'Prof. Bianchi'),
(3, 7, '2023-02-05', 30, 'Aula 201', 'Prof. Verdi'),
(4, 2, '2022-11-20', 22, 'Aula 103', 'Prof. Gialli'),
(5, 9, '2023-03-12', 26, 'Aula 202', 'Prof. Neri'),
(1, 5, '2022-10-25', 30, 'Aula 104', 'Prof. Azzurri'),
(3, 3, '2022-09-18', 28, 'Aula 203', 'Prof. Rosa'),
(2, 8, '2023-04-08', 23, 'Aula 105', 'Prof. Azzurri'),
(4, 6, '2022-08-30', 27, 'Aula 204', 'Prof. Verdi'),
(5, 10, '2023-05-20', 25, 'Aula 106', 'Prof. Gialli');

SELECT * FROM EsamiSostenuti;

# Voglio vedere tutti i dati relazionati tra loro
SELECT 	*
FROM 	Studenti INNER JOIN EsamiSostenuti ON Studenti.id = EsamiSostenuti.idStudente
				 INNER JOIN Esami		   ON Esami.id = EsamiSostenuti.idEsame;
# OCCHIO! Dalla seconda JOIN di fila in poi ricordatevi che farete la JOIN tra il risultato della prima e la seconda

# Voglio vedere soli nominativi degli studenti che hanno sostenuto l'esame di anatomia
SELECT 	Studenti.nome, Studenti.cognome, Esami.nome
FROM 	Studenti INNER JOIN EsamiSostenuti ON Studenti.id = EsamiSostenuti.idStudente
				 INNER JOIN Esami		   ON Esami.id = EsamiSostenuti.idEsame
WHERE 	Esami.nome = "Anatomia Umana";

-- ESERCIZI
-- Voglio vedere nominativo, il nome dell'esame e la data di ogni esame non superato
SELECT 	Studenti.nome, Studenti.cognome, Esami.nome, EsamiSostenuti.dataEsame
FROM 	Studenti INNER JOIN EsamiSostenuti ON Studenti.id = EsamiSostenuti.idStudente
				 INNER JOIN Esami		   ON Esami.id = EsamiSostenuti.idEsame
WHERE 	EsamiSostenuti.voto < 18;

-- Voglio vedere il voto medio di ogni studente (nella media i voti insufficienti(sotto il 18) non vengono calcolate)
SELECT 	Studenti.id, Studenti.nome, AVG(CASE WHEN voto >= 18 THEN voto ELSE NULL END) AS VotoMedio
FROM 	Studenti INNER JOIN EsamiSostenuti ON Studenti.id = EsamiSostenuti.idStudente
				 INNER JOIN Esami		   ON Esami.id = EsamiSostenuti.idEsame
GROUP BY Studenti.id, Studenti.nome;

-- Voglio vedere il nominativo degli studenti che hanno preso il voto maggiore
SELECT 	Studenti.nome, Studenti.cognome, voto
FROM 	Studenti INNER JOIN EsamiSostenuti ON Studenti.id = EsamiSostenuti.idStudente
				 INNER JOIN Esami		   ON Esami.id = EsamiSostenuti.idEsame
WHERE 	voto = (SELECT MAX(voto) FROM EsamiSostenuti);

-- Voglio vedere il numero di studenti che hanno dato esami per ogni professore
SELECT 		professore, COUNT(idStudente)
FROM 		Studenti INNER JOIN EsamiSostenuti ON Studenti.id = EsamiSostenuti.idStudente
					INNER JOIN Esami		   ON Esami.id = EsamiSostenuti.idEsame
GROUP BY 	professore;

-- Voglio vedere il voto maggiore e il nome dello studente che lo ha ottenuto per ogni esame
SELECT 		Esami.nome, MAX(EsamiSostenuti.voto), Studenti.nome
FROM 		Studenti INNER JOIN EsamiSostenuti ON Studenti.id = EsamiSostenuti.idStudente
					 INNER JOIN Esami		   ON Esami.id = EsamiSostenuti.idEsame
GROUP BY	Esami.id, Esami.nome, Studenti.nome;

-- Voglio vedere per ogni studente il numero di esami sostenuti, il numero di esami superati e il numero di esami non superati (<18)
SELECT		Studenti.id, Studenti.nome,
			COUNT(EsamiSostenuti.idStudente) AS EsamiSostenuti,
            SUM(EsamiSostenuti.voto >= 18) AS EsamiPassati,
            SUM(EsamiSostenuti.voto < 18) AS EsamiNonPassati
FROM 		Studenti INNER JOIN EsamiSostenuti ON Studenti.id = EsamiSostenuti.idStudente
					 INNER JOIN Esami		   ON Esami.id = EsamiSostenuti.idEsame
GROUP BY 	Studenti.id, Studenti.nome;

-- BONUS
-- Voglio vedere i crediti totali di ogni studente, immaginando che basti superare l'esame per prendere l'intero valore dei crediti
SELECT 		Studenti.id, Studenti.nome, SUM(Esami.crediti)
FROM 		Studenti INNER JOIN EsamiSostenuti ON Studenti.id = EsamiSostenuti.idStudente
					 INNER JOIN Esami		   ON Esami.id = EsamiSostenuti.idEsame
WHERE		EsamiSostenuti.voto >= 18
GROUP BY	Studenti.id, Studenti.nome;

-- Aggiungere la tabella Facolta, che avrà id, nomeFacolta, citta e collegarla alla tabella studenti.
CREATE TABLE Facolta
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nomeFacolta VARCHAR(150),
    citta VARCHAR(100)
);

INSERT INTO Facolta (nomeFacolta, citta) VALUES
('Universita1', 'Citta1'),
('Universita2', 'Citta2'),
('Universita3', 'Citta3');

-- Riempire la tabella facolta
-- Voglio vedere per ogni facoltà il numero di studenti presenti
-- Voglio vedere solo i nominativi degli studenti senza crediti
-- Voglio vedere le facoltà senza studenti
-- Voglio vedere gli esami non sostenuti
-- Voglio vedere per ogni facoltà il numero totale di esami sostenuti e la percentuale di esami passati
-- Voglio vedere la facolta con il maggior numero di studenti
-- Voglio vedere l'età media per ogni facoltà










