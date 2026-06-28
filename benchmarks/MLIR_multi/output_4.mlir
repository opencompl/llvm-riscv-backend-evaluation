module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.sdiv exact %arg0, %arg2 : i64
    %2 = llvm.sdiv exact %0, %1 : i64
    %3 = llvm.lshr %2, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or %arg1, %arg0 : i64
    %1 = llvm.shl %arg0, %0 : i64
    %2 = llvm.sdiv %arg2, %arg2 : i64
    %3 = llvm.shl %1, %2 overflow<nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg0, %arg1 overflow<nsw, nuw> : i64
    %1 = llvm.sdiv exact %arg2, %arg0 : i64
    %2 = llvm.ashr exact %1, %arg0 : i64
    %3 = llvm.srem %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.and %arg0, %arg1 : i64
    %2 = llvm.sdiv %0, %1 : i64
    %3 = llvm.shl %2, %arg1 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.add %arg1, %arg1 overflow<nsw> : i64
    %1 = llvm.shl %0, %0 overflow<nsw> : i64
    %2 = llvm.add %1, %1 overflow<nuw> : i64
    %3 = llvm.xor %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.lshr %arg2, %arg2 : i64
    %2 = llvm.add %0, %1 overflow<nsw, nuw> : i64
    %3 = llvm.udiv %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr exact %arg0, %arg0 : i64
    %1 = llvm.shl %arg2, %0 overflow<nsw> : i64
    %2 = llvm.lshr %arg1, %1 : i64
    %3 = llvm.lshr %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.add %arg0, %arg0 overflow<nuw> : i64
    %1 = llvm.sub %0, %arg0 overflow<nsw> : i64
    %2 = llvm.ashr %0, %1 : i64
    %3 = llvm.and %2, %arg1 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.sdiv %arg0, %arg0 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.ashr exact %1, %0 : i64
    %3 = llvm.sub %2, %arg1 overflow<nsw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg2 overflow<nuw> : i64
    %1 = llvm.lshr exact %arg2, %0 : i64
    %2 = llvm.add %arg1, %1 overflow<nsw> : i64
    %3 = llvm.sdiv %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    %1 = llvm.or %arg1, %0 : i64
    %2 = llvm.lshr exact %arg2, %1 : i64
    %3 = llvm.sub %0, %2 overflow<nsw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg0, %arg2 : i64
    %1 = llvm.xor %arg1, %0 : i64
    %2 = llvm.xor %arg0, %1 : i64
    %3 = llvm.udiv %2, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.or disjoint %2, %arg1 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.sub %arg1, %arg2 overflow<nsw> : i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.xor %2, %arg0 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.add %arg0, %arg0 : i64
    %2 = llvm.xor %1, %arg2 : i64
    %3 = llvm.ashr %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg1, %arg2 overflow<nsw, nuw> : i64
    %1 = llvm.srem %0, %arg2 : i64
    %2 = llvm.sub %arg0, %1 : i64
    %3 = llvm.add %arg0, %2 overflow<nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.shl %arg1, %arg2 overflow<nuw> : i64
    %2 = llvm.shl %1, %arg0 overflow<nuw> : i64
    %3 = llvm.or %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.shl %0, %arg1 overflow<nuw> : i64
    %2 = llvm.mul %arg1, %arg2 overflow<nuw> : i64
    %3 = llvm.urem %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.ashr exact %arg0, %0 : i64
    %2 = llvm.sub %1, %1 overflow<nuw> : i64
    %3 = llvm.ashr exact %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.lshr %arg0, %arg0 : i64
    %1 = llvm.xor %0, %arg0 : i64
    %2 = llvm.ashr exact %0, %1 : i64
    %3 = llvm.ashr %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 overflow<nsw> : i64
    %1 = llvm.and %arg1, %arg2 : i64
    %2 = llvm.sdiv %0, %1 : i64
    %3 = llvm.mul %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg1, %arg1 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.xor %arg2, %arg2 : i64
    %3 = llvm.mul %1, %2 overflow<nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg2, %arg0 overflow<nuw> : i64
    %1 = llvm.udiv %arg1, %0 : i64
    %2 = llvm.mul %arg1, %1 : i64
    %3 = llvm.add %arg0, %2 overflow<nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg1, %arg0 : i64
    %1 = llvm.xor %0, %arg2 : i64
    %2 = llvm.and %1, %arg0 : i64
    %3 = llvm.add %arg0, %2 overflow<nsw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg0 : i64
    %1 = llvm.and %arg0, %arg1 : i64
    %2 = llvm.xor %1, %arg1 : i64
    %3 = llvm.or %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 overflow<nuw> : i64
    %1 = llvm.xor %arg1, %arg1 : i64
    %2 = llvm.lshr exact %1, %arg2 : i64
    %3 = llvm.srem %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.ashr %0, %arg0 : i64
    %2 = llvm.xor %arg1, %arg2 : i64
    %3 = llvm.mul %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg1, %arg2 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.xor %arg2, %1 : i64
    %3 = llvm.udiv %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.udiv %arg2, %arg1 : i64
    %2 = llvm.add %arg2, %1 : i64
    %3 = llvm.xor %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg1, %arg0 : i64
    %1 = llvm.mul %arg0, %0 overflow<nuw> : i64
    %2 = llvm.ashr exact %1, %arg1 : i64
    %3 = llvm.and %2, %arg2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg1 : i64
    %1 = llvm.sdiv %0, %arg1 : i64
    %2 = llvm.sdiv %1, %1 : i64
    %3 = llvm.mul %0, %2 overflow<nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.srem %0, %arg1 : i64
    %2 = llvm.ashr exact %arg2, %arg2 : i64
    %3 = llvm.ashr %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr %arg0, %arg1 : i64
    %1 = llvm.sdiv %arg0, %0 : i64
    %2 = llvm.ashr %1, %0 : i64
    %3 = llvm.ashr exact %2, %arg2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg0, %arg1 overflow<nuw> : i64
    %1 = llvm.add %0, %0 overflow<nuw> : i64
    %2 = llvm.and %arg2, %1 : i64
    %3 = llvm.udiv %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg1 overflow<nsw, nuw> : i64
    %1 = llvm.lshr %arg2, %arg1 : i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.udiv %2, %0 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.urem %arg1, %arg2 : i64
    %2 = llvm.srem %0, %1 : i64
    %3 = llvm.udiv %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg2, %arg0 : i64
    %1 = llvm.xor %arg1, %0 : i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.shl %2, %1 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.sdiv exact %arg0, %arg1 : i64
    %3 = llvm.or %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.udiv %0, %arg2 : i64
    %2 = llvm.or disjoint %1, %arg2 : i64
    %3 = llvm.sub %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.lshr exact %arg1, %arg0 : i64
    %1 = llvm.sdiv %arg0, %0 : i64
    %2 = llvm.and %1, %1 : i64
    %3 = llvm.xor %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg1, %arg0 : i64
    %1 = llvm.urem %arg0, %0 : i64
    %2 = llvm.mul %arg2, %0 overflow<nuw> : i64
    %3 = llvm.srem %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.urem %arg1, %0 : i64
    %2 = llvm.srem %0, %1 : i64
    %3 = llvm.shl %0, %2 overflow<nsw, nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.urem %arg1, %arg2 : i64
    %2 = llvm.or %0, %1 : i64
    %3 = llvm.srem %2, %arg1 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.and %0, %0 : i64
    %2 = llvm.lshr exact %arg1, %1 : i64
    %3 = llvm.lshr exact %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    %1 = llvm.ashr %arg2, %arg0 : i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.sub %0, %2 overflow<nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    %1 = llvm.urem %arg2, %arg0 : i64
    %2 = llvm.and %0, %1 : i64
    %3 = llvm.xor %2, %arg1 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg1, %arg2 overflow<nsw, nuw> : i64
    %1 = llvm.shl %arg0, %0 overflow<nuw> : i64
    %2 = llvm.udiv %arg0, %1 : i64
    %3 = llvm.srem %2, %0 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.or %0, %arg2 : i64
    %2 = llvm.xor %1, %arg0 : i64
    %3 = llvm.lshr exact %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.add %arg0, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.shl %arg0, %arg1 overflow<nsw, nuw> : i64
    %2 = llvm.ashr exact %0, %1 : i64
    %3 = llvm.udiv %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.shl %arg0, %arg2 overflow<nsw> : i64
    %2 = llvm.add %0, %1 overflow<nsw> : i64
    %3 = llvm.and %2, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.add %arg1, %arg0 overflow<nuw> : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.and %1, %arg1 : i64
    %3 = llvm.and %2, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg1, %arg2 : i64
    %1 = llvm.urem %arg0, %0 : i64
    %2 = llvm.or disjoint %arg2, %arg2 : i64
    %3 = llvm.udiv %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.mul %arg0, %0 overflow<nsw> : i64
    %2 = llvm.lshr %1, %0 : i64
    %3 = llvm.urem %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.and %arg2, %arg2 : i64
    %2 = llvm.or %0, %1 : i64
    %3 = llvm.xor %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv %arg0, %arg1 : i64
    %1 = llvm.srem %0, %0 : i64
    %2 = llvm.and %1, %arg2 : i64
    %3 = llvm.lshr exact %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.mul %arg1, %arg2 overflow<nsw, nuw> : i64
    %2 = llvm.lshr %1, %0 : i64
    %3 = llvm.urem %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.urem %0, %arg2 : i64
    %2 = llvm.sdiv %arg1, %0 : i64
    %3 = llvm.xor %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.urem %arg1, %arg2 : i64
    %2 = llvm.and %arg2, %1 : i64
    %3 = llvm.add %0, %2 overflow<nsw, nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg1, %arg2 : i64
    %1 = llvm.add %0, %arg2 overflow<nuw> : i64
    %2 = llvm.srem %1, %arg1 : i64
    %3 = llvm.srem %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg2, %arg0 : i64
    %1 = llvm.srem %arg1, %0 : i64
    %2 = llvm.lshr %arg0, %1 : i64
    %3 = llvm.urem %2, %arg2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr exact %arg0, %arg0 : i64
    %1 = llvm.lshr %arg1, %arg2 : i64
    %2 = llvm.or %arg0, %1 : i64
    %3 = llvm.udiv %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr exact %arg0, %arg1 : i64
    %1 = llvm.sub %arg2, %arg0 overflow<nuw> : i64
    %2 = llvm.srem %arg0, %1 : i64
    %3 = llvm.or disjoint %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.udiv %0, %arg2 : i64
    %2 = llvm.shl %arg1, %arg2 overflow<nuw> : i64
    %3 = llvm.xor %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.mul %arg1, %arg2 overflow<nsw, nuw> : i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.srem %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg2 : i64
    %2 = llvm.lshr %arg0, %arg0 : i64
    %3 = llvm.urem %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.ashr %arg0, %arg0 : i64
    %1 = llvm.lshr %0, %arg1 : i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.mul %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg2, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.udiv %arg1, %0 : i64
    %2 = llvm.mul %arg0, %1 : i64
    %3 = llvm.add %2, %arg1 overflow<nsw, nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.shl %0, %0 overflow<nuw> : i64
    %2 = llvm.or disjoint %0, %1 : i64
    %3 = llvm.ashr %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg0, %arg0 overflow<nsw> : i64
    %1 = llvm.udiv %arg1, %arg2 : i64
    %2 = llvm.shl %1, %0 overflow<nsw> : i64
    %3 = llvm.xor %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.and %arg0, %arg2 : i64
    %2 = llvm.mul %arg1, %1 overflow<nsw> : i64
    %3 = llvm.xor %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg1 overflow<nsw, nuw> : i64
    %1 = llvm.udiv %0, %0 : i64
    %2 = llvm.and %arg1, %arg2 : i64
    %3 = llvm.sdiv exact %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg1, %arg2 : i64
    %1 = llvm.mul %0, %arg0 overflow<nsw> : i64
    %2 = llvm.sub %0, %1 : i64
    %3 = llvm.ashr %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg2, %arg1 : i64
    %1 = llvm.sdiv %arg1, %0 : i64
    %2 = llvm.and %1, %0 : i64
    %3 = llvm.srem %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.lshr %0, %arg1 : i64
    %2 = llvm.and %arg2, %0 : i64
    %3 = llvm.xor %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg1, %arg2 : i64
    %1 = llvm.sub %0, %arg1 : i64
    %2 = llvm.and %1, %0 : i64
    %3 = llvm.or %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg1, %arg1 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.shl %1, %arg2 overflow<nsw> : i64
    %3 = llvm.sdiv exact %2, %arg1 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.xor %arg1, %arg2 : i64
    %2 = llvm.shl %0, %1 overflow<nsw, nuw> : i64
    %3 = llvm.add %2, %0 overflow<nsw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.xor %arg1, %arg1 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.sdiv %arg0, %arg0 : i64
    %3 = llvm.lshr exact %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg1 overflow<nsw> : i64
    %1 = llvm.shl %0, %arg0 overflow<nsw> : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.and %2, %0 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.udiv %arg2, %arg1 : i64
    %2 = llvm.lshr exact %0, %1 : i64
    %3 = llvm.urem %2, %arg0 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg0, %arg0 overflow<nsw> : i64
    %1 = llvm.ashr %arg1, %0 : i64
    %2 = llvm.xor %1, %arg2 : i64
    %3 = llvm.and %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg1, %arg1 overflow<nsw, nuw> : i64
    %1 = llvm.srem %0, %arg0 : i64
    %2 = llvm.xor %1, %arg2 : i64
    %3 = llvm.sub %arg0, %2 overflow<nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg1, %arg0 : i64
    %1 = llvm.srem %0, %arg2 : i64
    %2 = llvm.shl %1, %arg2 : i64
    %3 = llvm.udiv %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg0, %arg0 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.and %arg1, %arg2 : i64
    %3 = llvm.and %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr exact %arg1, %arg2 : i64
    %1 = llvm.mul %arg0, %0 overflow<nsw, nuw> : i64
    %2 = llvm.and %arg2, %arg0 : i64
    %3 = llvm.shl %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.lshr %arg1, %arg2 : i64
    %3 = llvm.urem %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.urem %0, %arg0 : i64
    %2 = llvm.lshr %arg0, %arg1 : i64
    %3 = llvm.udiv %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.sub %arg1, %arg0 overflow<nsw> : i64
    %2 = llvm.shl %0, %1 overflow<nsw> : i64
    %3 = llvm.udiv %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.add %arg0, %arg0 overflow<nuw> : i64
    %1 = llvm.add %arg1, %arg1 overflow<nsw, nuw> : i64
    %2 = llvm.sub %1, %arg0 overflow<nsw> : i64
    %3 = llvm.and %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or disjoint %arg1, %arg2 : i64
    %1 = llvm.mul %0, %arg2 overflow<nuw> : i64
    %2 = llvm.and %1, %arg0 : i64
    %3 = llvm.and %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg1, %arg2 : i64
    %1 = llvm.and %0, %arg0 : i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.ashr %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr exact %arg0, %arg1 : i64
    %1 = llvm.sdiv exact %arg2, %0 : i64
    %2 = llvm.or disjoint %0, %1 : i64
    %3 = llvm.sdiv exact %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.udiv %0, %0 : i64
    %2 = llvm.sub %arg1, %arg2 : i64
    %3 = llvm.lshr exact %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.shl %0, %arg1 overflow<nsw, nuw> : i64
    %2 = llvm.mul %arg0, %1 overflow<nsw, nuw> : i64
    %3 = llvm.sub %2, %1 overflow<nsw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr exact %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg2 : i64
    %2 = llvm.sub %0, %arg0 overflow<nsw, nuw> : i64
    %3 = llvm.mul %1, %2 overflow<nsw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg2 : i64
    %2 = llvm.and %arg0, %arg0 : i64
    %3 = llvm.or %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.shl %arg0, %arg0 : i64
    %1 = llvm.sdiv %arg1, %arg1 : i64
    %2 = llvm.mul %0, %1 overflow<nuw> : i64
    %3 = llvm.ashr exact %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.srem %0, %arg0 : i64
    %2 = llvm.sdiv %1, %arg1 : i64
    %3 = llvm.srem %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.lshr %arg0, %arg1 : i64
    %2 = llvm.srem %1, %0 : i64
    %3 = llvm.sub %0, %2 overflow<nsw, nuw> : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.sdiv exact %arg0, %0 : i64
    %2 = llvm.sdiv %arg0, %1 : i64
    %3 = llvm.add %0, %2 overflow<nuw> : i64
    return %3 : i64
  }
}
// -----
