-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
-- 
-- All rights reserved.
-- 
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

-- Must be called from inside of "structure.sql", orelse uncomment these 2 lines:
-- \c <<$db_name$>> user_<<$app_name$>>_owner
-- SET search_path TO sch_<<$app_name$>>, public; -- sets only for current session

-- INSERT INTO ...

INSERT INTO test (f1,f2) VALUES ('test entry 1', 'test entry 2'), ('test entry 1', 'test entry 2');