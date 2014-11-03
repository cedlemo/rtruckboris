#ifndef TYPE_H
#define TYPE_H
#include "clang/AST/AST.h"
#include "string"
namespace TruckBoris {
  class Type
  {
    public:
      Type();
      Type(const clang::QualType & type);
      ~Type() {}
      Type& Equals(const Type& tpe);
      void setType(const clang::QualType & type);
      std::string getName() const;
      bool isCanonical() const;
      Type getCanonicalType() const;
      bool isEmpty() const;
    private:
      clang::QualType m_type;
      bool m_empty;
  };
}
#endif
