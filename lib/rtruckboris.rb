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
  def getUnions()
    unions=[]
    (0..(nbUnions() -1)).each do |i|
      unions<<getUnion(i)
    end
    unions
  end
  def getEnums()
    enums=[]
    (0..(nbEnums() -1)).each do |i|
      enums<<getEnum(i)
    end
    enums
  end
  def getTypedefs()
    typedefs=[]
    (0..(nbTypedefs() -1)).each do |i|
      typedefs<<getTypedef(i)
    end
    typedefs
  end
end
