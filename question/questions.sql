-- 0-1. Write an sql query to fetch "FIRST_NAME" form Worker table using the alias name as <WORKER_NAME>

select first_name as WORKER_NAME from Worker;

-- 0-2. Write an sql query to fetch "FIRST_NAME" form Worker table in upper case

select UPPER(first_name) from Worker ;

-- 0-3 . Write an sql query to fetch unique values of DEPARTMENT form Worker table

select distinct department from Worker;

-- using group by

select department from Worker GROUP BY department;

-- 0-4 . Write an sql query to print the first three characters of FIRST_NAME from Worker table

select SUBSTR(first_name,1,3) from Worker;

-- 0-5 . Write an sql query to find the position of the alphabet ('b') in the first name column 'Amitabh' from Worker table

select INSTR(first_name, "b")
from Worker
where first_name = "Amitabh";

-- 0-6 . Write an sql query to print the first_name form Worker table after removing white spaces from the right side

select RTRIM(first_name) from Worker;

-- 0-7 . Write an sql query to print the first_name form Worker table after removing white spaces from the left side

select LTRIM(first_name) from Worker;

-- 0-8 . Write an sql query that fetches the unique values of DEPARMENT  form Worker table and prints it's length

SELECT department, LENGTH(department) FROM Worker;

-- 0-9. Write an Sql query to print the FIRST_NAME from Worker table after replacing "a" with "A"

select REPLACE(first_name, 'a', 'A') from Worker;

-- 0-10. Write an Sql query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.

-- A Space character should separate them

SELECT
    CONCAT(first_name, ' ', last_name) as COMPLETE_NAME
from Worker;

-- 0-11 . Write an sql query to print all Worker details from the Worker Table ORDER BY FIRST_NAME Ascending.

select * from Worker ORDER BY first_name ASC;

-- 0-12 . Write an sql query to print all Worker details from the Worker table ORDER BY

-- FIRST_NAME Ascending and DEPARMENT Descending

select * from Worker ORDER BY first_name, department DESC;

-- 0-13 . Write an sql query to print details for Workers with the first_name as "vipul" and "satish" from Worker Table

select * from Worker WHERE first_name IN ("Satish", "Vipul");

select *
from Worker
WHERE
    first_name = "Satish"
    OR first_name = "Vipul";

-- 0-14 . Write an sql query to print all the details of workers excluding first_name as "vipul", "satish" from Worker table

select * from Worker WHERE first_name NOT IN ("Satish", "Vipul");

select *
from Worker
WHERE
    first_name <> "Satish"
    AND first_name <> "Vipul";

-- 0-15 . Write an sql query to print details of workers wih department name as "Admin*"

select * from Worker WHERE department LIKE "Admin%";

-- 0-16 . Write an sql query to print details of the workers whose first_name CONTAINS 'a'

select * from Worker WHERE first_name like "%a%";

-- 0-17 . Write an sql query to print details of the workers whose first_name ends with 'a'

select * from Worker WHERE first_name LIKE '%_a';

-- 0-18 . Write an sql query to print details of the workers whose first_name ends with 'h' and CONTAINS siz alphabets

select * from Worker WHERE first_name LIKE '_____h';

-- 0-19 . Write an sql query to print details of the Workers whose salary lies between 1lakh to 5 lakh

select * from Worker WHERE salary <= 500000 and salary >= 100000;

select * from Worker WHERE salary BETWEEN 100000 AND 500000;

-- 0-20 . Write an sql query to print details of the Workers who have joined in Feb 2014

select *
from Worker
WHERE
    YEAR(joining_date) = 2014
    AND MONTH(joining_date) = 02;

-- 0-21 . Write an sql query to fetch the count of employees working in the deparment "Admin"

select * , COUNT(department) from Worker where department = "Admin";

-- 0-22 . Write an sql query to fetch worker full names with salaries >= 50000 and <= 100000

select
    CONCAT(first_name, ' ', last_name) as full_name,
    salary
from Worker
WHERE
    salary BETWEEN 50000 AND 100000;

-- 0-23 . Write an sql query to fetch the number of worker for each department in descending order

select
    department,
    COUNT(worker_id) as no_of_workers
from Worker
GROUP BY department
ORDER BY no_of_workers DESC;

-- 0-24 . Write an sql query to print details of Workers who are also manager

SELECT w.*
from Worker as w
    INNER JOIN Title as t ON w.worker_id = t.worker_ref_id
WHERE
    t.worker_title = "Manager";

-- 0-25 . Write an sql query to fetch number (more than 1) of same titles in the ORG of different types

SELECT
    worker_title,
    COUNT(*) as total
from Title
GROUP BY worker_title
HAVING total > 1;

-- 0-26 . Write an sql query to show only odd rows on the table

SELECT * from Worker WHERE MOD(worker_id, 2) <> 0;

-- 0-27 .Write an sql query to show only even rows on the table

SELECT * from Worker WHERE MOD(worker_id, 2) = 0;

-- 0-28 . Write an sql query to clone a new table from another table

CREATE TABLE worker_clone LIKE Worker;

INSERT INTO worker_clone SELECT * from Worker;

SELECT * FROM worker_clone;

-- 0-29 . Write an sql query to fetch intersecting records of two tables

SELECT Worker.*
from Worker
    INNER JOIN worker_clone USING(worker_id);

-- 0-30 . Write an sql query to show records from one table that another table don't have

SELECT Worker.*
FROM Worker
    LEFT JOIN worker_clone USING(worker_id)
WHERE
    worker_clone.worker_id is NULL;

-- 0-31 . Write an sql query to show CURRENT date and time

SELECT CURDATE();

SELECT NOW();

