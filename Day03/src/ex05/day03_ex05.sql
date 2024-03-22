WITH Andrey_visit AS (SELECT visit_date
                    FROM person_visits
                    WHERE person_id IN (SELECT id
                                        FROM person
                                        WHERE name = 'Andrey')),
    Andrey_order AS (SELECT order_date
                    FROM person_order
                    WHERE person_id IN (SELECT id
                                        FROM person
                                        WHERE name = 'Andrey'))

SELECT pizzeria.name
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE visit_date IN (SELECT *
                        FROM Andrey_visit
                        EXCEPT 
                        SELECT *
                        FROM Andrey_order)
ORDER BY pizzeria.name;