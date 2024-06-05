create table ciu(
	ciudad_id varchar (255) primary key,
	ciudad_nom varchar (255)
);

drop table pers

create table pers( --tabla A
	id integer primary key,
	nom varchar (255),
	ciudad_idc varchar (255) NOT NULL,
	edad integer,
	FOREIGN KEY (ciudad_idc) 
	REFERENCES ciu(ciudad_id)
	ON DELETE restrict
	ON UPDATE cascade
);

drop table pers

create table pers( --tabla B
	id integer primary key,
	nom varchar (255),
	ciudad_idc varchar (255) NOT NULL,
	edad integer,
	FOREIGN KEY (ciudad_idc) 
	REFERENCES ciu(ciudad_id)
	ON DELETE set null
	ON UPDATE cascade
);

insert into ciu (ciudad_id,ciudad_nom) values ( 1,'Galilea');
insert into ciu values ( 2,'Betsaida');
insert into ciu values (3,'Patmos');
insert into ciu values (4,'Jerusalén');

insert into pers values (1,'Pedro Cortes',1,16);
insert into pers values (2,'San ago Mas',2, 25);
insert into pers values (3,'Juan Bas ',4, 50); --tenia un error y decia 5 y no existia ese ciudad
insert into pers values (4,'Andrea Hernández',1);
insert into pers values (5,'Ana Perez',1,30);

select * from pers;
select * from ciu;

delete from ciu WHERE ciudad_id='1' --viola la llave foranea con la tabla A y con la tabla B viola que no sea nulo
