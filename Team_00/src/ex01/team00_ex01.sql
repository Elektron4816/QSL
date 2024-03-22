SELECT sum AS total_cost, '{' || way || ',' || point2 || '}' as tour
FROM v_any_ways
WHERE length(way) = 7 AND point2 = 'a' AND sum = (select min(sum)
                                FROM v_any_ways
                                where length(way) = 7 AND point2 = 'a')
UNION
SELECT sum AS total_cost, '{' || way || ',' || point2 || '}' as tour
FROM v_any_ways
WHERE length(way) = 7 AND point2 = 'a' AND sum = (select max(sum)
                                FROM v_any_ways
                                where length(way) = 7 AND point2 = 'a')
ORDER BY 1,2;