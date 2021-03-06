# define db
use sakila;

# Q. 3
select distinct f.title as name_of_film from film f;

# Q. 4.1 - Check for distinct languages
select distinct f.language_id as language_of_film
from film f;

# Q. 4.2 - check for language name
select l.name as film_language 
from language l
where language_id='1';

# Q. 4.3 - combine both
select l.name as film_language 
from language l
where language_id=
	(select distinct f.language_id as language_of_film
from film f);

#Q. 5.1 - returned rentals
select count(r.return_Date) as returned_rentals
from rental r;

#Q. 5.2 - staff
select distinct count(s.staff_id) as no_staff
from staff s;

#Q. 5.3 - stores
select distinct count(s.store_id) as no_stores
from staff s;

#Q. 5.4 - first name of employees
select s.first_name as first_name_employees
from staff s;

#Q 6 - unique days
select count(distinct cast(r.rental_date as date)) as unique_rental_dates
	from rental r