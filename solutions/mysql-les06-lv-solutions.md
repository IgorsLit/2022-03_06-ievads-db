# Nodarbība 06
## Uzdevums 1 : Datubāzes struktūru mainīšana

# Obligātaais mājas Darbs

### Soļi.

Izveidojam jaunu modeli ņeemot modeli pēc izvēles, piemēram to kurš aprakstīts 5. mājaas darbā - Dzīvnieku audzētava.

tabula owner - satur datus par dzīvnieku īpašniekiem.  

kolonas: vārds, uzvārds, mob. tel, email, fiksētais tel, piezīmes.

tabula pet - dzīvnieks

kolonas: vārds, dzimšanas datums, piezīmes, dzīvnieka tips (kaķis, suns, pele, ...)

starp *pet* un *owner* ir vairāki pret vairāakiem saite, nodrošinam to ar tabulas *pet_owner* palīdzību.

tabula cattery - audzētavas

kolonas: vārds, pēdējās labošanas datums/laiks.

tabula species - dzīvnieku šķirnes

kolonas : šķirnes_vārds

Piezīme, izmaanatojiet kreiso apostrofu (\`) lietotāja definētam nosaukumaam, kurš drīkst saturēt, tukšumus, jebkurus spec simbolus, utt.

Katrai tabulai primāro atslēgas kolonu nosauciet par id un ģenerējiet to ar AUTO_INCREMENT Starp tabulām pielieciet saites (foreign keys)

Modeļa piemērs pieejaams lesson_04/petreg.mwb, lai to aapskatītu atveriet to ar

saglabājam mopdeli - SAVE

Pārbaudam datubāazes nosaukumu modelī - tam jābūt *petreg*

Izmetam esošo petreg, ja tāda ir.

izpildām Database -> forward engineer

tiek uzģenerēts shēmas skripts



```
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
-- -----------------------------------------------------
-- Schema employees
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema employees
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employees` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
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


-- -----------------------------------------------------
-- Table `petreg`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petreg`.`table1` (
  `id1` INT NOT NULL,
  `id2` INT NOT NULL,
  `name1` VARCHAR(45) NULL,
  `name2` VARCHAR(45) NULL,
  PRIMARY KEY (`id1`, `id2`),
  UNIQUE INDEX `name1_UNIQUE` (`name1` ASC),
  UNIQUE INDEX `name2_UNIQUE` (`name2` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petreg`.`table2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petreg`.`table2` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `table1_id1` INT NOT NULL,
  `table1_id2` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_table2_table11_idx` (`table1_id1` ASC, `table1_id2` ASC),
  CONSTRAINT `fk_table2_table11`
    FOREIGN KEY (`table1_id1` , `table1_id2`)
    REFERENCES `petreg`.`table1` (`id1` , `id2`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `employees` ;

-- -----------------------------------------------------
-- Table `employees`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`departments` (
  `dept_no` CHAR(4) NOT NULL,
  `dept_name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  UNIQUE INDEX `dept_name` (`dept_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`employees` (
  `emp_no` INT NOT NULL,
  `birth_date` DATE NOT NULL,
  `first_name` VARCHAR(14) NOT NULL,
  `last_name` VARCHAR(16) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `hire_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_no`),
  INDEX `idx_name_fl` (`first_name` ASC, `last_name` ASC),
  INDEX `idx_name_lf` (`last_name` ASC, `first_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`dept_emp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`dept_emp` (
  `emp_no` INT NOT NULL,
  `dept_no` CHAR(4) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `dept_no`),
  INDEX `dept_no` (`dept_no` ASC),
  CONSTRAINT `dept_emp_ibfk_1`
    FOREIGN KEY (`emp_no`)
    REFERENCES `employees`.`employees` (`emp_no`)
    ON DELETE CASCADE,
  CONSTRAINT `dept_emp_ibfk_2`
    FOREIGN KEY (`dept_no`)
    REFERENCES `employees`.`departments` (`dept_no`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`dept_manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`dept_manager` (
  `emp_no` INT NOT NULL,
  `dept_no` CHAR(4) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `dept_no`),
  INDEX `dept_no` (`dept_no` ASC),
  CONSTRAINT `dept_manager_ibfk_1`
    FOREIGN KEY (`emp_no`)
    REFERENCES `employees`.`employees` (`emp_no`)
    ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2`
    FOREIGN KEY (`dept_no`)
    REFERENCES `employees`.`departments` (`dept_no`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`employees_copy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`employees_copy` (
  `emp_no` INT NOT NULL,
  `birth_date` DATE NOT NULL,
  `vards` VARCHAR(14) NOT NULL,
  `uzvards` VARCHAR(16) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `hire_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`emplyees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`emplyees` (
  `emp_no` INT NOT NULL,
  `birth_date` DATE NOT NULL,
  `first_name` VARCHAR(14) NOT NULL,
  `last_name` VARCHAR(16) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `hire_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`salaries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`salaries` (
  `emp_no` INT NOT NULL,
  `salary` INT NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `from_date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`titles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`titles` (
  `emp_no` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL DEFAULT 'NO_TITLE',
  `from_date` DATE NOT NULL DEFAULT '2021-01-01',
  `to_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`emp_no`, `title`, `from_date`),
  CONSTRAINT `titles_ibfk_1`
    FOREIGN KEY (`emp_no`)
    REFERENCES `employees`.`employees` (`emp_no`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employees`.`titles1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`titles1` (
  `title` VARCHAR(50) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NULL DEFAULT NULL,
  `emplyees_emp_no` INT NOT NULL,
  INDEX `fk_titles1_emplyees1_idx` (`emplyees_emp_no` ASC),
  CONSTRAINT `fk_titles1_emplyees1`
    FOREIGN KEY (`emplyees_emp_no`)
    REFERENCES `employees`.`emplyees` (`emp_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `employees` ;

-- -----------------------------------------------------
-- Placeholder table for view `employees`.`current_dept_emp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`current_dept_emp` (`emp_no` INT, `dept_no` INT, `from_date` INT, `to_date` INT);

-- -----------------------------------------------------
-- Placeholder table for view `employees`.`dept_emp_latest_date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`dept_emp_latest_date` (`emp_no` INT, `from_date` INT, `to_date` INT);

-- -----------------------------------------------------
-- Placeholder table for view `employees`.`emp_dept_vw`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`emp_dept_vw` (`darbinieka_nr` INT, `emp_no` INT, `Uzvārds` INT, `strādā_departamentā` INT);

-- -----------------------------------------------------
-- View `employees`.`current_dept_emp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees`.`current_dept_emp`;
USE `employees`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `employees`.`current_dept_emp` AS select `employees`.`l`.`emp_no` AS `emp_no`,`d`.`dept_no` AS `dept_no`,`employees`.`l`.`from_date` AS `from_date`,`employees`.`l`.`to_date` AS `to_date` from (`employees`.`dept_emp` `d` join `employees`.`dept_emp_latest_date` `l` on(((`d`.`emp_no` = `employees`.`l`.`emp_no`) and (`d`.`from_date` = `employees`.`l`.`from_date`) and (`employees`.`l`.`to_date` = `d`.`to_date`))));

-- -----------------------------------------------------
-- View `employees`.`dept_emp_latest_date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees`.`dept_emp_latest_date`;
USE `employees`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `employees`.`dept_emp_latest_date` AS select `employees`.`dept_emp`.`emp_no` AS `emp_no`,max(`employees`.`dept_emp`.`from_date`) AS `from_date`,max(`employees`.`dept_emp`.`to_date`) AS `to_date` from `employees`.`dept_emp` group by `employees`.`dept_emp`.`emp_no`;

-- -----------------------------------------------------
-- View `employees`.`emp_dept_vw`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees`.`emp_dept_vw`;
USE `employees`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `employees`.`emp_dept_vw` AS select `e`.`emp_no` AS `darbinieka_nr`,`e`.`emp_no` AS `emp_no`,`e`.`last_name` AS `Uzvārds`,`d`.`dept_name` AS `strādā_departamentā` from ((`employees`.`employees` `e` join `employees`.`dept_emp` `de`) join `employees`.`departments` `d` on(((`e`.`emp_no` = `de`.`emp_no`) and (`de`.`dept_no` = `d`.`dept_no`))));

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

Forward engineer pieslēdzas izvēlētajam mysql serverim, izveido daaatubāzi, tabulas un indeksus, kuri tika nodefinēti modeelī.

- Veicam izmaiņas modelī un nosinhronizējam tās ar datubāzi:

- pievienojam last_updated kolonu ar tipu TIMESTAMP visām taabulām.

- Pievienojam pet tabulai kolonu dzimums (sex) ar tipu ENUM('M','W'))

- izpildām database -> synchronize model

Apskatām sql komandass kuras veic izmaiņu:

```
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `petreg`.`pet_owner`
DROP FOREIGN KEY `fk_pet_owner_owner`,
DROP FOREIGN KEY `fk_pet_owner_pet1`;

ALTER TABLE `petreg`.`pet`
DROP FOREIGN KEY `fk_pet_cattery1`;

ALTER TABLE `petreg`.`table2`
DROP FOREIGN KEY `fk_table2_table11`;

ALTER TABLE `petreg`.`owner`
ADD COLUMN `last_updated` TIMESTAMP NULL DEFAULT NULL AFTER `notes`;

ALTER TABLE `petreg`.`pet`
ADD COLUMN `last_updated` TIMESTAMP NULL DEFAULT NULL AFTER `cattery_id`,
ADD COLUMN `sex` ENUM('M', 'W') NOT NULL AFTER `last_updated`,
CHANGE COLUMN `birth_date` `birth_date` DATE NULL DEFAULT NULL ,
CHANGE COLUMN `pet_type` `pet_type` ENUM('cat', 'dog', 'rat') NOT NULL ,
DROP INDEX `pet_catetry_id_idx` ;
;

ALTER TABLE `petreg`.`species`
ADD COLUMN `last_updated` TIMESTAMP NULL DEFAULT NULL AFTER `species_na`;

CREATE TABLE IF NOT EXISTS `petreg`.`veterinarian_apt` (
  `id` INT(11) NOT NULL,
  `visit_dt` TIMESTAMP NOT NULL,
  `vet_name` VARCHAR(45) NOT NULL,
  `vet_title` VARCHAR(45) NULL DEFAULT NULL,
  `vet_record` LONGTEXT NULL DEFAULT NULL,
  `pet_id` INT(11) NOT NULL,
  INDEX `fk_verian_visit_pet1_idx` (`pet_id` ASC),
  CONSTRAINT `fk_verian_visit_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `petreg`.`pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `petreg`.`pet_owner`
ADD CONSTRAINT `fk_pet_owner_owner`
  FOREIGN KEY (`owner_id`)
  REFERENCES `petreg`.`owner` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_pet_owner_pet1`
  FOREIGN KEY (`pet_id`)
  REFERENCES `petreg`.`pet` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `petreg`.`pet`
DROP FOREIGN KEY `fk_pet_species1`;

ALTER TABLE `petreg`.`pet` ADD CONSTRAINT `fk_pet_species1`
  FOREIGN KEY (`species_id`)
  REFERENCES `petreg`.`species` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_pet_cattery1`
  FOREIGN KEY (`cattery_id`)
  REFERENCES `petreg`.`cattery` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `petreg`.`table2`
ADD CONSTRAINT `fk_table2_table11`
  FOREIGN KEY (`table1_id1` , `table1_id2`)
  REFERENCES `petreg`.`table1` (`id1` , `id2`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
```

Izpildām skripta darbības no rokas izmaantojot DDL komandas.

Šis ir domāats skripta fragments izpildāms no faila. Saglaabājiet komandas failā un piešķiriet taam .SQL paplašinājumu:

```
use petreg;

-- izveidojam jaunu tabulu.
CREATE TABLE IF NOT EXISTS `petreg`.`veterinarian_apt` (
  `id` INT(11) NOT NULL,
  `visit_dt` TIMESTAMP NOT NULL,
  `vet_name` VARCHAR(45) NOT NULL,
  `vet_title` VARCHAR(45) NULL DEFAULT NULL,
  `vet_record` LONGTEXT NULL DEFAULT NULL,
  `pet_id` INT(11) NOT NULL,
  CONSTRAINT `fk_verian_visit_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `petreg`.`pet` (`id`)
;

-- pievienojam jaunus ierakstus tabulai pet

DELIMITER $$
CREATE PROCEDURE genData01()
BEGIN
    DECLARE i int DEFAULT 0;
    WHILE i <= 100 DO
INSERT INTO `petreg`.`pet` (`name`, `birth_date`, `species_id`, `pet_type`, `cattery_id`, `sex`) VALUES (concat('SomePet-',i) , '2020-01-14', '2', 'cat', '1', 'W');
        SET i = i + 1;
    END WHILE;
END$$

show errors


call genData01();







-- pievienojam kolonu last_updated
-- izmetam šso kolonu ja tā eksistē

ALTER TABLE `petreg`.`pet`
DROP COLUMN `last_updated`;

ALTER TABLE `petreg`.`pet`
ADD COLUMN `last_updated` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- pievieno kolonu dzimums
ALTER TABLE `petreg`.`pet`
ADD COLUMN `sex` ENUM('M', 'W') NOT NULL;

-- nomainaam birth_date tipu uz DATE
ALTER TABLE `petreg`.`pet`
CHANGE COLUMN `birth_date` `birth_date` DATE NULL DEFAULT NULL;

-- nomainam peet_type kolonas tipu uz enum (jo sāakumā taas bija VARCHAAR.)

ALTER TABLE `petreg`.`pet`
CHANGE COLUMN `pet_type` `pet_type` ENUM('cat', 'dog', 'rat') NOT NULL;

-- izmetam eksistēejošsu indeksu
ALTER TABLE `petreg`.`pet`
DROP INDEX `pet_catetry_id_idx`
;



```
