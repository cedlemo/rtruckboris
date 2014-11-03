Gem::Specification.new do |s|
  s.name    = "parser"
  s.version = "0.0.1"
  s.summary = "C header parser based on Clang"
  s.author  = "cedlemo"
  
  s.files = Dir.glob("ext/*/*.{c,rb}") +
            Dir.glob("lib/*/*.rb")
  
  s.extensions << "ext/parser/extconf.rb"
 
  s.add_development_dependency 'rake-compiler', '~> 0' 
end


