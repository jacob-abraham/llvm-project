; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d -verify-machineinstrs < %s \
; RUN:   -target-abi=ilp32d | FileCheck -check-prefixes=CHECKIFD,RV32IFD %s
; RUN: llc -mtriple=riscv64 -mattr=+d -verify-machineinstrs < %s \
; RUN:   -target-abi=lp64d | FileCheck -check-prefixes=CHECKIFD,RV64IFD %s

define signext i32 @test_floor_si32(double %x) {
; CHECKIFD-LABEL: test_floor_si32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB0_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.w.d a0, fa0, rdn
; CHECKIFD-NEXT:  .LBB0_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.floor.f64(double %x)
  %b = call i32 @llvm.fptosi.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_floor_si64(double %x) nounwind {
; RV32IFD-LABEL: test_floor_si64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call floor@plt
; RV32IFD-NEXT:    lui a0, %hi(.LCPI1_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI1_0)(a0)
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fle.d s0, ft0, fa0
; RV32IFD-NEXT:    call __fixdfdi@plt
; RV32IFD-NEXT:    lui a3, 524288
; RV32IFD-NEXT:    bnez s0, .LBB1_2
; RV32IFD-NEXT:  # %bb.1:
; RV32IFD-NEXT:    lui a1, 524288
; RV32IFD-NEXT:  .LBB1_2:
; RV32IFD-NEXT:    lui a2, %hi(.LCPI1_1)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI1_1)(a2)
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    beqz a2, .LBB1_4
; RV32IFD-NEXT:  # %bb.3:
; RV32IFD-NEXT:    addi a1, a3, -1
; RV32IFD-NEXT:  .LBB1_4:
; RV32IFD-NEXT:    feq.d a3, fs0, fs0
; RV32IFD-NEXT:    bnez a3, .LBB1_6
; RV32IFD-NEXT:  # %bb.5:
; RV32IFD-NEXT:    li a1, 0
; RV32IFD-NEXT:    li a0, 0
; RV32IFD-NEXT:    j .LBB1_7
; RV32IFD-NEXT:  .LBB1_6:
; RV32IFD-NEXT:    neg a3, s0
; RV32IFD-NEXT:    and a0, a3, a0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:  .LBB1_7:
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_floor_si64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB1_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.l.d a0, fa0, rdn
; RV64IFD-NEXT:  .LBB1_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.floor.f64(double %x)
  %b = call i64 @llvm.fptosi.sat.i64.f64(double %a)
  ret i64 %b
}

