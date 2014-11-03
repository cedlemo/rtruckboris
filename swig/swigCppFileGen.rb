#!/usr/bin/env ruby
require 'tempfile'
swig_dir = File.dirname(__FILE__)
cpp_source_file = swig_dir + '/../ext/parser/parser.cpp'
swig_file = File.open(cpp_source_file)
tmp1 = Tempfile.new('tmp1')
tmp2 = Tempfile.new('tmp2')
is_include_part = false
swig_file.each_line do |line|
  is_include_part = true if line.chomp =~ /.*\-\-SWIGINCLUDE.*/
  
  if is_include_part
    tmp2.puts(line)
  else
    tmp1.puts(line)
  end

  is_include_part = false if line.chomp =~ /.*\-\-ENDSWIGINCLUDE.*/
end
tmp1.flush
tmp1.seek(0, :SET)
tmp2.flush
tmp2.seek(0, :SET)
swig_file.close
swig_file = File.open(cpp_source_file, 'w')

tmp2.each_line do |line|
  swig_file.puts(line)
end
tmp1.each_line do |line|
  swig_file.puts(line)
end
swig_file.close
tmp1.close
tmp1.unlink
tmp2.close
tmp2.unlink
