# Rtruckboris: Ruby bindings for the truckboris library

With rtruckboris, you can easily parse C headers files in pure Ruby.

```Ruby
#!/usr/bin/env ruby

require 'rtruckboris'

parser = Rtruckboris::HeaderParser.new("a_file.h", ["/usr/include"])
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
```

## Resolve dependencies and Install

### Dependencies
rtruckboris is a ruby extension for the truckboris library so you need to install
it (https://github.com/cedlemo/truckboris) and its dependencies (LLVM and Clang 3.5).

You will need to:
*    Ruby
*    Rake-compiler
*    swig

### Install
When this is done, clone this repository with:

<code>git clone https://github.com/cedlemo/rtruckboris</code>

First (re)generate the extension source code via swig with:

<code>rake swig</code>

Then create the gem for your platform:

<code>rake native gem</code>

After the compilation step, there is a new directory "pkg" that have been created.
You can now install the rtruckboris gem with:

<code>gem install pkg/rtruckboris-1.0.0.gem</code>

### Usage 

a lot of examples can be found in the test lib. I use those files when I test
truckboris functionnalities you have two ways to try them:

#### Without installing rtuckboris
<code>rake swig</code>
<code>rake compile</code>
Then you can use each files in the directory (be sure to be in this directory
in order to launch those files.

### After installing rtruckboris as a gem

Just modify the <code>require</code> line:
<code>require File.dirname(__FILE__) + "/../lib/rtruckboris/rtruckboris"</code>

with

<code>require 'rtruckboris'</code>

Cedlemo



