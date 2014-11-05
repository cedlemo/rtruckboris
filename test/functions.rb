#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../lib/rtruckboris/rtruckboris"

parser = Rtruckboris::HeaderParser.new("./test_cpp", ["/usr/include"])
parser.parse

functions = parser.getFunctions()
puts "Functions number : #{functions.size}"
functions.each do |f|
  puts "Name : #{f.getName}"
  puts "Return : #{f.getReturn.getName}"
  params = f.getParameters
  puts "\t #{params.size.to_s} parameters :"
  params.each do |p|
    puts "\t\t#{p.getType.getName}  #{p.getName}"
    if(!p.getType.isCanonical)
      puts "\t\t\t#{p.getType.getCanonicalType.getName}"
    end
  end
end

functions.each do |f|
  puts f.getRaw(parser.getSourceManager,parser.getLangOpts)
end
