CREATE OR REPLACE FUNCTION get_data(car_model VARCHAR)
RETURNS TABLE
(c_id INTEGER, model VARCHAR, year INTEGER)
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'SELECT c_id, model, year from car where model = ''' || 
		car_model || '''';
	RAISE NOTICE 'Query=%',str;
	RETURN QUERY EXECUTE str;
END; 
$$ LANGUAGE plpgsql;
