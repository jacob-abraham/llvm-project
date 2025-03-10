; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+m,+d,+zfh,+experimental-zvfh,+v -target-abi=ilp32d -riscv-v-vector-bits-min=128 \
; RUN:   -verify-machineinstrs < %s | FileCheck %s
; RUN: llc -mtriple=riscv64 -mattr=+m,+d,+zfh,+experimental-zvfh,+v -target-abi=lp64d -riscv-v-vector-bits-min=128 \
; RUN:   -verify-machineinstrs < %s | FileCheck %s

declare <2 x half> @llvm.vp.copysign.v2f16(<2 x half>, <2 x half>, <2 x i1>, i32)

define <2 x half> @vfsgnj_vv_v2f16(<2 x half> %va, <2 x half> %vb, <2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9, v0.t
; CHECK-NEXT:    ret
  %v = call <2 x half> @llvm.vp.copysign.v2f16(<2 x half> %va, <2 x half> %vb, <2 x i1> %m, i32 %evl)
  ret <2 x half> %v
}

define <2 x half> @vfsgnj_vv_v2f16_unmasked(<2 x half> %va, <2 x half> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v2f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9
; CHECK-NEXT:    ret
  %head = insertelement <2 x i1> poison, i1 true, i32 0
  %m = shufflevector <2 x i1> %head, <2 x i1> poison, <2 x i32> zeroinitializer
  %v = call <2 x half> @llvm.vp.copysign.v2f16(<2 x half> %va, <2 x half> %vb, <2 x i1> %m, i32 %evl)
  ret <2 x half> %v
}

declare <4 x half> @llvm.vp.copysign.v4f16(<4 x half>, <4 x half>, <4 x i1>, i32)

define <4 x half> @vfsgnj_vv_v4f16(<4 x half> %va, <4 x half> %vb, <4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9, v0.t
; CHECK-NEXT:    ret
  %v = call <4 x half> @llvm.vp.copysign.v4f16(<4 x half> %va, <4 x half> %vb, <4 x i1> %m, i32 %evl)
  ret <4 x half> %v
}

define <4 x half> @vfsgnj_vv_v4f16_unmasked(<4 x half> %va, <4 x half> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v4f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9
; CHECK-NEXT:    ret
  %head = insertelement <4 x i1> poison, i1 true, i32 0
  %m = shufflevector <4 x i1> %head, <4 x i1> poison, <4 x i32> zeroinitializer
  %v = call <4 x half> @llvm.vp.copysign.v4f16(<4 x half> %va, <4 x half> %vb, <4 x i1> %m, i32 %evl)
  ret <4 x half> %v
}

declare <8 x half> @llvm.vp.copysign.v8f16(<8 x half>, <8 x half>, <8 x i1>, i32)

define <8 x half> @vfsgnj_vv_v8f16(<8 x half> %va, <8 x half> %vb, <8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v8f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9, v0.t
; CHECK-NEXT:    ret
  %v = call <8 x half> @llvm.vp.copysign.v8f16(<8 x half> %va, <8 x half> %vb, <8 x i1> %m, i32 %evl)
  ret <8 x half> %v
}

define <8 x half> @vfsgnj_vv_v8f16_unmasked(<8 x half> %va, <8 x half> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v8f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9
; CHECK-NEXT:    ret
  %head = insertelement <8 x i1> poison, i1 true, i32 0
  %m = shufflevector <8 x i1> %head, <8 x i1> poison, <8 x i32> zeroinitializer
  %v = call <8 x half> @llvm.vp.copysign.v8f16(<8 x half> %va, <8 x half> %vb, <8 x i1> %m, i32 %evl)
  ret <8 x half> %v
}

declare <16 x half> @llvm.vp.copysign.v16f16(<16 x half>, <16 x half>, <16 x i1>, i32)

define <16 x half> @vfsgnj_vv_v16f16(<16 x half> %va, <16 x half> %vb, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v16f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v10, v0.t
; CHECK-NEXT:    ret
  %v = call <16 x half> @llvm.vp.copysign.v16f16(<16 x half> %va, <16 x half> %vb, <16 x i1> %m, i32 %evl)
  ret <16 x half> %v
}

define <16 x half> @vfsgnj_vv_v16f16_unmasked(<16 x half> %va, <16 x half> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v16f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v10
; CHECK-NEXT:    ret
  %head = insertelement <16 x i1> poison, i1 true, i32 0
  %m = shufflevector <16 x i1> %head, <16 x i1> poison, <16 x i32> zeroinitializer
  %v = call <16 x half> @llvm.vp.copysign.v16f16(<16 x half> %va, <16 x half> %vb, <16 x i1> %m, i32 %evl)
  ret <16 x half> %v
}

