//===-- SethISARegisterInfo.cpp - SethISA Register Information ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the SethISA implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#include "SethISARegisterInfo.h"
#include "SethISA.h"
#include "SethISAMachineFunctionInfo.h"
#include "SethISASubtarget.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

#define GET_REGINFO_TARGET_DESC
#include "SethISAGenRegisterInfo.inc"


SethISARegisterInfo::SethISARegisterInfo() : SethISAGenRegisterInfo(SP::O7) {}

const MCPhysReg*
SethISARegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {
  return CSR_SaveList;
}

const TargetRegisterClass*
SethISARegisterInfo::getPointerRegClass(const MachineFunction &MF,
                                      unsigned Kind) const {
  return SethISA::GPR;
}
