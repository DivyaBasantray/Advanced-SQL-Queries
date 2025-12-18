-- TRIGGERS 

-- a Trigger is a block of code that executes automatically executes when an event takes place in a table.


SELECT * 
FROM employee_salary;

SELECT * 
FROM employee_demographics;

USE parks_and_recreation;

DELIMITER $$
CREATE TRIGGER employee_insert2
	AFTER INSERT ON employee_salary
    -- now this means this trigger gets activated for each row that is inserted. Some sql databses like MSSQL have batch triggers or table level triggers that only trigger once, but MySQL doesn't have this functionality unfortunately
    FOR EACH ROW
    -- now we can write our block of code that we want to run when this is triggered
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name) 
    VALUES 
    (NEW.employee_id,NEW.first_name,NEW.last_name);
END $$
DELIMITER ; 


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);


-- EVENTS

-- Events are task or block of code that gets executed according to a schedule.  
-- Scheduling reports to be exported to files and so many other things
-- This helps with automation in MySQL

-- let's say Parks and Rec has a policy that anyone over the age of 60 is immediately retired with lifetime pay
-- All we have to do is delete them from the demographics table

SELECT * 
FROM parks_and_recreation.employee_demographics;

SHOW EVENTS;

-- we can drop or alter these events like this:

DROP EVENT IF EXISTS delete_retirees;
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO BEGIN
	DELETE
	FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$


-- if we run it again you can see Jerry is now retired

SELECT * 
FROM parks_and_recreation.employee_demographics;