-- 1. Display all available tables in the Sakila database.
SELECT table_name FROM information_schema.tables
WHERE table_type='BASE TABLE' AND table_schema= 'sakila';
SHOW FULL TABLES;

-- 2. Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- 3. Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
SELECT title FROM sakila.film;

-- 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT *, language_id,
CASE
	WHEN 1 THEN 'English'
    WHEN 2 THEN 'Italian'
    WHEN 3 THEN 'Japanese'
    WHEN 4 THEN 'Mandarin'
    WHEN 5 THEN 'French'
    WHEN 6 THEN 'German'
END FROM sakila.film;

-- 3.3 List of first names of all employees from the staff table
SELECT first_name FROM sakila.staff;

-- 4. Retrieve unique release years. ANSWER = 2006
SELECT DISTINCT release_year FROM sakila.film; 

-- 5. Counting records for database insights:
-- 5.1 Determine the number of stores that the company has. ANSWER =2
SELECT count(DISTINCT store_id)  FROM sakila.store;

-- 5.2 Determine the number of employees that the company has. ANSWER =2
SELECT count(staff_id) FROM sakila.staff;

-- 5.3 Determine how many films are available for rent and how many have been rented. ANSWER= AVAILABE 15.861 NOT 183 
SELECT * FROM rental;
SELECT COUNT(rental_id) FROM rental
WHERE return_date IS NULL OR return_date IN ('', ' '); 

SELECT COUNT(rental_id) FROM rental
WHERE return_date IS NOT NULL; 

-- 5.4 Determine the number of distinct last names of the actors in the database. ANSWER=121
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;

-- 6. Retrieve the 10 longest films
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 7. Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT". ANSWER= 2
SELECT * FROM sakila.actor
WHERE first_name LIKE 'SCARLETT%';

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
-- ANSWER=4
SELECT * FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%' AND length >100; 

-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT * FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%'; 