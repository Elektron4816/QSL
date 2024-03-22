COMMENT ON TABLE person_discounts IS 'Таблица индивидуальных скидок для человека в разный пиццериях';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ';
COMMENT ON COLUMN person_discounts.person_id IS 'Внешний ключ к человеку';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Внешний ключ к пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Величина скидки в %';