SELECT menu.pizza_name, pizzeria.name
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person_id IN (SELECT id
                    FROM person
                    WHERE name IN ('Anna','Denis'))
ORDER BY menu.pizza_name, pizzeria.name;