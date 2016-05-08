#!/bin/python

import io
import getopt
import os
import string
import sys

def main():
  """
  This function replaces the placeholder tags within a given file with
  string values specified by command line options or a configuration file.
  """
  # Default values.
  configFile = None
  replaceDict = {}
  inFile = sys.stdin
  outFile = sys.stdout
  
  # Get command line options and arguments.
  try:
    opts, args = getopt.getopt(sys.argv[1:], 'c:i:o:r:h', ['configFile=',
      'infile=', 'outfile=', 'replace=', 'help'])
  except getopt.GetoptError as e:
    print(str(e))
    print_usage()
    sys.exit(2)
  
  # Process command line options and arguments.
  for opt, arg in opts:
    if opt in ('-c', '--configFile'):
      print("Processed -c.")
      
      try:
        configFile = io.open(arg, 'r')
      except Exception as e:
        print(str(e))
        raise
      
      for line in configFile:
        try:
          k, v = line.split(':')
        except Exception as e:
          continue
        k = k.strip()
        v = v.strip()
        replaceDict[k] = v
      
      if not configFile.closed:
        configFile.close()
    elif opt in ('-i', '--inFile'):
      print("Processed -i.")
      try:
        inFile = open(arg, 'r')
      except Exception as e:
        print(str(e))
        raise
    elif opt in ('-o', '--outFile'):
      print("Processed -o.")
      if os.path.isfile(arg):
        os.rename(arg, arg+'.bkp')
      try:
        outFile = open(arg, 'w')
      except Exception as e:
        print(str(e))
        raise
    elif opt in ('-r', '--replace'):
      try:
        k, v = arg.split(':')
        k = k.strip()
        v = v.strip()
        replaceDict[k] = v
      except Exception as e:
        continue
    elif opt in ('-h', '--help'):
      print("Processed -h.")
      print_usage()
    else:
      print("Invalid command line option. Try again.")
      print_usage()
      sys.exit(2)
  
  # Replace placeholder tags.
  replace_line = ''
  for line in inFile:
    for k in replaceDict.iterkeys():
      try:
        line = string.replace(line, k, replaceDict[k])
      except Exception as e:
        print(str(e))
    outFile.write(line)
  
  if not outFile.closed:
    outFile.close()
  if not inFile.closed:
    inFile.close()
  
  
def print_usage():
  """Print usage information for this programm."""
  print("Usage:")
  print("\treplace_placeholders -c configFile [-i inFile] [-o outFile] [-h]")

if __name__ == '__main__':
  main()

