CREATE DATABASE IF NOT EXISTS faculty_mysql;
USE faculty_mysql;

DROP TABLE IF EXISTS temp_professors;
CREATE TABLE temp_professors (
    xml_data LONGTEXT
);

LOAD DATA LOCAL INFILE 'C:/Users/meuge/Downloads/LENG_RECUP_TASCA06/FACULTY_BD_XML/Professors.xml' 
INTO TABLE temp_professors 
FIELDS TERMINATED BY '' 
ESCAPED BY ''
LINES TERMINATED BY '\n' 
(xml_data);

SET SESSION group_concat_max_len = 1000000;
SELECT GROUP_CONCAT(xml_data SEPARATOR '') INTO @xml_professors FROM temp_professors;

-- 3.a
SELECT jt.email
FROM JSON_TABLE(
    CONCAT('["', REPLACE(ExtractValue(@xml_professors, '//professor[address/municipality="Charleston"]/contact/email'), ' ', '","'), '"]'),
    '$[*]' COLUMNS (email VARCHAR(150) PATH '$')
) jt;

-- 3.b
SELECT COUNT(*) AS total_professors_CA
FROM JSON_TABLE(
    CONCAT('["', REPLACE(ExtractValue(@xml_professors, '//professor[address/province="CA"]/identity/NIF'), ' ', '","'), '"]'),
    '$[*]' COLUMNS (nif VARCHAR(50) PATH '$')
) jt;


-- 3.c 
SELECT jt.surname1 AS primer_cognom
FROM JSON_TABLE(
    CONCAT('["', REPLACE(ExtractValue(@xml_professors, '//professor[supervisor/SupervisorId="PR001"]/identity/surname1'), ' ', '","'), '"]'),
    '$[*]' COLUMNS (surname1 VARCHAR(100) PATH '$')
) jt;

-- 3.d
SELECT ExtractValue(@xml_professors, '//professor[@idProfessor="PR019"]/address/municipality') AS municipality;

