#include "gears.h"
#include "HeaderParser.h"
#include "clang/Parse/ParseAST.h"
#include "dbg.h"
namespace TruckBoris {
  HeaderParser::HeaderParser(const std::string& sourceFile, const std::vector<std::string>& headersPaths)
  {
    m_source = sourceFile;
    m_headersPaths = headersPaths;
    initializeCompilerInstance(m_ci, m_headersPaths);
    // TODO use exception for if(!loadSourceFile(ci,sourceFile) )
    loadSourceFile(m_ci, m_source);
    m_headerElements = NULL;
  }
  HeaderParser::~HeaderParser()
  {
  // FIXME 
  //  delete m_headersElements;
  }
  void 
  HeaderParser::parse()
  {
    //clean all allowing to relaunch a parse  
    if ( m_headerElements )
    {
      // FIXME
      //delete m_headersElements;
    }
    m_ci.createASTContext();
    m_headerElements = new HeaderElements();
    m_ci.setASTConsumer(m_headerElements);
    m_ci.getDiagnosticClient().BeginSourceFile(m_ci.getLangOpts(),
                                               &m_ci.getPreprocessor());
    clang::ParseAST(m_ci.getPreprocessor(), m_headerElements, m_ci.getASTContext());
    m_ci.getDiagnosticClient().EndSourceFile();
  }

  /*#define PRINT_ELEMENTS_NAME(element)\
  void HeaderParser::print##element##Names() const\
  {\
    m_headerElements->print##element##Names();\
  }
  PRINT_ELEMENTS_NAME(Functions)
  PRINT_ELEMENTS_NAME(Enums)
  PRINT_ELEMENTS_NAME(Typedefs)
  PRINT_ELEMENTS_NAME(Unions)
  PRINT_ELEMENTS_NAME(Structures)
  #undef PRINT_ELEMENTS_NAME
  */
  const clang::LangOptions& 
  HeaderParser::getLangOpts () const
  {
    return m_ci.getLangOpts();
  }
  clang::SourceManager&
  HeaderParser::getSourceManager() const
  {
    return m_ci.getSourceManager();
  }
  void 
  HeaderParser::printFunctionsNames() const
  {
    if(m_headerElements)
    m_headerElements->printFunctionsNames();
  }
  void 
  HeaderParser::printStructuresNames() const
  {
    if(m_headerElements)
    m_headerElements->printStructuresNames();
  }
  void 
  HeaderParser::printEnumsNames() const
  {
    if(m_headerElements)
    m_headerElements->printEnumsNames();
  }
  void 
  HeaderParser::printUnionsNames() const
  {
    if(m_headerElements)
    m_headerElements->printUnionsNames();
  }
  void 
  HeaderParser::printTypedefsNames() const
  {
    if(m_headerElements)
    m_headerElements->printTypedefsNames();
  }
  int HeaderParser::getFunctionsNumber() const
  {
    if(m_headerElements)
      return m_headerElements->getFunctionsNumber();
    else
      return 0;
  }
  int HeaderParser::getStructuresNumber() const
  {
    if(m_headerElements)
      return m_headerElements->getStructuresNumber();
    else
      return 0;
  }
  int HeaderParser::getUnionsNumber() const
  {
    if(m_headerElements)
      return m_headerElements->getUnionsNumber();
    else
      return 0;
  }
  int HeaderParser::getEnumsNumber() const
  {
    if(m_headerElements)
      return m_headerElements->getEnumsNumber();
    else
      return 0;
  }
  int HeaderParser::getTypedefsNumber() const
  {
    if(m_headerElements)
      return m_headerElements->getTypedefsNumber();
    else
      return 0;
  }

  std::vector<Function> 
  HeaderParser::getFunctions() const
  {
    return m_headerElements->getFunctions();
  }

  std::vector<Structure>
  HeaderParser::getStructures() const
  {
    return m_headerElements->getStructures();
  }
  std::vector<Enum>
  HeaderParser::getEnums() const
  {
    return m_headerElements->getEnums();
  }
  std::vector<TagDeclaration>
  HeaderParser::getUnions() const
  {
    return m_headerElements->getUnions();
  }
  std::vector<Typedef>
  HeaderParser::getTypedefs() const
  {
    return m_headerElements->getTypedefs();
  }
}
