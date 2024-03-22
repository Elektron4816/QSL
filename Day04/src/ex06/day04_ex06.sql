CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person_id = (SELECT id
                    FROM person
                    WHERE name = 'Dmitriy') AND visit_date = '2022-01-08' AND menu.price < 800;
