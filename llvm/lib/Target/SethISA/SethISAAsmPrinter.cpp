//===-- SethISAAsmPrinter.cpp - SethISA LLVM assembly writer ------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains a printer that converts from our internal representation
// of machine-dependent LLVM code to GAS-format SethISA assembly language.
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/SethISAInstPrinter.h"
#include "MCTargetDesc/SethISAMCExpr.h"
#include "MCTargetDesc/SethISATargetStreamer.h"
#include "SethISA.h"
#include "SethISAInstrInfo.h"
#include "SethISATargetMachine.h"
#include "TargetInfo/SethISATargetInfo.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineModuleInfoImpls.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/IR/Mangler.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

#define DEBUG_TYPE "asm-printer"


// Force static initialization.
extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeSethISAAsmPrinter() {
  RegisterAsmPrinter<SethISAAsmPrinter> X(getTheSethISATarget());
}
