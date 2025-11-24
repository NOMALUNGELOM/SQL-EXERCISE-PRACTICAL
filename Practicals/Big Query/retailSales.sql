SELECT* 
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales` 
LIMIT 1000;

SELECT AGE
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`;

SELECT DISTINCT`Product Category`
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`;

SELECT FORMAT_DATE ('%Y-%m',DATE) AS YEAR_MONTH,

       COUNT(DISTINCT `TRANSACTION ID`) AS NUMBER_OF_SALES,
       COUNT(DISTINCT `CUSTOMER ID`) AS NUMBER_OF_CUSTOMERS,
   CASE
       WHEN AGE BETWEEN 0 AND 18 THEN '01.0-18 JUNIOR'
       WHEN AGE BETWEEN 19 AND 30 THEN '02.19-30 ADULT'
       WHEN AGE BETWEEN 31 AND 50 THEN '03.31-50 MIDDLE-AGE-ADULT'
       WHEN AGE BETWEEN 0 AND 18 THEN '04.50+ SENIOR ADULT'
       END AS AGE_BUCKET,
       SUM(IFNULL(`TOTAL AMOUNT`,0)) AS REVENUE,
       SUM(IFNULL(`QUANTITY`,0)) AS QUANTITY,
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`
WHERE GENDER != 'FEMALE'
GROUP BY ALL;

--1. WHERE Clause 
--Q1. Filter all transactions that occurred in the year 2023. 
--Expected output: All columns

SELECT *
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`
WHERE EXTRACT(YEAR FROM Date) = 2023;

---------------------------------------------------------------------------------------
--2. Filtering + Conditions 
--Q2. Display all transactions where the Total Amount is more than the average Total Amount 
--of the entire dataset. 
--Expected output: All columns 

SELECT *
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`
WHERE `Total Amount` > (SELECT AVG(`Total Amount`) FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`);
----------------------------------------------------------------------------------------
--3. Aggregate Functions 
--Q3. Calculate the total revenue (sum of Total Amount). 
--Expected output: Total_Revenue

SELECT SUM(`Total Amount`) AS Total_Revenue
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`;

-----------------------------------------------------------------------------------------
--4. DISTINCT 
--Q4. Display all distinct Product Categories in the dataset. 
--Expected output: Product_Category 

SELECT DISTINCT `Product Category`
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`;

-----------------------------------------------------------------------------------------
--5. GROUP BY 
--Q5. For each Product Category, calculate the total quantity sold. 
--Expected output: Product_Category, Total_Quantity

SELECT `Product Category`, 
SUM(Quantity) AS Total_Quantity
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`
GROUP BY `Product Category`;

---------------------------------------------------------------------------------------- 
--6. CASE Statement 
--Q6. Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’ 
--(30–59), and ‘Senior’ (60+). 
--Expected output: Customer_ID, Age, Age_Group

SELECT `Customer ID`, Age,
  CASE
    WHEN Age < 30 THEN 'Youth'
    WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
    WHEN Age >= 60 THEN 'Senior'
  END AS Age_Group
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`;

----------------------------------------------------------------------------------------
--7. Conditional Aggregation 
--Q7. For each Gender, count how many high-value transactions occurred (where Total 
--Amount > 500). 
--Expected output: Gender, High_Value_Transactions

SELECT Gender,
       COUNT(CASE WHEN `Total Amount` > 500 THEN 1 END) AS High_Value_Transactions
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`
GROUP BY Gender;

-------------------------------------------------------------------------------------
--8. HAVING Clause 
--Q8. For each Product Category, show only those categories where the total revenue 
--exceeds 5,000. 
--Expected output: Product_Category, Total_Revenue 

SELECT `Product Category`,
       SUM(`Total Amount`) AS Total_Revenue
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

----------------------------------------------------------------------------------------
--9. Calculated Fields 
--Q9. Display a new column called Unit_Cost_Category that labels a transaction as: – 'Cheap' if Price per Unit < 50 – 'Moderate' if Price per Unit between 50 and 200 – 'Expensive' if Price per Unit > 200 
--Expected output: Transaction_ID, Price_per_Unit, Unit_Cost_Category

SELECT `Transaction ID`, `Price per Unit`,
  CASE
    WHEN`Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    WHEN `Price per Unit` > 200 THEN 'Expensive'
  END AS Unit_Cost_Category
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`;

--------------------------------------------------------------------------------------- 
--10. Combining WHERE + CASE 
--Q10. Display all transactions from customers aged 40 or older and add a column 
--Spending_Level showing ‘High’ if Total Amount > 1000, otherwise ‘Low’. 
--Expected output: Customer_ID, Age, Total_Amount, Spending_Level

SELECT `Customer ID`, Age, `Total Amount`,
  CASE
    WHEN `Total Amount` > 1000 THEN 'High'
    ELSE 'Low'
  END AS Spending_Level
FROM `eternal-outlook-478118-h3.Sales.Retail_Sales`
WHERE Age >= 40;
---------------------------------------------------------------------------------------
