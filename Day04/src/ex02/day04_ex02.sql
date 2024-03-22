CREATE VIEW v_generated_dates AS
SELECT generated_date::date AS generated_date
FROM GENERATE_SERIES('2022-01-01'::timestamp,
                     '2022-01-31','1 day') AS generated_date
ORDER BY 1;