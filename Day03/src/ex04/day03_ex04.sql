WITH pizzeria_female AS (SELECT pizzeria.name AS pizzeria_name
                        FROM person_order
                            JOIN menu ON person_order.menu_id = menu.id
                            JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                        WHERE person_id IN (SELECT id
                                            FROM person
                                            WHERE gender = 'female')),
     pizzeria_male AS (SELECT pizzeria.name AS pizzeria_name
                        FROM person_order
                            JOIN menu ON person_order.menu_id = menu.id
                            JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                        WHERE person_id IN (SELECT id
                                            FROM person
                                            WHERE gender = 'male'))

(SELECT *
    FROM pizzeria_female
    EXCEPT
    SELECT *
    FROM pizzeria_male)
UNION
(SELECT *
    FROM pizzeria_male
    EXCEPT
    SELECT *
    FROM pizzeria_female)
ORDER BY 1;
