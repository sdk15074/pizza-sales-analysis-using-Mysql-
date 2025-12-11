-- Total Revenue:

select round(sum(quantity *unit_price),1) as total_revenue from pizza_sales

-- Average Order Value
select round((sum(quantity *unit_price)/ count(distinct ((order_id)))) ,1)as avg_order_value from pizza_sales

-- total pizza sold-- 

select sum(quantity) as total_pizza_sold from pizza_sales

-- total orders

select  count(order_id) as total_orders from pizza_sales

-- Average Pizzas Per Order
 select (sum(quantity)/ count(distinct ((order_id)))) as avg_pizza_per_order  from pizza_sales
 
-- Daily Trend for Total Orders

select 
 