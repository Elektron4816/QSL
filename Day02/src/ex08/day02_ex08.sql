SELECT person.name
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN person ON person_order.person_id = person.id
WHERE person.address IN ('Moscow', 'Samara') 
                    AND person.gender = 'male'
                    AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY person.name DESC;