#ifndef HEADER_ELEMENTS_H
#define HEADER_ELEMENTS_H
#include "clang/AST/AST.h" //DeclGroupRef TagDecl FunctionDecl TypedefDecl
#include "clang/AST/ASTConsumer.h"
#include <vector>
#include "Declarations.h"
#include "Function.h"
namespace TruckBoris {
  class HeaderElements : public clang::ASTConsumer
  {
    public:
      HeaderElements() : clang::ASTConsumer() { }
      virtual ~HeaderElements() { }

      virtual bool HandleTopLevelDecl( clang::DeclGroupRef d);
      virtual void HandleTagDeclDefinition( clang::TagDecl * d);
      void printFunctionsNames() const;
      void printStructuresNames() const;
      void printUnionsNames() const;
      void printEnumsNames() const;
      void printTypedefsNames() const;
      int getFunctionsNumber() const;
      int getStructuresNumber() const;
      int getUnionsNumber() const;
      int getEnumsNumber() const;
      int getTypedefsNumber() const;
      std::vector<Function> getFunctions() const;
      std::vector<Typedef> getTypedefs() const;
      std::vector<Structure> getStructures() const;
      std::vector<TagDeclaration> getUnions() const;
      std::vector<Enum> getEnums() const;
      //std::vector<TagDeclaration> getClasses() const;
    private:
      std::vector<Function> m_functions;
      std::vector<Typedef> m_typedefs;
      std::vector<Structure> m_structures;
      std::vector<TagDeclaration> m_unions;
      std::vector<Enum> m_enums;
      std::vector<TagDeclaration> m_classes;
      /*add methods for classes*/
  };
}
#endif
