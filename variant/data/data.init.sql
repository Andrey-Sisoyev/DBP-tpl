-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
--
-- All rights reserved.
--
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\c <<$db_name$>> user_db<<$db_name$>>_app<<$app_name$>>_owner
SET search_path TO sch_<<$app_name$>>, comn_funs, public;
\set ECHO none

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>> data.init.sql [BEGIN]

\set ECHO none

-------------------
-------------------

CREATE OR REPLACE FUNCTION pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__initial_data_delete__() RETURNS integer
LANGUAGE plpgsql
SET search_path TO sch_<<$app_name$>> -- , comn_funs, public
AS $$
DECLARE rows_cnt integer;
BEGIN
        DELETE FROM dbp_helloworld WHERE f1 = 'test entry 1';
        -- procedure body
        RETURN 0;
END;
$$;

COMMENT ON FUNCTION pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__initial_data_delete__() IS
'Deletes initial data from the database package "<<$pkg.name$>>" (version "<<$pkg.ver$>>").
This data is considered to be a part of the package.
Data is assumed to be inserted using "pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__initial_data_insert__()" function.
';

-------------------
-------------------

CREATE OR REPLACE FUNCTION pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__initial_data_insert__() RETURNS integer
LANGUAGE plpgsql
SET search_path TO sch_<<$app_name$>> -- , comn_funs, public
AS $$
DECLARE rows_cnt integer;
BEGIN
        PERFORM pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__initial_data_delete__();
        INSERT INTO dbp_helloworld (f1,f2) VALUES ('test entry 1', 'test entry 2'), ('test entry 1', 'test entry 2');
        -- procedure body
        RETURN 0;
END;
$$;

COMMENT ON FUNCTION pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__initial_data_insert__() IS
'Inserts initial data into the database package "<<$pkg.name$>>" (version "<<$pkg.ver$>>").
This data is considered to be a part of the package.
Data is assumed to be possible to delete the initial data using "pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__initial_data_delete__()" function.
Also, this deletion function is called in the beginning of inserting function.
';

-------------------
-------------------

SELECT set_config('client_min_messages', 'NOTICE', FALSE);

\set ECHO queries
SELECT pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__initial_data_insert__();
\set ECHO none

-------------------
-------------------

\echo NOTICE >>>>> data.init.sql [END]