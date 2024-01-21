#
#		VIEW
#
# E una tabella fittizia, perche nel concreto non esiste come tabella fisica.
# Le tabelle fisiche sono le classiche tabelle che vengono create usando il comando CREATE TABLE.
# Vengono definite fisiche perche esistono anche i loro metadati, cioe le informazioni legate alla struttura della tabella
# (ES. i limiti di un intero sono metadati, il tipo di dato di una colonna e un metadato, 
#		mentre il valore di una cella e semplicmente un dato)
# Le tabelle fittizie vengono create con un comando diverso, mancheranno i metadati, e il suo contenuto si aggiornera da solo
#	in conseguenza alle modifiche effettuate sulla tabella fisica originale. Inoltre non avendo metadati le tabelle 
# 	fittizie sono piu leggere rispetto alle loro originali.
# Le VIEW sono spesso chiamate "query salvate"

CREATE DATABASE Cinema;
USE Cinema;

CREATE TABLE Films
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(300),
    regista VARCHAR(150),
    genere VARCHAR(100),
    durata INT,
    oscar BOOL
);

SELECT * FROM Films;
DROP TABLE Films;
# Modo 1 per reiempire velocemente una tabella: TRAMITE INTERFACCIA
#	1) Scrivere una query che faccia vedere l'intera tabella, PK compresa
# 	2) Nella tabella risultante, al posto dei null scrivo i miei dati
#	3) Clicco APPLY in basso sulla destra
# 	4) Mi copio lo script che viene mostrato nella finestra che apre
#	5) Clicco di nuovo APPLY
#	6) Copio nel mio file lo script preso al punto 4

# Modo 2, tramite CSV
# 	1) Bisogna avere un file.csv pronto riempito da caricare
#	2) Scegliere "import" o dal menu di sinistrao dal tastino nella tabella risultante
#	3) Scegliere il file.csv da importare e fare Next
#	4) Scegliere se usare una tabella gia pronta o se crearla (Solitamente si usa la prima) e fare NEXT
#	5) Controllare che ogni colonna del CSV sia in linea con quella del DB e fare NEXT
#	6) Fare NEXT per importare i dati e di nuovo NEXT per concludere, se non ci sono errori fare FINISH

# Creazione di una view: La prima riga e obbligatoriamente da scrivere cosi (AS qui non indica un alias ma e sintassi)
# Se date degli alias alle colonne devono essere senza apici, altrimenti quella colonna non potre essere usata
#	in altre quesry, ma potra essere solo vista in stampa
CREATE VIEW Statistiche_Films AS
SELECT 	COUNT(id) AS Numero_Film,
		MAX(durata) AS Durata_Max,
        MIN(durata) AS Durata_Min,
        AVG(durata) AS Durata_Avg,
        SUM(durata) AS Durata_Sum
FROM Films;

SELECT * FROM Statistiche_Films;

SELECT 	titolo,
		durata,
        Statistiche_Films.Durata_Avg AS MEDIA
FROM 	Films, Statistiche_Films
WHERE 	durata > Statistiche_Films.Durata_Avg;

INSERT INTO Films
(titolo,regista,durata,genere,oscar)
VALUES
("Interstellar","Nolan",250,"Fantasy",1);


