SELECT FIRST_NAME, SALARY FROM Worker;

SELECT 44+11;

SELECT now();

select LCASE("RIJVI");

select UCASE("rijvi");

SELECT * FROM Worker;

SELECT * FROM Worker WHERE SALARY > 80000;

SELECT * FROM Worker WHERE SALARY BETWEEN 90000 and 300000;

SELECT * FROM Worker WHERE DEPARTMENT = "HR" AND SALARY >100000;

SELECT * FROM Worker WHERE DEPARTMENT = "HR" OR DEPARTMENT = "Admin";

-- better way

SELECT * FROM Worker WHERE DEPARTMENT IN ("HR", "Admin");

SELECT * FROM Worker WHERE DEPARTMENT NOT IN ("HR", "Admin");

SELECT * FROM Worker WHERE DEPARTMENT IS NULL;

-- wildcard

SELECT * FROM Worker WHERE FIRST_NAME LIKE "%i%";

SELECT * FROM Worker WHERE FIRST_NAME LIKE "_i%";

-- SORTING -- asc is default order by

SELECT * FROM Worker ORDER BY SALARY DESC;

--distinct

SELECT distinct department FROM Worker;

-- GROUP BY

SELECT department, COUNT(department) FROM Worker GROUP BY department;

-- avg salary per dept.

SELECT department, AVG(salary) FROM Worker GROUP BY department;

-- min salary per dept.

SELECT department, MIN(salary) FROM Worker GROUP BY department;

-- max salary per dept.

SELECT department, MAX(salary) FROM Worker GROUP BY department;

-- sum of the salary per dept.

SELECT department, SUM(salary) FROM Worker GROUP BY department;

-- GROUP BY  HAVING

SELECT
    department,
    COUNT(department)
FROM Worker
GROUP BY department
HAVING COUNT(department) > 1;