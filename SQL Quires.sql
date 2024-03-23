--** KPI'S REQUIREMENT **--
--1)Total Revenue--
select cast(sum(total_price) as decimal(10,2)) as 'Total revenue' from pizza_sales;

--2)Average Order Value.--
select sum(total_price) / count(distinct order_id) as 'Average Order Value' from pizza_sales;

--3)Total Pizza Sold--
select sum(quantity) as 'Total Pizza sold' from pizza_sales;

--4)Total Orders--
select count(distinct order_id) as 'Total Orders' from pizza_sales;

--5)Average Pizzas per Orders--
select cast(cast(sum(quantity) as decimal(10,2)) /
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as 'Average Pizzas per Orders ' from pizza_sales;

--** CHART REQUIREMENT **--

--1) Daily Trend For Total Orders--
select DATENAME(DW, order_date) as 'Order Day' , count(distinct order_id) as 'Total Orders' from pizza_sales
group by DATENAME(DW, order_date);

--2) Monthly Trend For Total Orders--
select DATENAME(MONTH, order_date) as 'Month Name' , count(distinct order_id) as 'Total Orders' from pizza_sales
group by DATENAME(MONTH, order_date)
order by 'Total Orders' desc;

--3) Percentage Of Sales By Pizza Category
select pizza_category , cast(sum(total_price)as decimal(10,2))as 'Total Price',cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales where MONTH(order_date)=1)as decimal(10,2)) as 'Total Sales'
from pizza_sales
where MONTH(order_date) = 1
group by pizza_category;

--4)Percentage Of Sales By Pizza Size--
select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by pizza_size


--5)Top 5 Best Sellers by Revenue--
select top 5 pizza_name,sum(total_price) as 'Total Revenue' 
from pizza_sales
group by pizza_name
order by 'Total Revenue' Desc;

 --6)Top 5 Pizzas by Quantity--
select top 5 pizza_name, sum(quantity) AS Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold ASC

--Top 5 Pizzas by Total Orders--
select top 5 pizza_name ,count(distinct order_id) as 'Total Orders'
from pizza_sales
group by pizza_name
order by 'Total Orders' desc;

--)Bottom 5 worst Sellers by Revenue--
select top 5 pizza_name,sum(total_price) as 'Total Revenue' 
from pizza_sales
group by pizza_name
order by 'Total Revenue';

--Bottom 5 Pizzas by Total Orders--
select top 5 pizza_name ,count(distinct order_id) as 'Total Orders'
from pizza_sales
group by pizza_name
order by 'Total Orders' Asc;