create database bar;
use bar;

create table snacks(
	id int primary key auto_increment,
    nome varchar (50),
    prezzo double,
    quantita int,
    salato boolean
);

create table bevande (
	id int primary key auto_increment,
    nome varchar(50),
    prezzo double
);
drop table bevande;
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn shrimp', 17.52, 48, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('granola bar', 9.17, 26, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn sausage', 28.94, 41, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('beef jerky', 29.3, 2, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('chocolate', 27.39, 3, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('ice cream', 1.87, 26, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn chicken', 5.19, 34, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn turkey', 13.26, 3, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn nuggets', 21.82, 45, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn', 18.53, 36, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('crackers', 3.33, 32, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('rice cakes', 7.65, 34, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('cheese sticks', 8.88, 45, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('marshmallows', 28.83, 10, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn veggie', 10.42, 46, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn fish', 29.32, 50, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn tofu', 19.57, 34, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('chips', 5.7, 35, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('ice cream', 2.06, 33, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('crackers', 14.84, 13, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('crackers', 14.13, 14, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn turkey', 21.42, 35, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn tofu', 4.38, 13, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn sausage', 18.65, 34, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn sausage', 14.45, 49, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('nuts', 3.35, 44, 1);
insert into snacks (nome, prezzo, quantita, salato) values ('nuts', 18.83, 16, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn fish', 26.32, 7, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn turkey', 17.07, 15, 0);
insert into snacks (nome, prezzo, quantita, salato) values ('popcorn turkey', 7.88, 17, 1);

insert into bevande (nome, prezzo) values ('lemonade', 7.47);
insert into bevande (nome, prezzo) values ('rum', 16.27);
insert into bevande (nome, prezzo) values ('coffee', 12.31);
insert into bevande (nome, prezzo) values ('iced tea', 34.84);
insert into bevande (nome, prezzo) values ('orange juice', 13.04);
insert into bevande (nome, prezzo) values ('smoothie', 28.47);
insert into bevande (nome, prezzo) values ('champagne', 15.55);
insert into bevande (nome, prezzo) values ('gin', 27.56);
insert into bevande (nome, prezzo) values ('coconut water', 44.1);
insert into bevande (nome, prezzo) values ('beer', 40.01);
insert into bevande (nome, prezzo) values ('wine', 33.44);
insert into bevande (nome, prezzo) values ('coconut water', 34.43);
insert into bevande (nome, prezzo) values ('cocktail', 3.48);
insert into bevande (nome, prezzo) values ('rum', 13.48);
insert into bevande (nome, prezzo) values ('orange juice', 30.5);
insert into bevande (nome, prezzo) values ('sparkling water', 11.17);
insert into bevande (nome, prezzo) values ('orange juice', 39.87);
insert into bevande (nome, prezzo) values ('soda', 11.05);
insert into bevande (nome, prezzo) values ('tea', 30.24);
insert into bevande (nome, prezzo) values ('vodka', 35.02);
insert into bevande (nome, prezzo) values ('rum', 39.43);
insert into bevande (nome, prezzo) values ('lemonade', 15.38);
insert into bevande (nome, prezzo) values ('rum', 23.44);
insert into bevande (nome, prezzo) values ('cocktail', 59.17);
insert into bevande (nome, prezzo) values ('apple cider', 26.88);
insert into bevande (nome, prezzo) values ('milk', 49.12);
insert into bevande (nome, prezzo) values ('root beer', 14.02);
insert into bevande (nome, prezzo) values ('champagne', 45.97);
insert into bevande (nome, prezzo) values ('beer', 27.5);
insert into bevande (nome, prezzo) values ('soda', 6.45);

select * from snacks;
select * from bevande;