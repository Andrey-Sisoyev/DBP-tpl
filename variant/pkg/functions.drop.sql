-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
--
-- All rights reserved.
--
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

-- (1) case sensetive (2) postgres lowercases real names
\c <<$db_name$>> user_db<<$db_name$>>_app<<$app_name$>>_owner

SET search_path TO sch_<<$app_name$>>; -- , comn_funs, public; -- sets only for current session

\echo NOTICE >>>>> functions.drop.sql [BEGIN]

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- Top level functions and types
-- DROP FUNCTION IF EXISTS ...
-- DROP TYPE     IF EXISTS ...

-- Reference functions:
-- ...

-- Lookup functions:
DROP FUNCTION IF EXISTS dbp_helloworld_testfun(par_pk1 integer, par_pk2 integer)

-- Administration functions:
-- ...

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- drop types
-- ...

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

\echo NOTICE >>>>> functions.drop.sql [END]

\i functions/module1.drop.sql
\i functions/module2.drop.sql