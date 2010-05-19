-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
--
-- All rights reserved.
--
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\c <<$db_name$>> user_db<<$db_name$>>_app<<$app_name$>>_owner

SET search_path TO sch_<<$app_name$>>, comn_funs, public; -- sets only for current session
\set ECHO none

INSERT INTO dbp_packages (package_name, package_version, dbp_standard_version)
                   VALUES('<<$pkg.name$>>', '<<$pkg.ver$>>', '<<$pkg.std_ver$>>');

-- ^^^ don't change this !!
--
-- IF CREATING NEW CUSTOM ROLES/TABLESPACES, then don't forget to register
-- them (under application owner DB account) using
-- FUNCTION public.register_cwobj_tobe_dependant_on_current_dbapp(
--        par_cwobj_name              varchar
--      , par_cwobj_type              t_clusterwide_obj_types
--      , par_cwobj_additional_data_1 varchar
--      , par_application_name        varchar
--      , par_drop_it_by_cascade_when_dropping_db  boolean
--      , par_drop_it_by_cascade_when_dropping_app boolean
--      )
-- , where TYPE public.t_clusterwide_obj_types IS ENUM ('tablespace', 'role')

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

\echo NOTICE >>>>> structure.init.sql [BEGIN]

--------------------------------------------------------------------------
--------------------------------------------------------------------------

-- SELECT new_codifier_w_subcodes(
--           make_codekeyl_bystr('Usual codifiers') -- supercodifier
--         , ROW ('My codifier', 'codifier' :: code_type) :: code_construction_input
--         , '' -- default code text (must be among subcodes)
--         , VARIADIC ARRAY[ ROW ( 'human', 'plain code' )
--                         , ROW ( 'organization', 'plain code' )
--                         ] :: code_construction_input[] -- subcodes
--         ) AS my_codifier__codifier_id;

CREATE SEQUENCE dbp_helloworld_pk_seq INCREMENT BY 1
       MINVALUE 1
       START WITH 1
       NO CYCLE;

CREATE TABLE dbp_helloworld (
         pk integer NOT NULL DEFAULT nextval('dbp_helloworld_pk_seq') PRIMARY KEY
       , f1 varchar     NULL
       , f2 varchar     NULL
--       , code_id integer NOT NULL
--       , CONSTRAINT cnstr_dbp_helloworld_has_a_codifier FOREIGN KEY (code_id)
--                   REFERENCES codes (code_id) ON DELETE RESTRICT ON UPDATE CASCADE
--       , CHECK (code_belongs_to_codifier(
--                          FALSE -- tolerate codifier nonexistance
--                        , make_acodekeyl( make_codekey_null()
--                                        , make_codekey_bystr('My codifier')
--                                        , make_codekey_byid(code_id)
--               )        )               )
) TABLESPACE tabsp_<<$db_name$>>_<<$app_name$>>;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE dbp_helloworld TO user_db<<$db_name$>>_app<<$app_name$>>_data_admin;
GRANT SELECT                         ON TABLE dbp_helloworld TO user_db<<$db_name$>>_app<<$app_name$>>_data_reader;

-- CREATE ...
-- GRANT ...

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>> structure.init.sql [END]

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- Sometimes we want to insert some data, before creating triggers.

\i functions.init.sql
\i ../data/data.init.sql
\i triggers.init.sql
