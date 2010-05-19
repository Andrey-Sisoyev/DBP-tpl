-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
--
-- All rights reserved.
--
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>>> tests.prepare.testcases.sql [BEGIN]

--------------------------------------------------------------------------
--------------------------------------------------------------------------

-- it's convenient to use OpenOfficeCalc to generate
INSERT INTO pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__testcases (tc_id, tc_input_data, tc_tobe_output_data, tc_asis_output_data, tc_comments) VALUES (1, 'x', 'x', 'x', 'x');

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>>> tests.prepare.testcases.sql [END]