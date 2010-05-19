-- Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
--
-- All rights reserved.
--
-- For license and copyright information, see the file COPYRIGHT

--------------------------------------------------------------------------
--------------------------------------------------------------------------

\echo NOTICE >>>>>> tests.cleanup.sql [BEGIN]

SELECT pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__remove_testcases();
DROP FUNCTION pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__integrate_testcases();
DROP FUNCTION pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__remove_testcases();

DROP TABLE pkg_<<$pkg.name_p$>>_<<$pkg.ver_p$>>__testcases;

\echo NOTICE >>>>>> tests.cleanup.sql [END]
