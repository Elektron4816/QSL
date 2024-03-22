SELECT person.name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
WHERE pizza_name = 'cheese pizza' AND person.gender = 'female' 
                AND person.id IN (SELECT person_id 
                                FROM person_order
                                JOIN menu ON menu.id = person_order.menu_id
                                WHERE menu.pizza_name = 'pepperoni pizza')
ORDER BY person.name;