ALTER TABLE heladera.articulo ADD fecha_ingreso date;
ALTER TABLE heladera.articulo ADD fecha_egreso date;
update heladera.articulo set fecha_ingreso = CAST('2017-11-01' AS DATE) where id_articulo > 0;
update heladera.articulo set fecha_ingreso = CAST('2017-10-01' AS DATE) , fecha_egreso = CAST('2017-10-30' AS DATE) where id_articulo between 5 and 8;