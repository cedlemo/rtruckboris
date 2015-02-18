#!/usr/bin env ruby

require 'rtruckboris/rtruckboris'

class Rtruckboris::HeaderParser
  def getFunctions()
    functions=[]
    (0..(nbFunctions() -1)).each do |i|
      functions<<getFunction(i)
    end
    functions
  end
end
