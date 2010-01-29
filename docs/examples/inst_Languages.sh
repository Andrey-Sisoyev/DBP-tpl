#!/bin/sh
#
# Copyright (C) 2010 Andrejs Sisojevs <andrejs.sisojevs@nextmail.ru>
#
# All rights reserved.
#
# For license and copyright information, see the file COPYRIGHT
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
#
# In this directory you may find 2 packages "Name" and "Language".
# In this script you may observe, how to install them in a new dedicated DB and
# new dedicated DB schema (application).

db_name='testdb'
app_name='testapp'

cd `dirname $0`
tar xjf Name-0.1.tar.bz2
tar xjf Language-0.1.tar.bz2

./Name-0.1/db_inst.sh     $db_name new      $app_name new
./Language-0.1/db_inst.sh $db_name existing $app_name existing
# Notice: with 2nd and 4th arguments = "new" by the first 'db_inst.sh' 
# we command "to create new DB", "to create new application (schema)".
# With "existing"s in the second command we say to ommit their recreation, 
# *assumming*, that they are already created.
#
# The "Name" package must be installed before "Language", because "Language"
# depends on it (see PACKAGE-INFO in "Language" package, field "Depends-on").
# Installation performs no special check, that dependecies are statisfied. 
# You will simply get installation failure (observable in resulting log), if
# dependencies aren't respected.

rm accumulated_log
touch accumulated_log
cat     ./Name-0.1/_install/db_inst.sh.log >> accumulated_log
cat ./Language-0.1/_install/db_inst.sh.log >> accumulated_log
cat accumulated_log | less

# That is the first way to compose DB packages. It is to be used,
# when you are 99% sure, that packages are bugless and installs 
# without problems.
#
# Second way. When you test "installability" of your packages, 
# it is recommended to install step by step:
# 1. Run first 'db_inst.sh' with 5th argument '1' 
# 2. View resulting log - it will be outputed automatically with less
# 3. If everything is OK, run second 'db_inst.sh' with 5th argument '1'
# 4. View second log - it will be outputed automatically with less
