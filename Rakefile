require "rake/extensiontask"
#spec = Gem::Specification.load('parser.gemspec')

current_dir = File.dirname(__FILE__)
src_dir = current_dir + "/ext/parser"
swig_dir = current_dir + "/swig"
task :swig do 
  puts "==> Generate the parser.cpp file with swig"
  sh "swig -c++ -ruby -o #{src_dir}/parser.cpp #{swig_dir}/parser.i"
  sh "ruby #{swig_dir}/swigCppFileGen.rb"
end

task :compile => :swig

Rake::ExtensionTask::new("parser") do |ext|
  ext.lib_dir = "lib/parser"
end
 

