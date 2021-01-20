#!/bin/sh
#===============================================================================
#
#          FILE:  mysql-database-import.sh
#
#         USAGE:  cat mysql-database-import.sh
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
#       CREATED:  2021-01-20 22:04 UTC
#      REVISION:  ---
#===============================================================================
echo "This is a documentation script. Please read-me instead of executing."
echo "    mysql-database-import.sh"
echo "Exiting..."
exit 1

#### Requisites ________________________________________________________________
# 1. MariaDB/MySQL or equivalent database
# 2. A exported database dump, (e.g. database_dump.sql)


#### Database import ___________________________________________________________
### Generic example ............................................................

mysql -u username -p database_name < database_dump.sql

### Example if using securebox-ad-hoc-backups-for-web-applications .............
sudo su
mysql -u username -p database_name < /backups/mirror/organization-name/project-name/mysqldump/database_name.sql
