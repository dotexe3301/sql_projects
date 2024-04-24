create database project;

use project;

-- imported data from foodsales.csv file into an table.
-- select * from foodsales limit 20;

-- 1: show number of product in every region.
select region, sum(Qty) as number_of_products from foodsales group by region;
-- 2: show the number of product and their price.
select Product, sum(Qty) as number_of_products, UnitPrice as price from foodsales group by Product, UnitPrice;
-- 3: show the number of products selled on every date in every region.
select Date, Region, sum(Qty) as number_of_products from foodsales group by Date, Region;
-- 4: show totalprice of the products selled on each date with their total quantity and product name.
select Date, Product, sum(TotalPrice) as total_price, sum(Qty) as quantity from foodsales group by Date, Product;
-- 5: show average price of a product with its name.
select Product, avg(TotalPrice) as average_price from foodsales group by Product;
-- 6: show the products in the category, and have selled price more than 80 according to their date in ascending order for categories.
select Date, Category, Product, TotalPrice as selled_price from foodsales where TotalPrice>80 group by Date, Product, Category, TotalPrice order by Category;
-- 7: List the Ids of Product that have been selled in Boston city.
select ï»¿ID as ID, Product from foodsales where City = 'Boston' group by Product, ï»¿ID;
-- 8: select every detail where quantity is greater then 30.
select * from foodsales where Qty > 30;
-- 9: show date, region, city and product name.
select Date, Region, City, Product from foodsales;
-- 10: show product name, their quantity, unitprice and totalprice.
select Product, Qty as quantity, UnitPrice as unit_price, TotalPrice as total_price from foodsales group by Product, Qty, unit_price, total_price;

-- VIEWS
create view product_every_region as (select region, sum(Qty) as number_of_products from foodsales group by region);

create view product_and_price as (select Product, sum(Qty) as number_of_products, UnitPrice as price from foodsales group by Product, UnitPrice);

create view product_selled_on_dates as (select Date, Region, sum(Qty) as number_of_products from foodsales group by Date, Region);

create view total_price_on_each_date as (select Date, Product, sum(TotalPrice) as total_price, sum(Qty) as quantity from foodsales group by Date, Product);

create view average_price_of_product as (select Product, avg(TotalPrice) as average_price from foodsales group by Product);

create view product_selled_more_than_80 as (select Date, Category, Product, TotalPrice as selled_price from foodsales where TotalPrice>80 group by Date, Product, Category, TotalPrice order by Category);

create view product_in_boston as (select ï»¿ID as ID, Product from foodsales where City = 'Boston' group by Product, ï»¿ID);

create view greater_than_30 as (select * from foodsales where Qty > 30);

create view date_region_city_name as (select Date, Region, City, Product from foodsales);

create view name_quantity_prices as (select Product, Qty as quantity, UnitPrice as unit_price, TotalPrice as total_price from foodsales group by Product, Qty, unit_price, total_price);
