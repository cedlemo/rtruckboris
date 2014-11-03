#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../lib/parser/parser"

classes = Parser.constants.select {|c| Class === Parser.const_get(c)}
puts "Classes Names"
classes.each do |c|
  puts "\t#{c}"
end
def print_methods(class_name)
  puts ">>#{class_name.name}"
  class_name.instance_methods(false).each do |m|
    puts "\t#{m}"
  end
end
print_methods(Parser::Structure)
print_methods(Parser::Enum)
print_methods(Parser::Function)
print_methods(Parser::TagDeclaration)
print_methods(Parser::Typedef)
print_methods(Parser::EnumConstant)
print_methods(Parser::Parameter)
print_methods(Parser::Field)
print_methods(Parser::Type)
print_methods(Parser::HeaderParser)
