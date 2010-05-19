-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
--
-- All rights reserved.
--
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>> triggers.init.sql [BEGIN]

-- CREATE OR REPLACE FUNCTION myobject_onaction() RETURNS trigger
-- LANGUAGE plpgsql
-- AS $myobject_onaction$ -- before delete
-- SET search_path = sch_<<$app_name$>> -- , comn_funs, public
-- BEGIN
        -- trigger function body
-- END;
-- $myobject_onaction$;

-- CREATE TRIGGER tri_myobject_onaction BEFORE INSERT OR DELETE ON sch_<<$app_name$>>.myobject_table
--     FOR EACH ROW EXECUTE PROCEDURE myobject_onaction();

\echo NOTICE >>>>> triggers.init.sql [END]