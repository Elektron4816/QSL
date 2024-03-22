-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH user_balance AS (
SELECT DISTINCT currency.name,
    CASE
        WHEN ( SELECT rate_to_usd
                FROM currency c
                WHERE b.currency_id = c.id AND c.updated < b.updated
                ORDER BY c.updated DESC
                limit 1) * money IS NULL 
            THEN ( SELECT rate_to_usd 
                    FROM currency c
                    WHERE b.currency_id = c.id AND c.updated > b.updated
                    ORDER BY c.updated ASC limit 1) * money
            ELSE ( SELECT rate_to_usd
                    FROM currency c
                    WHERE b.currency_id = c.id AND c.updated < b.updated
                    ORDER BY c.updated DESC
                    limit 1) * money
    END AS currency_in_usd, user_id, money
FROM balance b
JOIN currency ON b.currency_id = currency.id
ORDER BY 1)

SELECT CASE
            WHEN "user".name IS NULL THEN 'not defined'
            ELSE "user".name
        END AS name,
        CASE
            WHEN "user".lastname IS NULL THEN 'not defined'
            ELSE "user".lastname
        END AS lastname,
        user_balance.name,
        user_balance.currency_in_usd
FROM "user"
RIGHT JOIN user_balance ON "user".id = user_balance.user_id
ORDER BY 1 DESC, 2, 3;