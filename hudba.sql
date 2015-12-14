create database hudba char set utf8 collate utf8_czech_ci;
use hudba;
/*drop database hudba;*/

create table skladba
(
	id_skladba int not null primary key auto_increment,
    jmeno varchar(20) not null,
    skladatel varchar(20),
    rok varchar(4),
    hodnoceni int
);

create table album
(
	id_album int not null primary key auto_increment,
    nazev varchar(20) not null,
    rok varchar(4),
	pocet_stop int,
    kompilace bool
);

create table skl_alb
(
	id_skladba int not null,
    id_album int not null,
    primary key(id_skladba,id_album)
);

alter table skl_alb add constraint FK_skl_alb foreign key (id_skladba) references skladba(id_skladba) on delete cascade;
alter table skl_alb add constraint FK_alb_skl foreign key (id_album) references album(id_album) on delete cascade;
/*alter table skladba drop foreign key FK_skl_alb;*/

create table zanr
(
	id_zanr int not null primary key auto_increment,
    nazev varchar(12) not null,
    popis text,
    vznik text
);

alter table skladba add column id_zanr int not null;
alter table skladba add constraint FK_skl_zanr foreign key (id_zanr) references zanr(id_zanr);

create table umelec
(
	id_umelec int not null primary key auto_increment,
    jmeno varchar(20) not null,
    bio text,
    rok_zalozeni varchar(4),
    datum_narozeni varchar(4)
);

create table ume_skl
(
	id_skladba int not null,
    id_umelec int not null,
    primary key(id_skladba,id_umelec)
);

alter table ume_skl add constraint FK_ume_skl foreign key(id_umelec) references umelec(id_umelec);
alter table ume_skl add constraint FK_skl_ume foreign key(id_skladba) references skladba(id_skladba);

create table playlist
(
	id_play int not null primary key auto_increment,
    nazev varchar(15) not null,
    popis text
);

create table skl_pl
(
	id_skladba int not null,
    id_play int not null
);

alter table skl_pl add constraint FK_skl_pl foreign key (id_skladba) references skladba(id_skladba);
alter table skl_pl add constraint FK_pl_skl foreign key (id_play) references playlist(id_play);

/*alter table skladba drop column id_album;*/