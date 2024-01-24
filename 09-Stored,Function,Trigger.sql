
#			STORED, TRIGGER, FUNCTION

CREATE DATABASE Azienda2;
USE Azienda2;

CREATE TABLE Dipendenti
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nominativo VARCHAR(150),
    mansione VARCHAR(100),
    stipendio DOUBLE
);

DROP TABLE Dipendenti;
SELECT * FROM Dipendenti;

INSERT INTO Dipendenti (nominativo, mansione, stipendio) VALUES
('Mario Rossi', 'Programmatore', 5000.00),
('Giulia Verdi', 'Marketing Specialist', 5500.00),
('Luca Bianchi', 'Amministrativo', 6000.00),
('Alessia Neri', 'Responsabile Progetti', 5200.00),
('Paolo Gialli', 'Risorse Umane', 5800.00),
('Elena Rosa', 'Analista Finanziario', 5300.00),
('Riccardo Azzurri', 'Programmatore', 6200.00),
('Martina Verdi', 'Risorse Umane', 5500.00),
('Marco Gialli', 'Responsabile Progetti', 5800.00),
('Laura Rossi', 'Amministrativo', 6000.00);

# ---------------------------------------------- STORED PROCEDURE ----------------------------------------------
# E un blocco di codice che svolge operazioni di cui non ci interessa un risultato in uscita
# Come le VIEW, le STORED (o SP) vengono memorizzate nel DB, metadati compresi.

/*
	SINSTASSI DI UNA PROCEDURE
    
    DELIMITER $$ -> Indica che il simbolo che chiude il comando di SP non sara piu il ; ma diventa il $$
    
		CREATE PROCEDURE nomeSP(nomeParametro1 TipoParametro1, nomeParametro2 tipoParametro2,...)
		BEGIN
			comando1;
            comando2;
            comando3;
            ...
        END$$ -> Indica la fine della SP
        
    DELIMITER ; -> Riprota il ; come indicatore di fine comando
*/

# Esempio pratico di SP
DELIMITER $$
	CREATE PROCEDURE statistica()
		BEGIN
			SELECT 	Mansione,
					COUNT(*) AS PerMansione,
                    ROUND(AVG(Stipendio),2) AS Media,
                    MAX(Stipendio) AS Massimo,
                    MIN(Stipendio) AS Minimo
			FROM 	Dipendenti
            GROUP BY Mansione;
        END$$
DELIMITER ;

# Per eseguire una procedure, si deve lanciare tutto il codice, DELIMITER di apertura e chiusura compresi

# Per chiamare una SP gia creata si usa:
CALL statistica(); -- -> Passare nelle parentesi i parametri se necessario

# In SQL per creare un errore personalizzato si scrive:
SIGNAL SQLSTATE VALUE '45000'
SET MESSAGE_TEXT = 'descrizione dell errore che si e verificato';

# Possiamo usare questa nuova conoscenza per controllare i dati in ingresso e nel caso far uscire errori ad hoc
# Da questi controlli avremo solo spunta verde o rossa in output

DELIMITER $$
	CREATE PROCEDURE verificaDipendente(n VARCHAR(350), m VARCHAR(100), s DOUBLE)
		BEGIN
			IF(n IS NULL OR n = "")
            THEN
				SIGNAL SQLSTATE VALUE '45000'
                SET MESSAGE_TEXT = 'Nominativo non valido perche nullo o vuoto';
			END IF;
            
            IF(m IS NULL OR m = "")
            THEN
				SIGNAL SQLSTATE VALUE '45000'
                SET MESSAGE_TEXT = 'Mansione non valida perche nulla o vuota';
			END IF;
            
            IF(s IS NULL OR s < 500 OR s > 10000)
            THEN
				SIGNAL SQLSTATE VALUE '45000'
                SET MESSAGE_TEXT = 'Stipendio non valido perche nullo, inferiore a 500 o superiore a 10.000';
			END IF;
        END$$
DELIMITER ;

CALL verificaDipendente("Gigino", "Politico", 600);

# ---------------------------------------------- FUNCTION ----------------------------------------------
# Le function sono molto simili alle SP, con l'unica differenza che una FUNCTION deve per forza restituire un valore in uscita.

