-- Сессия 1
BEGIN;

-- Сессия 2
BEGIN;

-- Сессия 1
SELECT * FROM pizzeria WHERE id = 1 OR id = 2;

-- Сессия 1
UPDATE pizzeria SET rating = 1 WHERE id = 1;

-- Сессия 2
UPDATE pizzeria SET rating = 2 WHERE id = 2;

-- Сессия 1
UPDATE pizzeria SET rating = 3.1 WHERE id = 2;

-- Сессия 2
UPDATE pizzeria SET rating = 2.1 WHERE id = 1;

-- Сессия 1
COMMIT;

-- Сессия 2
COMMIT;

-- Сессия 1
SELECT * FROM pizzeria WHERE id = 1 OR id = 2;







