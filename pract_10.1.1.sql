-- Por Miguel Sanchez Garcia - 1DAM 
-- pract_10.1.1

create table cliente (
	dni varchar(10) primary key not null,
	nombre varchar(50) not null comment 'Nombre del cliente',
	apellidos varchar(50) not null,
	fecha_nac date,
	direccion varchar(100) not null comment 'Direccion del cliente',
	cod_postal varchar(5)
) ENGINE = InnoDB;

create table factura (
	cod_fac varchar(10) primary key not null comment 'Codigo de factura',
	dni_cliente varchar(10) not null,
	fecha_fac date not null,
	importe decimal(8,2) not null comment 'Importe de una determinada factura',
	foreign key(dni_cliente) references cliente(dni) on update cascade on delete cascade
) ENGINE = InnoDB;

create table articulo (
	cod_art varchar(10) primary key not null comment 'Codigo de articulo',
	descripcion varchar(100) not null comment 'Descripcion de un determinado articulo',
	precio decimal(8,2) not null,
	stock int not null default 100
) ENGINE = InnoDB;

create table albaran (
	cod_alb varchar(10) primary key not null comment 'Codigo del albaran',
	cod_fact varchar(10),
	fecha_alb date not null,
	cod_art varchar(10) not null,
	cantidad int not null comment 'Cantidad',
	foreign key(cod_fact) references factura(cod_fac) on update cascade on delete cascade,
	foreign key(cod_art) references articulo(cod_art) on update cascade on delete cascade
) ENGINE = InnoDB;

create table comercial (
	dni varchar(10) primary key not null comment 'Numero de identidad del comercial',
	nombre varchar(50) not null,
	apellidos varchar(50) not null,
	fecha_nac date not null comment 'Fecha de nacimiento del comercial',
	direccion varchar(100) not null,
	cod_postal varchar(5) not null
) ENGINE = InnoDB;

create table visita (
	dni_cli varchar(10) not null comment 'DNI de algun cliente',
	dni_comercial varchar(10) not null comment 'DNI de algun comercial',
	fecha_visita date not null,
	primary key(dni_cli, dni_comercial, fecha_visita),
	foreign key(dni_cli) references cliente(dni) on update cascade on delete cascade,
	foreign key(dni_comercial) references comercial(dni) on update cascade on delete cascade
) ENGINE = InnoDB;

