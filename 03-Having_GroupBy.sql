
#				HAVING e GROUP BY

# GROUP BY -> e una parola chiave che serve a raggruppare in base ai dati della/e colonna/e passate.

# Per lanciare veloce una query dovete in primis ricordarvi sempre i ; finali
# Dovete essere con il cursore dentro la query che volete lanciare e poi cliccare CTRL+ENTER
CREATE DATABASE Motorizzazione;

USE Motorizzazione;

# PRIMARY KEY: le PK possono essere di due tipi: NATURALI O ARTIFICIALI
# id e la classica PK artificiale, mentre il codice fiscale e il classico esempio di PK naturale.
# Dato che le PK naturali possono ripetersi, spesso sono usate in accostamento a una PK artificiale come l'id.
# In quel caso per identificare un record serve usare la combo delle PK della tabella.

CREATE TABLE macchine
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(100),
    modello VARCHAR(100),
    colore VARCHAR(200),
    cavalli INT,
    elettrico BOOL,
    costo DOUBLE,
    targa VARCHAR(7),
    porte INT,
    neopatentati BOOL,
    autonomia INT
);

INSERT INTO macchine
(marca, modello, colore, cavalli, elettrico, costo, targa, porte, neopatentati, autonomia)
VALUES
("Tesla", "Model 3", "Blu", 280, 1, 55000.00, "UV567WX", 4, 1, 400),
("Ford", "Focus", "Rosso", 120, 0, 16000.00, "YZ890AB", 3, 1, 300),
("Renault", "Twingo", "Verde", 80, 1, 19000.50, "CD123EF", 3, 1, 240),
("Toyota", "Prius", "Nero", 130, 1, 27000.75, "GH456IJ", 5, 0, 850),
("BMW", "X5", "Bianco", 350, 0, 75000.25, "KL789MN", 5, 0, 450),
("Renault", "Clio", "Blu", 75, 1, 18200.00, "OP234QR", 3, 1, 255),
("Ford", "Fiesta", "Giallo", 110, 0, 17500.00, "ST567UV", 3, 1, 800),
("Toyota", "Supra", "Grigio", 140, 1, 29000.00, "WX890YZ", 5, 0, 820);

DROP TABLE macchine;

SELECT * FROM macchine;

# Voglio vedere solo le marche senza rietizioni
SELECT marca
FROM Macchine
GROUP BY marca;

# Voglio vedere le macchine raggruppate per marca e modello
SELECT marca, modello
FROM Macchine
GROUP BY marca, modello;

# Voglio vedere tutti i colori disponibili nella tabella
SELECT colore
FROM macchine
GROUP BY colore;

# Voglio vedere per ogni marca quante macchine ci sono
SELECT marca, COUNT(id) AS Macchine
FROM macchine
GROUP BY marca;

# nel COUNT voglio vedere solo * o PK!! (lavora insieme a GROUP BY)

# FUNZIONE DI GRUPPO
#	Sono funzioni che di base tendono a compattare i record restituendo di base solo un risultato totale.
# 	Le funzioni di gruppo sono solo 5:
#		1- COUNT()
#		2- SUM()
#		3- MAX()
#		4- MIN()
#		5- AVG()
#	Tutte le funzioni di gruppo tranne COUNT vogliono un solo argomento, che deve essere per forza di tipo numerico.

# Voglio vedere il prezzo piu alto
# Sbagliato:
# MAI mettere una funzione di gruppo direttamente nel where, perche il where non e capace di usarle.
SELECT costo
FROM macchine
WHERE MAX(costo);

# Corretto
SELECT MAX(costo) AS Prezzo
FROM macchine;

#Voglio vedere la macchina con il prezzo maggiore
# Sbagliato
SELECT MAX(costo) AS Prezzo, marca, modello
FROM macchine;

# Nelle versioni vecchie vi permette di accostare a una funzione di gruppo nel select anche altre colonne.
# ATTENZIONE, le altre colonne non saranno mai (se non per caso) corrette, perche le funzioni di gruppo compattano i record,
# e di conseguenza il risultato che vedrete saranno i dati del primo record della tabella.
# Nelle versioni recenti per evitare questo problema vi segnala direttamente un errore.

# Corretto
SELECT *
FROM Macchine
WHERE costo = (SELECT MAX(costo) FROM Macchine);

# La query nelle tonde si chiama SUBQUERY e di questa subqeury io uso il valore risultatne, che attenzione, 
# deve essere per forza un valore singolo, altrimenti ci dara errore.
# Se volete vedere nel select il risultato di una funzione di gruppo, accostato a altre colonne, dovete per forza
# mettere quella funzione di gruppo in una SUBQUERY, altrimenti i risultati saranno di nuovo schiacciati,
# facendovi vedere dei record sballati

#	HAVING
# Voglio vedere solo i colori ripetuti 2 o piu volte
# STEP 1: Trovo l'insieme corretto e completo dei dati che mi servono
SELECT *
FROM macchine;

# STEP 2: Vedo se devo togliere con un WHERE qualche record dalla tabella
# STEP 3: Vedo se devo raggruppare per qualche valore
SELECT colore
FROM macchine
GROUP BY colore;

# STEP 4: Vedo se devo applicare delle funzioni di gruppo
SELECT colore, COUNT(id)
FROM macchine
GROUP BY colore;

# STEP 5: Vedo se alla funzione di gruppo devo applicare una condizione
SELECT colore, COUNT(id)
FROM macchine
GROUP BY colore
HAVING COUNT(id) >= 2;

# STEP 6: vedo se devo ordinare i dati
# STEP 7: Pulisco le colonne tenendo nel select solo quelle che mi interessano
SELECT colore, COUNT(id) AS Macchine
FROM macchine
GROUP BY colore
HAVING COUNT(id) >= 2;

# Finalmente possiamo avere gli ordini completi, che sarnanno:
# ORDINE SCRITTURA				ORDINE DI ESECUZIONE
# 	select							from
# 	from							where
# 	where							group by
# 	group by						having
# 	having							order by
# 	order by						select

# ATTENZIONE AI NOMI!
# SQL ---> e il nome del linguaggio (puo essere trasversale su diversi DBMS, relazionali e non)
# MySQL -> e il nome della piattaforma che contiene WorkBench, Server, etc.. 
#	 	Ogni DBMS e solitamente una piattaforma a se stante 
# 		(cioe potrebbe cambiare leggermente alcuni comandi del linguaggio che sfrutta, 
# 		 creando "dialetti" leggermente diversi tra loro)