-- DROP SCHEMA education_db;

-- ---------------------------------------------------
-- First session in Workbench
-- ---------------------------------------------------
SET AUTOCOMMIT = 0;
SELECT @@autocommit;
USE education_db;
INSERT INTO `education_db`.`students` (firstname, lastname, groups_id) VALUES ('Pēteris', 'Petrovs', 22);
INSERT INTO `education_db`.`students` (firstname, lastname, groups_id) VALUES ('Jānis', 'Jansons', 22);  

commit;

savepoint sp1; 

INSERT INTO `education_db`.`students` (firstname, lastname, groups_id) VALUES ('Andrejs', 'Andersons', 21); 
SELECT * FROM students;

rollback to sp1;

SELECT * FROM students;