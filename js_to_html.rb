#! /usr/bin/env ruby

require 'bundler/setup'
require 'pry'
# Take a single filename argument (ARGV[1])
# If 2nd argument given, treat as file write destination

# If argument file is a file (check for .js extension)
  # generate a "script_test.html" file in the current directory with the argument file
    # Contains a barebones html template that runs the script in the argument file
  # Any way to auto run it in Chrome? 
    # Probably not on WSL
# Otherwise if file doesn't exist or isn't a .js file, raise exception

