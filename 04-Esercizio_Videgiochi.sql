-- ESERCIZIO + BONUS
-- creare un database videogiochi
-- creare la tabella videogames con: id int pk, titolo varchar, console varchar, genere varchar, anno rilascio int, sviluppatore varchar, voto utenti int, voto critica int, pegi int
-- inserire 10 videogiochi
-- QUERY
-- voglio vedere l'intera tabella
-- voglio vedere titolo, console, anno rilascio
-- voglio vedere titolo e sviluppatore dei giochi playstaton 5
-- voglio vedere titolo, console dei giochi con voto critica > 82
-- voglio vedere titolo dei giochi usciti nel 2020 con voto utenti maggiore di 90
-- voglio vedere il voto medio della critica
-- voglio vedere il voto medio degli utenti
-- voglio vedere tutto dei giochi con pegi 18
-- voglio vedere la media dei voti di critica e utente per ogni console
-- voglio vededere titolo e anno rilascio per i giochi sviluppati da ubisoft
-- voglio vedere il voto più alto, più basso, e la media dei voti utenza e critica per ogni studio se il voto medio della critica è superiore a 80

CREATE DATABASE videogames;

USE videogames;

-- creare la tabella videogames con: id int pk, titolo varchar, console varchar, genere varchar, anno rilascio int, sviluppatore varchar, voto utenti int, voto critica int, pegi int
CREATE TABLE videogiochi
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(100),
    console VARCHAR(50),
    genere VARCHAR(50),
    anno_rilascio INT,
    sviluppatore VARCHAR(100),
    voto_utenti INT,
    voto_critica INT,
    pegi INT
);

-- inserire 10 videogiochi
INSERT INTO videogiochi (titolo, console, genere, anno_rilascio, sviluppatore, voto_utenti, voto_critica, pegi)
VALUES
("The Witcher 3: Wild Hunt", "PlayStation 4", "RPG", 2015, "CD Projekt", 92, 93, 18),
("Super Mario Odyssey", "Nintendo Switch", "Platform", 2017, "Nintendo", 90, 97, 7),
("Grand Theft Auto V", "Xbox One", "Action-Adventure", 2014, "Rockstar North", 88, 97, 18),
("The Legend of Zelda: Breath of the Wild", "Wii U", "Action-Adventure", 2017, "Nintendo", 92, 97, 12),
("Red Dead Redemption 2", "PlayStation 4", "Action-Adventure", 2018, "Rockstar Games", 89, 97, 18),
("Overwatch", "PC", "First-Person Shooter", 2016, "Blizzard Entertainment", 84, 91, 12),
("Fortnite", "PlayStation 5", "Battle Royale", 2017, "Epic Games", 79, 78, 12),
("Minecraft", "Xbox Series X", "Sandbox", 2011, "Mojang", 91, 93, 7),
("Cyberpunk 2077", "Xbox Series X", "Action RPG", 2020, "CD Projekt", 70, 71, 18),
("Fallout 4", "PlayStation 4", "Action RPG", 2015, "Bethesda Game Studios", 78, 88, 18),
("Assassin's Creed Odyssey", "Xbox One", "Action RPG", 2018, "Ubisoft", 83, 83, 18),
("FIFA 22", "PlayStation 5", "Sports", 2021, "EA Sports", 82, 82, 3),
("Call of Duty: Warzone", "PC", "Battle Royale", 2020, "Infinity Ward", 77, 80, 18),
("The Elder Scrolls V: Skyrim", "Nintendo Switch", "Action RPG", 2011, "Bethesda Game Studios", 88, 94, 18),
("Animal Crossing: New Horizons", "Nintendo Switch", "Life Simulation", 2020, "Nintendo", 90, 90, 3),
("Spider-Man: Miles Morales", "PlayStation 5", "Action-Adventure", 2020, "Insomniac Games", 88, 85, 16),
("Dark Souls III", "Xbox One", "Action RPG", 2016, "FromSoftware", 87, 89, 18),
("Tom Clancy's Rainbow Six Siege", "PlayStation 4", "Tactical Shooter", 2015, "Ubisoft", 79, 79, 18),
("Rocket League", "Xbox Series X", "Sports", 2015, "Psyonix", 86, 86, 3),
("Persona 5", "PlayStation 4", "JRPG", 2016, "Atlus", 94, 93, 16);

