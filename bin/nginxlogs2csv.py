#!/usr/bin/env python3
#===============================================================================
#
#          FILE:  nginxlogs2csv.py
#
#         USAGE:  nginxlogs2csv.py access.log
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
#       LICENSE:  MIT
#                 SPDX-License-Identifier: MIT
#       VERSION:  v1.0.0
#       CREATED:  2021-01-24 01:25 UTC
#      REVISION:  ---
#===============================================================================

import sys, getopt

def usage():
    print("Usage: \n  nginxlogs2csv -i /var/log/nginx/access.log")

def parse_file(input_file):
    # # Using readlines() 
    try:
      file1 = open(input_file, 'r') 
      Lines = file1.readlines()
    except (OSError, IOError, FileNotFoundError) as e:
      usage()
      print(e)
      sys.exit(2)

    file1 = open(input_file, 'r') 
    Lines = file1.readlines()
    
    count = 0
    # Strips the newline character 
    for line in Lines: 
        print("Line{}: {}".format(count, line.strip())) 

# print(NGinxlogs2csv.__doc__)

#help(NGinxlogs2csv)

# print ('Number of arguments:', len(sys.argv), 'arguments.')
# print ('Argument List:', str(sys.argv))

def main(argv):
   inputfile = ''
   # outputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:",["input-file=","input-file="])
   except getopt.GetoptError:
      # print ('test.py -i <inputfile> -o <outputfile>')
      usage
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h' or opt == '--help':
         # print ('test.py -i <inputfile> -o <outputfile>')
         usage
         sys.exit()
      elif opt in ("-i", "--input-file"):
         inputfile = arg
    #   elif opt in ("-o", "--output-file"):
    #      outputfile = arg
   print ('Input file is "', inputfile)
   # print ('Output file is "', outputfile)

   parse_file(inputfile)

if __name__ == "__main__":
   main(sys.argv[1:])

# # Using readlines() 
# file1 = open('/var/log/nginx/access.log', 'r') 
# Lines = file1.readlines() 
  
# count = 0
# # Strips the newline character 
# for line in Lines: 
#     print("Line{}: {}".format(count, line.strip())) 