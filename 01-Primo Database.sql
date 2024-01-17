-- Commento monoriga (lo spazione DEVE esserci)
# Commento monoriga
/*
 Commento multiriga
*/

#					ATTENZIONE!!!!
# RICORDATEVI SEMPRE CHE E' IL SERVER AD AVERE RAGIONE, NON LO SCRIPT!

#COMANDO: Creazione di un database chiamato PrimoDataBase
CREATE DATABASE PrimoDB112;

# DETTAGLI
# 	1) SQL NON e' CaseSensitive, cioè non gli interessa se scrite in CAPS o in minuscolo: per lui è uguale.
# 		La convezione però ci dice di scrivere in CAPS le parole che sono comandi 
# 		(cioè tutte le parole scritte in grassetto colorate o in generale diverse dal nero classico)
# 	2) In SQL non basta scrivere lo script ma va lanciato affinchè sia eseguito relamente dal server.
# 		ATTENZIONE! Lanciare lo script è come incidere i comandamenti su pietra: una volta fatto è molto 
#		molto molto difficile tornare indietro, spesso è impossibile senza scrivere nuovi comandi.
# 	3) Una volta eseguito lo script, per SQL quello script non ha più valore.
# 		Per eseguire uno script si deve evidenziare tutto il comando, dalla prima lettera fino al ; 
#		e cliccare sul fulmine "libero" da altri disegni(il primo della fila)

#COMANDO: Usa il database PrimoDB112
USE PrimoDB112;

# DETTAGLI
# 	USE Serve per indicare quale datebase usare, cioè su quale DB salvare le cose che volete fare.
# 	RICORDATEVI di lanciare il comando USE ogni volta che cambiate database o che riaprite MySQL.

#COMANDO: Creare la tabella Persone
CREATE TABLE Persone
(
	nome VARCHAR(60),
    cognome VARCHAR(80),
    citta_residenza VARCHAR(50),
    dob DATE,
    stipendio DOUBLE,
    #stipendio2 DECIMAL(7,2),
    numero_civico INT,
    sposato BOOL
);

# DETTAGLI
#	1) Le convenzioni ci dicono che i nomi delle tabelle devono essere al plurale, perchè rappresentano 
#		molti record diversi allo stesso tempo (i record si possono anche chiamare righe o tuple)
#	2) Quando create una tabella dovete scrivere le colonne che la formeranno: le colonne si scrivono mettendo
#		prima il nome della colonna e dopo il tipo di dato che ci vogliamo salvare dentro.
#		Se ci sono caratterische ulteriori vanno posizionate dopo il tipo.
#	3) I nomi composti solitamente sono scritti con un underscore(_) tra le parole (ES. numero_civico), cioè in snake_case
#		Sono accettati i nomi con gli accenti, ma poichè spesso le tabelle devono interagire con linguaggi come Java
#		di prassi è sconsigliato usare nomi accettanti (perchè quando Java parlerà con MySQL gli accenti potrebbero dare fastidio)
#	4) I tipi in SQL sono i seguenti:
#		- CHAR ------------> Identifica un singolo carattere (ES. M o F)
#		- VARCHAR ---------> Identifica un insieme di caratteri. 
#							  Se senza tonde possiamo inserire fino a 65535 caratteri.
#							  Se le tonde sono presenti il numero massimo di caratteri sarà quello indicato 
#							  nelle parentesi.
#		- INT -------------> Identifica un numero intero che va da 	-2147483648 a 	2147483647
#		- DOUBLE/FLOAT ----> Identifica un numero decimale che può avere fino a 65 cifre totali
#		- NUMERIC ---------> Identifica un numero decimale in cui la prima cifra tra le tonde indica il numero 
#								totale di cifre, mentre la seconda indica il numero totale di decimali tra quelli 
#								indicati (ES NUMERIC(5,2) comprende tutti i numeri tra -999,99 e 999,99)
#		- BOOL/BOOLEAN ----> Identifica un valore TRUE/FALSE, dove 1 rappresenta TRUE e 0 rappresenta FALSE
#		- BIT -------------> Identifica i bit di un dato (saranno valori formati da 0 e 1). 
#								In altri DBMS come SQL Server, può rappresentare un valore booleano.
#		- DATE ------------> Identifica una data, formattata con il pattern YYYY-MM-GG

# COMANDO: Visualizzare una tabella
SELECT *
FROM	persone;

