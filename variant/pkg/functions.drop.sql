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

-- DROP FUNCTION IF EXISTS ...
-- DROP TYPE     IF EXISTS ...

DROP FUNCTION IF EXISTS dbp_tpl_testfun(par_pk1 integer, par_pk2 integer);
