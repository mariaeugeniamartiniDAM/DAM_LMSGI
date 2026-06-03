USE faculty_mysql;

DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS subjects;

CREATE TABLE courses (data LONGTEXT);
CREATE TABLE subjects (data LONGTEXT);

LOAD DATA LOCAL INFILE 'C:/Users/meuge/Downloads/LENG_RECUP_TASCA06/Courses.json' 
INTO TABLE courses 
FIELDS TERMINATED BY '' 
LINES TERMINATED BY '},' 
(data);

LOAD DATA LOCAL INFILE 'C:/Users/meuge/Downloads/LENG_RECUP_TASCA06/Subjects.json' 
INTO TABLE subjects 
FIELDS TERMINATED BY '' 
LINES TERMINATED BY '},' 
(data);

UPDATE courses SET data = CONCAT(REPLACE(REPLACE(REPLACE(data, '[', ''), ']', ''), '}', ''), '}');
UPDATE subjects SET data = CONCAT(REPLACE(REPLACE(REPLACE(data, '[', ''), ']', ''), '}', ''), '}');

-- 4.2.a
SELECT DISTINCT JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')) AS name
FROM subjects
WHERE data LIKE '%"name"%';

-- 4.2.b
SELECT 
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.idSubject')) AS idSubject,
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')) AS name
FROM subjects
WHERE LOWER(JSON_UNQUOTE(JSON_EXTRACT(data, '$.name'))) LIKE '%model%';

-- 4.2.c
SELECT 
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.idSubject')) AS subject_id,
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')) AS name
FROM subjects
WHERE data LIKE '%"idSubject"%';

-- 4.2.d
SELECT 
    JSON_UNQUOTE(JSON_EXTRACT(s.data, '$.idSubject')) AS subject_id,
    JSON_UNQUOTE(JSON_EXTRACT(s.data, '$.name')) AS subject_name,
    JSON_UNQUOTE(JSON_EXTRACT(c.data, '$.descriptiveName')) AS course_name
FROM subjects s
JOIN courses c 
ON JSON_UNQUOTE(JSON_EXTRACT(s.data, '$.course')) = JSON_UNQUOTE(JSON_EXTRACT(c.data, '$.idCourse'))
WHERE s.data LIKE '%"idSubject"%';