-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
-- 
-- All rights reserved.
-- 
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\c <<$db_name$>> user_<<$app_name$>>_owner

SET search_path TO sch_<<$app_name$>>, public; -- sets only for current session
\set ECHO queries

SELECT * FROM dbp_helloworld;
SELECT * FROM dbp_helloworld_testfun(1, 2);

-- make sure this script doesn't output too much data - it all goes to log.
