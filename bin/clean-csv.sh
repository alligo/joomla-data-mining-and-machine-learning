#!/bin/sh
echo "README, this is an example"
echo "cat clean-csv.sh"
exit 1


cat input_file.csv | tr -cd '\000-\177' > output_file.csv

# @see https://unix.stackexchange.com/questions/403015/remove-all-type-of-special-characters-in-unix-csv-file
cat "portogente-artigos-sumarizado_2020-01-18.csv" | tr -cd '\000-\177' > "portogente-artigos-sumarizado_2020-01-18_limpo.csv"
cat "portogente-artigos-sumarizado_2020-01-18.csv" | tr -cd '\012-\177' > "portogente-artigos-sumarizado_2020-01-18_limpo.csv"