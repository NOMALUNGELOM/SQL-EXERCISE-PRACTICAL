SELECT *
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
LIMIT 10;


-- 1. Find all records where Size is missing and purchase_amount > 50

SELECT 
       Customer_ID, 
       Size, 
       purchase_amount, 
       Item Purchased
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE Size IS NULL 
  AND purchase_amount > 50;


-- 2️. Total number of purchases grouped by Season (NULLs = 'Unknown Season')

SELECT 
    COALESCE(Season, 'Unknown Season') AS Season,
    COUNT(*) AS Total Purchases
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
GROUP BY COALESCE(Season, 'Unknown Season');


-- 3️. Count customers per Payment Method (NULLs = 'Not Provided')

SELECT 
    COALESCE("Payment Method", 'Not Provided') AS "Payment Method",
    COUNT(DISTINCT "Customer ID") AS "Customer Count"
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
GROUP BY COALESCE("Payment Method", 'Not Provided');


-- 4️. Customers with NULL Promo Code and Review Rating < 3.0

SELECT 
    Customer ID, 
    Promo Code Used, 
    Review Rating, 
    Item Purchased
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE  Promo Code Used IS NULL 
  AND  Review Rating < 3.0;


-- 5️. Average purchase_amount per Shipping Type (NULLs = 0)

SELECT 
     Shipping Type, 
    AVG(COALESCE(purchase_amount, 0)) AS "Average purchase_amount"
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
GROUP BY "Shipping Type";


-- 6️. Locations with >5 purchases and non-NULL Payment Method

SELECT 
    Location, 
    COUNT(*) AS Total Purchases
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE  Payment Method IS NOT NULL
GROUP BY Location
HAVING COUNT(*) > 5;


-- 7️. Create Spender Category classification

SELECT 
    Customer ID,
    COALESCE(purchase_amount, 0) AS purchase_amount,
    CASE 
        WHEN COALESCE(purchase_amount, 0) > 80 THEN 'High'
        WHEN COALESCE(purchase_amount, 0) BETWEEN 50 AND 80 THEN 'Medium'
        ELSE 'Low'
    END AS Spender Category
FROM "PRACTICAL_3"."SHOPPING"."TRENDS";


-- 8️. Customers with no Previous Purchases but non-NULL Color

SELECT 
    Customer ID, 
    Color, 
    Previous Purchases
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE Previous Purchases IS NULL 
  AND Color IS NOT NULL;


-- 9️. Total amount spent per Frequency of Purchases (NULLs = 'Unknown')

SELECT 
    COALESCE("Frequency of Purchases", 'Unknown') AS Frequency of Purchases,
    SUM(purchase_amount) AS Total purchase_amount
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
GROUP BY COALESCE("Frequency of Purchases", 'Unknown');


-- 10. Category purchase counts (excluding NULLs)

SELECT 
    Category, 
    COUNT(*) AS Total Purchases
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE Category IS NOT NULL
GROUP BY Category;


-- 11️. Top 5 Locations by total purchase_amount (NULLs = 0)

SELECT 
    Location, 
    SUM(COALESCE(purchase_amount, 0)) AS Total purchase_amount
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
GROUP BY Location
ORDER BY Total purchase_amount DESC
LIMIT 5;


-- 12️. Count of NULL Color by Gender and Size

SELECT 
    Gender, 
    Size, 
    COUNT(*) AS Null Color Count
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE Color IS NULL
GROUP BY Gender, Size;


-- 13️. Items with more than 3 NULL Shipping Types

SELECT 
    Item Purchased, 
    COUNT(*) AS NULL Shipping Type Count
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE Shipping Type IS NULL
GROUP BY Item Purchased
HAVING COUNT(*) > 3;


-- 14️. Count of customers per Payment Method with NULL Review Rating

SELECT 
    Payment Method, 
    COUNT(*) AS Missing Review Rating Count
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE "Review Rating" IS NULL
GROUP BY "Payment Method";


-- 15️. Average Review Rating per Category (>3.5, NULLs = 0)

SELECT 
    Category, 
    AVG(COALESCE("Review Rating", 0)) AS "Average Review Rating"
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
GROUP BY Category
HAVING AVG(COALESCE("Review Rating", 0)) > 3.5;


-- 16️. Colors missing in ≥2 rows with average Age for those rows

SELECT 
    Color, 
    AVG(Age) AS "Average Age"
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE Color IS NULL
GROUP BY Color
HAVING COUNT(*) >= 2;


-- 17️. Delivery Speed classification using CASE

SELECT 
    CASE 
        WHEN "Shipping Type" IN ('Express', 'Next Day Air') THEN 'Fast'
        WHEN "Shipping Type" = 'Standard' THEN 'Slow'
        ELSE 'Other'
    END AS "Delivery Speed",
    COUNT(DISTINCT "Customer ID") AS "Customer Count"
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
GROUP BY 
    CASE 
        WHEN "Shipping Type" IN ('Express', 'Next Day Air') THEN 'Fast'
        WHEN "Shipping Type" = 'Standard' THEN 'Slow'
        ELSE 'Other'
    END;


-- 18️. Customers with NULL purchase_amount and Promo Code Used = 'Yes'

SELECT 
    "Customer ID", 
    purchase_amount, 
    "Promo Code Used"
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE purchase_amount IS NULL 
  AND "Promo Code Used" = 'Yes';


-- 19️. Max Previous Purchases per Location (NULLs = 0, Avg Rating > 4.0)

SELECT 
    Location, 
    MAX(COALESCE("Previous Purchases", 0)) AS "Max Previous Purchases",
    AVG("Review Rating") AS "Average Review Rating"
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
GROUP BY Location
HAVING AVG("Review Rating") > 4.0;

-- 20️.Customers with NULL Shipping Type and purchase_amount between 30–70 USD

SELECT 
    "Customer ID", 
    "Shipping Type", 
    purchase_amount, 
    "Item Purchased"
FROM "PRACTICAL_3"."SHOPPING"."TRENDS"
WHERE "Shipping Type" IS NULL
  AND purchase_amount BETWEEN 30 AND 70;

----------------------------------------------------------
