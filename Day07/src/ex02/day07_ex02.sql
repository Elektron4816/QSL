(SELECT pizzeria.name, COUNT(pizzeria_id) AS count, 'visit' AS action_type
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name
ORDER BY count DESC
LIMIT 3)
UNION ALL
(SELECT pizzeria.name, COUNT(menu.pizza_name) AS count, 'order' AS action_type
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type, count DESC;