define signext i32 @test_floor_ui32(double %x) {
; CHECKIFD-LABEL: test_floor_ui32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB2_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.wu.d a0, fa0, rdn
; CHECKIFD-NEXT:  .LBB2_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.floor.f64(double %x)
  %b = call i32 @llvm.fptoui.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_floor_ui64(double %x) nounwind {
; RV32IFD-LABEL: test_floor_ui64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call floor@plt
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fcvt.d.w ft0, zero
; RV32IFD-NEXT:    fle.d a0, ft0, fa0
; RV32IFD-NEXT:    neg s0, a0
; RV32IFD-NEXT:    call __fixunsdfdi@plt
; RV32IFD-NEXT:    lui a2, %hi(.LCPI3_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI3_0)(a2)
; RV32IFD-NEXT:    and a0, s0, a0
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:    and a1, s0, a1
; RV32IFD-NEXT:    or a1, a1, a2
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_floor_ui64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB3_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.lu.d a0, fa0, rdn
; RV64IFD-NEXT:  .LBB3_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.floor.f64(double %x)
  %b = call i64 @llvm.fptoui.sat.i64.f64(double %a)
  ret i64 %b
}

define signext i32 @test_ceil_si32(double %x) {
; CHECKIFD-LABEL: test_ceil_si32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB4_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.w.d a0, fa0, rup
; CHECKIFD-NEXT:  .LBB4_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.ceil.f64(double %x)
  %b = call i32 @llvm.fptosi.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_ceil_si64(double %x) nounwind {
; RV32IFD-LABEL: test_ceil_si64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call ceil@plt
; RV32IFD-NEXT:    lui a0, %hi(.LCPI5_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI5_0)(a0)
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fle.d s0, ft0, fa0
; RV32IFD-NEXT:    call __fixdfdi@plt
; RV32IFD-NEXT:    lui a3, 524288
; RV32IFD-NEXT:    bnez s0, .LBB5_2
; RV32IFD-NEXT:  # %bb.1:
; RV32IFD-NEXT:    lui a1, 524288
; RV32IFD-NEXT:  .LBB5_2:
; RV32IFD-NEXT:    lui a2, %hi(.LCPI5_1)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI5_1)(a2)
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    beqz a2, .LBB5_4
; RV32IFD-NEXT:  # %bb.3:
; RV32IFD-NEXT:    addi a1, a3, -1
; RV32IFD-NEXT:  .LBB5_4:
; RV32IFD-NEXT:    feq.d a3, fs0, fs0
; RV32IFD-NEXT:    bnez a3, .LBB5_6
; RV32IFD-NEXT:  # %bb.5:
; RV32IFD-NEXT:    li a1, 0
; RV32IFD-NEXT:    li a0, 0
; RV32IFD-NEXT:    j .LBB5_7
; RV32IFD-NEXT:  .LBB5_6:
; RV32IFD-NEXT:    neg a3, s0
; RV32IFD-NEXT:    and a0, a3, a0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:  .LBB5_7:
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_ceil_si64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB5_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.l.d a0, fa0, rup
; RV64IFD-NEXT:  .LBB5_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.ceil.f64(double %x)
  %b = call i64 @llvm.fptosi.sat.i64.f64(double %a)
  ret i64 %b
}

define signext i32 @test_ceil_ui32(double %x) {
; CHECKIFD-LABEL: test_ceil_ui32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB6_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.wu.d a0, fa0, rup
; CHECKIFD-NEXT:  .LBB6_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.ceil.f64(double %x)
  %b = call i32 @llvm.fptoui.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_ceil_ui64(double %x) nounwind {
; RV32IFD-LABEL: test_ceil_ui64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call ceil@plt
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fcvt.d.w ft0, zero
; RV32IFD-NEXT:    fle.d a0, ft0, fa0
; RV32IFD-NEXT:    neg s0, a0
; RV32IFD-NEXT:    call __fixunsdfdi@plt
; RV32IFD-NEXT:    lui a2, %hi(.LCPI7_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI7_0)(a2)
; RV32IFD-NEXT:    and a0, s0, a0
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:    and a1, s0, a1
; RV32IFD-NEXT:    or a1, a1, a2
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_ceil_ui64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB7_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.lu.d a0, fa0, rup
; RV64IFD-NEXT:  .LBB7_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.ceil.f64(double %x)
  %b = call i64 @llvm.fptoui.sat.i64.f64(double %a)
  ret i64 %b
}

define signext i32 @test_trunc_si32(double %x) {
; CHECKIFD-LABEL: test_trunc_si32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB8_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.w.d a0, fa0, rtz
; CHECKIFD-NEXT:  .LBB8_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.trunc.f64(double %x)
  %b = call i32 @llvm.fptosi.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_trunc_si64(double %x) nounwind {
; RV32IFD-LABEL: test_trunc_si64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call trunc@plt
; RV32IFD-NEXT:    lui a0, %hi(.LCPI9_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI9_0)(a0)
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fle.d s0, ft0, fa0
; RV32IFD-NEXT:    call __fixdfdi@plt
; RV32IFD-NEXT:    lui a3, 524288
; RV32IFD-NEXT:    bnez s0, .LBB9_2
; RV32IFD-NEXT:  # %bb.1:
; RV32IFD-NEXT:    lui a1, 524288
; RV32IFD-NEXT:  .LBB9_2:
; RV32IFD-NEXT:    lui a2, %hi(.LCPI9_1)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI9_1)(a2)
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    beqz a2, .LBB9_4
; RV32IFD-NEXT:  # %bb.3:
; RV32IFD-NEXT:    addi a1, a3, -1
; RV32IFD-NEXT:  .LBB9_4:
; RV32IFD-NEXT:    feq.d a3, fs0, fs0
; RV32IFD-NEXT:    bnez a3, .LBB9_6
; RV32IFD-NEXT:  # %bb.5:
; RV32IFD-NEXT:    li a1, 0
; RV32IFD-NEXT:    li a0, 0
; RV32IFD-NEXT:    j .LBB9_7
; RV32IFD-NEXT:  .LBB9_6:
; RV32IFD-NEXT:    neg a3, s0
; RV32IFD-NEXT:    and a0, a3, a0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:  .LBB9_7:
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_trunc_si64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB9_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.l.d a0, fa0, rtz
; RV64IFD-NEXT:  .LBB9_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.trunc.f64(double %x)
  %b = call i64 @llvm.fptosi.sat.i64.f64(double %a)
  ret i64 %b
}

define signext i32 @test_trunc_ui32(double %x) {
; CHECKIFD-LABEL: test_trunc_ui32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB10_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.wu.d a0, fa0, rtz
; CHECKIFD-NEXT:  .LBB10_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.trunc.f64(double %x)
  %b = call i32 @llvm.fptoui.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_trunc_ui64(double %x) nounwind {
; RV32IFD-LABEL: test_trunc_ui64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call trunc@plt
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fcvt.d.w ft0, zero
; RV32IFD-NEXT:    fle.d a0, ft0, fa0
; RV32IFD-NEXT:    neg s0, a0
; RV32IFD-NEXT:    call __fixunsdfdi@plt
; RV32IFD-NEXT:    lui a2, %hi(.LCPI11_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI11_0)(a2)
; RV32IFD-NEXT:    and a0, s0, a0
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:    and a1, s0, a1
; RV32IFD-NEXT:    or a1, a1, a2
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_trunc_ui64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB11_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.lu.d a0, fa0, rtz
; RV64IFD-NEXT:  .LBB11_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.trunc.f64(double %x)
  %b = call i64 @llvm.fptoui.sat.i64.f64(double %a)
  ret i64 %b
}

define signext i32 @test_round_si32(double %x) {
; CHECKIFD-LABEL: test_round_si32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB12_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.w.d a0, fa0, rmm
; CHECKIFD-NEXT:  .LBB12_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.round.f64(double %x)
  %b = call i32 @llvm.fptosi.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_round_si64(double %x) nounwind {
; RV32IFD-LABEL: test_round_si64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call round@plt
; RV32IFD-NEXT:    lui a0, %hi(.LCPI13_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI13_0)(a0)
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fle.d s0, ft0, fa0
; RV32IFD-NEXT:    call __fixdfdi@plt
; RV32IFD-NEXT:    lui a3, 524288
; RV32IFD-NEXT:    bnez s0, .LBB13_2
; RV32IFD-NEXT:  # %bb.1:
; RV32IFD-NEXT:    lui a1, 524288
; RV32IFD-NEXT:  .LBB13_2:
; RV32IFD-NEXT:    lui a2, %hi(.LCPI13_1)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI13_1)(a2)
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    beqz a2, .LBB13_4
; RV32IFD-NEXT:  # %bb.3:
; RV32IFD-NEXT:    addi a1, a3, -1
; RV32IFD-NEXT:  .LBB13_4:
; RV32IFD-NEXT:    feq.d a3, fs0, fs0
; RV32IFD-NEXT:    bnez a3, .LBB13_6
; RV32IFD-NEXT:  # %bb.5:
; RV32IFD-NEXT:    li a1, 0
; RV32IFD-NEXT:    li a0, 0
; RV32IFD-NEXT:    j .LBB13_7
; RV32IFD-NEXT:  .LBB13_6:
; RV32IFD-NEXT:    neg a3, s0
; RV32IFD-NEXT:    and a0, a3, a0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:  .LBB13_7:
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_round_si64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB13_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.l.d a0, fa0, rmm
; RV64IFD-NEXT:  .LBB13_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.round.f64(double %x)
  %b = call i64 @llvm.fptosi.sat.i64.f64(double %a)
  ret i64 %b
}

define signext i32 @test_round_ui32(double %x) {
; CHECKIFD-LABEL: test_round_ui32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB14_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.wu.d a0, fa0, rmm
; CHECKIFD-NEXT:  .LBB14_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.round.f64(double %x)
  %b = call i32 @llvm.fptoui.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_round_ui64(double %x) nounwind {
; RV32IFD-LABEL: test_round_ui64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call round@plt
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fcvt.d.w ft0, zero
; RV32IFD-NEXT:    fle.d a0, ft0, fa0
; RV32IFD-NEXT:    neg s0, a0
; RV32IFD-NEXT:    call __fixunsdfdi@plt
; RV32IFD-NEXT:    lui a2, %hi(.LCPI15_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI15_0)(a2)
; RV32IFD-NEXT:    and a0, s0, a0
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:    and a1, s0, a1
; RV32IFD-NEXT:    or a1, a1, a2
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_round_ui64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB15_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.lu.d a0, fa0, rmm
; RV64IFD-NEXT:  .LBB15_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.round.f64(double %x)
  %b = call i64 @llvm.fptoui.sat.i64.f64(double %a)
  ret i64 %b
}

define signext i32 @test_roundeven_si32(double %x) {
; CHECKIFD-LABEL: test_roundeven_si32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB16_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.w.d a0, fa0, rne
; CHECKIFD-NEXT:  .LBB16_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.roundeven.f64(double %x)
  %b = call i32 @llvm.fptosi.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_roundeven_si64(double %x) nounwind {
; RV32IFD-LABEL: test_roundeven_si64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call roundeven@plt
; RV32IFD-NEXT:    lui a0, %hi(.LCPI17_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI17_0)(a0)
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fle.d s0, ft0, fa0
; RV32IFD-NEXT:    call __fixdfdi@plt
; RV32IFD-NEXT:    lui a3, 524288
; RV32IFD-NEXT:    bnez s0, .LBB17_2
; RV32IFD-NEXT:  # %bb.1:
; RV32IFD-NEXT:    lui a1, 524288
; RV32IFD-NEXT:  .LBB17_2:
; RV32IFD-NEXT:    lui a2, %hi(.LCPI17_1)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI17_1)(a2)
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    beqz a2, .LBB17_4
; RV32IFD-NEXT:  # %bb.3:
; RV32IFD-NEXT:    addi a1, a3, -1
; RV32IFD-NEXT:  .LBB17_4:
; RV32IFD-NEXT:    feq.d a3, fs0, fs0
; RV32IFD-NEXT:    bnez a3, .LBB17_6
; RV32IFD-NEXT:  # %bb.5:
; RV32IFD-NEXT:    li a1, 0
; RV32IFD-NEXT:    li a0, 0
; RV32IFD-NEXT:    j .LBB17_7
; RV32IFD-NEXT:  .LBB17_6:
; RV32IFD-NEXT:    neg a3, s0
; RV32IFD-NEXT:    and a0, a3, a0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:  .LBB17_7:
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_roundeven_si64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB17_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.l.d a0, fa0, rne
; RV64IFD-NEXT:  .LBB17_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.roundeven.f64(double %x)
  %b = call i64 @llvm.fptosi.sat.i64.f64(double %a)
  ret i64 %b
}

define signext i32 @test_roundeven_ui32(double %x) {
; CHECKIFD-LABEL: test_roundeven_ui32:
; CHECKIFD:       # %bb.0:
; CHECKIFD-NEXT:    feq.d a0, fa0, fa0
; CHECKIFD-NEXT:    beqz a0, .LBB18_2
; CHECKIFD-NEXT:  # %bb.1:
; CHECKIFD-NEXT:    fcvt.wu.d a0, fa0, rne
; CHECKIFD-NEXT:  .LBB18_2:
; CHECKIFD-NEXT:    ret
  %a = call double @llvm.roundeven.f64(double %x)
  %b = call i32 @llvm.fptoui.sat.i32.f64(double %a)
  ret i32 %b
}

define i64 @test_roundeven_ui64(double %x) nounwind {
; RV32IFD-LABEL: test_roundeven_ui64:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IFD-NEXT:    call roundeven@plt
; RV32IFD-NEXT:    fmv.d fs0, fa0
; RV32IFD-NEXT:    fcvt.d.w ft0, zero
; RV32IFD-NEXT:    fle.d a0, ft0, fa0
; RV32IFD-NEXT:    neg s0, a0
; RV32IFD-NEXT:    call __fixunsdfdi@plt
; RV32IFD-NEXT:    lui a2, %hi(.LCPI19_0)
; RV32IFD-NEXT:    fld ft0, %lo(.LCPI19_0)(a2)
; RV32IFD-NEXT:    and a0, s0, a0
; RV32IFD-NEXT:    flt.d a2, ft0, fs0
; RV32IFD-NEXT:    seqz a2, a2
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    or a0, a0, a2
; RV32IFD-NEXT:    and a1, s0, a1
; RV32IFD-NEXT:    or a1, a1, a2
; RV32IFD-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IFD-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
;
; RV64IFD-LABEL: test_roundeven_ui64:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa0
; RV64IFD-NEXT:    beqz a0, .LBB19_2
; RV64IFD-NEXT:  # %bb.1:
; RV64IFD-NEXT:    fcvt.lu.d a0, fa0, rne
; RV64IFD-NEXT:  .LBB19_2:
; RV64IFD-NEXT:    ret
  %a = call double @llvm.roundeven.f64(double %x)
  %b = call i64 @llvm.fptoui.sat.i64.f64(double %a)
  ret i64 %b
}

declare double @llvm.floor.f64(double)
declare double @llvm.ceil.f64(double)
declare double @llvm.trunc.f64(double)
declare double @llvm.round.f64(double)
declare double @llvm.roundeven.f64(double)
declare i32 @llvm.fptosi.sat.i32.f64(double)
declare i64 @llvm.fptosi.sat.i64.f64(double)
declare i32 @llvm.fptoui.sat.i32.f64(double)
declare i64 @llvm.fptoui.sat.i64.f64(double)
