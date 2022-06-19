# Nodarbība 04
## Uzdevums 1 : Datu bāze, tabulas, indeksi un ierobežojumi (constraints)

### Datu bāzes veidošana

# Mājas darbaa obligātā daļa.

- izveidojam jaunu datubāazi

create database if not exists petreg

- pārslēdzamies uz šso datubāzi

use petreg;

- izveidojam 3 tabulas owner, pet_owner un pet izmantojot mySql Workbench data modeler
  zemāk skat skriptu.

  - new model
  - add diagram
  - chaang database name from myDb to petreg
  - Forward engineer, rezultātu skat zemāk skripts. Skat petreg.mwb

  ```
  -- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema petreg
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema petreg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petreg` DEFAULT CHARACTER SET utf8 ;
USE `petreg` ;

-- -----------------------------------------------------
-- Table `petreg`.`owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petreg`.`owner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(128) NOT NULL,
  `last_name` VARCHAR(128) NOT NULL,
  `mobile` VARCHAR(64) NOT NULL,
  `email` VARCHAR(64) NULL,
  `phone` VARCHAR(64) NULL,
  `notes` VARCHAR(1024) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petreg`.`species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petreg`.`species` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `species_na` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petreg`.`cattery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petreg`.`cattery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_updated` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petreg`.`pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petreg`.`pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `birth_date` DATETIME NULL,
  `notes` VARCHAR(1024) NULL,
  `species_id` INT NULL,
  `pet_type` ENUM('cat', 'dog', 'rat') NOT NULL,
  `cattery_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_species1_idx` (`species_id` ASC),
  INDEX `fk_pet_cattery1_idx` (`cattery_id` ASC),
  CONSTRAINT `fk_pet_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `petreg`.`species` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_cattery1`
    FOREIGN KEY (`cattery_id`)
    REFERENCES `petreg`.`cattery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petreg`.`pet_owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petreg`.`pet_owner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `owner_id` INT NOT NULL,
  `pet_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_owner_owner_idx` (`owner_id` ASC),
  INDEX `fk_pet_owner_pet1_idx` (`pet_id` ASC),
  CONSTRAINT `fk_pet_owner_owner`
    FOREIGN KEY (`owner_id`)
    REFERENCES `petreg`.`owner` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_owner_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `petreg`.`pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `petreg`.`cattery`
-- -----------------------------------------------------
START TRANSACTION;
USE `petreg`;
INSERT INTO `petreg`.`cattery` (`id`, `name`, `last_updated`) VALUES (1, 'Silkie Blue', NULL);
INSERT INTO `petreg`.`cattery` (`id`, `name`, `last_updated`) VALUES (2, 'Pet Paradise', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `petreg`.`pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `petreg`;
INSERT INTO `petreg`.`pet` (`id`, `name`, `birth_date`, `notes`, `species_id`, `pet_type`, `cattery_id`) VALUES (DEFAULT, 'Urmass', '2021-12-14', NULL, NULL, 'dog', 1);
INSERT INTO `petreg`.`pet` (`id`, `name`, `birth_date`, `notes`, `species_id`, `pet_type`, `cattery_id`) VALUES (DEFAULT, 'Flying Wing', '2011-11-01', NULL, NULL, 'cat', 2);

COMMIT;


  ```

- Ja neizdodas tikt galā ar Forward Engineer, izmantojiet šo skriptu.  

- ievērojiet ka pet_type ir enum tips. Izmēģiniet insert ar neatļautu tipu. Kādu kļūdu saņemsit?

- nomainiet pet_type tipu uz char(10) kopā aar check constraint


```
alter table pet modify column pet_type char(10);
alter table pet add constraint check_pet_type check( pet_type IN ('cat', 'dog', 'rat', 'turtle', 'bird', 'fish'));
```

- Pievienojiet datus ar INSERT komandu izveidotajam modelim.

- Jāiesāk ar vecāku/master tabulu

- Turpinām ar bērna/detail tabulu









  )
