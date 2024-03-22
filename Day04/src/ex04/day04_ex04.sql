CREATE VIEW v_symmetric_union AS

WITH two AS (SELECT person_id
            FROM person_visits
            WHERE visit_date = '2022-01-02'),
     six AS (SELECT person_id
            FROM person_visits
            WHERE visit_date = '2022-01-06')

(SELECT *
    FROM two
    EXCEPT
    SELECT *
    FROM six)
UNION
(SELECT *
    FROM six
    EXCEPT
    SELECT *
    FROM two)
ORDER BY 1;