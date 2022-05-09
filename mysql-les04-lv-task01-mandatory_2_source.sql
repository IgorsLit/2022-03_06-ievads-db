-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema education_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema education_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `education_db` DEFAULT CHARACTER SET utf8 ;
USE `education_db` ;

-- -----------------------------------------------------
-- Table `education_db`.`edu_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_db`.`edu_groups` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NULL COMMENT 'Grupas kods.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `name_UNIQUE` ON `education_db`.`edu_groups` (`name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `education_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_db`.`students` (
  `id` TINYINT(1) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(20) NOT NULL,
  `lastname` VARCHAR(20) NOT NULL,
  `groups_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_students_groups`
    FOREIGN KEY (`groups_id`)
    REFERENCES `education_db`.`edu_groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_students_groups_idx` ON `education_db`.`students` (`groups_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
