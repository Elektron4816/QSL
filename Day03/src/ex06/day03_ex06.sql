SELECT menu.pizza_name,
        pizzeria.name AS pizzeria_name_1,
        p1.name AS pizzeria_name_2,
        menu.price
FROM menu
JOIN menu m1 ON m1.pizza_name = menu.pizza_name
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN pizzeria p1 ON m1.pizzeria_id = p1.id
WHERE m1.price = menu.price AND menu.id > m1.id
ORDER BY 1;