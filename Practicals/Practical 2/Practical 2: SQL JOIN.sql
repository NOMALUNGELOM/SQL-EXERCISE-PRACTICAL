             --INNER JOIN
--List all orders along with the customer name and product name. 
SELECT O.ORDERID, O.ORDERDATE, C.CUSTOMERNAME, P.PRODUCTNAME,O.QUANTITY
FROM ORDERS_LARGE AS O
INNER JOIN CUSTOMERS_LARGE AS C
ON O.CUSTOMERID = C.CUSTOMERID
INNER JOIN PRODUCT_LARGE AS P
ON O.PRODUCTID = P.PRODUCTID;

--Which customers have placed at least one order? 
SELECT C.CUSTOMERID, C.CUSTOMERNAME, C.COUNTRY, O.ORDERID, O.ORDERDATE
FROM CUSTOMERS_LARGE AS C
INNER JOIN ORDERS_LARGE AS O
ON C.CUSTOMERID = O.CUSTOMERID;

           --LEFT JOIN
--List all customers and any orders they might have placed. Include customers who have not placed any orders. 
SELECT C.CustomerID, C.CustomerName, C.Country, O.OrderID, O.OrderDate, O.ProductID, O.Quantity 
FROM CUSTOMERS_LARGE AS C
LEFT JOIN ORDERS_LARGE AS O
ON C.CUSTOMERID = O.CUSTOMERID;

--List all products and how many times each was ordered (if any). 
SELECT P.PRODUCTID, P.PRODUCTNAME,
COUNT(O.ORDERID) AS TOTAL_ORDERS
FROM PRODUCT_LARGE AS P
LEFT JOIN ORDERS_LARGE AS O
ON P.PRODUCTID = O.PRODUCTID
GROUP BY P.PRODUCTID, P.PRODUCTNAME;

             --RIGHT JOIN
--Find all orders along with product details, including any products that might not have been ordered             
SELECT O.ORDERID, O.ORDERDATE, P.PRODUCTID, P.PRODUCTNAME, P.PRICE, O.QUANTITY
FROM ORDERS_LARGE AS O
RIGHT JOIN PRODUCT_LARGE AS P
ON O.PRODUCTID = P.PRODUCTID;

--Which customers have made orders, and include customers even if they have never placed an order. 
SELECT C.CUSTOMERID, C.CUSTOMERNAME, C.COUNTRY, O.ORDERID, O.ORDERDATE, O.PRODUCTID, O.QUANTITY
FROM ORDERS_LARGE AS O
RIGHT JOIN CUSTOMERS_LARGE AS C
ON O.CUSTOMERID = C.CUSTOMERID;

               --FULL OUTER JOIN
--List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info.       
SELECT C.CUSTOMERID, C.CUSTOMERNAME, C.COUNTRY, O.ORDERID, O.ORDERDATE, O.PRODUCTID, O.QUANTITY
FROM CUSTOMERS_LARGE AS C
FULL OUTER JOIN ORDERS_LARGE AS O
ON C.CUSTOMERID = O.CUSTOMERID;  

--List all products and orders, showing NULLs where products were never ordered or orders are missing product info.
SELECT P.PRODUCTID, P.PRODUCTNAME, P.PRICE, O.ORDERID, O.ORDERDATE,O.CUSTOMERID, O.QUANTITY
FROM PRODUCT_LARGE AS P
FULL OUTER JOIN ORDERS_LARGE AS O
ON P.PRODUCTID = O.PRODUCTID;
