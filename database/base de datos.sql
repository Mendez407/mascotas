-- MySQL Workbench Forward Engineering
drop database if exists mydb_base;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb_base
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb_base
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb_base` DEFAULT CHARACTER SET utf8 ;
USE `mydb_base` ;

-- -----------------------------------------------------
-- Table `mydb_base`.`Vacuna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_base`.`Vacuna` (
  `id` INT NOT NULL auto_increment,
  `nombre` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_base`.`TipoMascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_base`.`TipoMascota` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(150) NULL,
  `EdadEquivalenteJoven` INT NULL,
  `EdadEquivalenteAdulto` INT NULL,
  `EdadAdulto` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_base`.`Raza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_base`.`Raza` (
  `id` INT NOT NULL auto_increment,
  `nombre` VARCHAR(150) NULL,
  `TipoMascota_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Raza_TipoMascota_idx` (`TipoMascota_id` ASC) VISIBLE,
  CONSTRAINT `fk_Raza_TipoMascota`
    FOREIGN KEY (`TipoMascota_id`)
    REFERENCES `mydb_base`.`TipoMascota` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_base`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_base`.`Role` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_base`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_base`.`User` (
  `id` INT NOT NULL auto_increment,
  `nombre` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(150) NULL,
  `Role_id` INT NOT NULL,
  `foto` BLOB NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_Role1_idx` (`Role_id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role1`
    FOREIGN KEY (`Role_id`)
    REFERENCES `mydb_base`.`Role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_base`.`Mascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_base`.`Mascota` (
  `id` INT NOT NULL auto_increment,
  `nombre` VARCHAR(150) NULL,
  `FechaNacimiento` DATETIME NULL,
  `foto` BLOB NULL,
  `User_id` INT NOT NULL,
  `TipoMascota_id` INT NOT NULL,
  `Raza_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Mascota_User1_idx` (`User_id` ASC) VISIBLE,
  INDEX `fk_Mascota_TipoMascota1_idx` (`TipoMascota_id` ASC) VISIBLE,
  INDEX `fk_Mascota_Raza1_idx` (`Raza_id` ASC) VISIBLE,
  CONSTRAINT `fk_Mascota_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `mydb_base`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascota_TipoMascota1`
    FOREIGN KEY (`TipoMascota_id`)
    REFERENCES `mydb_base`.`TipoMascota` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascota_Raza1`
    FOREIGN KEY (`Raza_id`)
    REFERENCES `mydb_base`.`Raza` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_base`.`ControlVacuna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_base`.`ControlVacuna` (
  `Mascota_id` INT NOT NULL,
  `Vacuna_id` INT NOT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`Mascota_id`, `Vacuna_id`),
  INDEX `fk_Mascota_has_Vacuna_Vacuna1_idx` (`Vacuna_id` ASC) VISIBLE,
  INDEX `fk_Mascota_has_Vacuna_Mascota1_idx` (`Mascota_id` ASC) VISIBLE,
  CONSTRAINT `fk_Mascota_has_Vacuna_Mascota1`
    FOREIGN KEY (`Mascota_id`)
    REFERENCES `mydb_base`.`Mascota` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascota_has_Vacuna_Vacuna1`
    FOREIGN KEY (`Vacuna_id`)
    REFERENCES `mydb_base`.`Vacuna` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

 insert into Role values("1","user"),("2","admin");
-- select * from Role;


 
insert into TipoMascota (id,nombre) values("1","perro"),("2","gato");
-- select * from TipoMascota;

insert into Raza  values ("1","Alaska Malacute","1"),("2","Persa","2"),("3","Bulldog Americano","1"),("4","Siames","2"),("5","labrador retriever","1"),("6","Himalayo","2");
 -- select * from Raza;

-- select * from user;
-- select * from TipoMascota;
-- select * from `mydb_base`.`User` as u where username = 'asd';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
