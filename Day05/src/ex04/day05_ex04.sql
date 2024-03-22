SET ENABLE_SEQSCAN TO OFF;

CREATE UNIQUE INDEX idx_menu_unique on menu (pizzeria_id, pizza_name);

EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE pizzeria_id = 9 AND pizza_name = 'mushroom pizza';