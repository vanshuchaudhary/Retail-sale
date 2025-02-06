create database vanshu_sales;
use vanshu_sales;
create table retail_sale(
	Transaction_ID	bigint not null,
	Dates date,
	Customer_ID varchar(10),
	Gender	varchar(10),
	Age	int,
	Product_Category varchar(10),	
	Quantity int,
	Price_per_Unit	int,
	Total_Amount int,
	primary key(Transaction_ID));
select * from retail_sale;

#searching for null values
select * from retail_sale
where
	Transaction_ID is null
    or 
	Dates is null
    or 
	Customer_ID is null
    or 
	Gender is null
    or 
	Age	is null
    or 
	Product_Category is null
	or 
    Quantity is null
    or 
	Price_per_Unit	is null
    or 
	Total_Amount is null;

#How many transactions were recorded in the dataset?
select count(*) as total_transactions from  retail_sale;

#What is the total revenue generated from all transactions?
select sum(Total_Amount) as Total_revenue_generated from retail_sale;

#What is the average transaction amount?
select avg(Total_Amount) as average_transaction_amount from retail_sale;

#How many unique customers made purchases?
select count(distinct(Customer_ID)) as unique_customer  from retail_sale;

#What is the distribution of transactions by gender?
select Gender,count(*) as transaction_count from retail_sale
group by Gender;

#What is the trend of sales over time (daily, weekly, or monthly)?
select 
	day(Dates) as transaction_daily,
	week(Dates)as transaction_weekly,
	month(Dates) as transaction_months,
    year(Dates) as transaction_year,
    count(*) as transaction_count
from retail_sale
group by 4,3,2,1
order by 4,3,2,1;

#yearly trend
select 
    year(Dates) as transaction_year,
    count(*) as transaction_count
from retail_sale
group by 1
order by 1;

#monthly trend
select 
	month(Dates) as transaction_months,
    year(Dates) as transaction_year,
    count(*) as transaction_count
from retail_sale
group by 2,1
order by 2,1 ;

#weekly trend
select 
	week(Dates)as transaction_weekly,
    year(Dates) as transaction_year,
    count(*) as transaction_count
from retail_sale
group by 2,1
order by 2,1;

#daily trend 
select 
	day(Dates) as transaction_daily,
    count(*) as transaction_count
from retail_sale
group by 1
order by 1;

#Which date had the highest sales revenue?
select 
	date(Dates) as transaction_date,
	sum(Total_amount) as total_revenue
from retail_sale
group by 1
order by 2 desc
limit 1;

#What are the peak sales hours or days of the week?
select 
	day(Dates) as transaction_day ,
    week(Dates) as transaction_week,
    sum(Quantity) as total_sales
from retail_sale
group by 2,1
order by 3 desc
limit 2;

#How does the number of transactions vary across different seasons?
With season_sales as (
	select 
		case 
			when month(Dates) in (12,1,2) then 'winter'
			when month(Dates) in(3,4,5) then 'spring'
			when month(Dates) in(6,7,8) then 'monsoon'
			else 'autumn'
		end as season
	from retail_sale)
select 
	season,
	count(*) as transactions_vary_in_seasons
from season_sales
group by season
order by transactions_vary_in_seasons desc;


#What is the average number of items purchased per transaction?
select 
	avg(Quantity) as avg_no_items ,
    Product_category
from retail_sale
group by Product_Category
order by  avg_no_items;

#Which customer has made the most purchases (in terms of frequency and total spending)
select
	Customer_ID,
	count(*) as total_purchases
from retail_sale
group by Customer_ID
order by total_purchases desc 
limit 1;

select
	Customer_ID,
	sum(Total_amount) as total_spent
from retail_sale
group by Customer_ID
order by total_spent desc 
limit 1;

#What is the average age of customers making purchases?
select 
	avg(age) as avg_age_of_customers_making_purchases
from retail_sale;

#average by genders 
select * from retail_sale;
select 
	Gender,
    avg(age) as avg_age_genders
from retail_sale
group by Gender;

#Is there a difference in spending habits between male and female customers?
select Gender,Product_Category ,avg(Total_amount) as avg_amount_spent , sum(Total_amount) as total_amount_spent,
avg(Quantity) as avg_quantity_bought ,sum(Quantity) as total_quantity_bought
from retail_sale
group by 1,2
order by 1;
    
#What is the most frequently purchased product category?
select
	Product_Category ,
	sum(Quantity) as frequently_purchased
	from retail_sale
group by Product_Category 
having  sum(Quantity) > 1
order by frequently_purchased desc
limit 1; 


#What is the average price per unit for different product categories? 
select 
	Product_Category ,
	avg(Price_per_Unit) as avg_price_per_unit
from retail_sale
group by Product_Category ;

#Which product category has the highest average quantity per transaction?
select
	Product_Category,
	avg(Quantity) as avg_quantity_per_transaction
from retail_sale
group by Product_Category 
order by avg_quantity_per_transaction desc 
limit 1;


