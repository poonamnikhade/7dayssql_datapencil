
use sql7challenge;
-- from -> join -> where -> group by -> having -> select

-- 1. count the total number of orders in the database 
SELECT Count(*)  as total_orders
from orders ;



-- 2. order status count 
-- count how many orders are exist for eash staus eg.pending completed canceled
select status,count(*) as total_status
from orders
Group by status



-- 3 most recent orders
-- retrieve the 10 latest orders by order date
SELECT order_date ,count(10) as total_orders
from orders
Group by order_date
Order by order_date asc



-- 4.highest value orders 
-- find the 10 orders with the highest total amount 

select order_id,sum(quantity*unit_price) as order_amount
from orderitem
group by order_id

order by order_amount ASC
LIMIT 10;



 -- 5. daily order volume 
 -- count orders placed per day in chronological order
SELECT 
CAST(order_date AS DATE) AS order_day, 
COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY CAST(order_date AS DATE)
ORDER BY order_day ASC;

 
 
 
 -- 6.monthly order trend 
 -- group orders by month using date functins identify peak and low volume months 
select month(order_date),count(*)as total_orders
from orders 
group by month(order_date )
order by  month(order_date) ASC;



-- 7. avg order value rounded
-- calculate the avrerage amount across all orders round result for clean reporting 
select round(avg(order_amount),2) as avg_value
from
(select order_id,sum(quantity*unit_price) as order_amount
from orderitem
group by order_id ) as orders_total



-- insights 
-- 1. delivered orders are highest at 1796 while 280 orders were returned 
-- and 236 were cancelled 
-- 2. daily order volume fluctuates with some days recording higher orders 
-- than others indicating variations in cluster activity 
-- 3. monthly orders peak in August (300 orders),while November has only 130
-- orders so far 










