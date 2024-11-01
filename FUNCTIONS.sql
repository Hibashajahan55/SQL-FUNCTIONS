/*Functions
Consider the Country table and Persons table that you created earlier and perform the following:
1. Add a new column called DOB in Persons table with data type as Date.
2. Write a user-defined function to calculate age using DOB. 
3. Write a select query to fetch the Age of all persons using the function that has been created.
4. Find the length of each country name in the Country table. 
5. Extract the first three characters of each country's name in the Country table. 
6. Convert all country names to uppercase and lowercase in the Country table.*/

use entri;
DESC country;
DESC persons;
select * from country;
select * from persons;
-- 1. Add a new column called DOB in Persons table with data type as Date.
ALTER TABLE Persons
ADD DOB DATE;

DESC persons;

-- 2. Write a user-defined function to calculate age using DOB. 

-- inserting DOB 
UPDATE Persons
SET DOB = CASE 
             WHEN Id = 1 THEN '1990-01-01'
             WHEN Id = 2 THEN '1985-06-15'
             WHEN Id = 3 THEN '1983-08-18'
             WHEN Id = 4 THEN '1988-06-05'
             WHEN Id = 5 THEN '1980-04-16'
             WHEN Id = 6 THEN '1988-01-19'
             WHEN Id = 7 THEN '1999-07-29'
             WHEN Id = 8 THEN '1985-08-25'
             WHEN Id = 9 THEN '1982-11-16'
             WHEN Id = 10 THEN '1983-02-27'
             WHEN Id = 11 THEN '1988-12-25'
             WHEN Id = 12 THEN '1990-01-13'
             
          END
WHERE Id IN (1,2,3,4,5,6,7,8,9,10,11,12); 

-- -- user-defined function to calculate age using DOB. 

DELIMITER //

CREATE FUNCTION Calculate_Age (DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, DOB, CURDATE());
END //

DELIMITER ;

-- 3. Write a select query to fetch the Age of all persons using the function that has been created.

SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

-- 4. Find the length of each country name in the Country table. 

SELECT Country_name, LENGTH(Country_name) AS Length_of_country_name
FROM Country;

-- 5. Extract the first three characters of each country's name in the Country table. 
SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Characters
FROM Country;

-- 6. Convert all country names to uppercase and lowercase in the Country table.
SELECT Country_name, 
       UPPER(Country_name) AS CountryName_Uppercase, 
       LOWER(Country_name) AS CountryName_Lowercase
FROM Country;


