# SQL FUNCTIONS
## INTRODUCTION
This repository contains a set of SQL queries and a user-defined function created to manage and manipulate data within the Country and Persons tables. These queries cover common SQL operations, including adding columns, calculating ages dynamically, and manipulating string data. 
## QUERIES
1. Add a new column called DOB in Persons table with data type as Date.
```sql
ALTER TABLE Persons
ADD COLUMN DOB DATE;
```
3. Write a user-defined function to calculate age using DOB.
```sql
CREATE FUNCTION CalculateAge (DOB DATE)
RETURNS INT
BEGIN
    DECLARE Age INT;
    SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN Age;
END;
```
3. Write a select query to fetch the Age of all persons using the function that has been created.
```sql
SELECT Name, CalculateAge(DOB) AS Age
FROM Persons;
```
5. Find the length of each country name in the Country table.
```sql
SELECT Country_name, LENGTH(Country_name) AS Length_of_country_name 
FROM Country;
```
6. Extract the first three characters of each country's name in the Country table.
```sql
SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Characters 
FROM Country;
```
7. Convert all country names to uppercase and lowercase in the Country table.
```sql
SELECT CountryName,
       UPPER(CountryName) AS Upper_CaseName,
       LOWER(CountryName) AS Lower_CaseName
FROM Country;
```

## CONCLUSION
These SQL scripts provide a versatile toolkit for managing and analyzing data within the Country and Persons tables. From adding new columns to applying custom functions and performing string operations, these queries illustrate the power of SQL in database manipulation and data transformation tasks. 

