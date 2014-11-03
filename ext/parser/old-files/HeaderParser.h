#ifndef HEADER_PARSER_H
#define HEADER_PARSER_H
#include "HeaderElements.h"
#include "clang/Frontend/CompilerInstance.h"
#include <string>
namespace TruckBoris {
  class HeaderParser
  {
    public:
      HeaderParser( const std::string&  sourceFile, const std::vector<std::string>& headersPaths);
      ~HeaderParser();
      void parse();
      const clang::LangOptions& getLangOpts () const;
      clang::SourceManager&   getSourceManager() const;
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
      std::vector<Structure> getStructures() const;
      std::vector<TagDeclaration> getUnions() const;
      std::vector<Enum> getEnums() const;
      std::vector<Typedef> getTypedefs() const;
    private:
      std::string m_source;
      std::vector<std::string> m_headersPaths;
      clang::CompilerInstance m_ci;
      HeaderElements * m_headerElements; 
  };
}
#endif