/*
	SINTASSI generale di una FUNCTION
    
    DELIMITER $$
    
		CREATE FUNCTION nomeFunzione(nomeParametro1 tipoParametro1, nomeParametro2 tipoParametro2,...)
			RETURNS tipoDatoCheVerraRestituito
            
            DETERMINSTIC -----> Implica che saranno usate delle formule fisse (ad esempio le formule geometriche o matematiche)
								con dei dati che arriveranno solamente sotto forma di parametri
				oppure 
            READS SQL DATA ---> Implica che i dati necessari ai calcoli saranno presi dalle tabelle del DB 
								(quindi li avremo tramite la struttra di una QUERY nel BEGIN)
			Esistono anche altre parole che possiamo usare oltre alle due scritte sopra, se vi servono o se siete curiosi, 
            le trovate nella documentazione ufficiale di SQL,
            (occhio a cercare il dbms che state usando perche alcuni termini potrebbero cambiare in base al dialetto)
            
            BEGIN
				comando1;
                comando2;
                ....
			END$$
            
    DELIMITER ;
*/

# Esempi pratici

# Voglio scrivere una funzione che calcoli lo stipendio annuo dei miei dipendenti
DELIMITER $$
	CREATE FUNCTION stipendioAnnuo(stipendioMensile DOUBLE)
		RETURNS DOUBLE
		DETERMINISTIC
        BEGIN
			RETURN stipendioMensile*13;
		END$$
DELIMITER ;
DROP FUNCTION stipendioAnnuo;
# Per eseguire una function possiamo inserirla in una QUERY.
# Se non ci interessa usare la function su nessuna tabella presente, 
# possiamo usare la tabella DUAL, che e una tabella fittizia che non esiste

SELECT 	stipendioAnnuo(1200)
FROM 	DUAL;

SELECT 	*, stipendioAnnuo(stipendio)
FROM 	dipendenti;

# Esempio con READ SQL DATA
DELIMITER $$
	CREATE FUNCTION stipendioAnnuo2(idDipendente INT)
		RETURNS DOUBLE
		READS SQL DATA
        BEGIN
			RETURN 	(
					SELECT 	Dipendenti.stipendio*13 
					FROM 	Dipendenti 
                    WHERE 	Dipendenti.id = idDipendente
                    );
		END$$
DELIMITER ;
DROP FUNCTION stipendioAnnuo2;

SELECT 	*, stipendioAnnuo2(id)
FROM 	dipendenti;

# Per cancellare una FUNCTION
DROP FUNCTION nomeFunzione;

# Per cancellare una STORED PROCEDURE
DROP PROCEDURE nomeProcedure;

# Per modificarea una FUNCTION o una PROCEDURE gia esistenti vi conviene sempre cancellarle e ricrearle

# ---------------------------------------------- TRIGGER ----------------------------------------------

# Sono blocchi di codice ad attivazione automatica
# Si attivano automaticamente all'avvenire di un evento tra: INSERT, UPDATE, DELETE
# I trigger si possono attivare o prima che avvenga l'evento o dopo che l'evento e avvenuto.
# I trigger in base alla versione su cui lavorate, lavoreranno in due modi:
# -> FOR EACH ROW : significa che il trigger viene attivato (e quindi infuenza) ogni record collegato all'evento
# -> FOR EACH STATEMENT : significa che il trigger viene attivato per ogni evento (deprecato per le versioni succesive all'8)

/*
	SINTASSI di un TRIGGER
    
    DELIMITER $$
    
			# -> DEFINER e il termine con cui si indica il creatore del trigger
			# -> CURRENT_USER indica che l'autore del trigger e l'utente attualmente loggato al DB
			# -> nomeTrigger: un trigger per convenzione si nomina tabella_quando_evento
		CREATE DEFINER = CURRENT_USER TRIGGER nomeTrigger
			# -> BEFORE(prima) e AFTER(dopo) indicano quando si deve attivare il trigger. Ne serve solo uno alla volta.
            # -> nomeEvento: si puo scegliere tra INSERT, UPDATE e DELETE
            # -> nomeTabella: si sceglie una delle tabelle presenti nel DB
        BEFORE oppure AFTER nomeEvento ON nomeTabella
			# -> Vedi spiegazione a riga 184-185
        FOR EACH ROW oppure FOR EACH STATEMENT
        
        BEGIN
			comando1;
            comando2;
            ...
		END$$
    
    DELIMITER ;
*/

# Esempi pratici:

