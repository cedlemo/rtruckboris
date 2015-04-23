require 'mkmf'
CONFIG['CXX']='clang++'
have_library("truckboris")
$LIBS += " " + `pkg-config --libs truckboris`.chomp
$CPPFLAGS += " " + `pkg-config --cflags truckboris`.chomp + " -fcxx-exceptions"
create_makefile('rtruckboris/rtruckboris')
