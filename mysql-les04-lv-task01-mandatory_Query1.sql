-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema edu_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema edu_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `edu_db` DEFAULT CHARACTER SET utf8 ;
USE `edu_db` ;

-- -----------------------------------------------------
-- Table `edu_db`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edu_db`.`groups` (
  `id` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NULL COMMENT 'Grupas kods.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `name_UNIQUE` ON `edu_db`.`groups` (`name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `edu_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edu_db`.`students` (
  `id` TINYINT(1) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(20) NOT NULL,
  `lastname` VARCHAR(20) NOT NULL,
  `group_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_student_in_group`
    FOREIGN KEY (`group_id`)
    REFERENCES `edu_db`.`groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_student_in_group_idx` ON `edu_db`.`students` (`group_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
