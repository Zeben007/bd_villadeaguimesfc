DROP DATABASE IF EXISTS bd_villadeaguimesfc;
CREATE DATABASE bd_villadeaguimesfc;
USE bd_villadeaguimesfc;

create table equipo (
id_equipo	int not null auto_increment,
nombre	varchar(30) not null,
presidente	varchar(50) not null,
primary key (id_equipo)
);

create table jugador (
DNI_jugador	varchar(9) unique	not null,
id_equipo	int not null,
nombre	varchar(30) not null,
apellidos	varchar(30) not null,
telefono	int(11)	not null,
salario	int	not null,
primary key (DNI_jugador)
);

create table partido (
id_partido	int not null auto_increment,
id_equipo	int not null,
fecha	date not null,
resultado	varchar(5),
arbitro	varchar(50),
primary key (id_partido)
);

create table inventario (
id_item	int not null auto_increment,
item	varchar(30),
cantidad	int,
coste_unidad	int,
primary key (id_item)
);

create table subcontrata (
id_subcontrata int not null auto_increment,
nombre	varchar(30) not null,
telefono int(9)	not null,
primary key (id_subcontrata)
);

create table empleado (
DNI_empleado	varchar(9) unique	not null,
id_subcontrata int not null,
nombre	varchar(30) not null,
apellidos	varchar(30) not null,
ocupacion	varchar(30) not null,
primary key (DNI_empleado)
);

create table afiliado (
DNI_afiliado	varchar(9) unique not null,
nombre	varchar(30) not null,
apellidos	varchar(30) not null,
fecha_inicio	date,
abono_total	int,
primary key (DNI_afiliado)
);

create table equipo_subcontrata (
id_equipo	int not null,
id_subcontrata	int not null,
primary key (id_equipo, id_subcontrata)
);

create table equipo_inventario (
id_equipo	int not null,
id_item	int not null,
primary key (id_equipo, id_item)
);

create table equipo_afiliado (
id_equipo	int not null,
DNI_afiliado	varchar(9) unique not null,
primary key (id_equipo, DNI_afiliado)
);

create table jugador_partido (
DNI_jugador	varchar(9) unique	not null,
id_partido	int not null,
primary key (DNI_jugador, id_partido)
);

alter table jugador
add constraint FK_equipo1 foreign key(id_equipo) references equipo(id_equipo);

alter table partido
add constraint FK_equipo2 foreign key(id_equipo) references equipo(id_equipo);

alter table empleado
add constraint FK_subcontrata1 foreign key(id_subcontrata) references subcontrata(id_subcontrata);

alter table equipo_subcontrata
add constraint FK_equipo3 foreign key(id_equipo) references equipo(id_equipo),
add constraint FK_subcontrata2 foreign key(id_subcontrata) references subcontrata(id_subcontrata);


alter table equipo_inventario
add constraint FK_equipo4 foreign key(id_equipo) references equipo(id_equipo),
add constraint FK_inventario1 foreign key(id_item) references inventario(id_item);

alter table equipo_afiliado
add constraint FK_equipo5 foreign key(id_equipo) references equipo(id_equipo),
add constraint FK_afiliado1 foreign key(DNI_afiliado) references afiliado(DNI_afiliado);

alter table jugador_partido
add constraint FK_jugador1 foreign key(DNI_jugador) references jugador(DNI_jugador),
add constraint FK_partido1 foreign key(id_partido) references partido(id_partido);

insert into equipo values(1,'Machangos','Pepe Rebilla Matos');
insert into equipo values(2,'Loles','Vladimir Perez Lopez');
insert into equipo values(3,'Mancos','María Castaña Álvarez');
insert into equipo values(4,'Los Pros F.C.','Alberto Moreno Quesadilla');
insert into equipo values(5,'Macarrones','José Araujo Matos');

insert into jugador values('43543567R',1,'Marcos','Álamo Martinez',687786856,3000);
insert into jugador values('47234727S',2,'Lucia','Lemes Gonzalez',685345235,3400);
insert into jugador values('12345678A',3,'Kevin','Suarez Ojeda',675434234,4000);
insert into jugador values('11223344B',4,'Ramón','Burgos Cansino',675845675,2500);
insert into jugador values('98765432Z',5,'Ismael','Pérez Pérez',674345678,1500);

insert into partido values(1,5,'2023-01-12','0-0','Gómez');
insert into partido values(2,4,'2023-02-10','2-4','Memez');
insert into partido values(3,3,'2023-03-01','0-1','Pelotez');
insert into partido values(4,2,'2023-03-01','4-3','Arbitrez');
insert into partido values(5,1,'2023-04-14','2-2','Apellidez');

insert into inventario values(1,'balón',100,40);
insert into inventario values(2,'deportivas',80,200);
insert into inventario values(3,'camiseta',80,60);
insert into inventario values(4,'guantes',20,20);
insert into inventario values(5,'toallas',100,15);

insert into subcontrata values(1,'FARCA S.L.',666555333);
insert into subcontrata values(2,'Fisios S.L.',655123456);
insert into subcontrata values(3,'Arcan S.L.',644334523);
insert into subcontrata values(4,'Comp S.A.',928754367);
insert into subcontrata values(5,'Canaguas S.A.',667853596);

insert into empleado values('45635632T',1,'Lorenzo','Alvarez Suarez','Nutricionista');
insert into empleado values('43234521F',2,'Juana','Lemes Sota','Fisioterapeuta');
insert into empleado values('23425667L',3,'José','Ramirez Perez','Fisioterapeuta');
insert into empleado values('54565445T',4,'Aday','Ramos Lopez','Abogado');
insert into empleado values('34536653H',5,'David','Fernandez Gomez','Repartidor');

insert into afiliado values('45655634R','Nemesio','Apellidez Lemez','2022-12-01',200);
insert into afiliado values('43234523F','Claudia','Martinez Calvez','2023-01-23',140);
insert into afiliado values('45676734R','Azael','Reyes Martel','2023-04-12',0);
insert into afiliado values('45377569C','Laura','Perez Suarez', '2023-03-03',30);
insert into afiliado values('65742345E','Misifu','Mininez Gatetez','2016-01-01',2000);

insert into equipo_subcontrata values(1,5);
insert into equipo_subcontrata values(2,4);
insert into equipo_subcontrata values(3,3);
insert into equipo_subcontrata values(4,2);
insert into equipo_subcontrata values(5,1);

insert into equipo_inventario values(1,5);
insert into equipo_inventario values(2,4);
insert into equipo_inventario values(3,3);
insert into equipo_inventario values(4,2);
insert into equipo_inventario values(5,1);

insert into equipo_afiliado values(1,'45655634R');
insert into equipo_afiliado values(2,'43234523F');
insert into equipo_afiliado values(3,'45676734R');
insert into equipo_afiliado values(4,'45377569C');
insert into equipo_afiliado values(5,'65742345E');

insert into jugador_partido values('43543567R',1);
insert into jugador_partido values('47234727S',2);
insert into jugador_partido values('12345678A',3);
insert into jugador_partido values('11223344B',4);
insert into jugador_partido values('98765432Z',5);
