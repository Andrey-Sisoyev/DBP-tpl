-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
-- 
-- All rights reserved.
-- 
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\c <<$db_name$>> user_<<$app_name$>>_owner

SET search_path TO sch_<<$app_name$>>, public; -- sets only for current session

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- DROP ...

DROP TABLE IF EXISTS test;
DROP SEQUENCE IF EXISTS test_pk_seq;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE SEQUENCE test_pk_seq INCREMENT BY 1
       MINVALUE 1
       START WITH 1
       NO CYCLE;

CREATE TABLE test ( 
         pk integer NOT NULL DEFAULT nextval('test_pk_seq') PRIMARY KEY
       , f1 varchar     NULL 
       , f2 varchar     NULL
) TABLESPACE tabsp_<<$db_name$>>_<<$app_name$>>;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE test TO user_<<$app_name$>>_data_admin;
GRANT SELECT                         ON TABLE test TO user_<<$app_name$>>_data_reader;

-- CREATE ...
-- GRANT ...

-- Sometimes we want to insert some data, before creating triggers.
\i data.sql 

-- CREATE TRIGGER ...
