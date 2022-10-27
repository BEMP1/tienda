DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

select nombre from producto;
select nombre,precio from producto;
select * from producto;
select nombre,round(precio) from producto;
select distinct f.codigo,f.nombre 
from producto p,fabricante f 
where p.codigo_fabricante = f.codigo;
select nombre from fabricante order by nombre ASC;
select nombre from producto order by nombre asc;
select * from fabricante limit 5;
select nombre,precio 
from producto 
order by precio ASC limit 1;
select nombre,precio 
from producto 
order by precio desc limit 1;
select * from producto where precio<=120;
select * from producto where precio between 60 and 200;
select * from producto where codigo_fabricante in (1,3,5);
select nombre from producto where nombre like "%portatil%";
select producto.codigo,producto.nombre,codigo_fabricante,fabricante.nombre as 'nombre empresa' 
from producto 
inner join fabricante on producto.codigo_fabricante = fabricante.codigo;
select producto.nombre,producto.precio,codigo_fabricante,fabricante.nombre as 'nombre empresa' 
from producto 
inner join fabricante on producto.codigo_fabricante = fabricante.codigo
order by fabricante.nombre ASC;
select producto.nombre,producto.precio,fabricante.nombre as 'nombre empresa' 
from producto 
inner join fabricante on producto.codigo_fabricante = fabricante.codigo
order by producto.precio ASC limit 1;
select p.nombre,f.nombre from fabricante f inner join producto p on codigo_fabricante = f.codigo where f.nombre = 'Lenovo';
select p.nombre,f.nombre from fabricante f inner join producto p on codigo_fabricante = f.codigo where f.nombre = 'Crucial' and precio > 200;
select p.nombre,f.nombre from fabricante f inner join producto p on codigo_fabricante = f.codigo where f.nombre in ('Asus','Hewlett-Packard');
select p.nombre,precio,f.nombre from fabricante f inner join producto p on codigo_fabricante = f.codigo where precio >= 180 order by precio desc;
select p.nombre,f.nombre from fabricante f left join producto p on codigo_fabricante = f.codigo;
select f.nombre from producto p inner join fabricante f on f.codigo not in (select distinct codigo_fabricante from producto) group by f.nombre;
select nombre from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'lenovo');