
CREATE OR REPLACE FUNCTION get_order_info(order_name VARCHAR)
RETURNS TABLE
(id INTEGER, name VARCHAR, info VARCHAR)
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'SELECT id, name, info from order_info where name = ''' || 
		order_name || '''';
	RAISE NOTICE 'Query=%',str;
	RETURN QUERY EXECUTE str;
END;
$$ LANGUAGE plpgsql;
