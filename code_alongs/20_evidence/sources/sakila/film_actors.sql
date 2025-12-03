SELECT 
f.title,
f.rating,
a.first_name || ' '|| a.last_name
FROM staging.film f 
LEFT JOIN staging.film_actor fa ON  fa.film_id = f.film_id
LEFT JOIN staging.actor a ON a.actor_id = fa.actor_id; 