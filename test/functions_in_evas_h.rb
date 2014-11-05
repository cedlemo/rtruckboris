#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../lib/rtruckboris/rtruckboris"

evas = "/usr/include/evas-1/Evas.h"
headerPaths = `pkg-config --cflags evas`.gsub("-I","").split(" ")

#get gcc include if needed
#gccLibBase='/usr/lib/gcc/' << `llvm-config --host-target`.chomp << "/*"
#gccLib = Dir.glob(gccLibBase ).sort.last + "/include"
#headerPaths << gccLib

parser = Rtruckboris::HeaderParser.new(evas, headerPaths)
parser.parse
structures = parser.getStructures()
puts "Structures number : #{structures.size}"
structures.each do |s|
  puts "Structure Name : #{s.getName}"
#  puts "\thas name for linkage ? #{s.hasNameForLinkage}"  
#  puts "\thas linkage ? #{s.hasLinkage}"  
#  puts "\ttypedef name: #{s.getTypedefName}"
#  fields = s.getFields
#  puts "\tfield number: #{fields.size}"
#  fields.each do |f|
#    puts "\t\t #{f.getType.getName}  #{f.getName}"
#  end
end

functions = parser.getFunctions()
puts "Functions number : #{functions.size}"
functions.each do |f|
  puts "Name : #{f.getName}"
  puts "Return : #{f.getReturn.getName}"
  params = f.getParameters
  puts "\t #{params.size.to_s} parameters :"
  params.each do |p|
    puts "\t\t#{p.getType.getName}  #{p.getName}"
  end
end
