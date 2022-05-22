add_llvm_component_group(SethISA HAS_JIT)

set(LLVM_TARGET_DEFINITIONS SethISA.td)

tablegen(LLVM SethISAGenAsmMatcher.inc -gen-asm-matcher)
tablegen(LLVM SethISAGenAsmWriter.inc -gen-asm-writer)
tablegen(LLVM SethISAGenCallingConv.inc -gen-callingconv)
tablegen(LLVM SethISAGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM SethISAGenDisassemblerTables.inc -gen-disassembler)
tablegen(LLVM SethISAGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM SethISAGenMCCodeEmitter.inc -gen-emitter)
tablegen(LLVM SethISAGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM SethISAGenSubtargetInfo.inc -gen-subtarget)

add_public_tablegen_target(SethISACommonTableGen)

add_llvm_target(SethISACodeGen

  LINK_COMPONENTS
  AsmPrinter
  CodeGen
  Core
  MC
  SelectionDAG
  Support
  Target

  ADD_TO_COMPONENT
  SethISA
  )

add_subdirectory(AsmParser)
add_subdirectory(Disassembler)
add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)
