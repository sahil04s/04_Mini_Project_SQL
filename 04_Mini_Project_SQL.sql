Use classicmodels;
#1.Write a SQL query to retrieve the first 5 rows from the "customers" table
select * from customers;
select * from customers limit 5;
#2. Write a SQL query to retrieve the unique city names from "customers" table sorted in descending order.
select distinct(city) from customers Order by city  desc;
#3. Write a SQL query to get the number of unique city names "offices" table.
select Count(distinct city) as number_of_city from offices;
#4. Write a SQL query to get the maximum, minimum and average value from the "CreditLimit" column in the "customers" table.
select max(creditLimit)as max_cradit, min(creditLimit)as min_cradit,avg(creditLimit) as avg_cradit from customers;
#5. Write a SQL query to get the city names which are present in “offices” table but not in “customer” table.
select city from offices where city not in ( select city from customers);
#6. Write a SQL query to get the city names which are present in “offices” table as well as in “customer” table.
select city from offices where city in ( select city from customers);
#7. Write a SQL query to get records where city or state is not given in “customer” table and creditlimit is in the range – 80000 to 130000.
select * from customers
 where city or state is null and creditLimit between -80000 and 13000;
 #8. Write a SQL query to get the maximum number of orders placed on a particular date and what is that date in orders table.
select Count(orderNumber) as nos_count_orders,orderdate from orders 
group by orderDate 
order by nos_count_orders desc limit 1;
#9. For the records which we get in previous question(Q8), write a SQL query to get the customer names and their phone numbers. 
SELECT customers.customerName, customers.phone
FROM customers 
JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.orderDate = (
  SELECT orderDate
  FROM orders
  GROUP BY orderDate
  ORDER BY COUNT(*) DESC
  LIMIT 1);
#10. SQL query to get the customer phone number and customer name from customers table where order is either cancelled or disputed in orders table.
select customers.customerName,customers.phone
from customers
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.status IN ('cancelled', 'resolve');
#11. Write a SQL query to get the top 4 highest selling products from orderdetails table.
Select count(quantityOrdered) as highest_order,productCode
From orderdetails
Group by productCode
Order by highest_order desc limit 4;
#12. Write a SQL query to get the count of orders placed by each customer in 2003 and 2004.
Select count(orderNumber) as Nos_total_order
From orders
Where shippedDate between 2003 and 2004 and status = 'Shipped'; 
#13. Write a SQL query to get the city names from customer table where more than 4 customers reside.
select count(customerNumber) as Total_Customers,city
from customers
Group by city 
Having Total_Customers > 4;
