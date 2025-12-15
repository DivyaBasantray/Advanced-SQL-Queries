-- TEMPORARY TABLES

-- Temporary tables are tables that are only visible to the session that created them. 
-- They can be used to store intermediate results for complex queries or to manipulate data before inserting it into a permanent table.

-- THERE ARE 2 WAYS TO CREATE A TEMPORARY TABLE
-- OPTION 1:

CREATE TEMPORARY TABLE temp
(first_name varchar(50),
last_name varchar(50),
age int
);

INSERT INTO temp
VALUES
("Divya", "Basantray", 24);

SELECT * 
FROM temp;

-- notice that if we refresh out tables it isn't there. It isn't an actual table. It's just a table in memory.

-- OPTION 2:

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;