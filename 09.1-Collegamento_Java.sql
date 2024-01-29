CREATE DATABASE anagrafe;
USE anagrafe;

CREATE TABLE Persone
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    cognome VARCHAR(200),
    dob DATE,
    residenza VARCHAR(200),
    genere CHAR,
    professione VARCHAR(250)
);

SELECT * FROM Persone;

INSERT INTO Persone (nome, cognome, dob, residenza, genere, professione) VALUES
('Mario', 'Rossi', '1990-05-15', 'Roma', 'M', 'Ingegnere'),
('Giulia', 'Verdi', '1985-12-10', 'Milano', 'F', 'Avvocato'),
('Luca', 'Bianchi', '1978-08-22', 'Napoli', 'M', 'Medico'),
('Alessia', 'Neri', '1995-04-30', 'Firenze', 'F', 'Insegnante'),
('Paolo', 'Gialli', '1983-07-20', 'Torino', 'M', 'Architetto'),
('Elena', 'Rosa', '1992-10-05', 'Palermo', 'F', 'Programmatore'),
('Riccardo', 'Azzurri', '1975-03-25', 'Bologna', 'M', 'Commercialista'),
('Martina', 'Verdi', '1989-09-15', 'Genova', 'F', 'Psicologo'),
('Marco', 'Gialli', '1980-11-18', 'Venezia', 'M', 'Ingegnere'),
('Laura', 'Rossi', '1998-06-08', 'Bari', 'F', 'Designer');