declare <2 x float> @llvm.vp.copysign.v2f32(<2 x float>, <2 x float>, <2 x i1>, i32)

define <2 x float> @vfsgnj_vv_v2f32(<2 x float> %va, <2 x float> %vb, <2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9, v0.t
; CHECK-NEXT:    ret
  %v = call <2 x float> @llvm.vp.copysign.v2f32(<2 x float> %va, <2 x float> %vb, <2 x i1> %m, i32 %evl)
  ret <2 x float> %v
}

define <2 x float> @vfsgnj_vv_v2f32_unmasked(<2 x float> %va, <2 x float> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v2f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9
; CHECK-NEXT:    ret
  %head = insertelement <2 x i1> poison, i1 true, i32 0
  %m = shufflevector <2 x i1> %head, <2 x i1> poison, <2 x i32> zeroinitializer
  %v = call <2 x float> @llvm.vp.copysign.v2f32(<2 x float> %va, <2 x float> %vb, <2 x i1> %m, i32 %evl)
  ret <2 x float> %v
}

declare <4 x float> @llvm.vp.copysign.v4f32(<4 x float>, <4 x float>, <4 x i1>, i32)

define <4 x float> @vfsgnj_vv_v4f32(<4 x float> %va, <4 x float> %vb, <4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9, v0.t
; CHECK-NEXT:    ret
  %v = call <4 x float> @llvm.vp.copysign.v4f32(<4 x float> %va, <4 x float> %vb, <4 x i1> %m, i32 %evl)
  ret <4 x float> %v
}

define <4 x float> @vfsgnj_vv_v4f32_unmasked(<4 x float> %va, <4 x float> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v4f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9
; CHECK-NEXT:    ret
  %head = insertelement <4 x i1> poison, i1 true, i32 0
  %m = shufflevector <4 x i1> %head, <4 x i1> poison, <4 x i32> zeroinitializer
  %v = call <4 x float> @llvm.vp.copysign.v4f32(<4 x float> %va, <4 x float> %vb, <4 x i1> %m, i32 %evl)
  ret <4 x float> %v
}

declare <8 x float> @llvm.vp.copysign.v8f32(<8 x float>, <8 x float>, <8 x i1>, i32)

define <8 x float> @vfsgnj_vv_v8f32(<8 x float> %va, <8 x float> %vb, <8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v10, v0.t
; CHECK-NEXT:    ret
  %v = call <8 x float> @llvm.vp.copysign.v8f32(<8 x float> %va, <8 x float> %vb, <8 x i1> %m, i32 %evl)
  ret <8 x float> %v
}

define <8 x float> @vfsgnj_vv_v8f32_unmasked(<8 x float> %va, <8 x float> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v8f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v10
; CHECK-NEXT:    ret
  %head = insertelement <8 x i1> poison, i1 true, i32 0
  %m = shufflevector <8 x i1> %head, <8 x i1> poison, <8 x i32> zeroinitializer
  %v = call <8 x float> @llvm.vp.copysign.v8f32(<8 x float> %va, <8 x float> %vb, <8 x i1> %m, i32 %evl)
  ret <8 x float> %v
}

declare <16 x float> @llvm.vp.copysign.v16f32(<16 x float>, <16 x float>, <16 x i1>, i32)

define <16 x float> @vfsgnj_vv_v16f32(<16 x float> %va, <16 x float> %vb, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v16f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v12, v0.t
; CHECK-NEXT:    ret
  %v = call <16 x float> @llvm.vp.copysign.v16f32(<16 x float> %va, <16 x float> %vb, <16 x i1> %m, i32 %evl)
  ret <16 x float> %v
}

define <16 x float> @vfsgnj_vv_v16f32_unmasked(<16 x float> %va, <16 x float> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v16f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v12
; CHECK-NEXT:    ret
  %head = insertelement <16 x i1> poison, i1 true, i32 0
  %m = shufflevector <16 x i1> %head, <16 x i1> poison, <16 x i32> zeroinitializer
  %v = call <16 x float> @llvm.vp.copysign.v16f32(<16 x float> %va, <16 x float> %vb, <16 x i1> %m, i32 %evl)
  ret <16 x float> %v
}

declare <2 x double> @llvm.vp.copysign.v2f64(<2 x double>, <2 x double>, <2 x i1>, i32)

define <2 x double> @vfsgnj_vv_v2f64(<2 x double> %va, <2 x double> %vb, <2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9, v0.t
; CHECK-NEXT:    ret
  %v = call <2 x double> @llvm.vp.copysign.v2f64(<2 x double> %va, <2 x double> %vb, <2 x i1> %m, i32 %evl)
  ret <2 x double> %v
}