INSERT INTO videogiochi (titolo, console, genere, anno_rilascio, sviluppatore, voto_utenti, voto_critica, pegi)
VALUES
("God of War", "PlayStation 4", "Action-Adventure", 2018, "Santa Monica Studio", 94, 94, 18),
("Horizon Zero Dawn", "PlayStation 4", "Action RPG", 2017, "Guerrilla Games", 89, 89, 16),
("BioShock Infinite", "Xbox 360", "First-Person Shooter", 2013, "Irrational Games", 91, 94, 18),
("The Last of Us Part II", "PlayStation 4", "Action-Adventure", 2020, "Naughty Dog", 93, 93, 18),
("Uncharted 4: A Thief's End", "PlayStation 4", "Action-Adventure", 2016, "Naughty Dog", 92, 93, 16),
("Destiny 2", "PC", "MMORPG", 2017, "Bungie", 79, 83, 16),
("Star Wars Jedi: Fallen Order", "Xbox One", "Action-Adventure", 2019, "Respawn Entertainment", 85, 87, 16),
("Halo: Reach", "Xbox 360", "First-Person Shooter", 2010, "Bungie", 87, 91, 18),
("Final Fantasy XV", "PlayStation 4", "JRPG", 2016, "Square Enix", 83, 82, 16),
("The Division 2", "PlayStation 4", "Action RPG", 2019, "Massive Entertainment", 77, 81, 18),
("Gears 5", "Xbox One", "Third-Person Shooter", 2019, "The Coalition", 82, 84, 18),
("Monster Hunter: World", "PC", "Action RPG", 2018, "Capcom", 87, 90, 16),
("DOOM Eternal", "PlayStation 4", "First-Person Shooter", 2020, "id Software", 88, 88, 18),
("Nier: Automata", "PlayStation 4", "Action RPG", 2017, "PlatinumGames", 89, 88, 18),
("The Outer Worlds", "Xbox One", "Action RPG", 2019, "Obsidian Entertainment", 82, 85, 18),
("Resident Evil Village", "PlayStation 5", "Survival Horror", 2021, "Capcom", 86, 84, 18),
("Sekiro: Shadows Die Twice", "PC", "Action-Adventure", 2019, "FromSoftware", 88, 91, 18),
("Watch Dogs: Legion", "Xbox Series X", "Action-Adventure", 2020, "Ubisoft", 76, 75, 18),
("Ghost of Tsushima", "PlayStation 4", "Action-Adventure", 2020, "Sucker Punch Productions", 91, 83, 18),
("Assassin's Creed Valhalla", "PlayStation 5", "Action RPG", 2020, "Ubisoft", 82, 84, 18);

INSERT INTO videogiochi (titolo, console, genere, anno_rilascio, sviluppatore, voto_utenti, voto_critica, pegi)
VALUES
("giocobellissimo", "consolebellissima", "generebellissimo", 2020, "studiopazzesco", 100, 100, 18);

-- voglio vedere l'intera tabella
SELECT *
FROM videogiochi;

-- voglio vedere titolo, console, anno rilascio
SELECT titolo, console, anno_rilascio
FROM videogiochi;

-- voglio vedere titolo e sviluppatore dei giochi playstaton 5
SELECT titolo, sviluppatore
FROM videogiochi
WHERE console = "PlayStation 5";

-- voglio vedere titolo, console dei giochi con voto critica > 82
SELECT titolo, console
FROM videogiochi
WHERE voto_critica > 82;

-- voglio vedere titolo dei giochi usciti nel 2020 con voto utenti maggiore di 90
SELECT titolo
FROM videogiochi
WHERE anno_rilascio = 2020 AND voto_utenti > 90;

-- voglio vedere il voto medio della critica
SELECT AVG(voto_critica) AS media_critica
FROM videogiochi;

-- voglio vedere il voto medio degli utenti
SELECT AVG(voto_utenti) AS media_utenti
FROM videogiochi;

-- voglio vedere tutto dei giochi con pegi 18
SELECT *
FROM videogiochi
WHERE pegi = 18;

-- voglio vedere la media dei voti di critica e utente per ogni console
SELECT console, AVG(voto_critica) AS media_critica, AVG(voto_utenti) AS media_utenti
FROM videogiochi
GROUP BY console;

-- voglio vededere titolo e anno rilascio per i giochi sviluppati da ubisoft
SELECT titolo, anno_rilascio
FROM videogiochi
WHERE sviluppatore = "ubisoft";

-- voglio vedere il voto più alto, più basso, e la media dei voti utenza e critica per ogni studio se il voto medio della critica è superiore a 80
SELECT 		sviluppatore, 
			MAX(voto_utenti) AS voto_utenti_massimo,
			MIN(voto_utenti) AS voto_utenti_minimo,
			AVG(voto_utenti) AS media_voto_utenti,
			MAX(voto_critica) AS voto_critica_massimo,
			MIN(voto_critica) AS voto_critica_minimo,
			AVG(voto_critica) AS media_voto_critica
FROM 		videogiochi
GROUP BY 	sviluppatore
HAVING AVG	(voto_critica) > 80;

#BONUS
-- voglio vedere per ogni anno di rilascio il numero di videogiochi rilasciato per ogni studio di sviluppo
SELECT 		anno_rilascio, sviluppatore, COUNT(id) AS numero_videogiochi
FROM 		videogiochi
GROUP BY 	anno_rilascio, sviluppatore;

-- voglio vedere il pegi più presente
# Visualizzare SOLO il piu presente???
SELECT pegi, COUNT(id)
FROM videogiochi
GROUP BY pegi;

-- voglio vedere i titoli dei videogiochi con un voto della critica superiore al voto medio della critica complessiva
SELECT 	titolo, voto_critica
FROM 	videogiochi
HAVING 	voto_critica > (SELECT AVG(voto_critica) FROM videogiochi);

