CodeReview09 - OXALES - Mail Delivery Services: MySQL Queries

1. Query - Count last_name
SELECT count(`last_name`) FROM `customer` WHERE `last_name` = 'donut'

2. Query - Names with John and starts with 'D'
SELECT * FROM `customer` WHERE `first_name`like 'john' and `last_name` like 'd%';

3. Query - Count items on specific date (year:2020)
SELECT count(fk_item_id) FROM `deposit` WHERE deposit_date like '2020-%-%';

4. Query - type of item
SELECT fk_customer_id from item where type_item = 'mail';

5. Query - Customers country
SELECT first_name, last_name
from customer
where fk_country_id in (SELECT country_id from country where country = 'Austria')

6. Query - Left join (attempt)
SELECT first_name, last_name
from customer
where fk_country_id in (SELECT country_id from country where country = 'Austria') left join country on fk_customer_id = country_id; (error message :( )

7. Query - Right join (attempt)
SELECT last_name, type_item
from `customer`
right join `item` on fk_customer_id = item_id; (Null Result?)