define <2 x double> @vfsgnj_vv_v2f64_unmasked(<2 x double> %va, <2 x double> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v2f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v9
; CHECK-NEXT:    ret
  %head = insertelement <2 x i1> poison, i1 true, i32 0
  %m = shufflevector <2 x i1> %head, <2 x i1> poison, <2 x i32> zeroinitializer
  %v = call <2 x double> @llvm.vp.copysign.v2f64(<2 x double> %va, <2 x double> %vb, <2 x i1> %m, i32 %evl)
  ret <2 x double> %v
}

declare <4 x double> @llvm.vp.copysign.v4f64(<4 x double>, <4 x double>, <4 x i1>, i32)

define <4 x double> @vfsgnj_vv_v4f64(<4 x double> %va, <4 x double> %vb, <4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v10, v0.t
; CHECK-NEXT:    ret
  %v = call <4 x double> @llvm.vp.copysign.v4f64(<4 x double> %va, <4 x double> %vb, <4 x i1> %m, i32 %evl)
  ret <4 x double> %v
}

define <4 x double> @vfsgnj_vv_v4f64_unmasked(<4 x double> %va, <4 x double> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v4f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v10
; CHECK-NEXT:    ret
  %head = insertelement <4 x i1> poison, i1 true, i32 0
  %m = shufflevector <4 x i1> %head, <4 x i1> poison, <4 x i32> zeroinitializer
  %v = call <4 x double> @llvm.vp.copysign.v4f64(<4 x double> %va, <4 x double> %vb, <4 x i1> %m, i32 %evl)
  ret <4 x double> %v
}

declare <8 x double> @llvm.vp.copysign.v8f64(<8 x double>, <8 x double>, <8 x i1>, i32)

define <8 x double> @vfsgnj_vv_v8f64(<8 x double> %va, <8 x double> %vb, <8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v8f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v12, v0.t
; CHECK-NEXT:    ret
  %v = call <8 x double> @llvm.vp.copysign.v8f64(<8 x double> %va, <8 x double> %vb, <8 x i1> %m, i32 %evl)
  ret <8 x double> %v
}

define <8 x double> @vfsgnj_vv_v8f64_unmasked(<8 x double> %va, <8 x double> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v8f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v12
; CHECK-NEXT:    ret
  %head = insertelement <8 x i1> poison, i1 true, i32 0
  %m = shufflevector <8 x i1> %head, <8 x i1> poison, <8 x i32> zeroinitializer
  %v = call <8 x double> @llvm.vp.copysign.v8f64(<8 x double> %va, <8 x double> %vb, <8 x i1> %m, i32 %evl)
  ret <8 x double> %v
}

declare <15 x double> @llvm.vp.copysign.v15f64(<15 x double>, <15 x double>, <15 x i1>, i32)

define <15 x double> @vfsgnj_vv_v15f64(<15 x double> %va, <15 x double> %vb, <15 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v15f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v16, v0.t
; CHECK-NEXT:    ret
  %v = call <15 x double> @llvm.vp.copysign.v15f64(<15 x double> %va, <15 x double> %vb, <15 x i1> %m, i32 %evl)
  ret <15 x double> %v
}

define <15 x double> @vfsgnj_vv_v15f64_unmasked(<15 x double> %va, <15 x double> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v15f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v16
; CHECK-NEXT:    ret
  %head = insertelement <15 x i1> poison, i1 true, i32 0
  %m = shufflevector <15 x i1> %head, <15 x i1> poison, <15 x i32> zeroinitializer
  %v = call <15 x double> @llvm.vp.copysign.v15f64(<15 x double> %va, <15 x double> %vb, <15 x i1> %m, i32 %evl)
  ret <15 x double> %v
}

declare <16 x double> @llvm.vp.copysign.v16f64(<16 x double>, <16 x double>, <16 x i1>, i32)

define <16 x double> @vfsgnj_vv_v16f64(<16 x double> %va, <16 x double> %vb, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v16f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, mu
; CHECK-NEXT:    vfsgnj.vv v8, v8, v16, v0.t
; CHECK-NEXT:    ret
  %v = call <16 x double> @llvm.vp.copysign.v16f64(<16 x double> %va, <16 x double> %vb, <16 x i1> %m, i32 %evl)
  ret <16 x double> %v
}

define <16 x double> @vfsgnj_vv_v16f64_unmasked(<16 x double> %va, <16 x double> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v16f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v16
; CHECK-NEXT:    ret
  %head = insertelement <16 x i1> poison, i1 true, i32 0
  %m = shufflevector <16 x i1> %head, <16 x i1> poison, <16 x i32> zeroinitializer
  %v = call <16 x double> @llvm.vp.copysign.v16f64(<16 x double> %va, <16 x double> %vb, <16 x i1> %m, i32 %evl)
  ret <16 x double> %v
}

