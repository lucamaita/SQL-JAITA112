Create database corsi;
use corsi;
create table tableCorsi
(
	id int primary key auto_increment,
    nome varchar(100),
    totale_ore int,
    numero_lezioni int,
    lingua varchar(100),
    materiali boolean
);
create table utenti
(
	id int primary key auto_increment,
    nome varchar(100),
    cognome varchar(100),
    dob date,
    azienda varchar(100),
    mansione varchar(100),
    corsoFrequentato int,
    foreign key (corsoFrequentato) references tableCorsi(id)
    on update cascade on delete set null
);

INSERT INTO tableCorsi (nome, totale_ore, numero_lezioni, lingua, materiali) VALUES
('Corso di Programmazione Java', 40, 10, 'Italiano', true),
('Corso di Marketing Digitale', 30, 8, 'Inglese', true),
('Corso di Finanza Personale', 20, 5, 'Italiano', false),
('Corso di Fotografia Avanzata', 50, 12, 'Italiano', true),
('Corso di Yoga e Meditazione', 15, 4, 'Inglese', false),
('Corso di Cucina Italiana', 25, 6, 'Italiano', true),
('Corso di Giardinaggio Urbano', 35, 9, 'Italiano', false),
('Corso di Web Design', 45, 11, 'Inglese', true),
('Corso di Lingua Spagnola', 30, 8, 'Spagnolo', true),
('Corso di Programmazione Python', 40, 10, 'Inglese', true),
('Corso di Marketing su Instagram', 20, 5, 'Italiano', false),
('Corso di Scrittura Creativa', 35, 9, 'Italiano', true),
('Corso di Fotografia Naturalistica', 50, 12, 'Inglese', true),
('Corso di Economia Domestica', 15, 4, 'Italiano', false),
('Corso di Aerobica e Fitness', 30, 8, 'Italiano', false),
('Corso di Pittura ad Olio', 40, 10, 'Italiano', true),
('Corso di Inglese Avanzato', 25, 6, 'Inglese', true),
('Corso di Programmazione JavaScript', 45, 11, 'Inglese', true),
('Corso di Cucina Vegetariana', 30, 8, 'Italiano', true),
('Corso di Marketing su Facebook', 20, 5, 'Inglese', false);

INSERT INTO utenti (nome, cognome, dob, azienda, mansione, corsoFrequentato) VALUES
('Giuseppe', 'Rossi', '1990-05-15', 'ABC Srl', 'Programmatore', 1),
('Maria', 'Bianchi', '1985-08-22', 'XYZ Spa', 'Marketing Manager', 2),
('Luca', 'Verdi', '1993-03-10', '123 Srl', 'Grafico', 3),
('Alessia', 'Ferrari', '1988-11-28', 'ABC Srl', 'Programmatrice', 1),
('Giorgio', 'Russo', '1995-09-18', 'XYZ Spa', 'Social Media Manager', 2),
('Roberta', 'Neri', '1983-02-20', 'XYZ Spa', 'Copywriter', 2),
('Paolo', 'Gialli', '1992-06-05', '123 Srl', 'Web Designer', 3),
('Sara', 'Marroni', '1990-08-20', 'XYZ Spa', 'Marketing Specialist', 2),
('Marco', 'Bianchi', '1991-12-03', 'ABC Srl', 'Sviluppatore Software', 1),
('Martina', 'Verdi', '1987-07-30', 'XYZ Spa', 'Grafico', 3),
('Federico', 'Ricci', '1984-04-15', '123 Srl', 'Analista Finanziario', 3),
('Laura', 'Gallo', '1996-01-20', 'ABC Srl', 'Social Media Specialist', 2),
('Simone', 'Marini', '1989-10-10', 'XYZ Spa', 'SEO Specialist', 2),
('Chiara', 'Moretti', '1994-07-05', '123 Srl', 'Content Manager', 3),
('Davide', 'Conti', '1998-09-25', 'ABC Srl', 'Sviluppatore Front-end', 1),
('Elisa', 'Barbieri', '1993-06-12', 'XYZ Spa', 'Grafico', 3),
('Lorenzo', 'Gatti', '1990-03-28', '123 Srl', 'Analista Dati', 3),
('Francesca', 'Marchetti', '1992-11-17', 'ABC Srl', 'Web Developer', 1),
('Andrea', 'Fontana', '1987-08-08', 'XYZ Spa', 'Digital Strategist', 2),
('Valentina', 'Pellegrini', '1991-05-03', '123 Srl', 'Gestore Social Media', 2);

select * from tableCorsi;
select * from utenti;
