SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name, visit_date
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person_id = (SELECT id
                    FROM person
                    WHERE name = 'Kate') AND price BETWEEN 800 AND 1000
ORDER BY 1,2,3;