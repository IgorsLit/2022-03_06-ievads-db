-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema corpdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema corpdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `corpdb` DEFAULT CHARACTER SET utf8 ;
USE `corpdb` ;

-- -----------------------------------------------------
-- Table `corpdb`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpdb`.`departments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL COMMENT 'Departamenta nosaukums. ',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `name_UNIQUE` ON `corpdb`.`departments` (`name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `corpdb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpdb`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `departments_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_employees_departments`
    FOREIGN KEY (`departments_id`)
    REFERENCES `corpdb`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employees_departments_idx` ON `corpdb`.`employees` (`departments_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpdb`.`countries` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `departments_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_countries_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `corpdb`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_countries_departments1_idx` ON `corpdb`.`countries` (`departments_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
