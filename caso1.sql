create table per(
	correo varchar (255) primary key,
	nomu varchar (255),
	nombre varchar (255)
);

create table curso (
	nom varchar (255) primary key,
	ch integer
);


create table temas(
	nom varchar (255),
	tema varchar (255),
	PRIMARY KEY (nom,tema)
);

drop table insc

create table insc(
	correo varchar (255),
	nom varchar (255),
	correod varchar (255),
	nota integer,
	PRIMARY KEY (correo,nom),
	FOREIGN KEY (correod)
	REFERENCES per(correo)
);


create table dicta(
	correo varchar (255),
	nom varchar (255),
	PRIMARY KEY(correo,nom)
);


insert into per values('anagarcia56@gmail.com' ,  'AnaG56','Ana Garcia');
insert into per values('anagarcia32@gmail.com' ,  'AnaG32','Ana Garciax');
insert into per values('franciscopeña52@yahoo.com.ar','FranPeña865','Gonzalo Ramos');
insert into per values('pedroibañez@yahoo.com.ar','PedroIbañez223','Pedro Ibañez');
insert into per values('gisellevasquez201@yahoo.com.ar','Giselle201','Giselle Vasquez');
insert into per values('giselleV146@gmail.com','GVasquez24','Giselle Vasquez');
insert into per values('estefaniaperalta@gmail.com','Estef','Estefania Peralta');
insert into per values('gonzaloramos1978@yahoo.com.ar','GonzaR','Gonzalo Ramos');
insert into per values('rubengonzales104@gmail.com','RubenG','Ruben Gonzales');

insert into curso values('Python I', 29);
insert into curso values('Python II', 28);
insert into curso values('Kotlin I',45);
insert into curso values('Kotlin II',42);
insert into curso values('Ruby I', 22);

insert into temas values('Python I', 'Estructuras de control');
insert into temas values('Python I', 'Aplicacion');
insert into temas values('Python II', 'Estructuras de datos');
insert into temas values('Python II', 'Estructuras de contro');
insert into temas values('Kotlin I', 'Estructuras de datos');
insert into temas values('Kotlin I', 'Aplicacion');

insert into dicta values('estefaniaperalta@gmail.com', 'Python I');
insert into dicta values('estefaniaperalta@gmail.com', 'Python II');
insert into dicta values('gonzaloramos1978@yahoo.com.ar', 'Kotlin I');
insert into dicta values('gonzaloramos1978@yahoo.com.ar', 'Kotlin II');
insert into dicta values('pedroibañez@yahoo.com.ar', 'Python II');
insert into dicta values('pedroibañez@yahoo.com.ar', 'Kotlin II');
insert into dicta values('gisellevasquez201@yahoo.com.ar', 'Kotlin II');

insert into insc values('anagarcia32@gmail.com', 'Python I', 'estefaniaperalta@gmail.com', 7);
insert into insc values('franciscopeña52@yahoo.com.ar', 'Python I', 'estefaniaperalta@gmail.com', 9);
insert into insc values('anagarcia32@gmail.com', 'Python II', 'pedroibañez@yahoo.com.ar', 8);
insert into insc values('anagarcia56@gmail.com', 'Python II', 'estefaniaperalta@gmail.com', 6);
insert into insc values('pedroibañez@yahoo.com.ar', 'Python I', 'estefaniaperalta@gmail.com', 9);
insert into insc values('rubengonzales104@gmail.com', 'Kotlin I', 'gonzaloramos1978@yahoo.com.ar', 8);
insert into insc values('rubengonzales104@gmail.com', 'Kotlin II', 'gonzaloramos1978@yahoo.com.ar', 6);
insert into insc values('anagarcia56@gmail.com', 'Kotlin I', 'gonzaloramos1978@yahoo.com.ar', 7);

update curso set ch = 60 where nom='Ruby I'; --Punto 7

delete from curso where nom='Ruby I'; --Punto 8

select correo,nombre from per; --Punto 9

select count (nom) from curso; --Punto 10

select COUNT (DISTINCT (correo)) from dicta; --Punto 11

select MAX (nota) from insc where nom='Python I' ; --Punto 12

select nom from curso order by nom; --Punto 13

select nom from curso where ch>(select MAX (ch) from dicta inner join curso on dicta.nom=curso.nom where correo='pedroibañez@yahoo.com.ar'); --Punto 14

select nombre from per where nombre like '%Giselle%'; --Punto 15

select ch from curso where ch> (select ch from curso where nom='Python II') ORDER BY nom DESC; --Punto 16

select * from curso where curso.ch>40; --Punto 17

select * from curso where ch between 40 and 45; --Punto 18

select distinct correo,nombre from per natural join dicta; --Punto 19

select * from (select nom from curso) natural join per; --Punto 20

select * from curso full outer join insc on curso.nom=insc.nom; --Punto 21

select distinct correo,nomu,nombre from (select correo from dicta where nom='Python I') natural join per; --Punto 22

select distinct correo,nomu,nombre from (select correo from dicta where nom='Python II') natural join per; --Punto 23

select distinct correo,nomu,nombre from (select correo from dicta where nom='Python II' or nom='Python I') natural join per; --Punto 23

select distinct correo,nomu,nombre from (select correo from dicta where nom='Python II' Intersect select correo from dicta where nom='Python I') natural join per; --Punto 24

--Punto 26 preguntar

select correo,nomu,nombre from (select correo from insc where nom='Kotlin I') natural join per; --Punto 27

select correo,nomu,nombre from (select correo from insc where nom='Kotlin II') natural join per; --Punto 28

select correo,nomu,nombre from (select correo from insc where nom='Kotlin I' intersect select correo from insc where nom='Kotlin II') natural join per; --Punto 29

select correo,nomu,nombre from (select correo from insc where nom='Python I' and nota>6 Intersect select correo from insc where nom='Python II' and nota>6) natural join per; --Punto 30

--Punto 31

select correo,nomu, COUNT(*) nombre from dicta natural join per group by correo,nomu having count(*) > 1; --Punto 32

select correo,nomu, COUNT(*) nombre from (select correo,nom from (select correo, nom, ch from dicta natural join curso)  where ch<30) natural join per group by correo,nomu having count(*) > 1; --Punto 33

select insc.correo from insc, (select * from insc) AUX where insc.correo!=AUX.correo and insc.nom=AUX.nom;


