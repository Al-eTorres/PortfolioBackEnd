-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB_PORTFOLIO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB_PORTFOLIO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_PORTFOLIO` DEFAULT CHARACTER SET utf8 ;
USE `DB_PORTFOLIO` ;

-- -----------------------------------------------------
-- Table `DB_PORTFOLIO`.`sobre_mi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_PORTFOLIO`.`sobre_mi` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(145) NOT NULL,
  `logo_trabajo` VARCHAR(100) NULL,
  `foto_perfil` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_PORTFOLIO`.`portadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_PORTFOLIO`.`portadas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `banner` VARCHAR(145) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_PORTFOLIO`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_PORTFOLIO`.`personas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `sobre_mi_id` INT NOT NULL,
  `portadas_id` INT NOT NULL,
  `titulo` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_personas_sobre_mi_idx` (`sobre_mi_id` ASC) VISIBLE,
  INDEX `fk_personas_portadas1_idx` (`portadas_id` ASC) VISIBLE,
  CONSTRAINT `fk_personas_sobre_mi`
    FOREIGN KEY (`sobre_mi_id`)
    REFERENCES `DB_PORTFOLIO`.`sobre_mi` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_portadas1`
    FOREIGN KEY (`portadas_id`)
    REFERENCES `DB_PORTFOLIO`.`portadas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_PORTFOLIO`.`estado_actividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_PORTFOLIO`.`estado_actividades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_PORTFOLIO`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_PORTFOLIO`.`educacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_instituto` VARCHAR(45) NOT NULL,
  `titulo_curso` VARCHAR(100) NOT NULL,
  `ubicacion` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NULL,
  `logo_institucion` VARCHAR(145) NULL,
  `personas_id` INT NOT NULL,
  `estado_actividades_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_educacion_personas1_idx` (`personas_id` ASC) VISIBLE,
  INDEX `fk_educacion_estado_actividades1_idx` (`estado_actividades_id` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_personas1`
    FOREIGN KEY (`personas_id`)
    REFERENCES `DB_PORTFOLIO`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_estado_actividades1`
    FOREIGN KEY (`estado_actividades_id`)
    REFERENCES `DB_PORTFOLIO`.`estado_actividades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_PORTFOLIO`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_PORTFOLIO`.`experiencia_laboral` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `puesto` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NULL,
  `descripcion_tareas` VARCHAR(45) NOT NULL,
  `personas_id` INT NOT NULL,
  `estado_actividades_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experiencia_laboral_personas1_idx` (`personas_id` ASC) VISIBLE,
  INDEX `fk_experiencia_laboral_estado_actividades1_idx` (`estado_actividades_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_laboral_personas1`
    FOREIGN KEY (`personas_id`)
    REFERENCES `DB_PORTFOLIO`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_laboral_estado_actividades1`
    FOREIGN KEY (`estado_actividades_id`)
    REFERENCES `DB_PORTFOLIO`.`estado_actividades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_PORTFOLIO`.`tipos_habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_PORTFOLIO`.`tipos_habilidades` (
  `id` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_PORTFOLIO`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_PORTFOLIO`.`habilidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_habilidad` VARCHAR(45) NOT NULL,
  `porcentaje` SMALLINT(2) NULL,
  `icono` VARCHAR(145) NULL,
  `tipos_habilidades_id` INT NOT NULL,
  `personas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_habilidades_tipos_habilidades1_idx` (`tipos_habilidades_id` ASC) VISIBLE,
  INDEX `fk_habilidades_personas1_idx` (`personas_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidades_tipos_habilidades1`
    FOREIGN KEY (`tipos_habilidades_id`)
    REFERENCES `DB_PORTFOLIO`.`tipos_habilidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habilidades_personas1`
    FOREIGN KEY (`personas_id`)
    REFERENCES `DB_PORTFOLIO`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_PORTFOLIO`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_PORTFOLIO`.`proyectos` (
  `id` INT NOT NULL,
  `titulo_proyecto` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(145) NOT NULL,
  `fecha_realizacion` DATE NOT NULL,
  `ruta` VARCHAR(145) NULL,
  `imagen_proyecto` VARCHAR(145) NULL,
  `personas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proyectos_personas1_idx` (`personas_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_personas1`
    FOREIGN KEY (`personas_id`)
    REFERENCES `DB_PORTFOLIO`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
