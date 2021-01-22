#!/bin/sh
#===============================================================================
#
#          FILE:  mysql-database-export.sh
#
#         USAGE:  cat mysql-database-export.sh
#
#   DESCRIPTION:  
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]alligo.com.br>
#       COMPANY:  Alligo
#       LICENSE:  Public Domain
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v1.0.0
#       CREATED:  2021-01-21 20:14 BRT
#      REVISION:  ---
#===============================================================================
echo "This is a documentation script. Please read-me instead of executing."
echo "    mysql-database-export.sh"
echo "Exiting..."
exit 1

#### Requisites ________________________________________________________________
# 1. MariaDB/MySQL or equivalent database
# 2. A exported database dump, (e.g. database_dump.sql)


#### Database export ___________________________________________________________
### Generic example ............................................................
mysqldump -u user -pPassWord database_name > database_name.sql


### Example with test datasets .................................................
sudo su
mysqldump -u root test_joomla-3 > database-dumps/test_joomla-3.sql
