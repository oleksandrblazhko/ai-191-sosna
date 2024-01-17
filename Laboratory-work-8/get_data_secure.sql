CREATE OR REPLACE FUNCTION get_order_info_secure(order_name VARCHAR)
RETURNS TABLE
(id INTEGER, name VARCHAR, info VARCHAR)
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'SELECT id, name, info from order_info where name = $1';
	RETURN QUERY EXECUTE str USING order_name;
END;
$$ LANGUAGE plpgsql;
