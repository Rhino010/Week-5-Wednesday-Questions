--1. List all customers who live in Texas (use JOINs).
select first_name, last_name, district
from customer
inner join address
on customer.address_id = address.address_id
where district like 'Texas';
--Answer: There are 5 customers from Texas.

--2. Get all payments above $6.99 with the Customer's Full Name.
select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;
--Answer: There are 1406 payments above $6.99

--3. Show all customers names who have made payments over $175 (use subqueries).
select first_name, last_name
from customer
where customer_id in(
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc);
--There are 6 total customers who have made payments above $175.

--4. List all customers who live in Nepal.
select CUSTOMER.first_name, CUSTOMER.last_name
from customer
full join address
on CUSTOMER.address_id = ADDRESS.address_id
full join city
on ADDRESS.city_id = CITY.city_id
full join country
on CITY.country_id = COUNTRY.country_id
where COUNTRY = 'Nepal';
--There is only one customer from 'Nepal' named Kevin Schuler.


select * from rental;
select * from staff;

--5. Which staff member had the most transactions?
select staff.FIRST_NAME, staff.LAST_NAME, count(rental.rental_id)
from staff
full join rental
on STAFF.staff_id = RENTAL.staff_id
group by STAFF.staff_id
order by COUNT desc;
--Answer: Mike Hillyer had the most transactions with 8,040.

--6. How many movies of each rating are there?
select RATING, count(*) as RATING_COUNT
from FILM
group by RATING
order by RATING_COUNT desc;
--PG-13 has 223, NC-17 has 210, R has 195, PG has 194, G has 178

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries).
select customer_id, FIRST_NAME, LAST_NAME
from customer
where CUSTOMER_ID in (
	select CUSTOMER_ID
	from payment
	where amount > 6.99
);
--Answer: There are 539 customers who have made a single payment above $6.99.



