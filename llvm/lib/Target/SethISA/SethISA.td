//===-- SethISA.td - Describe the SethISA Target Machine -------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Target-independent interfaces which we are implementing
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"



/*

ISA Description: 
Machine has 8 bit wide words.
One Accumulator (8 bits wide)
Program counter is 8 bits wide

All instructions should assert the oretire signal when they finsih.

8 registers: R0-R7, by convention R0 is the SP

  HALT format:
  +---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   |
  | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
  |   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---+
HALT    0x00         A 8 bit instruction, opcode 0.
                      Machine should assert ohalt signal.

  NOP format:
  +---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   |
  | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
  |   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---+
NOP    0x01         A 8 bit instruction, opcode 1.


  ADDI format:
  +---+---+---+---+---+---+---+---++---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   ||   |   |   |   |   |   |   |   |
  | 0 | 0 | 0 | 0 | 1 |    REG    ||           CONSTANT            |
  |   |   |   |   |   |   |   |   ||   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---++---+---+---+---+---+---+---+---+
ADDI   0x08+i CONST   A 16 bit instruction, opcode 0x08+i
                        followed by the 8 bit value to be
                        added to Register i (Ri)

  ADD format:
  +---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   |
  | 0 | 1 |   REGi    |    REGj   |
  |   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---+
ADD   0x40+i+j   A 8 bit instruction, opcode 0x40+i+j
                        Ri = Ri + Rj


  SUB format:
  +---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   |
  | 1 | 0 |   REGi    |   REGj    |
  |   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---+
SUB   0x80+i+j   A 8 bit instruction, opcode 0x80+i+j
                        Ri = Ri - Rj

  MOV format:
  +---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   |
  | 1 | 1 |   REGi    |   REGj    |
  |   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---+
MOV     0xC0+i+j      A 8 bit instruction moving source
                      Ri = Rj
                      The original contents of the Rj are NOT destroyed

NOP = MOV R0, R0



  LOAD format:
  +---+---+---+---+---+---+---+---++---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   ||   |   |   |   |   |   |   |   |
  | 0 | 0 | 0 | 1 | 0 |   REGi    ||   REGj    |    OFFSET         |
  |   |   |   |   |   |   |   |   ||   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---++---+---+---+---+---+---+---+---+
LOAD     0x10+i j+offset      A 16 bit instruction to load with offset
                              Ri = [Rj + OFFSET]

  STORE format:
  +---+---+---+---+---+---+---+---++---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   ||   |   |   |   |   |   |   |   |
  | 0 | 0 | 0 | 1 | 1 |   REGi    ||   REGj    |    OFFSET         |
  |   |   |   |   |   |   |   |   ||   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---++---+---+---+---+---+---+---+---+
STORE     0x18+i j+offset      A 16 bit instruction to store with offset
                              [Rj + OFFSET] = Ri


  JUMP format:
  +---+---+---+---+---+---+---+---++---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   ||   |   |   |   |   |   |   |   |
  | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 ||          ADDRESS              |
  |   |   |   |   |   |   |   |   ||   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---++---+---+---+---+---+---+---+---+
JUMP     0x20 ADDRESS      A 16 bit instruction to jump to an address
                              PC = ADDRESS

  JUMPI format:
  +---+---+---+---+---+---+---+---+
  |   |   |   |   |   |   |   |   |
  | 0 | 0 | 1 | 0 | 1 |    REG    |
  |   |   |   |   |   |   |   |   |
  +---+---+---+---+---+---+---+---+
JUMPI     0x22+REG      A 8 bit instruction to jump indirectly to an address
                              PC = contents of REG

*/


//===----------------------------------------------------------------------===//
// Register File, Calling Conv, Instruction Descriptions
//===----------------------------------------------------------------------===//

include "SethISARegisterInfo.td"
include "SethISAInstrInfo.td"

def SethISAInstrInfo : InstrInfo;

def SethISAAsmParser : AsmParser {
  bit ShouldEmitMatchRegisterName = 0;
}
