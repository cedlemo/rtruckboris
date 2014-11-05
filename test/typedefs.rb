#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../lib/rtruckboris/rtruckboris"

parser = Rtruckboris::HeaderParser.new("./test_cpp", ["/usr/include"])
parser.parse

typedefs = parser.getTypedefs()
puts "Typedefs numbers : #{typedefs.size}"
typedefs.each do |t|
  puts "Typedef Name : #{t.getName}"
  puts "Typedef Type : #{t.getType.getName}"
  puts "Typedef is Canonical : #{t.getType.isCanonical}"
  puts "Canonical name : #{t.getType.getCanonicalType.getName}"
end

typedefs.each do |t|
  puts t.getRaw(parser.getSourceManager,parser.getLangOpts)
end
