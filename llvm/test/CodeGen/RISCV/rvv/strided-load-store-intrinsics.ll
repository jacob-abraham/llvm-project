; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=riscv64 -mattr=+m,+v | FileCheck %s

declare <32 x i8> @llvm.riscv.masked.strided.load.v32i8.p0.i64(<32 x i8>, ptr, i64, <32 x i1>)
declare <2 x i64> @llvm.riscv.masked.strided.load.v2i64.p0.i64(<2 x i64>, ptr, i64, <2 x i1>)

declare void @llvm.riscv.masked.strided.store.v32i8.p0.i64(<32 x i8>, ptr, i64, <32 x i1>)
declare void @llvm.riscv.masked.strided.store.v2i64.p0.i64(<2 x i64>, ptr, i64, <2 x i1>)

define <32 x i8> @strided_load_i8(ptr %p, i64 %stride, <32 x i1> %m) {
; CHECK-LABEL: strided_load_i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a2, 32
; CHECK-NEXT:    vsetvli zero, a2, e8, m2, ta, mu
; CHECK-NEXT:    vlse8.v v8, (a0), a1, v0.t
; CHECK-NEXT:    ret
  %res = call <32 x i8> @llvm.riscv.masked.strided.load.v32i8.p0.i64(<32 x i8> undef, ptr %p, i64 %stride, <32 x i1> %m)
  ret <32 x i8> %res
}

define <2 x i64> @strided_load_i64(ptr %p, i64 %stride, <2 x i1> %m) {
; CHECK-LABEL: strided_load_i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v8, (a0), a1, v0.t
; CHECK-NEXT:    ret
  %res = call <2 x i64> @llvm.riscv.masked.strided.load.v2i64.p0.i64(<2 x i64> undef, ptr %p, i64 %stride, <2 x i1> %m)
  ret <2 x i64> %res
}

define <32 x i8> @strided_load_i8_splat(ptr %p, <32 x i1> %m) {
; CHECK-LABEL: strided_load_i8_splat:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a1, 32
; CHECK-NEXT:    vsetvli zero, a1, e8, m2, ta, mu
; CHECK-NEXT:    vlse8.v v8, (a0), zero, v0.t
; CHECK-NEXT:    ret
  %res = call <32 x i8> @llvm.riscv.masked.strided.load.v32i8.p0.i64(<32 x i8> undef, ptr %p, i64 0, <32 x i1> %m)
  ret <32 x i8> %res
}

define <32 x i8> @strided_load_i8_reverse(ptr %p, <32 x i1> %m) {
; CHECK-LABEL: strided_load_i8_reverse:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a1, 32
; CHECK-NEXT:    li a2, -1
; CHECK-NEXT:    vsetvli zero, a1, e8, m2, ta, mu
; CHECK-NEXT:    vlse8.v v8, (a0), a2, v0.t
; CHECK-NEXT:    ret
  %res = call <32 x i8> @llvm.riscv.masked.strided.load.v32i8.p0.i64(<32 x i8> undef, ptr %p, i64 -1, <32 x i1> %m)
  ret <32 x i8> %res
}

define <32 x i8> @strided_load_i8_nostride(ptr %p, <32 x i1> %m) {
; CHECK-LABEL: strided_load_i8_nostride:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a1, 32
; CHECK-NEXT:    li a2, 1
; CHECK-NEXT:    vsetvli zero, a1, e8, m2, ta, mu
; CHECK-NEXT:    vlse8.v v8, (a0), a2, v0.t
; CHECK-NEXT:    ret
  %res = call <32 x i8> @llvm.riscv.masked.strided.load.v32i8.p0.i64(<32 x i8> undef, ptr %p, i64 1, <32 x i1> %m)
  ret <32 x i8> %res
}


define void @strided_store_i8(ptr %p, <32 x i8> %v, i64 %stride, <32 x i1> %m) {
; CHECK-LABEL: strided_store_i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a2, 32
; CHECK-NEXT:    vsetvli zero, a2, e8, m2, ta, ma
; CHECK-NEXT:    vsse8.v v8, (a0), a1, v0.t
; CHECK-NEXT:    ret
  call void @llvm.riscv.masked.strided.store.v32i8.p0.i64(<32 x i8> %v, ptr %p, i64 %stride, <32 x i1> %m)
  ret void
}

define void @strided_store_i8_zero(ptr %p, <32 x i8> %v, <32 x i1> %m) {
; CHECK-LABEL: strided_store_i8_zero:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a1, 32
; CHECK-NEXT:    vsetvli zero, a1, e8, m2, ta, ma
; CHECK-NEXT:    vsse8.v v8, (a0), zero, v0.t
; CHECK-NEXT:    ret
  call void @llvm.riscv.masked.strided.store.v32i8.p0.i64(<32 x i8> %v, ptr %p, i64 0, <32 x i1> %m)
  ret void
}

define void @strided_store_i8_nostride(ptr %p, <32 x i8> %v, <32 x i1> %m) {
; CHECK-LABEL: strided_store_i8_nostride:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a1, 32
; CHECK-NEXT:    li a2, 1
; CHECK-NEXT:    vsetvli zero, a1, e8, m2, ta, ma
; CHECK-NEXT:    vsse8.v v8, (a0), a2, v0.t
; CHECK-NEXT:    ret
  call void @llvm.riscv.masked.strided.store.v32i8.p0.i64(<32 x i8> %v, ptr %p, i64 1, <32 x i1> %m)
  ret void
}

define void @strided_store_i8_reverse(ptr %p, <32 x i8> %v, <32 x i1> %m) {
; CHECK-LABEL: strided_store_i8_reverse:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a1, 32
; CHECK-NEXT:    li a2, -1
; CHECK-NEXT:    vsetvli zero, a1, e8, m2, ta, ma
; CHECK-NEXT:    vsse8.v v8, (a0), a2, v0.t
; CHECK-NEXT:    ret
  call void @llvm.riscv.masked.strided.store.v32i8.p0.i64(<32 x i8> %v, ptr %p, i64 -1, <32 x i1> %m)
  ret void
}

declare void @llvm.riscv.masked.strided.store.nxv1i64.p0.i64(<vscale x 1 x i64>, ptr, i64, <vscale x 1 x i1>)

declare <vscale x 1 x i64> @llvm.riscv.masked.strided.load.nxv1i64.p0.i64(<vscale x 1 x i64>, ptr, i64, <vscale x 1 x i1>)

define <vscale x 1 x i64> @strided_load_vscale_i64(ptr %p, i64 %stride, <vscale x 1 x i1> %m) {
; CHECK-LABEL: strided_load_vscale_i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a2, zero, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v8, (a0), a1, v0.t
; CHECK-NEXT:    ret
  %res = call <vscale x 1 x i64> @llvm.riscv.masked.strided.load.nxv1i64.p0.i64(<vscale x 1 x i64> undef, ptr %p, i64 %stride, <vscale x 1 x i1> %m)
  ret <vscale x 1 x i64> %res
}

define void @strided_store_vscale_i64(ptr %p, <vscale x 1 x i64> %v, i64 %stride, <vscale x 1 x i1> %m) {
; CHECK-LABEL: strided_store_vscale_i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a2, zero, e64, m1, ta, ma
; CHECK-NEXT:    vsse64.v v8, (a0), a1, v0.t
; CHECK-NEXT:    ret
  call void @llvm.riscv.masked.strided.store.nxv1i64.p0.i64(<vscale x 1 x i64> %v, ptr %p, i64 %stride, <vscale x 1 x i1> %m)
  ret void
}
