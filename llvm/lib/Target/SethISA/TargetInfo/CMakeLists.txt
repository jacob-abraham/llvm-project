add_llvm_component_library(LLVMSethISAInfo
  SethISATargetInfo.cpp

  LINK_COMPONENTS
  MC
  Support

  ADD_TO_COMPONENT
  SethISA
  )
