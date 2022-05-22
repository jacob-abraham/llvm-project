//===-- SethISAInstrFormats.td - SethISA Instruction Formats ---*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// Format specifies the encoding used by the instruction.  This is part of the
// ad-hoc solution used to emit machine instruction encodings by our machine
// code emitter.
class Format<bits<3> val> {
  bits<3> Value = val;
}

def Pseudo          : Format<0>;
def Frm_Custom      : Format<1>;
def Frm_NoOperand   : Format<2>;
def Frm_Imm8        : Format<3>;
def Frm_RegImm8     : Format<4>;
def Frm_RegRegImm5  : Format<5>;
def Frm_Reg         : Format<6>;
def Frm_RegReg      : Format<7>;



class SethISAInst<Format f, dag outs, dag ins, string opcodestr, string argstr,
             list<dag> pattern, Format f>
    : Instruction {
  let Namespace = "SethISA";

  Format Form = f;

  dag OutOperandList = outs;
  dag InOperandList = ins;
  let AsmString = opcodestr # "\t" # argstr;
  let Pattern = pattern;
}





class SethISAInst_NoOperand<bits<8> opcode, dag outs, dag ins, string opcodestr>
    : SethISAInst<Frm_NoOperand, outs, ins, opcodestr, "", []> {
  field bits<8> Inst;
  let Inst = opcode;
}

class SethISAInst_Imm8<bits<8> opcode, dag outs, dag ins, string opcodestr, string argstr>
    : SethISAInst<Frm_Imm8, outs, ins, opcodestr, argstr, []> {
  field bits<16> Inst;
  let Inst{15-8} = opcode;
  let Inst{7-0} = imm8;
}

class SethISAInst_RegImm8<bits<5> opcode, dag outs, dag ins, string opcodestr, string argstr>
    : SethISAInst<Frm_RegImm8, outs, ins, opcodestr, argstr, []> {
  field bits<16> Inst;
  let Inst{15-11} = opcode;
  let Inst{10-8} = reg;
  let Inst{7-0} = imm8;
}

class SethISAInst_RegRegImm5<bits<5> opcode, dag outs, dag ins, string opcodestr, string argstr>
    : SethISAInst<Frm_RegRegImm5, outs, ins, opcodestr, argstr, []> {
  field bits<16> Inst;
  let Inst{15-11} = opcode;
  let Inst{10-8} = regi;
  let Inst{7-5} = regj;
  let Inst{4-0} = imm5;
}

class SethISAInst_Reg<bits<5> opcode, dag outs, dag ins, string opcodestr, string argstr>
    : SethISAInst<Frm_Reg, outs, ins, opcodestr, argstr, []> {
  field bits<8> Inst;
  let Inst{7-3} = opcode;
  let Inst{2-0} = reg;
}

class SethISAInst_RegReg<bits<2> opcode, dag outs, dag ins, string opcodestr, string argstr>
    : SethISAInst<Frm_RegReg, outs, ins, opcodestr, argstr, []> {
  field bits<8> Inst;
  let Inst{7-6} = opcode;
  let Inst{5-3} = regi;
  let Inst{2-0} = regj;
}

