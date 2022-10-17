--Question 1
select customer.first_name, customer.last_name, customer.email, district
from customer
full join address
on customer.customer_id = address.address_id
where district = 'Texas';

--Question 2
select customer.first_name, customer.last_name, payment.amount
from customer
left join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

--Question 3
select customer.customer_id, customer.first_name, customer.last_name, customer.email
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
)
order by last_name desc;

--Question 4
select customer.first_name, customer.last_name, customer.email, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal'

--Question 5
select count(rental_id), staff_id  
from rental
group by staff_id;

--Question 6
select count(rating), rating
from film
group by rating;

--Question 7
select first_name, last_name, email
from customer
where customer_id in(
	select amount
	from payment
	group by amount
	having amount > 6.99
	order by amount desc
);

--Question 8
select count(rental_rate), rental_rate
from film
group by rental_rate
order by rental_rate desc;
