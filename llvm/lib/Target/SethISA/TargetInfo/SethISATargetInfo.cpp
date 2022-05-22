//===-- SethISATargetInfo.cpp - SethISA Target Implementation -----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "TargetInfo/SethISATargetInfo.h"
#include "llvm/MC/TargetRegistry.h"
using namespace llvm;

Target &llvm::getTheSethISATarget() {
  static Target TheSethISATarget;
  return TheSethISATarget;
}

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeSethISATargetInfo() {
  RegisterTarget<Triple::sethisa, /*HasJIT=*/false> X(getTheSethISATarget(), "SethISA",
                                                   "SethISA", "SethISA");
}