# DETTAGLI
# 	Questo comando si chiama QUERY ed e un interrogazione.
# 	1) La parola SELECT serve a dire quali colonne vogliamo vedere.
# 		Se scriviamo * (si legge ALL) significa che vogliamo vedere tutte le colonne della tabella/e e del FROM
#	2) La parola FROM serve a dire quale tabella vogliamo usare come pool di dati 
# 		(cioe quale tabella ci serve per trovare i dati che vogliamo)

# COMANDO: Inserire dati in tabella
# TUPLA (o record): una riga intera della tabella
# CELLA: Un singolo campo della riga
INSERT INTO Persone
VALUES
("Pino","Pane","Milano","1999-09-25",1345.54,2,1),
("Alice","Bensanelli","Zelo","1997-04-23",1490.60,24,0),
("Ella","Cinder","Londra","1956-12-29",0.0,100,1);

# DETTAGLI
# 	1) 	In MySQL e permesso l'inserimento multiplo di record, come scritto nell'esempio sopra.
#	2)	Dopo il nome della tabella voi potete scegliere se valorizzare tutte le colonne nell'ordine (come nell'esempio sopra)
# 			o se valorizzare solo alcune colonne. Nel secondo caso dovrete scrivere il nome della tabella delle tonde con 
#			all'interno il nome delle colonne che volete valorizzare. (ES INSERT INTO Persone (nome,cognome) VALUES....)
#			ATTENZIONE! L'ordine dei valori inseriti deve essere lo stesso delle colonne indicate.
#	3)	Il testo e le date vogliono gli apici, i numeri e i booleani no.
# 	4)	Seppur MySQL in base alle versioni accetti sia " che ' come identificatore di testo, e caldamento consigliato
#			l'uso di " perche ci salva da tutte quelle situazioni in cui il testo comprende l'apostrofo(').
#			Se mai dovesse capire di non poter usare "" l'unica soluzione sarebbe quella di inserire uno
#			slash(/) prima dell'apostrofo nel testo (ES. 'O/'Connor')

# COMANDO: Modificare una tabella gia esistente
# Rinominare una tabella
RENAME TABLE vecchio_nome TO nuovo_nome;

# Cancellare una tabella (Strumento super pericoloso!)
DROP TABLE nome_tabella;
#NB: DROP vale anche per i DB (DROP DATABASE nome_db) -> Cancella tutto

# Aggiungere una colonna
# AFTER: inserisce la colonna dopo la colonna specificata
# FIRST: inserisce la colonna all'inizio della tabella
# Se non specifisco la posizione, verra creata alla fine.
ALTER TABLE Persone
ADD COLUMN indirizzo VARCHAR(150) AFTER stipendio;

# Modificare una colonna (Solo Tipologia)
ALTER TABLE Persone
MODIFY COLUMN indirizzo VARCHAR(100);

# Modificare una colonna (Nome + Tipologia)
ALTER TABLE Persone
CHANGE COLUMN indirizzo indirizzo_residenza VARCHAR(100);

# Cancellare una colonna e il suo contenuto
ALTER TABLE Persone
DROP COLUMN nome_colonna;

# COMANDO: Giocare coi record (coi dati)
# Eliminare un record (ATTENZIONE!!!)
DELETE FROM Persone
WHERE id = 3; 
# Colonna = valore, cancella tutti i record che corrispondono 
#			(citta_residenza = "milano" cancellero tutti i record con residenza a milano)
# 			Per questo motivo di solito si usa come colonna una colonna definita PRIMARY KEY
# 			perche la PK e l'unica colonna della tabella ad avere come vincolo il fatto di essere completamente valorizzata e di non essere mai doppia.

# Dato che ci serve una PK per superare la SAFE MODE (che non dovreste mai disabilitare) dobbiamo aggiungerla alla tabella
# gia creata e dobbiamo anche popolare la colonna prima di poter usare suddetta per effettuare il DELETE quindi faremo:

ALTER TABLE Persone
ADD id INT PRIMARY KEY AUTO_INCREMENT FIRST;

# DETTAGLI
# 	1) PRIMARY KEY (PK) indica che quella colonna avra due caratteristiche: mai vuota e mai doppia.
# 	2) AUTO_INCREMENT e una caratteristica tipica della PK numerica e server per far si che ogni numero si 
#		incrementi da solo senza che noi dobbiamo preoccuparcene

