CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy', pprice numeric default 800, pdate date default '2022-01-08')
RETURNS TABLE ( pizzeria_name varchar) AS $$
    BEGIN
        RETURN QUERY
            SELECT DISTINCT pizzeria.name
            FROM person_visits
            JOIN person ON person_visits.person_id = person.id
            JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
            JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
            WHERE person.name = pperson AND person_visits.visit_date = pdate AND menu.price < pprice;
    END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
