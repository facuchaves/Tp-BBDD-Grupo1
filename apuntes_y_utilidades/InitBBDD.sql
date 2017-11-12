-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema heladera
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema heladera
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `heladera` DEFAULT CHARACTER SET utf8 ;
USE `heladera` ;

-- -----------------------------------------------------
-- Table `heladera`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heladera`.`compra` (
  `id_compra` INT NOT NULL,
  `fecha_compra` DATETIME NULL,
  PRIMARY KEY (`id_compra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heladera`.`configuracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heladera`.`configuracion` (
  `id_configuracion` INT NOT NULL,
  `maximo` INT NULL,
  `minimo` INT NULL,
  `default` TINYINT NULL,
  `vigente` TINYINT NULL,
  PRIMARY KEY (`id_configuracion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heladera`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heladera`.`categoria` (
  `id_categoria` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `configuracion_id_configuracion` INT NOT NULL,
  PRIMARY KEY (`id_categoria`),
  INDEX `fk_categoria_configuracion1_idx` (`configuracion_id_configuracion` ASC),
  CONSTRAINT `fk_categoria_configuracion1`
    FOREIGN KEY (`configuracion_id_configuracion`)
    REFERENCES `heladera`.`configuracion` (`id_configuracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heladera`.`unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heladera`.`unidad` (
  `id_unidad` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_unidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heladera`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heladera`.`articulo` (
  `id_articulo` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `cant_stock` INT NULL,
  `descripcion` VARCHAR(45) NULL,
  `categoria_id_categoria` INT NOT NULL,
  `unidad_id_unidad` INT NOT NULL,
  PRIMARY KEY (`id_articulo`),
  INDEX `fk_articulo_categoria1_idx` (`categoria_id_categoria` ASC),
  INDEX `fk_articulo_unidad1_idx` (`unidad_id_unidad` ASC),
  CONSTRAINT `fk_articulo_categoria1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `heladera`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_unidad1`
    FOREIGN KEY (`unidad_id_unidad`)
    REFERENCES `heladera`.`unidad` (`id_unidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heladera`.`receta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heladera`.`receta` (
  `id_receta` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descripcion` VARCHAR(255) NULL,
  `pasos` VARCHAR(255) NULL,
  PRIMARY KEY (`id_receta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heladera`.`sector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heladera`.`sector` (
  `id_sector` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `configuracion_id_configuracion` INT NOT NULL,
  PRIMARY KEY (`id_sector`),
  INDEX `fk_sector_configuracion1_idx` (`configuracion_id_configuracion` ASC),
  CONSTRAINT `fk_sector_configuracion1`
    FOREIGN KEY (`configuracion_id_configuracion`)
    REFERENCES `heladera`.`configuracion` (`id_configuracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heladera`.`compra_has_articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heladera`.`compra_has_articulo` (
  `compra_id_compra` INT NOT NULL,
  `articulo_id_articulo` INT NOT NULL,
  PRIMARY KEY (`compra_id_compra`, `articulo_id_articulo`),
  INDEX `fk_compra_has_articulo_articulo1_idx` (`articulo_id_articulo` ASC),
  INDEX `fk_compra_has_articulo_compra_idx` (`compra_id_compra` ASC),
  CONSTRAINT `fk_compra_has_articulo_compra`
    FOREIGN KEY (`compra_id_compra`)
    REFERENCES `heladera`.`compra` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_has_articulo_articulo1`
    FOREIGN KEY (`articulo_id_articulo`)
    REFERENCES `heladera`.`articulo` (`id_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heladera`.`receta_has_articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heladera`.`receta_has_articulo` (
  `receta_id_receta` INT NOT NULL,
  `articulo_id_articulo` INT NOT NULL,
  PRIMARY KEY (`receta_id_receta`, `articulo_id_articulo`),
  INDEX `fk_receta_has_articulo_articulo1_idx` (`articulo_id_articulo` ASC),
  INDEX `fk_receta_has_articulo_receta1_idx` (`receta_id_receta` ASC),
  CONSTRAINT `fk_receta_has_articulo_receta1`
    FOREIGN KEY (`receta_id_receta`)
    REFERENCES `heladera`.`receta` (`id_receta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receta_has_articulo_articulo1`
    FOREIGN KEY (`articulo_id_articulo`)
    REFERENCES `heladera`.`articulo` (`id_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


#Configuracion carne
INSERT INTO `heladera`.`configuracion`(`id_configuracion`,`maximo`,`minimo`,`default`,`vigente`)VALUES(1,1,1,true,true);
#Configuracion lacteos
INSERT INTO `heladera`.`configuracion`(`id_configuracion`,`maximo`,`minimo`,`default`,`vigente`)VALUES(2,4,5,true,false);
#Configuracion bebidas
INSERT INTO `heladera`.`configuracion`(`id_configuracion`,`maximo`,`minimo`,`default`,`vigente`)VALUES(3,5,10,true,false);
#Configuracion otros
INSERT INTO `heladera`.`configuracion`(`id_configuracion`,`maximo`,`minimo`,`default`,`vigente`)VALUES(4,10,10,true,false);

#Carnes
INSERT INTO `heladera`.`categoria`(`id_categoria`,`nombre`,`descripcion`,`configuracion_id_configuracion`)VALUES(1,'Carnes','Carnes',1);
#Lacteosa
INSERT INTO `heladera`.`categoria`(`id_categoria`,`nombre`,`descripcion`,`configuracion_id_configuracion`)VALUES(2,'Lacteos','Lacteos',2);
#Bebidas
INSERT INTO `heladera`.`categoria`(`id_categoria`,`nombre`,`descripcion`,`configuracion_id_configuracion`)VALUES(3,'Bebidas','Bebidas',3);
#Otros
INSERT INTO `heladera`.`categoria`(`id_categoria`,`nombre`,`descripcion`,`configuracion_id_configuracion`)VALUES(4,'Otros','Otros',4);

INSERT INTO `heladera`.`unidad`(`id_unidad`,`nombre`,`descripcion`)VALUES(1,'Kilos','Kilos');
INSERT INTO `heladera`.`unidad`(`id_unidad`,`nombre`,`descripcion`)VALUES(2,'Litros','Litros');
INSERT INTO `heladera`.`unidad`(`id_unidad`,`nombre`,`descripcion`)VALUES(3,'Cantidad Unitaria','Cantidad Unitaria');
INSERT INTO `heladera`.`unidad`(`id_unidad`,`nombre`,`descripcion`)VALUES(4,'Gramos','Gramos');

#Churrasco
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(1,'Churrasco',1,'Churrasco',(select id_categoria from heladera.categoria WHERE nombre = 'Carnes'),(select id_unidad from heladera.unidad WHERE nombre = 'Kilos'));
#Bondiola
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(2,'Bondiola',3,'Bondiola',(select id_categoria from heladera.categoria WHERE nombre = 'Carnes'),(select id_unidad from heladera.unidad WHERE nombre = 'Kilos'));
#Pollo
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(3,'Pollo',5,'Pollo',(select id_categoria from heladera.categoria WHERE nombre = 'Carnes'),(select id_unidad from heladera.unidad WHERE nombre = 'Kilos'));
#Pescado
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(4,'Pescado',1,'Pescado',(select id_categoria from heladera.categoria WHERE nombre = 'Carnes'),(select id_unidad from heladera.unidad WHERE nombre = 'Kilos'));

#Leche
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(5,'Leche',1,'Leche',(select id_categoria from heladera.categoria WHERE nombre = 'Lacteos'),(select id_unidad from heladera.unidad WHERE nombre = 'Litros'));
#Yogurt
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(6,'Yogurt',2,'Yogurt',(select id_categoria from heladera.categoria WHERE nombre = 'Lacteos'),(select id_unidad from heladera.unidad WHERE nombre = 'Litros'));
#Queso
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(7,'Queso',5,'Queso',(select id_categoria from heladera.categoria WHERE nombre = 'Lacteos'),(select id_unidad from heladera.unidad WHERE nombre = 'Kilos'));
#Manteca
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(8,'Manteaca',100,'Manteca',(select id_categoria from heladera.categoria WHERE nombre = 'Lacteos'),(select id_unidad from heladera.unidad WHERE nombre = 'Gramos'));

#Cocacola
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(9,'Cocacola',1,'Cocacola',(select id_categoria from heladera.categoria WHERE nombre = 'Bebidas'),(select id_unidad from heladera.unidad WHERE nombre = 'Cantidad Unitaria'));

#Huevos
INSERT INTO `heladera`.`articulo`(`id_articulo`,`nombre`,`cant_stock`,`descripcion`,`categoria_id_categoria`,`unidad_id_unidad`)VALUES(10,'Huevos',12,'Huevos',(select id_categoria from heladera.categoria WHERE nombre = 'Otros'),(select id_unidad from heladera.unidad WHERE nombre = 'Cantidad Unitaria'));

select * from heladera.configuracion;
select * from heladera.categoria WHERE nombre = 'Carnes';
select * from heladera.unidad;
select * from heladera.articulo;
