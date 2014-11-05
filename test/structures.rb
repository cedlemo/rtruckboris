#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../lib/rtruckboris/rtruckboris"

parser = Rtruckboris::HeaderParser.new("./test_cpp", ["/usr/include"])
parser.parse

structures = parser.getStructures()
puts "Structures number : #{structures.size}"
structures.each do |s|
  puts "Structure Name : #{s.getName}"
  puts "\thas name for linkage ? #{s.hasNameForLinkage}"  
  puts "\thas linkage ? #{s.hasLinkage}"  
  puts "\ttypedef name: #{s.getTypedefName}"
  fields = s.getFields
  puts "\tfield number: #{fields.size}"
  fields.each do |f|
    puts "\t\t #{f.getType.getName}  #{f.getName}"
  end
end

structures.each do |s|
  puts s.getRaw(parser.getSourceManager,parser.getLangOpts)
end
