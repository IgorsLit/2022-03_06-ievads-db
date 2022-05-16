USE education_db;
-- ---------------------------------------------------
-- Grupu saraksts ar studentiem atbilstošā grupā
-- ---------------------------------------------------
SELECT grp.name, grp.edu_year_num, stud.firstname, stud.lastname FROM edu_groups AS grp INNER JOIN students AS stud ON grp.id = stud.groups_id   