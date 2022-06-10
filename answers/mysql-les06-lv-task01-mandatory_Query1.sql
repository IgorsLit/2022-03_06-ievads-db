-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema maintain
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema maintain
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `maintain`;
USE `maintain` ;

-- -----------------------------------------------------
-- Table `maintain`.`tests61`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `maintain`.`tests61` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL DEFAULT 'Kontroldarba nosaukums' COMMENT 'Kontroldarba nosaukums',
  `theme` VARCHAR(55) NOT NULL DEFAULT 'Teema' COMMENT 'Kontroldarba teema',
  `modifying_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4;

CREATE UNIQUE INDEX `name_UNIQUE` ON `maintain`.`tests61` (`name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `maintain`.`levels61`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `maintain`.`levels61` (
  `id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `tasks_id` TINYINT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_level6_in_tests61`
    FOREIGN KEY (`tasks_id`)
    REFERENCES `maintain`.`tests61` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_level6_in_tests61_idx` ON `maintain`.`levels61` (`tasks_id` ASC) VISIBLE;

-- -----------------------------------------------------
-- Table `maintain`.`tasks61`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `maintain`.`tasks61` (
  `id` TINYINT NOT NULL AUTO_INCREMENT,
  `theme` VARCHAR(50) NOT NULL,
  `type` VARCHAR(30) NOT NULL DEFAULT 'Daudzizveellu(Multiple choise)',
  `task_text` VARCHAR(30) NOT NULL DEFAULT 'Daudzizveellu(Multiple choise)',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
