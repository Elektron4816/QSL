DROP FUNCTION fnc_trg_person_insert_audit CASCADE;
DROP FUNCTION fnc_trg_person_update_audit CASCADE;
DROP FUNCTION fnc_trg_person_delete_audit CASCADE;

TRUNCATE person_audit;

CREATE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $trg_person_audit$
    BEGIN
        IF TG_OP = 'INSERT' THEN
            INSERT INTO person_audit VALUES (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        ELSEIF TG_OP = 'UPDATE' THEN
            INSERT INTO person_audit VALUES (CURRENT_TIMESTAMP, 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        ELSEIF TG_OP = 'DELETE' THEN
            INSERT INTO person_audit VALUES (CURRENT_TIMESTAMP, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        END IF;
    RETURN NULL;
END;

$trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE ON person FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;