# Usiamo lo stesso DB Cinema Del file 05-View
USE Cinema;

# Ipotiziamo che ogni film sara proiettato sempre e solo in una sala specifica
CREATE TABLE sale
(
	id INT PRIMARY KEY auto_increment,
    nome VARCHAR(50),
    altaRisoluzione BOOL,
    posti INT,
    idFilm INT,
    FOREIGN KEY(idFilm) REFERENCES Films(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

# Se voglio far si che due tabelle possano collegarsi, quindi scambiarsi dati, devo fare in modo che si possano 
# riconoscere in modo assolutmante certo i record interssati al dialogo.
# Devo gestire alcune situazioni:
#	- quale record mi interessa legare alla sala (riga 11)
#	- quale tabella contiene il record interessato (riga 12)
#	- quale colonna contiene il  valore interessato (riga 12)
#	- come mi comporto se il record interessato viene cancellato (riga 13)
#	- come mi comporto se il record interessato viene modificato (riga 14)

# FOREIGN KEY: spesso abbreviata come FK, la chiave esterna serve per indicare quale tabella vogliamo legare a SALE,
# 				e per quali colonne vogliamo avvenga questo legame.

# Nel caso sopra, noi leghiamo i valori della colonna idFilm ai valori della colonna id della tabella Films.
# Se un valore non esiste nella tabella films, non sara accettato nemmeno nella tabella Sale.

# Le tabelle si possono relazionare in modi diversi, a livello concettuale, anche se a livello pratico, la sintassi
# sara pressoche semre la stessa.

# !!! IMPORTANTE !!!
# Che relazioni esistono in SQL
# Esistono 3 relazioni diverse: 1-1, 1-N, N-N
# 	1-1 -> Ogni record della tabella 1 si collega a uno e un solo record della tabella 2
# 	1-N -> Ogni record della tabella 1 si collega a tanti record della tabella 2
# 	N-N -> Ogni record della tabella 1 si collega a tanti record della tabella 2 e viceversa

# ON UPDATE/ON DELETE Vogliono di seguito un comportamento da tenere nel caso in cui il valore legato tramite FK
# 	venga modificato o cancellato.
# 	I comportamenti sono SET NULL -> metto null alla FK, CASCADE -> FK Subisce la stessa cosa dal record collegato,
# 	RESTRICTED o NO ACTION -> Bloccano qualunque azione possano interessare la FK o il record collegato(e quello di default)

SELECT * FROM Sale;
SELECT * FROM Films;
INSERT INTO `cinema`.`Sale` (`nome`, `altaRisoluzione`, `posti`, `idFilm`) VALUES ('Fuoco', '1', '350', '1');
INSERT INTO `cinema`.`Sale` (`nome`, `altaRisoluzione`, `posti`, `idFilm`) VALUES ('Acqua', '0', '280', '1');
INSERT INTO `cinema`.`Sale` (`nome`, `altaRisoluzione`, `posti`, `idFilm`) VALUES ('Terra', '0', '300', '2');
INSERT INTO `cinema`.`Sale` (`nome`, `altaRisoluzione`, `posti`, `idFilm`) VALUES ('Aria', '0', '200', '3');
INSERT INTO `cinema`.`Sale` (`nome`, `altaRisoluzione`, `posti`) VALUES ('Gialla', '0', '150');

# Voglio vedere il titolo di ogni film proiettato e il nome della sala in cui viene proiettato
# CROSS JOIN, SBAGLIATO
SELECT films.titolo, sale.nome
FROM films, sale;

SELECT films.titolo, sale.nome
FROM films INNER JOIN sale ON films.id = sale.idfilm;
 
# Nel FROM noi possiamo mettere tutte le tabelle che desideriamo. Se pero non indichiamo il tipo di collegamento (JOIN)
# che vogliamo fare, in automatico il DB fara una cosa chiamata CROSS JOIN, cioe un prodotto cartesiano.
 
# INNER JOIN -> Tiene solo le combo di record che rispettano il predicato
# Predicato di JOIN: e la regola che detta l'esistenza delle combo nella join. Per intenderci, e il codice dopo ON.

# Se nella query vedete scritto INNER JOIN si dice che si sta facendo una INNER JOIN ESPLICITA
SELECT *
FROM films INNER JOIN sale ON films.id = sale.idfilm;

# Se nella query vedete scritta una CROSS JOIN con un WHERE in cui PK = FK, si dice INNER JOIN IMPLICITA
SELECT 	*
FROM 	films, sale
WHERE	films.id = sale.idfilm;

# D'ora in poi noi giocheremo con tante tabelle alla volta, quindi sara comodo usare sempre tabella.colonna dentro alle query

#	!!!JOIN NON SIGNIFICA RELAZIONE!!!

# Voglio vedere il titolo dei film che verranno proiettati in alta risoluzione
SELECT titolo
FROM films, sale
WHERE films.id = sale.idfilm AND sale.altaRisoluzione = 1;

SELECT titolo
FROM films INNER JOIN sale ON films.id = sale.idfilm
WHERE sale.altaRisoluzione = 1;

# Voglio vedere il nome della sala che proietta il film piu lungo in proiezione
SELECT 	sale.nome
FROM 	films INNER JOIN sale ON films.id = sale.idfilm
WHERE  	films.durata = (SELECT MAX(durata) FROM films INNER JOIN sale ON sale.idfilm = films.id);

# Voglio vedere per ogni film proiettato, il numero di posti a sedere disponibili
SELECT 		films.titolo, SUM(sale.posti)
FROM 		films INNER JOIN sale ON films.id = sale.idfilm
GROUP BY 	films.titolo;
