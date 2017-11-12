use mydb;

#Configuracion carne
INSERT INTO `mydb`.`configuracion`(`id_configuracion`,`maximo`,`minimo`,`default`,`vigente`)VALUES(1,1,1,true,true);
#Configuracion lacteos
INSERT INTO `mydb`.`configuracion`(`id_configuracion`,`maximo`,`minimo`,`default`,`vigente`)VALUES(2,4,5,true,false);
#Configuracion bebidas
INSERT INTO `mydb`.`configuracion`(`id_configuracion`,`maximo`,`minimo`,`default`,`vigente`)VALUES(3,5,10,true,false);
#Configuracion otros
INSERT INTO `mydb`.`configuracion`(`id_configuracion`,`maximo`,`minimo`,`default`,`vigente`)VALUES(4,10,10,true,false);

#Carnes
INSERT INTO `mydb`.`categoria`(`id_categoria`,`nombre`,`descripcion`,`configuracion_id_configuracion`)VALUES(1,'Carnes','Carnes',1);
#Lacteos
INSERT INTO `mydb`.`categoria`(`id_categoria`,`nombre`,`descripcion`,`configuracion_id_configuracion`)VALUES(2,'Lacteos','Lacteos',2);
#Bebidas
INSERT INTO `mydb`.`categoria`(`id_categoria`,`nombre`,`descripcion`,`configuracion_id_configuracion`)VALUES(3,'Bebidas','Bebidas',3);
#Otros
INSERT INTO `mydb`.`categoria`(`id_categoria`,`nombre`,`descripcion`,`configuracion_id_configuracion`)VALUES(4,'Otros','Otros',4);

select * from mydb.configuracion;
select * from mydb.categoria WHERE nombre = 'Carnes';
select * from mydb.unidad;
select * from mydb.articulo;

INSERT INTO `mydb`.`unidad`(`id_unidad`,`nombre`,`descripcion`)VALUES(1,'Kilos','Kilos');
INSERT INTO `mydb`.`unidad`(`id_unidad`,`nombre`,`descripcion`)VALUES(2,'Litros','Litros');
INSERT INTO `mydb`.`unidad`(`id_unidad`,`nombre`,`descripcion`)VALUES(3,'Cantidad Unitaria','Cantidad Unitaria');
INSERT INTO `mydb`.`unidad`(`id_unidad`,`nombre`,`descripcion`)VALUES(4,'Gramos','Gramos');

#Churrasco
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(1,'Churrasco',1,'Churrasco',(select id_categoria from mydb.categoria WHERE nombre = 'Carnes'),(select id_unidad from mydb.unidad WHERE nombre = 'Kilos'));
#Bondiola
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(2,'Bondiola',3,'Bondiola',(select id_categoria from mydb.categoria WHERE nombre = 'Carnes'),(select id_unidad from mydb.unidad WHERE nombre = 'Kilos'));
#Pollo
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(3,'Pollo',5,'Pollo',(select id_categoria from mydb.categoria WHERE nombre = 'Carnes'),(select id_unidad from mydb.unidad WHERE nombre = 'Kilos'));
#Pollo
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(3,'Pollo',5,'Pollo',(select id_categoria from mydb.categoria WHERE nombre = 'Carnes'),(select id_unidad from mydb.unidad WHERE nombre = 'Kilos'));
#Pescado
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(4,'Pescado',1,'Pescado',(select id_categoria from mydb.categoria WHERE nombre = 'Carnes'),(select id_unidad from mydb.unidad WHERE nombre = 'Kilos'));

#Leche
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(5,'Leche',1,'Leche',(select id_categoria from mydb.categoria WHERE nombre = 'Lacteos'),(select id_unidad from mydb.unidad WHERE nombre = 'Litros'));
#Yogurt
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(6,'Yogurt',2,'Yogurt',(select id_categoria from mydb.categoria WHERE nombre = 'Lacteos'),(select id_unidad from mydb.unidad WHERE nombre = 'Litros'));
#Queso
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(7,'Queso',5,'Queso',(select id_categoria from mydb.categoria WHERE nombre = 'Lacteos'),(select id_unidad from mydb.unidad WHERE nombre = 'Kilos'));
#Manteca
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(8,'Manteaca',100,'Manteca',(select id_categoria from mydb.categoria WHERE nombre = 'Lacteos'),(select id_unidad from mydb.unidad WHERE nombre = 'Gramos'));

#Cocacola
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(9,'Cocacola',1,'Cocacola',(select id_categoria from mydb.categoria WHERE nombre = 'Bebidas'),(select id_unidad from mydb.unidad WHERE nombre = 'Cantidad Unitaria'));

#Huevos
INSERT INTO `mydb`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(10,'Huevos',12,'Huevos',(select id_categoria from mydb.categoria WHERE nombre = 'Otros'),(select id_unidad from mydb.unidad WHERE nombre = 'Cantidad Unitaria'));