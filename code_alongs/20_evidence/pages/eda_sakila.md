```sql film 
from sakila.films;
```



```sql film_actor
from sakila.film_actors
where rating = 'G';
```


```sql number_films_by_rating
SELECT
rating,
COUNT(film_id) as total_films
FROM films
GROUP BY rating;
```