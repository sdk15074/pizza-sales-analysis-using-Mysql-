-- Total Revenue:

select round(sum(quantity *unit_price),1) as total_revenue from pizza_sales

-- Average Order Value
select
 round
      ((sum(quantity *unit_price)/ count(distinct ((order_id))))
       ,1)  as avg_order_value 
from pizza_sales

-- total pizza sold-- 

select sum(quantity) as total_pizza_sold from pizza_sales

-- total orders

select  count(order_id) as total_orders from pizza_sales

-- Average Pizzas Per Order
 select (sum(quantity)/ count(distinct ((order_id)))) as avg_pizza_per_order  from pizza_sales
 
-- Daily Trend for Total Orders

SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day,
    COUNT(order_id) AS total_orders
FROM pizza_sales
GROUP BY order_day;

-- MONTHLY TREND FOR ORDER
SELECT 
    MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_MONTH,
    COUNT(DISTINCT ((order_id)))AS total_orders
FROM pizza_sales
GROUP BY order_MONTH;

-- % of Sales by Pizza Category
SELECT pizza_category , 
       round(sum(total_price * quantity),1) as total_revenue ,
       round(sum(total_price* quantity )* 100 / (select sum(total_price* quantity) as total_revenue from pizza_sales),1) as prcentage_per_pizzaCategory 
from pizza_sales 
group by pizza_category

       
-- % of Sales by Pizza Size
SELECT pizza_size , 
       round(sum(total_price * quantity),1) as total_revenue ,
       round(sum(total_price* quantity )* 100 / (select sum(total_price* quantity) as total_revenue from pizza_sales),1) as prcentage_per_pizzaCategory 
from pizza_sales 
group by pizza_size


-- Total Pizzas Sold by Pizza Category

select pizza_category , sum(quantity) as total_pizza_sold 
from pizza_sales 
group by pizza_category  

-- Top 5 Pizzas by Revenue
select pizza_name , sum(total_price * quantity)  as total_revenue 
from pizza_sales 
group by pizza_name 
order by total_revenue desc
limit 5 

-- bottom 5 pizza by total_revenue

select pizza_name , sum(total_price * quantity)  as total_revenue 
from pizza_sales 
group by pizza_name 
order by total_revenue asc
limit 5 


-- Top 5 Pizzas by Quantity

select pizza_name , sum(quantity)  as total_quantity
from pizza_sales 
group by pizza_name 
order by total_quantity desc
limit 5 

-- bottom 5 pizza by quantity

select pizza_name , sum( quantity)  as total_quantity
from pizza_sales 
group by pizza_name 
order by total_quantity asc
limit 5 

-- Top 5 Pizzas by Total Orders
 select pizza_name , sum(order_id)  as total_order
from pizza_sales 
group by pizza_name 
order by total_order desc
limit 5 

-- bottom 5 pizza by total orders 
select pizza_name , sum(order_id)  as total_order
from pizza_sales 
group by pizza_name 
order by total_order asc
limit 5 