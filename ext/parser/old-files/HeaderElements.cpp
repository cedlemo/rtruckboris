#include "HeaderElements.h"
#include <iostream>
namespace TruckBoris {
  bool 
  HeaderElements::HandleTopLevelDecl( clang::DeclGroupRef d ) 
  {
    clang::DeclGroupRef::iterator it;
    for( it = d.begin(); it != d.end(); it++)
    {
        if(clang::FunctionDecl *fd = llvm::dyn_cast<clang::FunctionDecl>(*it))
        {
          Function fn(fd);  
          m_functions.push_back(fn);
        }
        else if(clang::TypedefDecl *td = llvm::dyn_cast<clang::TypedefDecl>(*it))
        {
            Typedef t_dc(td);
            m_typedefs.push_back(t_dc);
        }
    }
    return true;
  }
  void 
  HeaderElements::HandleTagDeclDefinition( clang::TagDecl * d)
  {
    if(d)
    {
      TagDeclaration tag(d);
      if(d->isStruct())
      {
        Structure s(d);
        m_structures.push_back(s);
      }
      if(d->isUnion())
           m_unions.push_back(tag);
      if(d->isEnum())
      {
        Enum e(d);
        m_enums.push_back(e);
      }
      if(d->isClass())
        m_classes.push_back(tag);
    }
  }
  void 
  HeaderElements::printFunctionsNames() const
  {
    if(m_functions.size() > 0)
    {
      std::vector<Function>::const_iterator it;
      for( it = m_functions.begin(); it != m_functions.end(); ++it)
      {
        std::cout << "funct " << (*it).getName() << std::endl;
      }
    }
  }

  void 
  HeaderElements::printTypedefsNames() const
  {
    if(m_typedefs.size() > 0)
    {
      std::vector<Typedef>::const_iterator it;
      for( it = m_typedefs.begin(); it != m_typedefs.end(); ++it )
      {
        std::cout << "typedef " << (*it).getName() << std::endl;
      }
    }
  }

  void 
  HeaderElements::printStructuresNames() const
  {
    if(m_structures.size() > 0)
    {
      std::vector<Structure>::const_iterator it;
      for( it = m_structures.begin(); it != m_structures.end(); ++it )
      {
        std::cout << "struct " << (*it).getName() << std::endl;
      }
    }
  }
  void 
  HeaderElements::printUnionsNames() const
  {
    if(m_unions.size() > 0)
    {
      std::vector<TagDeclaration>::const_iterator it;
      for( it = m_unions.begin(); it != m_unions.end(); ++it )
      {
        std::cout << "union " << (*it).getName() << std::endl;
      }
    }
  }
  void 
  HeaderElements::printEnumsNames() const
  {
    if(m_enums.size() > 0)
    {
      std::vector<Enum>::const_iterator it;
      for( it = m_enums.begin(); it != m_enums.end(); ++it )
      {
        std::cout << "enum " << (*it).getName() << std::endl;
      }
    }
  }
  int
  HeaderElements::getFunctionsNumber() const
  {
    return m_functions.size();
  }
  int
  HeaderElements::getStructuresNumber() const
  {
    return m_structures.size();
  }
  int
  HeaderElements::getUnionsNumber() const
  {
    return m_unions.size();
  }
  int
  HeaderElements::getEnumsNumber() const
  {
    return m_enums.size();
  }
  int
  HeaderElements::getTypedefsNumber() const
  {
    return m_typedefs.size();
  }
  std::vector<Function> 
  HeaderElements::getFunctions() const
  {
    return m_functions;
  }
  std::vector<Typedef>
  HeaderElements::getTypedefs() const
  {
    return m_typedefs;
  }
  std::vector<Structure>
  HeaderElements::getStructures() const
  {
    return m_structures;
  }
  std::vector<TagDeclaration>
  HeaderElements::getUnions() const
  {
    return m_unions;
  }
  std::vector<Enum>
  HeaderElements::getEnums() const
  {
    return m_enums;
  }
}
