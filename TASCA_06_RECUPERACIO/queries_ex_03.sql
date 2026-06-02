CREATE DATABASE ejercicio3_xml;

USE ejercicio3_xml;

DROP TABLE IF EXISTS temp_employees;
CREATE TABLE temp_employees (
    xml_data LONGTEXT
);

LOAD DATA LOCAL INFILE 'C:/Users/meuge/Downloads/LENG_M_TASCA05/Employees.xml' 
INTO TABLE temp_employees 
FIELDS TERMINATED BY '' 
ESCAPED BY ''
LINES TERMINATED BY '\n' 
(xml_data);



SET SESSION group_concat_max_len = 1000000;
SELECT GROUP_CONCAT(xml_data SEPARATOR '') INTO @xml_completo FROM temp_employees;

SELECT jt.email
FROM JSON_TABLE(
    CONCAT('["', REPLACE(ExtractValue(@xml_completo, '//employee[jobTitle="VP Sales"]/email'), ' ', '","'), '"]'),
    '$[*]' COLUMNS (email VARCHAR(100) PATH '$')
) jt;

SELECT ExtractValue(@xml_completo, 'count(//employee[office/Territory="EMEA"])') AS total_empleats_EMEA;

SELECT jt.lastName
FROM JSON_TABLE(
    CONCAT('["', REPLACE(ExtractValue(@xml_completo, '//employee[reportsTo="1056"]/lastName'), ' ', '","'), '"]'),
    '$[*]' COLUMNS (lastName VARCHAR(100) PATH '$')
) jt;

SELECT ExtractValue(@xml_completo, '//employee[@employeeNumber="1166"]/office/City') AS city;

SELECT ExtractValue(@xml_completo, '//employee/office/state') AS totsxml_data_els_territoris;

SELECT xml_data FROM temp_employees LIMIT 35;