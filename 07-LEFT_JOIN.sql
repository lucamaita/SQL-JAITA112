# Vogliamo gestire una serie di album.
# Sappiamo che ogni album e formato da: id PK AI, nome, artista, genere, premiato
-- id INT PK AI
-- titolo VARCHAR(300)
-- id_album INT FK
-- gradimento DOUBLE
# Sappiamo anche le canzoni a disposizione: id PK AI, titolo, durata, album, gradimento
-- id INT PK AI
-- nome VARCHAR(250)
-- artista INT FK
-- genere VARCHAR(150)
-- premiato BOOL
# Sappiamo anche che ogni artista sara formato da: id PK AI, nome_artista, dob, nazionalita
-- id INT PK AI
-- nome_arte VARCHAR(250)
-- dob DATE
-- nazionalita VARCHAR(100)

CREATE DATABASE ManagerMusica;
USE ManagerMusica;

CREATE TABLE Artisti
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_arte VARCHAR(250),
    dob DATE,
    nazionalita VARCHAR(150)
);

INSERT INTO Artisti (nome_arte, dob, nazionalita) VALUES
('Ludwig van Beethoven', '1770-12-16', 'Austriaca'),
('Wolfgang Amadeus Mozart', '1756-01-27', 'Austriaca'),
('Johann Sebastian Bach', '1685-03-31', 'Tedesca'),
('Freddie Mercury', '1946-09-05', 'Britannica'),
('Michael Jackson', '1958-08-29', 'Americana'),
('Elvis Presley', '1935-01-08', 'Americana'),
('Madonna', '1958-08-16', 'Americana'),
('Bob Marley', '1945-02-06', 'Giamaicana'),
('David Bowie', '1947-01-08', 'Britannica'),
('Adele', '1988-05-05', 'Britannica'),
('Miles Davis', '1926-05-26', 'Americana'),
('Jimi Hendrix', '1942-11-27', 'Americana'),
('Beyoncé', '1981-09-04', 'Americana'),
('Johnny Cash', '1932-02-26', 'Americana'),
('Aretha Franklin', '1942-03-25', 'Americana'),
('Frank Sinatra', '1915-12-12', 'Americana'),
('Prince', '1958-06-07', 'Americana'),
('Celine Dion', '1968-03-30', 'Canadese'),
('Stevie Wonder', '1950-05-13', 'Americana'),
('Billie Holiday', '1915-04-07', 'Americana');

SELECT * FROM artisti;

