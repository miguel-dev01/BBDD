-- Por Miguel Sanchez Garcia - 1DAM 
-- pract_10.1.2

insert into cliente(dni, nombre, apellidos, fecha_nac, direccion, cod_postal) values
('11111111A', 'Jose', 'Perez Perez', '1974-08-01', 'C/Lepanto nº25 5º B', '30001'),
('22222222B', 'Maria', 'Sanchez Sanchez', '1985-03-25', 'C/Cervantes nº1 2ºA', '30001'),
('33333333C', 'Pedro', 'Martinez Lopez', '1995-06-10', 'C/Medina nº 15 1º C', '30009'),
('44444444D', 'Juan', 'Flores Puerta', '1991-04-12', 'C/Velazquez nº 20 4ºD', '30008');

insert into factura(cod_fac, dni_cliente, fecha_fac, importe) values
('F-0001', '11111111A', '2012-02-01', 2800),
('F-0002', '11111111A', '2012-03-02', 1500),
('F-0003', '11111111A', '2012-08-15', 800),
('F-0004', '22222222B', '2013-09-20', 3000),
('F-0005', '22222222B', '2013-10-02', 900),
('F-0006', '33333333C', '2013-11-15', 2500),
('F-0007', '44444444D', '2014-02-02', 520),
('F-0008', '44444444D', '2015-02-04', 2500);

insert into articulo(cod_art, descripcion, precio, stock) values
('ART-10', 'Elevador potencia', 60, 50),
('ART-80', 'Condensador RJW', 20, 200),
('ART-77', 'Placa Base ASUS 1155', 50, 35),
('ART-100', 'SAI 1500VA-Salicru', 500, 8),
('ART-101', 'Condensador RJW', 20, 200),
('ART-120', 'Ventilador led enermax', 10, 55),
('ART-250', 'Condensador RJW', 250, 40);

insert into albaran(cod_alb, cod_fact, fecha_alb, cod_art, cantidad) values
('A-0001', 'F-0001', '2012-01-10', 'ART-250', 10),
('A-0002', 'F-0001', '2012-01-20', 'ART-120', 30),
('A-0003', 'F-0002', '2012-02-15', 'ART-100', 3),
('A-0004', 'F-0003', '2012-04-03', 'ART-80', 25),
('A-0005', 'F-0003', '2012-06-15', 'ART-120', 10),
('A-0006', 'F-0003', '2012-07-25', 'ART-77', 4),
('A-0007', 'F-0004', '2013-09-20', 'ART-10', 50),
('A-0008', 'F-0005', '2013-10-02', 'ART-10', 15),
('A-0009', 'F-0006', '2013-11-15', 'ART-100', 5),
('A-0010', 'F-0007', '2014-02-01', 'ART-101', 1),
('A-0011', 'F-0007', '2014-02-02', 'ART-100', 1),
('A-0012', 'F-0008', '2015-02-04', 'ART-100', 5);

insert into comercial(dni, nombre, apellidos, fecha_nac, direccion, cod_postal) values 
('55555555E', 'Berta', 'Fuertes Ruiz', '1980-08-01', 'C/Medina nº40 3º A', '30008'),
('66666666F', 'Luis', 'Perez Martinez', '1983-02-23', 'C/Picasso nº3 7ºC', '30001'),
('77777777G', 'Ramon', 'Lucas Sanchez', '1995-06-12', 'C/Nadal nº 14 1º D', '30009'),
('88888888H', 'Juana', 'Luna Puertas', '1991-05-15', 'C/Colon nº 20 4ºD', '30007');

insert into visita(dni_cli, dni_comercial, fecha_visita) values
('11111111A', '66666666F', '2012-04-01'),
('11111111A', '66666666F', '2012-06-01'),
('22222222B', '55555555E', '2013-05-10'),
('33333333C', '66666666F', '2014-07-12'),
('33333333C', '66666666F', '2014-04-01'),
('44444444D', '77777777G', '2012-02-07'),
('44444444D', '66666666F', '2013-04-01'),
('44444444D', '55555555E', '2014-04-15');


