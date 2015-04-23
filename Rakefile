require "rubygems"
require "rake/extensiontask"

#current_dir = File.dirname(__FILE__)
#src_dir = current_dir + "/ext/rtruckboris"
#swig_dir = current_dir + "/swig"
task :swig do 
  puts "==> Generate the rtruckboris.cpp file with swig"
  sh "swig -c++ -ruby -o #{src_dir}/rtruckboris.cpp #{swig_dir}/rtruckboris.i"
  sh "ruby #{swig_dir}/swigCppFileGen.rb"
end

task :compile => :swig do 
  puts "Compile time!! bitch..."
end

task :default => [:compile]

spec = Gem::Specification.load('rtruckboris.gemspec')

#Gem::PackageTask.new(spec) do |pkg|
#end

# feed the ExtensionTask with your spec
Rake::ExtensionTask::new("rtruckboris", spec) do |ext|
  ext.lib_dir = "lib/rtruckboris"
end
 

