-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
-- 
-- All rights reserved.
-- 
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\c <<$db_name$>> user_<<$app_name$>>_owner
SET search_path TO sch_<<$app_name$>>, public; 

-- INSERT INTO ...

INSERT INTO dbp_helloworld (f1,f2) VALUES ('test entry 1', 'test entry 2'), ('test entry 1', 'test entry 2');
-- ^^^ In real package TESTING data should be inserted and virified in script test/tests.sql
-- ^^^ Here we put package intital data.