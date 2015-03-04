#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../lib/rtruckboris"

parser = Rtruckboris::HeaderParser.new("./test_cpp", ["/usr/include"])
if (!parser.parse) then 
  puts "Whada fock??"
  exit
end

enums = parser.getEnums()
puts "Enums number : #{enums.size}"
enums.each do |e|
  puts "Enum Name : #{e.getName}"
  puts "\thas name for linkage ? #{e.hasNameForLinkage}"  
  puts "\thas linkage ? #{e.hasLinkage}"  
  puts "\ttypedef name: #{e.getTypedefName}"
  constants = e.getConstants
  print "\t\t"
  constants.each do |c|
    print "#{c.getName} #{c.getValue}  "
  end
  puts""
end

enums.each do |e|
  puts e.getRaw(parser.getSourceManager, parser.getLangOpts)
end
