SELECT pizza_name, pizzeria.name, price
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE pizza_name IN ('mushroom pizza','pepperoni pizza')
ORDER BY pizza_name, pizzeria.name;