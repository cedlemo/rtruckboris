%module rtruckboris 
%include "std_string.i"
%include "std_vector.i"
%{
/*--SWIGINCLUDE*/
/*includes for the compiler*/
#include "HeaderParser.h"
/*--ENDSWIGINCLUDE*/
%}

namespace std {
  %template(VectorEnum) vector<TruckBoris::Enum>;
  %template(VectorEnumConstant) vector<TruckBoris::EnumConstant>;
  %template(VectorFunction) vector<TruckBoris::Function>;
  %template(VectorParameter) vector<TruckBoris::Parameter>;
  %template(VectorStructure) vector<TruckBoris::Structure>;
  %template(VectorField) vector<TruckBoris::Field>;
  %template(VectorTypedef) vector<TruckBoris::Typedef>;
  %template(VectorString) vector<string>;
}; 
%import "/usr/include/clang/AST/ASTConsumer.h"
%rename($ignore) *::getPtr() const;
%rename($ignore) TruckBoris::Structure::Equals(const Structure& tag);
%rename($ignore) TruckBoris::Structure::getField(int) const;
%rename($ignore) TruckBoris::Structure::getFieldsNumber() const;
%rename($ignore) TruckBoris::Enum::Equals(const Enum& tag);
%rename($ignore) TruckBoris::Enum::getConstantsNumber() const;
%rename($ignore) TruckBoris::Enum::getConstant(int i) const;
%rename($ignore) TruckBoris::Function::setPtr(clang::FunctionDecl * fn);
%rename($ignore) TruckBoris::Function::getParamsNumber() const;
%rename($ignore) TruckBoris::Function::getParameter(int i) const;
%rename($ignore) TruckBoris::Function::Equals(const Function& fn);
%rename($ignore) TruckBoris::TagDeclaration::setPtr(clang::TagDecl * var);
%rename($ignore) TruckBoris::TagDeclaration::Equals( const TagDeclaration & tag);
%rename($ignore) TruckBoris::Typedef::Equals( const Typedef& tpd);
%rename($ignore) TruckBoris::Typedef::setPtr(clang::TypedefDecl * var);
%rename($ignore) TruckBoris::EnumConstant::Equals(const EnumConstant& cst);
%rename($ignore) TruckBoris::EnumConstant::setPtr(clang::EnumConstantDecl * constant);
%rename($ignore) TruckBoris::Parameter::Equals(const Constant& pdc);
%rename($ignore) TruckBoris::Parameter::setPtr(clang::ParmVarDecl * var);
%rename($ignore) TruckBoris::Field::Equals(const Field& fld);
%rename($ignore) TruckBoris::Field::setPtr(clang::FieldDecl * var);
%rename($ignore) TruckBoris::Type::Equals(const Type& tpe);
%rename($ignore) TruckBoris::Type::setType(const clang::QualType & type);
%rename($ignore) TruckBoris::HeaderParser::getClasses() const;
%include "/usr/include/truckboris/Type.h"
%include "/usr/include/truckboris/Declarations.h"
%include "/usr/include/truckboris/Function.h"
%import "/usr/include/truckboris/HeaderElements.h"
%include "/usr/include/truckboris/HeaderParser.h"

