; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -basic-aa -dse -S | FileCheck %s

target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
declare void @unknown_func()
declare void @llvm.memcpy.p0.p0.i64(ptr nocapture, ptr nocapture, i64, i1) nounwind
declare void @llvm.memset.p0.i64(ptr nocapture, i8, i64, i32, i1) nounwind

; Tests where the pointer/object is accessible after the function returns.

; Overwriting store along one path to the exit.
define void @accessible_after_return_1(ptr noalias %P, i1 %c) {
; CHECK-LABEL: @accessible_after_return_1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[ARRAYIDX0:%.*]] = getelementptr inbounds i32, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    call void @llvm.memset.p0.i64(ptr align 4 [[ARRAYIDX0]], i8 0, i64 28, i1 false)
; CHECK-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds i32, ptr [[P]], i64 1
; CHECK-NEXT:    store i32 1, ptr [[ARRAYIDX1]], align 4
; CHECK-NEXT:    br label [[BB3]]
; CHECK:       bb3:
; CHECK-NEXT:    ret void
;
entry:
  %arrayidx0 = getelementptr inbounds i32, ptr %P, i64 1
  call void @llvm.memset.p0.i64(ptr %arrayidx0, i8 0, i64 28, i32 4, i1 false)
  br i1 %c, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  %arrayidx1 = getelementptr inbounds i32, ptr %P, i64 1
  store i32 1, ptr %arrayidx1, align 4
  br label %bb3

bb3:
  ret void
}

; Post-dominating store.
; TODO: The memset can be shortened.
define void @accessible_after_return_2(ptr noalias %P, i1 %c) {
; CHECK-LABEL: @accessible_after_return_2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[ARRAYIDX0:%.*]] = getelementptr inbounds i32, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    call void @llvm.memset.p0.i64(ptr align 4 [[ARRAYIDX0]], i8 0, i64 28, i1 false)
; CHECK-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds i32, ptr [[P]], i64 1
; CHECK-NEXT:    store i32 1, ptr [[ARRAYIDX1]], align 4
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds i32, ptr [[P]], i64 1
; CHECK-NEXT:    store i32 1, ptr [[ARRAYIDX2]], align 4
; CHECK-NEXT:    br label [[BB3]]
; CHECK:       bb3:
; CHECK-NEXT:    ret void
;
entry:
  %arrayidx0 = getelementptr inbounds i32, ptr %P, i64 1
  call void @llvm.memset.p0.i64(ptr %arrayidx0, i8 0, i64 28, i32 4, i1 false)
  br i1 %c, label %bb1, label %bb2

bb1:
  %arrayidx1 = getelementptr inbounds i32, ptr %P, i64 1
  store i32 1, ptr %arrayidx1, align 4
  br label %bb3

bb2:
  %arrayidx2 = getelementptr inbounds i32, ptr %P, i64 1
  store i32 1, ptr %arrayidx2, align 4
  br label %bb3

bb3:
  ret void
}

; Stores along  both exit paths.
define void @accessible_after_return_3(ptr noalias %P, i1 %c) {
; CHECK-LABEL: @accessible_after_return_3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[ARRAYIDX0:%.*]] = getelementptr inbounds i32, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[TMP0:%.*]] = getelementptr inbounds i8, ptr [[ARRAYIDX0]], i64 4
; CHECK-NEXT:    call void @llvm.memset.p0.i64(ptr align 4 [[TMP0]], i8 0, i64 24, i1 false)
; CHECK-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    br label [[BB3]]
; CHECK:       bb3:
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds i32, ptr [[P]], i64 1
; CHECK-NEXT:    store i32 1, ptr [[ARRAYIDX1]], align 4
; CHECK-NEXT:    ret void
;
entry:
  %arrayidx0 = getelementptr inbounds i32, ptr %P, i64 1
  call void @llvm.memset.p0.i64(ptr %arrayidx0, i8 0, i64 28, i32 4, i1 false)
  br i1 %c, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %arrayidx1 = getelementptr inbounds i32, ptr %P, i64 1
  store i32 1, ptr %arrayidx1, align 4
  ret void
}


declare void @readonly_use(ptr nocapture) readonly

; Tests where the pointer/object is *NOT* accessible after the function returns.

; Overwriting store along one path to the exit.
define void @alloca_1(i1 %c) {
; CHECK-LABEL: @alloca_1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[P_ALLOCA:%.*]] = alloca [32 x i32], align 4
; CHECK-NEXT:    [[ARRAYIDX0:%.*]] = getelementptr inbounds i32, ptr [[P_ALLOCA]], i64 1
; CHECK-NEXT:    call void @llvm.memset.p0.i64(ptr align 4 [[ARRAYIDX0]], i8 0, i64 28, i1 false)
; CHECK-NEXT:    call void @readonly_use(ptr [[P_ALLOCA]])
; CHECK-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    br label [[BB3]]
; CHECK:       bb3:
; CHECK-NEXT:    ret void
;
entry:
  %P.alloca = alloca [32 x i32]
  %arrayidx0 = getelementptr inbounds i32, ptr %P.alloca, i64 1
  call void @llvm.memset.p0.i64(ptr %arrayidx0, i8 0, i64 28, i32 4, i1 false)
  call void @readonly_use(ptr %P.alloca)
  br i1 %c, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  %arrayidx1 = getelementptr inbounds i32, ptr %P.alloca, i64 1
  store i32 1, ptr %arrayidx1, align 4
  br label %bb3

bb3:
  ret void
}

; Post-dominating store.
define void @alloca_2(i1 %c) {
; CHECK-LABEL: @alloca_2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[P_ALLOCA:%.*]] = alloca [32 x i32], align 4
; CHECK-NEXT:    [[ARRAYIDX0:%.*]] = getelementptr inbounds i32, ptr [[P_ALLOCA]], i64 1
; CHECK-NEXT:    call void @llvm.memset.p0.i64(ptr align 4 [[ARRAYIDX0]], i8 0, i64 28, i1 false)
; CHECK-NEXT:    call void @readonly_use(ptr [[P_ALLOCA]])
; CHECK-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    br label [[BB3]]
; CHECK:       bb3:
; CHECK-NEXT:    ret void
;
entry:
  %P.alloca = alloca [32 x i32]
  %arrayidx0 = getelementptr inbounds i32, ptr %P.alloca, i64 1
  call void @llvm.memset.p0.i64(ptr %arrayidx0, i8 0, i64 28, i32 4, i1 false)
  call void @readonly_use(ptr %P.alloca)
  br i1 %c, label %bb1, label %bb2

bb1:
  %arrayidx1 = getelementptr inbounds i32, ptr %P.alloca, i64 1
  store i32 1, ptr %arrayidx1, align 4
  br label %bb3

bb2:
  %arrayidx2 = getelementptr inbounds i32, ptr %P.alloca, i64 1
  store i32 1, ptr %arrayidx2, align 4
  br label %bb3

bb3:
  ret void
}

; Stores along  both exit paths.
define void @alloca_3(i1 %c) {
; CHECK-LABEL: @alloca_3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[C:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    br label [[BB3]]
; CHECK:       bb3:
; CHECK-NEXT:    ret void
;
entry:
  %P.alloca = alloca [32 x i32]
  %arrayidx0 = getelementptr inbounds i32, ptr %P.alloca, i64 1
  call void @llvm.memset.p0.i64(ptr %arrayidx0, i8 0, i64 28, i32 4, i1 false)
  br i1 %c, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %arrayidx1 = getelementptr inbounds i32, ptr %P.alloca, i64 1
  store i32 1, ptr %arrayidx1, align 4
  ret void
}