declare <32 x double> @llvm.vp.copysign.v32f64(<32 x double>, <32 x double>, <32 x i1>, i32)

define <32 x double> @vfsgnj_vv_v32f64(<32 x double> %va, <32 x double> %vb, <32 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v32f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    li a3, 24
; CHECK-NEXT:    mul a1, a1, a3
; CHECK-NEXT:    sub sp, sp, a1
; CHECK-NEXT:    vmv1r.v v1, v0
; CHECK-NEXT:    vsetivli zero, 2, e8, mf4, ta, ma
; CHECK-NEXT:    vslidedown.vi v0, v0, 2
; CHECK-NEXT:    addi a1, a0, 128
; CHECK-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; CHECK-NEXT:    vle64.v v24, (a1)
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    slli a1, a1, 3
; CHECK-NEXT:    add a1, sp, a1
; CHECK-NEXT:    addi a1, a1, 16
; CHECK-NEXT:    vs8r.v v24, (a1) # Unknown-size Folded Spill
; CHECK-NEXT:    addi a3, a2, -16
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    slli a1, a1, 4
; CHECK-NEXT:    add a1, sp, a1
; CHECK-NEXT:    addi a1, a1, 16
; CHECK-NEXT:    vs8r.v v8, (a1) # Unknown-size Folded Spill
; CHECK-NEXT:    li a1, 0
; CHECK-NEXT:    bltu a2, a3, .LBB26_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    mv a1, a3
; CHECK-NEXT:  .LBB26_2:
; CHECK-NEXT:    vle64.v v8, (a0)
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; CHECK-NEXT:    vsetvli zero, a1, e64, m8, ta, mu
; CHECK-NEXT:    li a0, 16
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    slli a1, a1, 3
; CHECK-NEXT:    add a1, sp, a1
; CHECK-NEXT:    addi a1, a1, 16
; CHECK-NEXT:    vl8re8.v v8, (a1) # Unknown-size Folded Reload
; CHECK-NEXT:    vfsgnj.vv v16, v16, v8, v0.t
; CHECK-NEXT:    bltu a2, a0, .LBB26_4
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    li a2, 16
; CHECK-NEXT:  .LBB26_4:
; CHECK-NEXT:    vsetvli zero, a2, e64, m8, ta, mu
; CHECK-NEXT:    vmv1r.v v0, v1
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 4
; CHECK-NEXT:    add a0, sp, a0
; CHECK-NEXT:    addi a0, a0, 16
; CHECK-NEXT:    vl8re8.v v24, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vl8re8.v v8, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vfsgnj.vv v8, v24, v8, v0.t
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    li a1, 24
; CHECK-NEXT:    mul a0, a0, a1
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %v = call <32 x double> @llvm.vp.copysign.v32f64(<32 x double> %va, <32 x double> %vb, <32 x i1> %m, i32 %evl)
  ret <32 x double> %v
}

define <32 x double> @vfsgnj_vv_v32f64_unmasked(<32 x double> %va, <32 x double> %vb, i32 zeroext %evl) {
; CHECK-LABEL: vfsgnj_vv_v32f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, a0, 128
; CHECK-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; CHECK-NEXT:    vle64.v v24, (a1)
; CHECK-NEXT:    addi a3, a2, -16
; CHECK-NEXT:    li a1, 0
; CHECK-NEXT:    bltu a2, a3, .LBB27_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    mv a1, a3
; CHECK-NEXT:  .LBB27_2:
; CHECK-NEXT:    vle64.v v0, (a0)
; CHECK-NEXT:    vsetvli zero, a1, e64, m8, ta, ma
; CHECK-NEXT:    li a0, 16
; CHECK-NEXT:    vfsgnj.vv v16, v16, v24
; CHECK-NEXT:    bltu a2, a0, .LBB27_4
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    li a2, 16
; CHECK-NEXT:  .LBB27_4:
; CHECK-NEXT:    vsetvli zero, a2, e64, m8, ta, ma
; CHECK-NEXT:    vfsgnj.vv v8, v8, v0
; CHECK-NEXT:    ret
  %head = insertelement <32 x i1> poison, i1 true, i32 0
  %m = shufflevector <32 x i1> %head, <32 x i1> poison, <32 x i32> zeroinitializer
  %v = call <32 x double> @llvm.vp.copysign.v32f64(<32 x double> %va, <32 x double> %vb, <32 x i1> %m, i32 %evl)
  ret <32 x double> %v
}
