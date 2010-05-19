-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
--
-- All rights reserved.
--
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>>> tests.prepare.sql [BEGIN]

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>>> Create table where testcases will be kept and functions to insert and cleanup test cases.
\echo

CREATE TABLE pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__testcases (
        tc_id               integer NOT NULL
      , tc_input_data       varchar NOT NULL
      , tc_tobe_output_data varchar NOT NULL
      , tc_asis_output_data varchar NOT NULL
      , tc_comments         varchar NOT NULL
) TABLESPACE tabsp_<<$db_name$>>_<<$app_name$>>;

---------------------------
---------------------------

CREATE OR REPLACE FUNCTION pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__remove_testcases() RETURNS integer
LANGUAGE plpgsql
SET search_path TO sch_<<$app_name$>> -- , comn_funs, public
AS $$
DECLARE rows_cnt integer;
BEGIN
        -- delete testcases
        RETURN 0;
END;
$$;

---------------------------
---------------------------

CREATE OR REPLACE FUNCTION pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__integrate_testcases() RETURNS integer
LANGUAGE plpgsql
SET search_path TO sch_<<$app_name$>> -- , comn_funs, public
AS $$
DECLARE rows_cnt integer;
BEGIN
        PERFORM pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__remove_testcases();
        -- delete testcases
        RETURN 0;
END;
$$;

------------------------------------------------------------------------------
-- execute -------------------------------------------------------------------
------------------------------------------------------------------------------

\echo NOTICE >>>>>> Fill testcases table.
\echo

\i tests.prepare.testcases.sql

\echo NOTICE >>>>>> Execute testcases creation functions.
\echo

SELECT pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__integrate_testcases();

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>>> tests.prepare.sql [END]