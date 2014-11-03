%module parser
%include "std_string.i"
%include "std_vector.i"
%{
/*--SWIGINCLUDE*/
/*includes for the compiler*/
#include "clang/AST/AST.h"
#include "clang/AST/ASTConsumer.h"
#include "clang/Parse/ParseAST.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/Utils.h"
#include "clang/Basic/TargetInfo.h"
#include "llvm/Support/Host.h"
#include "clang/Lex/Preprocessor.h"
#include "clang/Lex/HeaderSearch.h"
#include "clang/AST/AST.h"
#include "clang/AST/ASTContext.h"
#include "clang/Parse/Parser.h"

#include "TruckBoris/Type.h"
#include "TruckBoris/Declarations.h"
#include "TruckBoris/Function.h"
#include "TruckBoris/HeaderElements.h"
//#include "gears.h"
#include "TruckBoris/HeaderParser.h"
//#include "dbg.h"
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
%include "../ext/parser/TruckBoris/Type.h"
%include "../ext/parser/TruckBoris/Declarations.h"
%include "../ext/parser/TruckBoris/Function.h"
%import "../ext/parser/TruckBoris/HeaderElements.h"
%include "../ext/parser/TruckBoris/HeaderParser.h"

