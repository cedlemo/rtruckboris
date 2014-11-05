Gem::Specification.new do |s|
  s.name    = "rtruckboris"
  s.version = "0.0.1"
  s.summary = "Ruby wrapper for the Truckboris libray (C header parser based on Clang)"
  s.author  = "cedlemo"
#  s.platform = Gem::Platform::RUBY  
#  s.files = Dir.glob("ext/*/*.{c,rb}") +
#            Dir.glob("lib/*/*.{so,rb}")

  s.files = FileList['lib/*/*.{so}',
                     'lib/*.{rb}'
                    ].to_a
  s.extensions << "ext/rtruckboris/extconf.rb"
#  s.require_paths = [ 'lib', 'ext' ] 
  s.add_development_dependency 'rake-compiler', '~> 0' 
end


