SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE menu.id IN ( SELECT id FROM menu
                    EXCEPT
                    SELECT menu_id FROM person_order)
ORDER BY pizza_name, price;

