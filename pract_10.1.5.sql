-- Por Miguel Sanchez Garcia - 1DAM 
-- pract_10.1.5

use comercial;

load data infile '/var/lib/mysql-files/cliente.csv' into table cliente
fields terminated by ','
lines terminated by '\n'; 

load data infile '/var/lib/mysql-files/factura.csv' into table factura
fields terminated by ','
lines terminated by '\n'; 

load data infile '/var/lib/mysql-files/articulo.csv' into table articulo
fields terminated by ','
lines terminated by '\n'; 

load data infile '/var/lib/mysql-files/albaran.csv' into table albaran
fields terminated by ','
lines terminated by '\n'; 

load data infile '/var/lib/mysql-files/comercial.csv' into table comercial
fields terminated by ','
lines terminated by '\n'; 

load data infile '/var/lib/mysql-files/visita.csv' into table visita
fields terminated by ','
lines terminated by '\n'; 
