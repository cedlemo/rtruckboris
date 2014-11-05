#!/usr/bin/env ruby

require 'rtruckboris'
#require "/home/cedlemo/.gem/ruby/2.1.0/gems/rtruckboris-0.0.1/lib/rtruckboris/rtruckboris"

gtk_window = "/usr/include/gtk-3.0/gtk/gtkwindow.h"
headerPaths = `pkg-config --cflags gtk+-3.0`.gsub("-I","").split(" ")
#get gcc include if needed
gccLibBase='/usr/lib/gcc/' << `llvm-config --host-target`.chomp << "/*"
gccLib = Dir.glob(gccLibBase ).sort.last + "/include"
headerPaths << gccLib
headerPaths << "/usr/include"

parser = Rtruckboris::HeaderParser.new(gtk_window, headerPaths)
parser.parse(true)

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
