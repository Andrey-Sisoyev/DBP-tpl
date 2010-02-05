-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
-- 
-- All rights reserved.
-- 
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\c <<$db_name$>> user_<<$app_name$>>_owner

SET search_path TO sch_<<$app_name$>>, public; -- sets only for current session

INSERT INTO dbp_packages (package_name, package_version, dbp_standard_version) 
                   VALUES('<<$pkg.name$>>', '<<$pkg.ver$>>', '<<$pkg.std_ver$>>');

-- ^^^ don't change this !!

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE SEQUENCE dbp_helloworld_pk_seq INCREMENT BY 1
       MINVALUE 1
       START WITH 1
       NO CYCLE;

CREATE TABLE dbp_helloworld ( 
         pk integer NOT NULL DEFAULT nextval('dbp_helloworld_pk_seq') PRIMARY KEY
       , f1 varchar     NULL 
       , f2 varchar     NULL
) TABLESPACE tabsp_<<$db_name$>>_<<$app_name$>>;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE dbp_helloworld TO user_<<$app_name$>>_data_admin;
GRANT SELECT                         ON TABLE dbp_helloworld TO user_<<$app_name$>>_data_reader;

-- CREATE ...
-- GRANT ...

-- Sometimes we want to insert some data, before creating triggers.
\i functions.init.sql 
\i ../data/data.sql 

-- CREATE TRIGGER ...