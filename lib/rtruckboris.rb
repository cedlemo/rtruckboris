#!/usr/bin env ruby

require 'rtruckboris/rtruckboris'

class Rtruckboris::HeaderParser
  def getFunctions
    functions=[]
    (0..(nbFunctions() -1)).each do |i|
      functions<<getFunction(i)
    end
    functions
  end
  def getUnions
    unions=[]
    (0..(nbUnions() -1)).each do |i|
      unions<<getUnion(i)
    end
    unions
  end
  def getEnums
    enums=[]
    (0..(nbEnums() -1)).each do |i|
      enums<<getEnum(i)
    end
    enums
  end
  def getTypedefs
    typedefs=[]
    (0..(nbTypedefs() -1)).each do |i|
      typedefs<<getTypedef(i)
    end
    typedefs
  end
  def getStructures
    structures=[]
    (0..(nbStructures() -1)).each do |i|
      structures<<getStructure(i)
    end
    structures
  end
  def to_s
    "Source file: #{getSourceFile} with paths: #{getHeaderPaths}"
  end
end

class Rtruckboris::Function
  def to_s
    "#{getReturn.getName} #{getName}(#{getParameters.map { |p|"#{p.getType.getName} #{p.getName}" }.join(',')})"
  end
  def getParameters
    parameters=[]
    (0..(nbParameters() - 1)).each do |i|
      parameters<<getParameter(i)
    end
    parameters
  end
end

class Rtruckboris::TagDeclaration
  def to_s
    getName
  end
end
class Rtruckboris::Structure
  def getFields
    fields=[]
    (0..(nbFields() -1)).each do |i|
      fields<<getField(i)
    end
    fields
  end
end
class Rtruckboris::Union
  def getFields
    fields=[]
    (0..(nbFields() -1)).each do |i|
      fields<<getField(i)
    end
    fields
  end
end
class Rtruckboris::Enum
  def getConstants
    econstants=[]
    (0..(nbConstants() -1)).each do |i|
      econstants<<getConstant(i)
    end
    econstants
  end
end
class Rtruckboris::Typedef
  def to_s
    getName
  end
end

class Rtruckboris::Field
  def to_s
    getName
  end
end

class Rtruckboris::Type
  def to_s
    getName
  end
end

class Rtruckboris::Parameter
  def to_s
    getName
  end
end
