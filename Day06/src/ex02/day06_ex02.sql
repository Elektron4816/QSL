WITH without_discount AS (
    SELECT person.name,
           menu.pizza_name,
           menu.price,
           pizzeria.name AS pizzeria_name,
           person_order.person_id,
           menu.pizzeria_id
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    ORDER BY person.name, menu.pizza_name
)

SELECT wd.name,
       wd.pizza_name,
       wd.price, ROUND(price - ( price * (discount / 100)),2) AS discount_price,
       wd.pizzeria_name
FROM without_discount wd
JOIN person_discounts ON wd.person_id = person_discounts.person_id 
                        AND wd.pizzeria_id = person_discounts.pizzeria_id
ORDER BY 1,2;