-- Using database:
USE ShopDB;

--1. Write a query to create a view for those salesmen belongs to the city New York. 
CREATE VIEW vw_salesmen_newyork AS
SELECT *
FROM salesman
WHERE city = 'New York';

--2. Write a query to create a view for all salesmen with columns salesman_id, name and city. 
CREATE VIEW vw_salesmen_basic AS
SELECT salesman_id, name, city
FROM salesman;

--3. Write a query to find the salesmen of the city New York who achieved the commission more than 13%. 
CREATE VIEW vw_salesmen_ny_commission AS
SELECT *
FROM salesman
WHERE city = 'New York' AND commission > 0.13;

--4. Write a query to create a view to getting a count of how many customers we have at each level of a grade.
CREATE VIEW vw_customer_grade_count AS
SELECT grade, COUNT(*) AS customer_count
FROM customer
GROUP BY grade;

--5.  Write a query to create a view to keeping track the number of customers ordering, number of salesmen attached, average amount of orders and the total amount of orders in a day.  
CREATE VIEW vw_daily_order_stats AS
SELECT ord_date,
       COUNT(DISTINCT customer_id) AS num_customers,
       COUNT(DISTINCT salesman_id) AS num_salesmen,
       AVG(purch_amt) AS avg_order_amount,
       SUM(purch_amt) AS total_order_amount
FROM orders
GROUP BY ord_date;

--6. Write a query to create a view that shows for each order the salesman and customer by name.  
CREATE VIEW vw_order_details AS
SELECT o.ord_no, o.ord_date, o.purch_amt,
       s.name AS salesman_name,
       c.cust_name AS customer_name
FROM orders o
JOIN salesman s ON o.salesman_id = s.salesman_id
JOIN customer c ON o.customer_id = c.customer_id;

--7. Write a query to create a view that finds the salesman who has the customer with the highest order of a day. 
CREATE VIEW vw_salesman_highest_order AS
SELECT o.ord_date, s.name AS salesman_name
FROM orders o
JOIN salesman s ON o.salesman_id = s.salesman_id
WHERE o.purch_amt = (
    SELECT MAX(purch_amt)
    FROM orders o2
    WHERE o2.ord_date = o.ord_date
);

--8. Write a query to create a view that shows all of the customers who have the highest grade. 
CREATE VIEW vw_customers_highest_grade AS
SELECT *
FROM customer
WHERE grade = (SELECT MAX(grade) FROM customer);

--9. Write a query to create a view that shows the number of the salesman in each city. 
CREATE VIEW vw_salesmen_city_count AS
SELECT city, COUNT(*) AS num_salesmen
FROM salesman
GROUP BY city;

--10. Write a query to create a view that shows the average and total orders for each salesman after his or her name. (Assume all names are unique) 
CREATE VIEW vw_salesman_order_stats AS
SELECT s.name,
       AVG(o.purch_amt) AS avg_order_amount,
       SUM(o.purch_amt) AS total_order_amount
FROM salesman s
JOIN orders o ON s.salesman_id = o.salesman_id
GROUP BY s.name;

--11. Write a query to create a view that shows each salesman with more than one customers. 
CREATE VIEW vw_salesmen_multiple_customers AS
SELECT s.salesman_id, s.name, COUNT(c.customer_id) AS num_customers
FROM salesman s
JOIN customer c ON s.salesman_id = c.salesman_id
GROUP BY s.salesman_id, s.name
HAVING COUNT(c.customer_id) > 1;

--12. Write a query to create a view that shows all matches of customers with salesman such that at least one customer in the city of customer served by a salesman in the city of the salesman. 
CREATE VIEW vw_customer_salesman_city_match AS
SELECT c.cust_name, s.name AS salesman_name, c.city
FROM customer c
JOIN salesman s ON c.city = s.city;

--13. Write a query to create a view that shows the number of orders in each day. 
CREATE VIEW vw_orders_per_day AS
SELECT ord_date, COUNT(*) AS num_orders
FROM orders
GROUP BY ord_date;

--14.  Write a query to create a view that finds the salesmen who issued orders on October 10th, 2012. 
CREATE VIEW vw_salesmen_orders_oct10 AS
SELECT DISTINCT s.name
FROM orders o
JOIN salesman s ON o.salesman_id = s.salesman_id
WHERE o.ord_date = '2012-10-10';

--15.  Write a query to create a view that finds the salesmen who issued orders on either August 17th, 2012 or October 10th, 2012. 
CREATE VIEW vw_salesmen_orders_aug_oct AS
SELECT DISTINCT s.name
FROM orders o
JOIN salesman s ON o.salesman_id = s.salesman_id
WHERE o.ord_date IN ('2012-08-17', '2012-10-10');