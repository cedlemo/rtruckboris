Gem::Specification.new do |s|
  s.name    = "rtruckboris"
  s.version = "1.0.0"
  s.summary = "Ruby wrapper for the Truckboris libray (C header parser based on Clang)"
  s.author  = "cedlemo"
#  s.platform = Gem::Platform::RUBY  
#  s.files = Dir.glob("ext/*/*.{c,rb}") +
#            Dir.glob("lib/*/*.{so,rb}")
  require "rake"
  s.files = FileList['lib/*.rb', 'ext/*/*.{rb,c,h,cpp}', 'test/*']
  s.extensions = %(ext/rtruckboris/extconf.rb)
#  s.require_paths = [ 'lib', 'ext' ] 
  s.add_development_dependency 'rake-compiler', '~> 0' 
end


