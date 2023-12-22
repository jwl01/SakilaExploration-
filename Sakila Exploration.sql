use sakila;

#Exploring Sakila Database, I had ChatGPT randomly generate some analysis questions. 


#Find out the total number of customers in the database. 
select count(customer_id) as customer_total from customer;
# There are 599 customers in the database. 

#List the first 10 customers in alphabetical order by their last name.
select concat(first_name," ",last_name) as full_name from customer 
order by last_name ASC;  
# Rafael Abney, Nathaniel Adam, Kathleen Adams, Diana Alexander, Gordon Allard, Shirley Allen, Charlene Alvarez, Lisa Anderson, Jose Andrew, Ida Andrews

#Find out which actors played in the film 'CHICAGO NORTH'.
select a.first_name, a.last_name, f.title
from actor a
inner join film_actor fa on a.actor_id=fa.actor_id
inner join film f on fa.film_id=f.film_id
where f.title regexp "chicago north"; 
# Mae Hoffman, Cuba Allen, Liza Bergman, Kevin Garland, River Dean, Meryl Gibson, Burt Temple, Jayne Silverstone
 
#Calculate the total number of films in each category.
select cat.name, count(fil.category_id) as total
from film_category fil
inner join category cat on fil.category_id=cat.category_id
group by cat.name;
#Action: 64 Films
#Animation: 66 Films
#Children: 60 Films 
#Classics: 57 Films
#Comedy: 58 Films 
#Documentary: 68 Films 
#Drama: 62 Films
#Family: 69 Films
#Foreign: 73 Films
#Games: 61 Films
#Horror: 56 Films
#Music: 51 Films 
#New: 63 Films 
#Sci-Fi: 61 Films
#Sports: 74 Films 
#Travel: 57 Films  

#Determine the average rental rate for each category of films.
select cat.name, avg(f.rental_rate) as avg_rate
from film f 
inner join film_category fil on f.film_id=fil.film_id
inner join category cat on fil.category_id=cat.category_id
group by cat.name;
#Action: 2.65
#Animation: 2.81
#Children: 2.89 
#Classics: 2.74 
#Comedy: 3.16
#Documentary: 2.67 
#Drama: 3.02 
#Family: 2.76 
#Foreign: 3.10 
#Games: 3.25 
#Horror: 3.03 
#Music: 2.95 
#New: 3.12 
#Sci-Fi: 3.22 
#Sports: 3.13 
#Travel: 3.24

#Find out the average rental duration (days) for each film category.
select cat.name, avg(f.rental_duration) as avg_duration
from film f 
inner join film_category fil on f.film_id=fil.film_id
inner join category cat on fil.category_id=cat.category_id
group by cat.name;
#Action: 4.95
#Animation: 4.89
#Children: 5.03 
#Classics: 5.07 
#Comedy: 4.93
#Documentary: 4.76 
#Drama: 5.08 
#Family: 5.17 
#Foreign: 5.11 
#Games: 5.07 
#Horror: 4.86
#Music: 5.24 
#New: 4.75
#Sci-Fi: 4.89 
#Sports: 4.72 
#Travel: 5.35

#Find the average rental duration (days) for films rented by customers with a last name starting with 'S'.
select f.title, c.last_name, avg(f.rental_duration) as avg_duration
from customer c
inner join inventory i on c.store_id=i.store_id
inner join film f on i.film_id=f.film_id 
where (c.last_name like 'S%')
group by f.title, c.last_name; 

#There are a lot of films in the results, so I've listed the top 5 alphabetically. 
#Academy Dinosaur : 6
#Ace Goldfinger: 3
#Adaptation Holes: 7
#Affair Prejudice: 5
#African Egg: 6
