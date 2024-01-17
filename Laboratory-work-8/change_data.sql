CREATE OR REPLACE FUNCTION passwd_change_secure(login varchar, passwd varchar)
RETURNS varchar
AS $$
DECLARE
	strmd5 varchar(100);
 	str varchar;
BEGIN
	strmd5 := md5(passwd); 
	str := 'update users set passwd = $1 where login = $2';
	raise notice 'Query=%' , str;
	EXECUTE str USING strmd5, login;
	return strmd5;
END;
$$ LANGUAGE plpgsql;
