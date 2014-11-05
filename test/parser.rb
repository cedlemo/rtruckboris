#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../parser'

parser = Rtruckboris::HeaderParser.new("./test_cpp", ["/usr/include"])
parser.parse
parser.printFunctionsNames()
puts "Function : " + parser.getFunctionsNumber().to_s
parser.printStructuresNames()
puts "Structures : " + parser.getStructuresNumber().to_s
parser.printEnumsNames()
puts "Enums : " + parser.getEnumsNumber().to_s
parser.printUnionsNames()
puts "Unions : " + parser.getUnionsNumber().to_s
parser.printTypedefsNames()
puts "Typedefs : " + parser.getTypedefsNumber().to_s
