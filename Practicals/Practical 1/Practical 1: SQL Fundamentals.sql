--------------------------------------------------------------------------------------------
          --SELECT Statement 
--Q1. Display all columns for all transactions
--Expected output: All columns 
SELECT *
FROM RETAIL_SALES_DATASET;

--Q2. Display only the Transaction ID, Date, and Customer ID for all records.
--Expected output: Transaction ID, Date, Customer ID 
SELECT TRANSACTION_ID,
       Date,
       CUSTOMER_ID
FROM RETAIL_SALES_DATASET;

          --SELECT DISTINCT Statement 
--Q3. Display all the distinct product categories in the dataset.
--Expected output: Product Category
SELECT DISTINCT PRODUCT_CATEGORY
FROM RETAIL_SALES_DATASET;

--Q4. Display all the distinct gender values in the dataset.
--Expected output: Gender 
SELECT DISTINCT GENDER
FROM RETAIL_SALES_DATASET;

--------------------------------------------------------------------------------------------------
                      -- WHERE Clause 
--Q5. Display all transactions where the Age is greater than 40.
--Expected output: All columns 
SELECT*
FROM RETAIL_SALES_DATASET
WHERE AGE > 40 ;

--Q6. Display all transactions where the Price per Unit is between 100 and 500.
--Expected output: All columns 
SELECT*
FROM RETAIL_SALES_DATASET
WHERE PRICE_PER_UNIT BETWEEN 100 AND 500 ;

--Q7. Display all transactions where the Product Category is either 'Beauty' or 'Electronics'. 
--Expected output: All columns 
SELECT*
FROM RETAIL_SALES_DATASET
WHERE PRODUCT_CATEGORY = 'Beauty' or PRODUCT_CATEGORY = 'Electronics' ;

--Q8. Display all transactions where the Product Category is not 'Clothing'.
--Expected output: All columns 
SELECT*
FROM RETAIL_SALES_DATASET
WHERE PRODUCT_CATEGORY NOT IN ('Clothing');

--Q9. Display all transactions where the Quantity is greater than or equal to 3.
--Expected output: All columns 
SELECT*
FROM RETAIL_SALES_DATASET
WHERE QUANTITY >= 3;

------------------------------------------------------------------------------------------------------
                       -- Aggregate Functions 
--Q10. Count the total number of transactions.
--Expected output: Total_Transactions 
SELECT COUNT(TRANSACTION_ID) AS TOTAL_TRANSACTIONS
FROM RETAIL_SALES_DATASET;

--Q11. Find the average Age of customers.
--Expected output: Average_Age
SELECT AVG(AGE) AS AVARAGE_AGE
FROM RETAIL_SALES_DATASET;

--Q12. Find the total quantity of products sold.
--Expected output: Total_Quantity 
SELECT SUM(QUANTITY) AS TOTAL_QUANTITY
FROM RETAIL_SALES_DATASET;

--Q13. Find the maximum Total Amount spent in a single transaction.
--Expected output: Max_Total_Amount 
SELECT MAX(TOTAL_AMOUNT) AS MAX_TOTAL_AMOUNT
FROM RETAIL_SALES_DATASET;

--Q14. Find the minimum Price per Unit in the dataset.
--Expected output: Min_Price_per_Unit 
SELECT MIN(PRICE_PER_UNIT) AS MIN_PRICE_PER_UNIT
FROM RETAIL_SALES_DATASET;

------------------------------------------------------------------------------------------------------
                 --GROUP BY Statement
--Q15. Find the number of transactions per Product Category. 
--Expected output: Product Category, Transaction_Count
SELECT PRODUCT_CATEGORY, COUNT(TRANSACTION_ID) AS TRANSACTION_COUNT
FROM RETAIL_SALES_DATASET
GROUP BY PRODUCT_CATEGORY;

--Q16. Find the total revenue (Total Amount) per gender.
--Expected output: Gender, Total_Revenue 
SELECT GENDER, SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM RETAIL_SALES_DATASET
GROUP BY GENDER;

--Q17. Find the average Price per Unit per product category.
--Expected output: Product Category, Average_Price 
SELECT PRODUCT_CATEGORY, AVG(PRICE_PER_UNIT) AS AVARAGE_PRICE
FROM RETAIL_SALES_DATASET
GROUP BY PRODUCT_CATEGORY;

-----------------------------------------------------------------------------------------------
             -- HAVING Clause 
--Q18. Find the total revenue per product category where total revenue is greater than 10,000.
--Expected output: Product Category, Total_Revenue 
SELECT PRODUCT_CATEGORY,
SUM(PRICE_PER_UNIT * QUANTITY) AS TOTAL_REVENUE
FROM RETAIL_SALES_DATASET
GROUP BY PRODUCT_CATEGORY
HAVING SUM(PRICE_PER_UNIT * QUANTITY) > 10000;

--Q19. Find the average quantity per product category where the average is more than 2.
--Expected output: Product Category, Average_Quantity 
SELECT PRODUCT_CATEGORY,
AVG(QUANTITY) AS AVARAGE_QUANTITY
FROM RETAIL_SALES_DATASET
GROUP BY PRODUCT_CATEGORY
HAVING AVG(QUANTITY) > 2;

-------------------------------------------------------------------------------------------
                     --CASE Statement 
--Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000, otherwise 'Low'.
--Expected output: Transaction ID, Total Amount, Spending_Level 
SELECT TRANSACTION_ID,
       TOTAL_AMOUNT,
CASE
WHEN TOTAL_AMOUNT > 1000 THEN 'HIGH'
ELSE 'LOW'
END AS SPENDING_LEVEL
FROM RETAIL_SALES_DATASET;

--Q21. Display a new column called Age_Group that labels customers as:
--Expected output: Customer ID, Age, Age_Group
SELECT CUSTOMER_ID,
       AGE,
CASE
WHEN AGE <30 THEN 'YOUNG'
WHEN AGE BETWEEN 30 AND 59 THEN 'ADULT'
ELSE 'SENIOR'
END AS AGE_GROUP
FROM RETAIL_SALES_DATASET;


