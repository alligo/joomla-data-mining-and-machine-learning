#!/bin/sh
#===============================================================================
#
#          FILE:  webserver-access-log-to-csv.sh
#
#         USAGE:  cat webserver-access-log-to-csv.sh
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
#                 SPDX-License-Identifier: MIT
#       VERSION:  v1.0
#       CREATED:  2021-01-23 19:13 UTC
#      REVISION:  ---
#===============================================================================
echo "This is a documentation script. Please read-me instead of executing."
echo "    webserver-access-log-to-csv.sh"
echo "Exiting..."
exit 1


#### Install goaccess __________________________________________________________
# @see https://goaccess.io/download
# For Debian-like OS:
sudo apt install goaccess

#### accesslog2csv.py __________________________________________________________
# @see https://gist.github.com/joswr1ght/c2e08f520933bb36c0b19aa0dcb6a173

accesslog2csv.py /var/log/nginx/access.log /tmp/access.log.csv

#### Examples __________________________________________________________________
### Apache .....................................................................
sudo goaccess /var/log/apache2/access.log --output /tmp/access.log.csv
sudo goaccess /etc/httpd/logs/access_log --output /tmp/access.log.csv


### Nginx ......................................................................
sudo goaccess /var/log/nginx/access.log --output /tmp/access.log.csv
sudo goaccess /var/log/nginx/access.log --log-format="%h %^[%d:%^] \"%r\" %s %b \"%R\" \"%u\"" --date-format="%d/%b/%Y" --time-format="%T" --output /tmp/access.log.csv
sudo goaccess /var/log/nginx/access.log --log-format="%h %^[%d:%^] \"%r\" %s %b \"%R\" \"%u\"" --date-format="%d/%b/%Y" --time-format="%T" --no-csv-summary --output /tmp/access.log.csv

#### Examples __________________________________________________________________
