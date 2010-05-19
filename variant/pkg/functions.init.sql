-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
--
-- All rights reserved.
--
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

-- (1) case sensetive (2) postgres lowercases real names
\c <<$db_name$>> user_db<<$db_name$>>_app<<$app_name$>>_owner

SET search_path TO sch_<<$app_name$>>, comn_funs, public; -- sets only for current session
\set ECHO none

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

\i modules/module1.init.sql
\i modules/module2.init.sql

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

\echo NOTICE >>>>> functions.init.sql [BEGIN]

-- CREATE TYPE ...
-- CREATE OR REPLACE FUNCTION ...

CREATE OR REPLACE FUNCTION dbp_helloworld_testfun(par_pk1 integer, par_pk2 integer) RETURNS SETOF dbp_helloworld
LANGUAGE plpgsql
SET search_path = sch_<<$app_name$>> -- , comn_funs, public
AS $$
BEGIN
        RETURN QUERY
                SELECT *
                FROM dbp_helloworld
                WHERE pk = par_pk1
                   OR pk = par_pk2;
END;
$$;

GRANT EXECUTE ON FUNCTION dbp_helloworld_testfun(par_pk1 integer, par_pk2 integer) TO user_db<<$db_name$>>_app<<$app_name$>>_data_admin, user_db<<$db_name$>>_app<<$app_name$>>_data_reader;

\echo NOTICE >>>>> functions.init.sql [END]
