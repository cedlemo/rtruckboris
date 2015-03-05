#!/usr/bin env ruby

require 'rtruckboris/rtruckboris'

class Rtruckboris::HeaderParser
  def functions
    fns=[]
    (0..(functions_num() -1)).each do |i|
      fns<<get_nth_function(i)
    end
    fns
  end
  def unions
    us=[]
    (0..(unions_num() -1)).each do |i|
      us<<get_nth_union(i)
    end
    us
  end
  def enums
    es=[]
    (0..(enums_num() -1)).each do |i|
      es<<get_nth_enum(i)
    end
    es
  end
  def typedefs
    tfs=[]
    (0..(typedefs_num() -1)).each do |i|
      tfs<<get_nth_typedef(i)
    end
    tfs
  end
  def structures
    stt=[]
    (0..(structures_num() -1)).each do |i|
      stt<<get_nth_structure(i)
    end
    stt
  end
  def to_s
    "Source file: #{getSourceFile} with paths: #{getHeaderPaths}"
  end
end

class Rtruckboris::Function
  def to_s
    "#{return_type.name} #{name}(#{parameters.map { |p|"#{p.type.name} #{p.name}" }.join(',')})"
  end
  def parameters
    pms=[]
    (0..(parameters_num() - 1)).each do |i|
      pms<<get_nth_parameter(i)
    end
    pms
  end
end

class Rtruckboris::TagDeclaration
  def to_s
    getName
  end
end
class Rtruckboris::Structure
  def fields
    fs=[]
    (0..(fields_num() -1)).each do |i|
      fs<<get_nth_field(i)
    end
    fs
  end
end
class Rtruckboris::Union
  def fields
    fs=[]
    (0..(fields_enum() -1)).each do |i|
      fs<<get_nth_field(i)
    end
    fs
  end
end
class Rtruckboris::Enum
  def enum_constants
    econstants=[]
    (0..(constants_num() -1)).each do |i|
      econstants<<get_nth_enum_constant(i)
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
