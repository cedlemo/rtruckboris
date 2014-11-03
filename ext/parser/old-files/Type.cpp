#include "Type.h"
namespace TruckBoris {
  Type::Type(): m_empty(true)
  {}
  Type::Type(const clang::QualType & type) : m_type(type), m_empty(false)
  {}
  Type& Type::Equals(const Type& tpe)
  {
    m_empty = tpe.m_empty;
    m_type = tpe.m_type;
    return *this;
  }
  std::string Type::getName() const
  {
    if(m_empty)
      return std::string();
    else
      return m_type.getAsString();
  }
  bool Type::isCanonical() const
  {
    if(m_empty)
      return false;
    else
      return m_type.isCanonical();
  }
  Type Type::getCanonicalType() const
  {
    if(m_empty)
      return Type();
    else
      return Type(m_type.getCanonicalType());
  }
  bool Type::isEmpty() const
  {
    return m_empty;
  }
  void Type::setType(const clang::QualType & type)
  {
    m_type = type;
    m_empty = false;
  }
} 