-- 0-32 . Write an sql query to show the top n (say 5) records of a table order by descending salary

SELECT * FROM Worker ORDER BY salary DESC LIMIT 5;

-- 0-33 . Write an sql query to determine the nth () highest salary from table

SELECT * FROM Worker ORDER BY salary DESC LIMIT 4,1;

-- 0-34 . Write an sql query to determine the nth () highest salary from table without using limit keyword

SELECT *
FROM Worker w1
WHERE 4 = (
        SELECT
            COUNT(DISTINCT(w2.salary))
        FROM Worker w2
        WHERE
            w2.salary >= w1.salary
    );

-- 0-35 . Write an sql query to fetch the list of employees with the same salary

SELECT w1.*
FROM Worker w1, Worker w2
WHERE
    w1.salary = w2.salary
    AND w1.worker_id != w2.worker_id;

-- 0-36 . Write an sql query to show the second highest salary from table

-- using sub-queries

SELECT MAX(salary)
FROM Worker
WHERE salary NOT IN (
        SELECT MAX(salary)
        from Worker
    );

-- using limit

SELECT DISTINCT salary FROM Worker ORDER BY salary DESC LIMIT 1,1;

-- 0-37 . Write an sql query to show one row twice in results from table

SELECT *
FROM Worker
UNION ALL
SELECT *
FROM Worker
ORDER BY worker_id;

-- 0-38 . Write an sql query to list worker_id who doesn't get bonus

SELECT *
FROM Worker
WHERE worker_id NOT IN (
        SELECT worker_ref_id
        FROM Bonus
    );

-- 0-39 . Write an sql query to ffetch the first 50% records from tables

SELECT *
FROM Worker
WHERE worker_id <= (
        SELECT
            COUNT(worker_id) / 2
        FROM Worker
    );

-- 0-40 . Write an sql query to fetch the departments that have less than 4 people init

SELECT
    department,
    COUNT(department) as employee
from Worker
GROUP BY department
HAVING employee < 4;

-- 0-41 . Write an sql query to show all departments along with the number of people in there

SELECT
    department,
    COUNT(department) as employee
from Worker
GROUP BY department;

-- 0-42 . Write an sql query to show the last record of a table

SELECT *
FROM Worker
WHERE worker_id = (
        SELECT
            COUNT(worker_id)
        from Worker
    );

SELECT *
FROM Worker
WHERE worker_id = (
        SELECT MAX(worker_id)
        from Worker
    );

-- 0-43 . Write an sql query to fetch the first row of a table

SELECT *
FROM Worker
WHERE worker_id = (
        SELECT MIN(worker_id)
        from Worker
    );

-- 0-44 . Write an sql query to fetch the last 5 records from a table

(
    SELECT *
    FROM Worker
    ORDER BY worker_id DESC
    LIMIT 5
)
ORDER BY worker_id;

-- 0-45 . Write an sql query to print the name of employees having the highest salary in each department

SELECT
    w.department,
    w.first_name,
    w.salary
from (
        SELECT
            MAX(salary) as maximum_salary,
            department
        FROM Worker
        GROUP BY
            department
    ) as temp
    INNER JOIN Worker w ON temp.department = w.department
    AND temp.maximum_salary = w.salary;

-- 0-46 . Write an sql query to fetch three max salaries from a table using co-related sub-query

SELECT salary
FROM Worker w1
WHERE 3 >= (
        SELECT
            COUNT(DISTINCT salary)
        FROM Worker w2
        WHERE
            w1.salary <= w2.salary
    )
ORDER BY w1.salary DESC;

SELECT COUNT(DISTINCT salary ) FROM Worker WHERE salary < 100000;

SELECT DISTINCT salary FROM Worker ORDER BY salary DESC LIMIT 3;

-- 0-47 . Write an sql query to fetch three min salaries from a table using co-related sub-query

SELECT DISTINCT salary
FROM Worker w1
WHERE 3 >= (
        SELECT
            COUNT(DISTINCT salary)
        FROM Worker w2
        WHERE
            w1.salary >= w2.salary
    )
ORDER BY w1.salary DESC;

-- 0-48 . Write an sql query to fetch nth max salaries from a table

SELECT DISTINCT salary
FROM Worker w1
WHERE n >= (
        SELECT
            COUNT(DISTINCT salary)
        FROM Worker w2
        WHERE
            w1.salary >= w2.salary
    )
ORDER BY w1.salary DESC;

-- 0-49 . Write an sql query to fetch departments along with the total salaries paid for each of them

SELECT
    department,
    SUM(salary) as total_sal
from Worker
GROUP BY department
ORDER BY total_sal DESC;

-- 0-50 . Write an sql query to fetch the names of workers who earn the highest salaries

SELECT first_name, salary
from Worker
WHERE salary = (
        SELECT MAX(salary)
        FROM Worker
    );

-- 0-51 . Write an sql query to remove all the reversed number pairs form the given table

CREATE TABLE pairs ( A INT, B INT );

INSERT INTO pairs
VALUES (1, 2), (2, 4), (2, 1), (3, 2), (4, 2), (5, 6), (6, 5), (7, 8);

SELECT * FROM pairs;

-- method 1: JOINS

SELECT lt.*
FROM pairs lt
    LEFT JOIN pairs rt ON lt.a = rt.b AND lt.b = rt.a
WHERE rt.a IS NULL OR lt.a < rt.a;

-- method 2 : correlated sub-query

SELECT *
FROM pairs p1
WHERE NOT EXISTS (
        SELECT *
        FROM pairs p2
        WHERE
            p1.b = p2.a
            AND p1.a = p2.b
            AND p1.a > p2.a
    );