DELIMITER $$

	CREATE DEFINER = CURRENT_USER TRIGGER dipendenti_BEFORE_INSERT
	BEFORE INSERT ON dipendenti
    FOR EACH ROW
    BEGIN
		IF(NEW.nominativo IS NULL OR NEW.nominativo = "" OR LENGTH(NEW.nominativo) > 349)
        THEN
			SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Nominativo non valido perche nullo, vuoto o fuoriscala';
        END IF;
		IF(NEW.mansione IS NULL OR NEW.mansione = "" OR LENGTH(NEW.mansione) > 99)
        THEN
			SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Mansione non valida perche nullo, vuoto o fuoriscala';
        END IF;
		IF(NEW.stipendio IS NULL OR NEW.stipendio = "" OR NEW.stipendio > 10000)
        THEN
			SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Stipendio non valido perche nullo, vuoto o fuoriscala';
        END IF;
    END$$
DELIMITER ;
DROP TRIGGER dipendenti_BEFORE_INSERT;
# Per vedere i TRIGGER creati su MySQL dovete fare cosi:
# -> Click sulla chiave Inglese accanto alla tabella creato il trigger (chiave inglese accanto dipendenti)
# -> Cerco in basso alla pagina che si apre la scritta TRIGGER e la clicco
# -> Sulla sinistra ci sono tutti i trigger creati: cliccandoli possiamo vedere il loro script
# O da terminale:
SHOW TRIGGERS
FROM azienda2
LIKE 'dipendenti';

# I trigger si attivano da soli, voi non dovrete mai chiamarli direttamente.
# Per farli attivare basta scatenare l'evento che li interessa.

INSERT INTO Dipendenti
(nominativo, mansione, stipendio)
VALUES
("PinoPane","Programmatore",300),
("Mara Maria","Docente",5000);

SELECT * FROM Dipendenti;

# Scrivere un trigger che controlli che i dati dell'update siano corretti
DELIMITER $$
	DROP TRIGGER IF EXISTS dipendenti_BEFORE_UPDATE$$
	
    
    CREATE TRIGGER dipendenti_BEFORE_UPDATE
		BEFORE UPDATE ON Dipendenti
        FOR EACH ROW
        BEGIN
			IF(NEW.nominativo IS NULL OR NEW.nominativo = "" OR LENGTH(NEW.nominativo) > 349)
			THEN
				SIGNAL SQLSTATE VALUE '45000'
				SET MESSAGE_TEXT = 'Nominativo non valido perche nullo, vuoto o fuoriscala';
			END IF;
			IF(	NEW.mansione IS NULL OR NEW.mansione = "" OR LENGTH(NEW.mansione) > 99 OR 
				NEW.mansione NOT IN("Programmatore","Docente","IT"))
			THEN
				SIGNAL SQLSTATE VALUE '45000'
				SET MESSAGE_TEXT = 'Mansione non valida perche nullo, vuoto o fuoriscala';
			END IF;
			IF(NEW.stipendio IS NULL OR NEW.stipendio = "" OR NEW.stipendio > 10000)
			THEN
				SIGNAL SQLSTATE VALUE '45000'
				SET MESSAGE_TEXT = 'Stipendio non valido perche nullo, vuoto o fuoriscala';
			END IF;
        END$$
DELIMITER ;

-- ------------------------------    ESERCIZI    ------------------------------------------
-- Aggiungete una colonna chiamata stipendioAnnuale alla tabella dipendenti


-- Riempite la colonna calcolando lo stipendio annuale(ricordatevi che in un anno ci sono 13 stipendi)
-- Aggiungete una colonna con la data di nascita delle persone e riempitela
-- Voglio una funzione che sia in grado di indicare chi deve andare in pensione (fissata a 60 anni compiuti).
-- Applicate poi la funzione alla tabella e mostrate i nominativi e se devono andare in pensione o no
-- Voglio una funzione che sia in grado per ogni persona di calcolare quanti soldi hanno guadagnato, ipotizzando che
-- abbiano sempre preso lo stesso stipendio attuale e che abbiano tutti iniziato a lavorare a 18 anni
-- Applicatela poi alla tabella dipendenti
-- Scrivere una funzione che calcoli un bonus sullo stipendio legato alla mansione e agli anni lavorati:
-- Se la mansione è Programmatore e lavora da 5 a 10 anni, + 500, se lavora da 10 a 20 + 800, più di 20 + 10000
-- Se la mansione è Docente e lavora da 5 a 15 anni, + 550, se lavora da più di 15 + 1100
-- Se la mansione è CEO, aggiungere 100 per ogni anno lavorato
-- Applicare poi la funzione alla tabella dipendenti
-- Scrivere un trigger che blocchi l'eliminazione dei dipendenti non in età da pensione






