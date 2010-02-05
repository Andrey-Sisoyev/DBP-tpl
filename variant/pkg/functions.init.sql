-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
-- 
-- All rights reserved.
-- 
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

-- (1) case sensetive (2) postgres lowercases real names
\c <<$db_name$>> user_<<$app_name$>>_owner

SET search_path TO sch_<<$app_name$>>, public; -- sets only for current session

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- CREATE TYPE ...
-- CREATE OR REPLACE FUNCTION ...

CREATE OR REPLACE FUNCTION dbp_helloworld_testfun(par_pk1 integer, par_pk2 integer) RETURNS SETOF dbp_helloworld AS $$
BEGIN
        RETURN QUERY
                SELECT *
                FROM dbp_helloworld
                WHERE pk = par_pk1
                   OR pk = par_pk2;
END;
$$ LANGUAGE plpgsql;

GRANT EXECUTE ON FUNCTION dbp_helloworld_testfun(par_pk1 integer, par_pk2 integer) TO user_<<$app_name$>>_data_admin, user_<<$app_name$>>_data_reader;