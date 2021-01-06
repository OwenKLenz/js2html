#! /usr/bin/env ruby

require 'bundler/setup'
# Take a single filename argument (ARGV[1])
# If 2nd argument given, treat as file write destination

# If argument file is a file (check for .js extension)
  # generate a "script_test.html" file in the current directory with the argument file
    # Contains a barebones html template that runs the script in the argument file
  # Any way to auto run it in Chrome? 
    # Probably not on WSL
# Otherwise if file doesn't exist or isn't a .js file, raise exception

class JS2HTML
  @@template_path = File.expand_path(File.dirname(__FILE__) + "/../template.html")

  def initialize
    @js_file = ARGV[0]

    unless @js_file && is_real_js_file?(@js_file)
      raise ArgumentError.new('Invalid file argument. (Does it exist and is it a JS file?)')
    end
  end

  def generate_js2html_file
    text = File.read(@@template_path)
    text.sub!('js_path', @js_file)
    File.write(@js_file.match(/^[^.]+/)[0] + '.html', text)
  end

  def is_real_js_file?(file_string)
    File.exist?(file_string) && file_string.match(/.*\.js$/)
  end
end

JS2HTML.new.generate_js2html_file