CREATE TABLE albums
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250),
    idArtista INT,
    genere VARCHAR(200),
    premiato BOOL,
    FOREIGN KEY(idArtista) REFERENCES Artisti(id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

INSERT INTO albums (nome, idArtista, genere, premiato) VALUES
('Thriller', 5, 'Pop', true),
('Abbey Road', 2, 'Rock', true),
('The Dark Side of the Moon', 3, 'Rock', true),
('A Night at the Opera', 1, 'Rock', true),
('Back in Black', 12, 'Rock', true),
('Rumours', 14, 'Rock', true),
('The Wall', 11, 'Rock', true),
('Purple Rain', 16, 'Pop/Rock', true),
('Like a Virgin', 7, 'Pop', true),
('A Kind of Magic', 9, 'Rock', false),
('Black Album', 13, 'Metal', true),
('The Velvet Rope', 10, 'R&B', true),
('Legend', 8, 'Reggae', true),
('Space Oddity', 4, 'Rock', false),
('21', 6, 'Pop', true),
('Blue', 19, 'Jazz', true),
('The Immaculate Collection', 7, 'Pop', true),
('Led Zeppelin IV', 15, 'Rock', true),
('Off the Wall', 5, 'Pop', true),
('Jazz', 18, 'Rock', true);

SELECT * FROM albums;

CREATE TABLE Canzoni
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(100),
    durata DOUBLE,
    idAlbum INT,
    gradimento DOUBLE,
    idArtista INT,
    FOREIGN KEY(idAlbum) REFERENCES Albums(id)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
    FOREIGN KEY (idArtista) REFERENCES Artisti(id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

INSERT INTO Canzoni (titolo, durata, idAlbum, gradimento, idArtista) VALUES
("Billie Jean", 4.54, 1, 4.7, 5),
("Come Together", 4.20, 2, 3.9, 2),
("Comfortably Numb", 6.22, 3, 4.9, 11),
("Bohemian Rhapsody", 5.55, 4, 4.6, 1),
("Back in Black", 4.15, 5, 4.4, 12),
("Go Your Own Way", 3.38, 6, 4.2, 14),
("Another Brick in the Wall", 3.09, 7, 4.1, 11),
("Purple Rain", 8.41, 8, 4.8, 16),
("Like a Virgin", 3.38, 9, 3.8, 7),
("Under Pressure", 4.05, 10, 4.7, 9),
("Enter Sandman", 5.31, 11, 4.8, 13),
("If", 4.52, 12, 3.9, 10),
("No Woman, No Cry", 3.45, 13, 4.1, 8),
("Space Oddity", 5.14, 14, 4.3, 4),
("Rolling in the Deep", 3.48, 15, 4.6, 6),
("So What", 3.08, 16, 4.0, 19),
("Like a Prayer", 5.41, 17, 4.2, 7),
("Stairway to Heaven", 8.02, 18, 4.7, 15),
("Don't Stop 'Til You Get Enough", 5.59, 19, 4.6, 5),
("Imagine", 3.04, 20, 4.0, 1);

UPDATE `managermusica`.`Canzoni` SET `idAlbum` = NULL, `gradimento` = NULL, `idArtista` = NULL WHERE (`id` = '20');

SELECT * FROM Canzoni;

# Voglio vedere per ogni canzone a che album appartiene
SELECT 	*
FROM 	canzoni INNER JOIN albums ON albums.id = canzoni.idAlbum;
# La inner mi fa vedere solo i record accoppiati tra le due tabelle, ma non i record senza coppie(ES con FK settata a NULL)
# Per vedere anche i record non accoppiati devo cambiare la JOIN che uso
SELECT 	*
FROM 	canzoni LEFT JOIN albums ON albums.id = canzoni.idAlbum;
# La LEFT JOIN fa vedere tutti i record della tabella scritta a sinistra della tabella JOIN,
# sia quelli accoppiati che quelli non accoppiati

# Voglio vedere per ogni album il numero di canzoni presenti
SELECT albums.nome AS titolo_album, COUNT(canzoni.id) AS Numero_Canzoni
FROM Albums LEFT JOIN Canzoni ON Canzoni.idAlbum = Albums.id
GROUP BY albums.id, albums.nome;
# Soprattutto quando si fanno le LEFT JOIN mettere * o mettere PK nel COUNT cambia il risultato.
# * cerca l'esistenza del record, record che potrebbe essere anche interamente NULL e quindi non valere.
# PK invece cerca il valore nella colonna se quel valore e NULL, non sara contato

# Voglio vedere per ogni artista il numero di canzoni prodotte
SELECT artisti.nome_arte AS Artista, COUNT(canzoni.id) AS Numero_Canzoni
FROM Artisti LEFT JOIN Canzoni ON Canzoni.idArtista = Artisti.id
GROUP BY artisti.id, artisti.nome_arte;

# Voglio vedere l'artista con il maggior numero di canzoni prodotte (???)
SELECT *
FROM 	(SELECT artisti.nome_arte AS Artista, COUNT(canzoni.id) AS Canzoni
		FROM Artisti LEFT JOIN Canzoni ON Canzoni.idArtista = Artisti.id
		GROUP BY artisti.id, artisti.nome_arte) AS Produzioni
WHERE 	Produzioni.canzoni = 	(SELECT MAX(P.canzoni)
								FROM 	(	
										SELECT artisti.nome_arte AS Artista, COUNT(canzoni.id) AS Canzoni
										FROM Artisti LEFT JOIN Canzoni ON Canzoni.idArtista = Artisti.id
										GROUP BY artisti.id, artisti.nome_arte
                                        ) AS P
								);

# Voglio vedere per ogni album il nome dell'artista
SELECT Albums.nome, Artisti.nome_arte
FROM Albums LEFT JOIN Artisti ON Albums.idArtista = Artisti.id
GROUP BY Albums.id, Albums.nome;

# Voglio vedere la durata totale di ogni album
SELECT 		Albums.nome, SUM(canzoni.durata)
FROM 		Albums LEFT JOIN Canzoni ON Albums.id = Canzoni.idAlbum
GROUP BY 	Albums.id, Albums.nome;


