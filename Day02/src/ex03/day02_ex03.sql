WITH generate AS (
SELECT generate
FROM generate_series('2022-01-01'::timestamp,
                              '2022-01-10','1 day') AS generate
)

SELECT generate::date AS missing_date 
FROM generate
LEFT JOIN (SELECT visit_date 
            FROM person_visits
            WHERE person_id = 1 OR person_id = 2) AS visit 
    ON generate = visit.visit_date
WHERE visit.visit_date IS NULL
ORDER BY missing_date;