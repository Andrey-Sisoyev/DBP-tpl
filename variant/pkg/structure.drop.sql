-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
-- 
-- All rights reserved.
-- 
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\i functions.drop.sql 

\c <<$db_name$>> user_<<$app_name$>>_owner

SET search_path TO sch_<<$app_name$>>, public; -- sets only for current session

DELETE FROM dbp_packages WHERE package_name = '<<$pkg.name$>>' 
                           AND package_version = '<<$pkg.ver$>>'
                           AND dbp_standard_version = '<<$pkg.std_ver$>>';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

DROP TABLE IF EXISTS dbp_helloworld;
DROP SEQUENCE IF EXISTS dbp_helloworld_pk_seq;