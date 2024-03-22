WITH max_rate AS (
    SELECT id, name, MAX(updated) AS updated
    FROM currency
    GROUP BY id, name),
    last_rate AS (
        SELECT rate_to_usd, currency.id, currency.name
FROM currency
RIGHT JOIN max_rate ON currency.id = max_rate.id AND currency.updated = max_rate.updated
    )


SELECT  CASE
            WHEN "user".name IS NULL THEN 'not defined'
            ELSE "user".name
        END AS name,
        CASE
            WHEN "user".lastname IS NULL THEN 'not defined'
            ELSE "user".lastname
        END AS lastname,
        balance.type,
        SUM(money) AS volume,
        CASE
            WHEN last_rate.name IS NULL THEN 'not defined'
            ELSE last_rate.name
        END AS currency_name,
        CASE
            WHEN last_rate.rate_to_usd IS NULL THEN 1
            ELSE last_rate.rate_to_usd 
        END AS last_rate_to_usd,
        CASE
            WHEN SUM(money) * last_rate.rate_to_usd IS NULL THEN SUM(money) * 1
            ELSE SUM(money) * last_rate.rate_to_usd
        END AS total_volume_in_usd

FROM "user"
RIGHT JOIN balance ON "user".id = balance.user_id
LEFT JOIN last_rate ON balance.currency_id = last_rate.id
GROUP BY 1, 2, 3, 5, last_rate.rate_to_usd
ORDER BY 1 DESC, 2, 3;