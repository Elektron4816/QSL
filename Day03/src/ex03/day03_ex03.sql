WITH pizzeria_female AS (SELECT pizzeria.name AS pizzeria_name
                        FROM person_visits
                            JOIN person ON person.id = person_visits.person_id
                            JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                        WHERE person_id IN (SELECT id
                                            FROM person
                                            WHERE gender = 'female')),
     pizzeria_male AS (SELECT pizzeria.name AS pizzeria_name
                        FROM person_visits
                            JOIN person ON person.id = person_visits.person_id
                            JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                        WHERE person_id IN (SELECT id
                                            FROM person
                                            WHERE gender = 'male'))

(SELECT *
    FROM pizzeria_female
    EXCEPT ALL
    SELECT *
    FROM pizzeria_male)
UNION ALL
(SELECT *
    FROM pizzeria_male
    EXCEPT ALL
    SELECT *
    FROM pizzeria_female)
ORDER BY 1;
