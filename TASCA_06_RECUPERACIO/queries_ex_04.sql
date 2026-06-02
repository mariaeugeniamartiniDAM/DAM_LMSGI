UPDATE offices SET data = CONCAT(REPLACE(REPLACE(REPLACE(data, '[', ''), ']', ''), '}', ''), '}');
UPDATE employees SET data = CONCAT(REPLACE(REPLACE(REPLACE(data, '[', ''), ']', ''), '}', ''), '}');

SELECT DISTINCT JSON_UNQUOTE(JSON_EXTRACT(data, '$.phone')) AS phone
FROM offices
WHERE data LIKE '%"phone"%';

SELECT 
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.employeeNumber')) AS employee_id,
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.firstName')) AS firstName,
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.lastName')) AS lastName,
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.extension')) AS extension
FROM employees
WHERE JSON_UNQUOTE(JSON_EXTRACT(data, '$.extension')) LIKE '%23%';

SELECT 
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.employeeNumber')) AS employee_id,
    JSON_UNQUOTE(JSON_EXTRACT(data, '$.lastName')) AS lastName
FROM employees
WHERE data LIKE '%"employeeNumber"%';

SELECT 
    JSON_UNQUOTE(JSON_EXTRACT(emp.data, '$.employeeNumber')) AS employeeNumber,
    CONCAT(JSON_UNQUOTE(JSON_EXTRACT(emp.data, '$.firstName')), ' ', JSON_UNQUOTE(JSON_EXTRACT(emp.data, '$.lastName'))) AS fullName,
    JSON_UNQUOTE(JSON_EXTRACT(off.data, '$.city')) AS city
FROM employees emp
JOIN offices off 
ON JSON_UNQUOTE(JSON_EXTRACT(emp.data, '$.officeCode')) = JSON_UNQUOTE(JSON_EXTRACT(off.data, '$.officeCode'))
WHERE emp.data LIKE '%"employeeNumber"%';