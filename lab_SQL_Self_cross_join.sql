USE sakila;

#1. Get all pairs of actors that worked together.
SELECT a1.actor_id AS actor1, a1.film_id, a2.actor_id AS actor2, a2.film_id
FROM film_actor AS a1
JOIN film_actor AS a2
on a1.actor_id < a2.actor_id
AND a1.film_id=a2.film_id;

#2. Get all pairs of customers that have rented the same film more than 3 times.
SELECT * FROM inventory;
SELECT * FROM rental;


SELECT r1.customer_id AS customer1, r2.customer_id AS customer2, i.film_id, COUNT(r1.rental_id) AS num_rental
FROM rental AS r1
JOIN rental AS r2
ON r1.customer_id > r2.customer_id AND r1.inventory_id=r2.inventory_id
INNER JOIN inventory AS i
ON r1.inventory_id = i.inventory_id
GROUP By i.film_id, r1.customer_id, r2.customer_id
HAVING num_rental>3;
 #I don't understand why I'm not getting any result.

#3. Get all possible pairs of actors and films.
SELECT a.first_name, a.last_name, f.title
FROM actor AS a
CROSS JOIN film as F;

