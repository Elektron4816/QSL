CREATE FUNCTION fnc_fibonacci(pstop integer) RETURNS TABLE (fibon integer) AS $$
WITH RECURSIVE fibonacci_numbers(val1, val2) AS (
    VALUES(0, 1)
      UNION ALL
    SELECT val2, val1 + val2 FROM fibonacci_numbers
    WHERE val2 < pstop
)
SELECT val1 FROM fibonacci_numbers;
$$ LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
