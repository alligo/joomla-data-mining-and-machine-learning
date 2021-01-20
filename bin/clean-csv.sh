#!/bin/sh
#===============================================================================
#
#          FILE:  clean-csv.sh
#
#         USAGE:  cat clean-csv.sh
#
#   DESCRIPTION:  Draft of commands to clean CSV files. Not usable.
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
#       VERSION:  v1.0.0-alpha
#       CREATED:  2021-01-20 20:00 UTC
#      REVISION:  ---
#===============================================================================
echo "This is a documentation script. Please read-me instead of executing."
echo "    clean-csv.sh"
echo "Exiting..."

cat input_file.csv | tr -cd '\000-\177' > output_file.csv

# @see https://unix.stackexchange.com/questions/403015/remove-all-type-of-special-characters-in-unix-csv-file
cat "input_filecsv" | tr -cd '\000-\177' > "input_file_limpo.csv"
cat "input_file.csv" | tr -cd '\012-\177' > "input_file_limpo.csv"