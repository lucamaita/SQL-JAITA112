create database GameStop;
use GameStop;

create table games
(
	game_id int primary key auto_increment,
    title varchar(255),
    genre varchar(255),
    rating decimal(3,1),
    release_date DATE
);
describe games;
drop table games;
select * from games;

create table platforms
(
	platform_id int primary key auto_increment,
    name varchar(255)
);
select * from platforms;
drop table platforms;

create table game_platforms
(
	game_id int,
    platform_id int,
    primary key (game_id, platform_id),
    foreign key (game_id) references games(game_id),
    foreign key (platform_id) references platforms(platform_id)
);
drop table game_platforms;
select * from game_platforms;

INSERT INTO platforms (name) VALUES
('PlayStation 5'),
('PlayStation 4'),
('Xbox Series X'),
('Xbox One S'),
('Nintendo Switch'),
('PC (Windows)'),
('PC (Mac)'),
('iOS'),
('Android');