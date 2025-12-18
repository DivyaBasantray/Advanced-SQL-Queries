-- STORED PROCEDURES

SELECT *
FROM employee_salary
WHERE salary >=  50000;

USE parks_and_recreation;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >=  50000;

-- Now if we run this it will work and create the stored procedure
-- we can click refresh and see that it is there

-- notice it did not give us an output, that's because we 

-- If we want to call it and use it we can call it by saying:

CALL large_salaries();

-- it ran the query inside the stored procedure we created

CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >=  50000;
SELECT *
FROM employee_salary
WHERE salary >=  10000;

-- Best practice is to use a delimiter and a Begin and End to really control what's in the stored procedure
-- the delimiter is what separates the queries by default, we can change this to something like two $$
-- When we change this delimiter it now reads in everything as one whole unit or query instead of stopping after the first semi colon

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >=  50000;
	SELECT *
	FROM employee_salary
	WHERE salary >=  10000;
END $$
DELIMITER ;

CALL large_salaries3();

-- we can also create a stored procedure by right clicking on Stored Procedures and creating one:
-- it's going to drop the procedure if it already exists.

USE `parks_and_recreation`;
DROP procedure IF EXISTS `large_salaries3`;

-- it automatically adds the dilimiter for us

-- we can also add parameters
DELIMITER $$
CREATE PROCEDURE large_salaries4(e_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = e_id;
END $$
DELIMITER ;

CALL large_salaries4(1);