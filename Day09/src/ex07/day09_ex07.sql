CREATE FUNCTION func_minimum(arr numeric[]) RETURNS numeric AS $$
DECLARE
  s numeric = 'inf';
  x numeric;
BEGIN
    FOREACH x IN ARRAY arr
    LOOP
    IF s > x THEN
        s = x;
    END IF;
    END LOOP;
    RETURN s;
END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);