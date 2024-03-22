WITH pizzeria_count AS (
    (SELECT pizzeria.name, COUNT(pizzeria_id) AS count
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.name)
    UNION ALL
    (SELECT pizzeria.name, COUNT(menu.pizza_name) AS count
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name)
)

SELECT pizzeria_count.name, SUM(count) AS total_count
FROM pizzeria_count
GROUP BY pizzeria_count.name
ORDER BY total_count DESC, pizzeria_count.name;