INSERT INTO Persone
(nome, cognome, citta_residenza, dob, stipendio, indirizzo_residenza, numero_civico, sposato)
VALUES
("Ken","O'Connor","Milano","1967-09-03",1234.09,"Via Dei matti",0,1),
("John","Smith","Londra","1999-01-31",234.0,null,null,1);

# Modificare un record esistente
UPDATE Persone
SET indirizzo_residenza = "Piazza Plebiscito"
WHERE id = 1 OR id = 2;

UPDATE Persone
SET indirizzo_residenza = "Piligram Street", numero_civico = 7
WHERE id = 5;

SELECT * FROM persone;

# DDL -> Data Definition Language (Operazioni sulla struttura(tabelle, DB, colonne))
# DML -> Data Manipulation Language (Operazioni sui dati(insert, delete, update))
# DQL -> Data Query Language (Interrogazione sui dati (select))
# DCL -> Data Control Language (Operazioni di controllo sui dati)

# Voglio vedere solo la colonna nome, cognome e citta
SELECT nome, cognome, citta_residenza
FROM Persone;

# Voglio vedere solo i residenti a Milano
SELECT 	*
FROM 	Persone
WHERE 	citta_residenza = "milano";
# WHERE serve per filtrare i record e tenere solo quelli che combaciano con i nostri desideri

# Voglio vedere solo i nominativi delle persone sposate residenti a milano
SELECT 	CONCAT(nome," ",cognome) AS Nominativo, 
		citta_residenza AS residenza, 
		sposato
FROM 	Persone
WHERE	citta_residenza = "milano" AND sposato IS TRUE;

# AS serve a creare un alias.
# Se messo nel SELECT cambia solo in stampa il nome della colonna
# Se messo nel FROM cambia il nome della tabella per tutta la durata della query
# AS ha 2 forma:
#	- AS nome ---> Non vuole gli spazi e quel nome puo essere richiamato nel codice se messo nel posto giusto
#	- AS "nome" -> Puo avere spazi ma non potra essere usato per richiamare l'elemento

# Voglio vedere per ogni persona il suo nominativo, la sua data di nascita e la sua eta
SELECT 	CONCAT(nome," ",cognome) AS Nominativo,
		dob AS "Data di nascita",
		TRUNCATE(DATEDIFF(NOW(),dob)/365.25,0) AS Eta
FROM 	Persone;

# Funzioni scalari
# 	TRUNCATE --> Serve per 'troncare' senza arrotondamento un numero al decimale indicato come secondo parametro
#		Eempio:
#			TRUNCATE(1.2345,0) -> 1
#			TRUNCATE(1.2345,1) -> 1.2
#			TRUNCATE(1.2345,2) -> 1.23
# 	DATEDIFF --> Calcola la differenza in giorni tra il primo parametro e il secondo
#	NOW -------> Estrae dal sistema la data attuale
# 	YEAR ------> Estrapola unicamente l'anno della data messa tra parentesi
# 	CONCAT ----> Concatena due o piu parametri mettendoli nella stessa colonna temporanea

# Voglio vedere solo le persone con un eta superiore a 30 anni
SELECT 	cognome, dob, TRUNCATE(DATEDIFF(NOW(),dob)/365.25,0) AS Eta
FROM 	Persone
WHERE 	TRUNCATE(DATEDIFF(NOW(),dob)/365.25,0) > 29;

# Le query hanno 6 parole chiave che le formano. 
# Queste 6 parole hanno un ordine di scrittura e un ordine di esecuzione.

# ORDINE SCRITTURA				ORDINE DI ESECUZIONE
# 	select							from
# 	from							where
# 	where							...
# 	...								...
# 	...								order by
# 	order by						select

# Voglio ordinare per citta_residenza tutte le persone della tabella
SELECT *
FROM Persone
ORDER BY citta_residenza, numero_civico DESC;

# DETTAGLI
# 	ORDER BY vuole di seguito il nome di una o piu colonne.
# 	Di base ordina sempre in modo crescente (A->Z, 1->9) -> ASC
# 	Se volete invertire l'ordine basta mettere dopo la colonna la parola DESC (Z->A, 9->1)


# Voglio vedere solo le persone sposate in ordine alfabetico
SELECT 		*
FROM 		Persone
WHERE 		sposato IS TRUE
ORDER BY 	cognome, nome;




