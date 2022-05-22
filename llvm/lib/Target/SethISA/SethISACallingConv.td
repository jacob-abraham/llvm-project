//===-- SethISACallingConv.td - Calling Conventions SethISA ----*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This describes the calling conventions for the SethISA architecture.
//
//===----------------------------------------------------------------------===//


// empty
def CSR_SaveRegs : CalleeSavedRegs<(add)>;
