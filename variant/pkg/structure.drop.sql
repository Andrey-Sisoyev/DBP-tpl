-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
--
-- All rights reserved.
--
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\c <<$db_name$>> user_db<<$db_name$>>_app<<$app_name$>>_owner

SET search_path TO sch_<<$app_name$>>; -- , comn_funs, public; -- sets only for current session

DELETE FROM dbp_packages WHERE package_name = '<<$pkg.name$>>'
                           AND package_version = '<<$pkg.ver$>>'
                           AND dbp_standard_version = '<<$pkg.std_ver$>>';

-- IF DROPPING CUSTOM ROLES/TABLESPACES, then don't forget to unregister
-- them (under application owner DB account) using
-- FUNCTION public.unregister_cwobj_thatwere_dependant_on_current_dbapp(
--        par_cwobj_name varchar
--      , par_cwobj_type t_clusterwide_obj_types
--      )
-- , where TYPE public.t_clusterwide_obj_types IS ENUM ('tablespace', 'role')

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

\i triggers.drop.sql
\i ../data/data.drop.sql
\i functions.drop.sql

-------------------------------------------------------------------------------

\echo NOTICE >>>>> structure.drop.sql [BEGIN]

--------------------------------------------------------------------------
--------------------------------------------------------------------------

DROP TABLE IF EXISTS dbp_helloworld;
DROP SEQUENCE IF EXISTS dbp_helloworld_pk_seq;

-- SELECT remove_code(
--               TRUE -- tolerate target code nonexistance
--             , make_acodekeyl_bystr2('Usual codifiers', 'My codifier')
--             , TRUE -- par_remove_code
--             , TRUE -- par_cascade_remove_subcodes
--             , TRUE -- par_if_cascade__only_ones_not_reachable_from_elsewhere
--             );

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>> structure.drop.sql [END]