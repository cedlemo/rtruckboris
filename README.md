# Rtruckboris: Ruby bindings for the truckboris library

With rtruckboris, you can easily parse C headers files in pure Ruby.

```ruby
#!/usr/bin/env ruby

require 'rtruckboris'

parser = Rtruckboris::HeaderParser.new("a_file.h", ["/usr/include"])
parser.parse

functions = parser.functions
puts "Functions number : #{functions.size}"
functions.each do |f|
  puts "Name : #{f.name}"
  puts "Return : #{f.return.name}"
  params = f.parameters
  puts "\t #{params.size.to_s} parameters :"
  params.each do |p|
    puts "\t\t#{p.type.name}  #{p.name}"
    if(!p.type.is_canonical)
      puts "\t\t\t#{p.type.canonical_type.name}"
    end
  end
end

functions.each do |f|
  puts f.raw(parser.source_manager,parser.lang_opts)
end
```

## Resolve dependencies and Install

### Dependencies
rtruckboris is a ruby extension for the truckboris library so you need to install
it (https://github.com/cedlemo/truckboris) and its dependencies (LLVM and Clang >= 3.4 to 3.8).

You will need to install :
*    Ruby
*    Rake-compiler
*    swig

### Install
When this is done, clone this repository with:

<code>git clone https://github.com/cedlemo/rtruckboris</code>

First (re)generate the extension source code via swig with:

<code>rake swig</code>

Then create the gem for your platform:

<code>gem build rtruckboris.gemspec</code>

You can now install the rtruckboris gem with:

<code>gem install rtruckboris-x.x.x.gem</code>

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



