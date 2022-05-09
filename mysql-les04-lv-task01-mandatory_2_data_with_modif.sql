USE education_db;

-- --------------------------------------------------------------------------
-- Insert information
-- --------------------------------------------------------------------------
INSERT INTO edu_groups (name) VALUES('DP1-1'), ('DP1-2'), ('DP2-1'), ('DP2-2'), ('DT1-1'), ('DT2-1'), ('A1-1'), ('A2-1');
INSERT INTO students (firstname, lastname, groups_id) VALUES('Andrejs', 'Abolins', 1), ('Peteris', 'Ozols', 1), ('Liene', 'Smita', 1), ('Antons', 'Avotins', 2), ('Janis','Berzs', 2), ('Peteris', 'Berzins', 2), ('Uldis', 'Ivanovs', 2), ('Andrejs', 'Berzins', 3), ('Antra','Liepina', 3);
INSERT INTO students (firstname, lastname, groups_id) VALUES('Oskars', 'Berzins', 4), ('Ilvars','Liepins', 5);

-- --------------------------------------------------------------------------
-- Add columns and change information, groups education years
-- --------------------------------------------------------------------------
ALTER TABLE edu_groups ADD edu_year_num TINYINT(1) UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE edu_groups ADD modifying_time TIMESTAMP;
UPDATE edu_groups SET edu_year_num = 2 WHERE name LIKE '%2-_';
INSERT INTO edu_groups (name, edu_year_num) VALUES ('PP1-1', 1), ('DP3-1', 3), ('DP4-1', 4);
