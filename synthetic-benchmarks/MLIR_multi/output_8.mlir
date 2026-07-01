module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg0 : i64
    %2 = llvm.sdiv %arg2, %arg0 : i64
    %3 = llvm.sub %arg0, %arg2 : i64
    %4 = llvm.mul %3, %arg1 overflow<nuw> : i64
    %5 = llvm.srem %2, %4 : i64
    %6 = llvm.shl %1, %5 : i64
    %7 = llvm.or disjoint %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg1, %arg2 : i64
    %1 = llvm.or disjoint %arg2, %arg0 : i64
    %2 = llvm.mul %0, %1 overflow<nsw, nuw> : i64
    %3 = llvm.mul %arg0, %2 overflow<nuw> : i64
    %4 = llvm.mul %arg0, %arg1 : i64
    %5 = llvm.or disjoint %4, %1 : i64
    %6 = llvm.urem %1, %5 : i64
    %7 = llvm.or disjoint %3, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg1 overflow<nsw, nuw> : i64
    %1 = llvm.sub %arg2, %arg0 overflow<nsw> : i64
    %2 = llvm.xor %1, %arg1 : i64
    %3 = llvm.sdiv exact %0, %1 : i64
    %4 = llvm.mul %arg1, %2 overflow<nsw> : i64
    %5 = llvm.ashr %3, %4 : i64
    %6 = llvm.ashr exact %2, %5 : i64
    %7 = llvm.urem %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.shl %arg0, %arg0 overflow<nsw> : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.lshr %1, %arg0 : i64
    %3 = llvm.xor %2, %arg1 : i64
    %4 = llvm.mul %3, %arg1 overflow<nsw> : i64
    %5 = llvm.sub %4, %0 overflow<nsw> : i64
    %6 = llvm.mul %arg0, %5 : i64
    %7 = llvm.mul %5, %6 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.xor %arg1, %0 : i64
    %2 = llvm.xor %0, %arg0 : i64
    %3 = llvm.urem %arg2, %2 : i64
    %4 = llvm.or %2, %3 : i64
    %5 = llvm.mul %4, %arg2 overflow<nsw> : i64
    %6 = llvm.mul %1, %5 overflow<nsw> : i64
    %7 = llvm.ashr exact %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv %arg1, %arg1 : i64
    %1 = llvm.or %0, %arg2 : i64
    %2 = llvm.sdiv exact %arg0, %1 : i64
    %3 = llvm.xor %2, %0 : i64
    %4 = llvm.srem %arg2, %3 : i64
    %5 = llvm.add %2, %4 overflow<nsw> : i64
    %6 = llvm.mul %1, %2 overflow<nuw> : i64
    %7 = llvm.ashr %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.or disjoint %arg0, %0 : i64
    %2 = llvm.urem %0, %arg2 : i64
    %3 = llvm.shl %2, %arg1 overflow<nuw> : i64
    %4 = llvm.and %3, %2 : i64
    %5 = llvm.urem %2, %1 : i64
    %6 = llvm.srem %4, %5 : i64
    %7 = llvm.xor %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg1, %arg2 : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.and %1, %arg1 : i64
    %3 = llvm.mul %arg1, %2 overflow<nsw, nuw> : i64
    %4 = llvm.shl %1, %3 : i64
    %5 = llvm.udiv %4, %2 : i64
    %6 = llvm.ashr exact %0, %arg2 : i64
    %7 = llvm.ashr %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.ashr %0, %arg2 : i64
    %2 = llvm.ashr exact %1, %arg0 : i64
    %3 = llvm.urem %1, %2 : i64
    %4 = llvm.udiv %2, %3 : i64
    %5 = llvm.or %1, %4 : i64
    %6 = llvm.lshr %5, %arg1 : i64
    %7 = llvm.lshr exact %6, %arg2 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.udiv %0, %arg1 : i64
    %2 = llvm.mul %arg2, %arg1 overflow<nsw, nuw> : i64
    %3 = llvm.add %2, %arg2 overflow<nsw, nuw> : i64
    %4 = llvm.shl %3, %3 overflow<nsw, nuw> : i64
    %5 = llvm.xor %1, %4 : i64
    %6 = llvm.xor %1, %5 : i64
    %7 = llvm.shl %6, %arg0 overflow<nsw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.or disjoint %arg1, %arg2 : i64
    %2 = llvm.sdiv %1, %arg0 : i64
    %3 = llvm.lshr %arg2, %2 : i64
    %4 = llvm.add %3, %arg1 : i64
    %5 = llvm.sdiv %0, %4 : i64
    %6 = llvm.or disjoint %2, %1 : i64
    %7 = llvm.sdiv %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.and %0, %arg1 : i64
    %2 = llvm.or disjoint %0, %1 : i64
    %3 = llvm.sub %0, %2 : i64
    %4 = llvm.add %1, %3 overflow<nsw> : i64
    %5 = llvm.ashr %0, %2 : i64
    %6 = llvm.lshr %0, %5 : i64
    %7 = llvm.xor %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.shl %arg1, %arg1 overflow<nuw> : i64
    %2 = llvm.urem %arg0, %arg1 : i64
    %3 = llvm.and %arg2, %2 : i64
    %4 = llvm.and %1, %3 : i64
    %5 = llvm.udiv %0, %4 : i64
    %6 = llvm.add %0, %0 overflow<nuw> : i64
    %7 = llvm.lshr exact %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 : i64
    %1 = llvm.xor %arg1, %arg2 : i64
    %2 = llvm.sdiv %0, %1 : i64
    %3 = llvm.xor %arg1, %arg2 : i64
    %4 = llvm.lshr %2, %3 : i64
    %5 = llvm.ashr %0, %4 : i64
    %6 = llvm.sdiv %2, %5 : i64
    %7 = llvm.ashr %6, %5 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.sub %arg1, %arg2 overflow<nsw, nuw> : i64
    %2 = llvm.xor %1, %0 : i64
    %3 = llvm.sdiv exact %0, %2 : i64
    %4 = llvm.srem %0, %3 : i64
    %5 = llvm.and %arg0, %arg1 : i64
    %6 = llvm.srem %4, %5 : i64
    %7 = llvm.sdiv exact %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg1 : i64
    %2 = llvm.add %arg2, %0 overflow<nuw> : i64
    %3 = llvm.add %arg2, %2 overflow<nsw, nuw> : i64
    %4 = llvm.ashr %2, %arg0 : i64
    %5 = llvm.or disjoint %4, %4 : i64
    %6 = llvm.udiv %3, %5 : i64
    %7 = llvm.sdiv %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv %arg0, %arg1 : i64
    %1 = llvm.lshr exact %arg0, %arg2 : i64
    %2 = llvm.and %0, %1 : i64
    %3 = llvm.sub %arg2, %2 overflow<nsw, nuw> : i64
    %4 = llvm.mul %arg1, %3 : i64
    %5 = llvm.add %4, %1 overflow<nuw> : i64
    %6 = llvm.ashr exact %2, %5 : i64
    %7 = llvm.udiv %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr exact %arg0, %arg1 : i64
    %1 = llvm.add %0, %arg2 : i64
    %2 = llvm.lshr %1, %arg1 : i64
    %3 = llvm.urem %arg2, %1 : i64
    %4 = llvm.shl %2, %3 overflow<nsw, nuw> : i64
    %5 = llvm.udiv %4, %arg0 : i64
    %6 = llvm.sub %1, %5 overflow<nsw> : i64
    %7 = llvm.sdiv exact %arg0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.urem %arg2, %arg0 : i64
    %2 = llvm.udiv %arg2, %arg1 : i64
    %3 = llvm.sub %2, %arg2 overflow<nsw> : i64
    %4 = llvm.sdiv exact %1, %3 : i64
    %5 = llvm.udiv %4, %arg0 : i64
    %6 = llvm.urem %0, %5 : i64
    %7 = llvm.or %6, %2 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg2, %arg2 overflow<nsw, nuw> : i64
    %1 = llvm.urem %0, %arg0 : i64
    %2 = llvm.shl %arg0, %1 overflow<nsw, nuw> : i64
    %3 = llvm.or disjoint %arg1, %2 : i64
    %4 = llvm.add %arg0, %3 overflow<nsw, nuw> : i64
    %5 = llvm.mul %arg2, %arg0 overflow<nuw> : i64
    %6 = llvm.srem %2, %5 : i64
    %7 = llvm.udiv %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg0, %arg0 : i64
    %1 = llvm.mul %arg0, %0 : i64
    %2 = llvm.ashr %arg2, %0 : i64
    %3 = llvm.ashr %arg1, %2 : i64
    %4 = llvm.udiv %1, %3 : i64
    %5 = llvm.sdiv exact %2, %arg1 : i64
    %6 = llvm.urem %4, %5 : i64
    %7 = llvm.shl %6, %arg2 overflow<nsw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg0, %arg0 : i64
    %1 = llvm.urem %0, %0 : i64
    %2 = llvm.mul %arg1, %arg2 overflow<nsw, nuw> : i64
    %3 = llvm.add %arg2, %arg1 overflow<nsw, nuw> : i64
    %4 = llvm.or disjoint %2, %3 : i64
    %5 = llvm.sub %1, %4 overflow<nuw> : i64
    %6 = llvm.xor %2, %5 : i64
    %7 = llvm.srem %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv %arg2, %arg0 : i64
    %1 = llvm.mul %0, %arg0 overflow<nsw, nuw> : i64
    %2 = llvm.udiv %arg1, %1 : i64
    %3 = llvm.shl %0, %1 overflow<nsw, nuw> : i64
    %4 = llvm.and %3, %2 : i64
    %5 = llvm.add %4, %2 : i64
    %6 = llvm.mul %2, %5 overflow<nuw> : i64
    %7 = llvm.mul %arg0, %6 overflow<nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg1 overflow<nsw> : i64
    %1 = llvm.sub %0, %arg2 overflow<nsw> : i64
    %2 = llvm.lshr exact %0, %1 : i64
    %3 = llvm.and %1, %2 : i64
    %4 = llvm.sdiv exact %2, %3 : i64
    %5 = llvm.ashr exact %arg0, %arg1 : i64
    %6 = llvm.lshr exact %4, %5 : i64
    %7 = llvm.sdiv %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg1, %arg2 : i64
    %1 = llvm.lshr exact %arg1, %arg0 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.udiv %1, %arg0 : i64
    %4 = llvm.urem %3, %0 : i64
    %5 = llvm.udiv %4, %arg0 : i64
    %6 = llvm.srem %2, %5 : i64
    %7 = llvm.mul %arg0, %6 overflow<nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr exact %arg0, %arg1 : i64
    %1 = llvm.or %arg2, %arg2 : i64
    %2 = llvm.sdiv exact %arg2, %1 : i64
    %3 = llvm.urem %2, %1 : i64
    %4 = llvm.shl %0, %3 overflow<nsw, nuw> : i64
    %5 = llvm.udiv %4, %arg1 : i64
    %6 = llvm.srem %0, %2 : i64
    %7 = llvm.ashr %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg0 : i64
    %1 = llvm.ashr exact %0, %0 : i64
    %2 = llvm.udiv %1, %1 : i64
    %3 = llvm.add %0, %2 : i64
    %4 = llvm.ashr %arg1, %arg1 : i64
    %5 = llvm.sdiv %arg2, %4 : i64
    %6 = llvm.lshr %4, %5 : i64
    %7 = llvm.ashr exact %3, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg0, %arg1 : i64
    %1 = llvm.sub %arg0, %0 overflow<nuw> : i64
    %2 = llvm.srem %1, %0 : i64
    %3 = llvm.sub %1, %arg2 overflow<nuw> : i64
    %4 = llvm.udiv %3, %arg2 : i64
    %5 = llvm.srem %1, %4 : i64
    %6 = llvm.xor %5, %arg0 : i64
    %7 = llvm.ashr exact %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or %arg0, %arg1 : i64
    %1 = llvm.add %arg1, %arg0 overflow<nuw> : i64
    %2 = llvm.sdiv exact %arg2, %1 : i64
    %3 = llvm.lshr exact %0, %2 : i64
    %4 = llvm.sub %1, %2 overflow<nsw> : i64
    %5 = llvm.shl %3, %4 overflow<nsw, nuw> : i64
    %6 = llvm.srem %5, %2 : i64
    %7 = llvm.mul %3, %6 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg0 : i64
    %1 = llvm.ashr exact %0, %arg0 : i64
    %2 = llvm.or %1, %arg1 : i64
    %3 = llvm.sub %0, %2 overflow<nuw> : i64
    %4 = llvm.urem %arg0, %3 : i64
    %5 = llvm.or %arg0, %arg1 : i64
    %6 = llvm.lshr %arg2, %5 : i64
    %7 = llvm.and %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    %1 = llvm.shl %0, %arg2 overflow<nsw, nuw> : i64
    %2 = llvm.srem %1, %arg2 : i64
    %3 = llvm.lshr %1, %2 : i64
    %4 = llvm.srem %arg0, %0 : i64
    %5 = llvm.and %1, %4 : i64
    %6 = llvm.sub %3, %5 overflow<nsw, nuw> : i64
    %7 = llvm.xor %6, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr %arg1, %arg0 : i64
    %1 = llvm.mul %arg0, %0 overflow<nuw> : i64
    %2 = llvm.lshr exact %arg2, %1 : i64
    %3 = llvm.lshr exact %1, %2 : i64
    %4 = llvm.lshr exact %3, %arg0 : i64
    %5 = llvm.and %3, %4 : i64
    %6 = llvm.and %1, %5 : i64
    %7 = llvm.add %3, %6 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.and %arg1, %arg1 : i64
    %2 = llvm.srem %1, %0 : i64
    %3 = llvm.add %2, %arg2 overflow<nsw, nuw> : i64
    %4 = llvm.ashr exact %0, %3 : i64
    %5 = llvm.lshr exact %arg1, %4 : i64
    %6 = llvm.urem %3, %5 : i64
    %7 = llvm.shl %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.sdiv exact %arg1, %arg0 : i64
    %2 = llvm.sdiv %arg1, %arg2 : i64
    %3 = llvm.xor %2, %2 : i64
    %4 = llvm.and %1, %3 : i64
    %5 = llvm.mul %arg2, %4 : i64
    %6 = llvm.xor %0, %5 : i64
    %7 = llvm.sdiv %6, %arg1 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.udiv %0, %arg1 : i64
    %2 = llvm.urem %arg0, %1 : i64
    %3 = llvm.mul %arg2, %arg1 overflow<nsw, nuw> : i64
    %4 = llvm.urem %3, %arg2 : i64
    %5 = llvm.mul %2, %4 overflow<nsw, nuw> : i64
    %6 = llvm.mul %4, %0 overflow<nsw, nuw> : i64
    %7 = llvm.or disjoint %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg1, %arg1 overflow<nsw, nuw> : i64
    %1 = llvm.sdiv exact %0, %arg2 : i64
    %2 = llvm.or disjoint %arg0, %0 : i64
    %3 = llvm.lshr exact %1, %2 : i64
    %4 = llvm.and %arg1, %3 : i64
    %5 = llvm.lshr exact %4, %0 : i64
    %6 = llvm.ashr exact %1, %5 : i64
    %7 = llvm.mul %arg0, %6 overflow<nsw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.mul %arg2, %arg1 overflow<nsw, nuw> : i64
    %2 = llvm.ashr %0, %1 : i64
    %3 = llvm.ashr exact %2, %2 : i64
    %4 = llvm.urem %arg0, %3 : i64
    %5 = llvm.xor %4, %1 : i64
    %6 = llvm.add %0, %arg1 overflow<nuw> : i64
    %7 = llvm.sub %5, %6 overflow<nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.shl %arg1, %arg0 overflow<nsw, nuw> : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.srem %arg2, %2 : i64
    %4 = llvm.udiv %2, %3 : i64
    %5 = llvm.or %arg1, %4 : i64
    %6 = llvm.sdiv exact %2, %5 : i64
    %7 = llvm.mul %6, %6 overflow<nsw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.mul %0, %arg1 : i64
    %2 = llvm.mul %arg0, %1 overflow<nuw> : i64
    %3 = llvm.urem %arg0, %2 : i64
    %4 = llvm.urem %1, %3 : i64
    %5 = llvm.srem %arg2, %arg2 : i64
    %6 = llvm.ashr %4, %5 : i64
    %7 = llvm.lshr exact %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg1, %arg2 : i64
    %1 = llvm.shl %arg0, %0 overflow<nsw, nuw> : i64
    %2 = llvm.udiv %arg1, %arg0 : i64
    %3 = llvm.sub %arg0, %2 overflow<nsw, nuw> : i64
    %4 = llvm.and %1, %3 : i64
    %5 = llvm.sub %3, %arg0 overflow<nsw, nuw> : i64
    %6 = llvm.mul %arg0, %5 overflow<nsw, nuw> : i64
    %7 = llvm.and %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg2, %arg2 overflow<nsw> : i64
    %1 = llvm.shl %arg2, %0 overflow<nsw, nuw> : i64
    %2 = llvm.or disjoint %1, %arg0 : i64
    %3 = llvm.mul %arg1, %2 : i64
    %4 = llvm.ashr %arg1, %arg0 : i64
    %5 = llvm.mul %1, %4 : i64
    %6 = llvm.mul %3, %5 overflow<nsw, nuw> : i64
    %7 = llvm.mul %arg0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg0 : i64
    %1 = llvm.urem %0, %arg0 : i64
    %2 = llvm.shl %0, %1 : i64
    %3 = llvm.sub %0, %2 overflow<nsw> : i64
    %4 = llvm.udiv %1, %3 : i64
    %5 = llvm.srem %4, %arg1 : i64
    %6 = llvm.sdiv %5, %arg2 : i64
    %7 = llvm.srem %6, %2 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg0, %arg1 overflow<nsw, nuw> : i64
    %1 = llvm.ashr %0, %arg2 : i64
    %2 = llvm.shl %arg2, %arg1 overflow<nuw> : i64
    %3 = llvm.sub %arg2, %arg1 overflow<nuw> : i64
    %4 = llvm.or disjoint %2, %3 : i64
    %5 = llvm.add %arg2, %4 : i64
    %6 = llvm.ashr %5, %0 : i64
    %7 = llvm.sdiv exact %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.ashr %arg1, %arg2 : i64
    %2 = llvm.and %arg2, %arg2 : i64
    %3 = llvm.add %1, %2 : i64
    %4 = llvm.ashr %0, %3 : i64
    %5 = llvm.xor %4, %arg0 : i64
    %6 = llvm.mul %4, %2 overflow<nuw> : i64
    %7 = llvm.sub %5, %6 overflow<nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg1, %arg2 overflow<nsw, nuw> : i64
    %1 = llvm.sdiv %0, %arg1 : i64
    %2 = llvm.sub %0, %arg2 : i64
    %3 = llvm.shl %2, %arg0 overflow<nsw> : i64
    %4 = llvm.shl %3, %1 overflow<nuw> : i64
    %5 = llvm.srem %1, %4 : i64
    %6 = llvm.lshr exact %5, %4 : i64
    %7 = llvm.udiv %arg0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.ashr exact %0, %arg1 : i64
    %2 = llvm.srem %1, %arg2 : i64
    %3 = llvm.urem %0, %arg2 : i64
    %4 = llvm.add %2, %3 overflow<nuw> : i64
    %5 = llvm.srem %arg2, %3 : i64
    %6 = llvm.add %4, %5 overflow<nuw> : i64
    %7 = llvm.udiv %arg0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg0, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.xor %arg1, %0 : i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.srem %arg1, %arg2 : i64
    %4 = llvm.lshr %2, %3 : i64
    %5 = llvm.shl %4, %arg1 overflow<nsw, nuw> : i64
    %6 = llvm.ashr %4, %5 : i64
    %7 = llvm.sdiv %arg0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.or %arg0, %0 : i64
    %2 = llvm.mul %1, %arg2 overflow<nsw, nuw> : i64
    %3 = llvm.xor %2, %2 : i64
    %4 = llvm.sdiv %3, %arg0 : i64
    %5 = llvm.xor %arg2, %4 : i64
    %6 = llvm.sdiv exact %5, %3 : i64
    %7 = llvm.mul %2, %6 overflow<nsw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 : i64
    %1 = llvm.urem %arg1, %arg2 : i64
    %2 = llvm.shl %1, %1 : i64
    %3 = llvm.add %0, %2 overflow<nsw> : i64
    %4 = llvm.and %3, %arg0 : i64
    %5 = llvm.shl %0, %4 overflow<nsw, nuw> : i64
    %6 = llvm.ashr %3, %5 : i64
    %7 = llvm.or disjoint %6, %3 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg1 overflow<nsw> : i64
    %1 = llvm.xor %arg2, %0 : i64
    %2 = llvm.and %0, %1 : i64
    %3 = llvm.or disjoint %arg2, %2 : i64
    %4 = llvm.udiv %arg1, %arg2 : i64
    %5 = llvm.xor %0, %4 : i64
    %6 = llvm.udiv %3, %5 : i64
    %7 = llvm.mul %0, %6 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg1, %arg0 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.and %arg2, %arg2 : i64
    %3 = llvm.sub %arg1, %0 overflow<nsw, nuw> : i64
    %4 = llvm.or %1, %0 : i64
    %5 = llvm.shl %3, %4 overflow<nuw> : i64
    %6 = llvm.sdiv %2, %5 : i64
    %7 = llvm.lshr exact %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg0, %arg1 : i64
    %1 = llvm.mul %0, %0 overflow<nsw, nuw> : i64
    %2 = llvm.or %0, %arg2 : i64
    %3 = llvm.lshr %1, %2 : i64
    %4 = llvm.ashr exact %arg1, %3 : i64
    %5 = llvm.ashr exact %arg1, %4 : i64
    %6 = llvm.udiv %arg0, %5 : i64
    %7 = llvm.urem %6, %arg0 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg1, %arg2 overflow<nsw, nuw> : i64
    %1 = llvm.ashr %0, %arg1 : i64
    %2 = llvm.ashr exact %arg2, %1 : i64
    %3 = llvm.add %2, %arg1 : i64
    %4 = llvm.srem %1, %3 : i64
    %5 = llvm.shl %2, %arg0 : i64
    %6 = llvm.sdiv %4, %5 : i64
    %7 = llvm.sdiv exact %arg0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.or %arg1, %arg2 : i64
    %2 = llvm.sub %0, %1 overflow<nuw> : i64
    %3 = llvm.shl %arg0, %arg0 overflow<nuw> : i64
    %4 = llvm.xor %2, %3 : i64
    %5 = llvm.urem %4, %4 : i64
    %6 = llvm.shl %1, %5 overflow<nuw> : i64
    %7 = llvm.srem %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or disjoint %arg0, %arg0 : i64
    %1 = llvm.mul %arg1, %arg0 overflow<nuw> : i64
    %2 = llvm.srem %arg1, %arg2 : i64
    %3 = llvm.ashr exact %1, %2 : i64
    %4 = llvm.sdiv %arg0, %3 : i64
    %5 = llvm.srem %0, %4 : i64
    %6 = llvm.lshr exact %2, %2 : i64
    %7 = llvm.urem %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or %arg0, %arg1 : i64
    %1 = llvm.ashr %arg0, %0 : i64
    %2 = llvm.sdiv %arg0, %1 : i64
    %3 = llvm.udiv %2, %arg2 : i64
    %4 = llvm.add %0, %3 overflow<nsw> : i64
    %5 = llvm.shl %2, %4 overflow<nsw> : i64
    %6 = llvm.xor %4, %arg1 : i64
    %7 = llvm.and %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg2 overflow<nsw> : i64
    %1 = llvm.sub %arg2, %0 : i64
    %2 = llvm.and %arg1, %1 : i64
    %3 = llvm.ashr %arg0, %2 : i64
    %4 = llvm.sdiv %3, %arg2 : i64
    %5 = llvm.shl %4, %2 : i64
    %6 = llvm.shl %3, %5 : i64
    %7 = llvm.xor %6, %3 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg1 : i64
    %1 = llvm.urem %0, %0 : i64
    %2 = llvm.shl %arg2, %1 overflow<nsw> : i64
    %3 = llvm.ashr %2, %1 : i64
    %4 = llvm.mul %arg0, %0 : i64
    %5 = llvm.sdiv %3, %4 : i64
    %6 = llvm.udiv %0, %5 : i64
    %7 = llvm.shl %6, %5 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.ashr %arg0, %arg0 : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.sdiv exact %arg0, %1 : i64
    %3 = llvm.udiv %0, %arg1 : i64
    %4 = llvm.lshr exact %3, %0 : i64
    %5 = llvm.and %2, %4 : i64
    %6 = llvm.srem %3, %5 : i64
    %7 = llvm.lshr exact %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.srem %0, %arg0 : i64
    %2 = llvm.sub %arg2, %arg2 overflow<nsw, nuw> : i64
    %3 = llvm.udiv %arg2, %2 : i64
    %4 = llvm.mul %arg1, %3 overflow<nsw, nuw> : i64
    %5 = llvm.ashr %0, %arg1 : i64
    %6 = llvm.or %4, %5 : i64
    %7 = llvm.xor %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg0, %arg2 : i64
    %1 = llvm.xor %arg1, %0 : i64
    %2 = llvm.lshr %arg2, %arg2 : i64
    %3 = llvm.sub %1, %2 overflow<nuw> : i64
    %4 = llvm.udiv %arg2, %3 : i64
    %5 = llvm.ashr %arg1, %4 : i64
    %6 = llvm.udiv %arg0, %5 : i64
    %7 = llvm.and %6, %5 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg1, %arg1 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.mul %1, %arg2 overflow<nuw> : i64
    %3 = llvm.and %arg0, %0 : i64
    %4 = llvm.srem %2, %arg2 : i64
    %5 = llvm.sdiv exact %arg2, %4 : i64
    %6 = llvm.urem %3, %5 : i64
    %7 = llvm.shl %2, %6 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr exact %arg0, %arg1 : i64
    %1 = llvm.xor %0, %arg1 : i64
    %2 = llvm.udiv %1, %arg1 : i64
    %3 = llvm.sdiv exact %2, %arg2 : i64
    %4 = llvm.shl %1, %1 : i64
    %5 = llvm.xor %4, %0 : i64
    %6 = llvm.or disjoint %3, %5 : i64
    %7 = llvm.urem %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.mul %0, %0 overflow<nsw, nuw> : i64
    %2 = llvm.lshr exact %1, %arg1 : i64
    %3 = llvm.add %0, %2 overflow<nuw> : i64
    %4 = llvm.shl %arg2, %arg0 overflow<nsw> : i64
    %5 = llvm.udiv %4, %1 : i64
    %6 = llvm.lshr %3, %5 : i64
    %7 = llvm.ashr %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.or %arg1, %0 : i64
    %2 = llvm.shl %arg0, %1 overflow<nsw, nuw> : i64
    %3 = llvm.srem %arg1, %arg2 : i64
    %4 = llvm.urem %arg2, %arg1 : i64
    %5 = llvm.lshr exact %arg1, %4 : i64
    %6 = llvm.and %3, %5 : i64
    %7 = llvm.and %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg1 overflow<nuw> : i64
    %1 = llvm.or disjoint %arg0, %arg0 : i64
    %2 = llvm.ashr exact %1, %1 : i64
    %3 = llvm.srem %2, %1 : i64
    %4 = llvm.sdiv %arg0, %arg0 : i64
    %5 = llvm.udiv %4, %arg2 : i64
    %6 = llvm.and %3, %5 : i64
    %7 = llvm.and %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.sdiv exact %0, %arg0 : i64
    %2 = llvm.and %arg0, %arg0 : i64
    %3 = llvm.lshr exact %0, %2 : i64
    %4 = llvm.mul %arg1, %arg2 : i64
    %5 = llvm.and %3, %4 : i64
    %6 = llvm.srem %1, %5 : i64
    %7 = llvm.add %6, %5 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.add %arg0, %0 : i64
    %2 = llvm.udiv %1, %arg0 : i64
    %3 = llvm.lshr exact %0, %arg0 : i64
    %4 = llvm.mul %3, %0 : i64
    %5 = llvm.ashr %4, %arg2 : i64
    %6 = llvm.ashr exact %arg2, %5 : i64
    %7 = llvm.mul %2, %6 overflow<nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 : i64
    %1 = llvm.ashr %arg2, %arg0 : i64
    %2 = llvm.shl %arg1, %1 overflow<nsw> : i64
    %3 = llvm.udiv %arg0, %2 : i64
    %4 = llvm.mul %3, %arg1 overflow<nuw> : i64
    %5 = llvm.urem %3, %arg2 : i64
    %6 = llvm.sub %4, %5 overflow<nsw> : i64
    %7 = llvm.shl %0, %6 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.sub %0, %arg0 overflow<nuw> : i64
    %2 = llvm.sdiv %arg2, %arg2 : i64
    %3 = llvm.sub %arg2, %2 overflow<nsw> : i64
    %4 = llvm.sub %2, %3 overflow<nsw, nuw> : i64
    %5 = llvm.udiv %1, %4 : i64
    %6 = llvm.udiv %arg2, %5 : i64
    %7 = llvm.shl %1, %6 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.udiv %0, %arg2 : i64
    %2 = llvm.shl %arg2, %1 overflow<nsw> : i64
    %3 = llvm.ashr %1, %2 : i64
    %4 = llvm.srem %0, %1 : i64
    %5 = llvm.and %3, %4 : i64
    %6 = llvm.urem %1, %5 : i64
    %7 = llvm.shl %1, %6 overflow<nsw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr %arg0, %arg0 : i64
    %1 = llvm.udiv %0, %arg1 : i64
    %2 = llvm.or disjoint %arg2, %arg1 : i64
    %3 = llvm.mul %1, %arg1 overflow<nsw, nuw> : i64
    %4 = llvm.udiv %2, %3 : i64
    %5 = llvm.srem %1, %4 : i64
    %6 = llvm.mul %2, %arg1 : i64
    %7 = llvm.and %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg1 : i64
    %1 = llvm.mul %arg2, %arg0 overflow<nsw, nuw> : i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.urem %2, %arg1 : i64
    %4 = llvm.ashr exact %arg1, %arg1 : i64
    %5 = llvm.add %arg2, %4 overflow<nsw> : i64
    %6 = llvm.sub %3, %5 overflow<nsw, nuw> : i64
    %7 = llvm.mul %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.sdiv exact %0, %arg2 : i64
    %2 = llvm.sdiv exact %1, %arg0 : i64
    %3 = llvm.xor %arg1, %2 : i64
    %4 = llvm.urem %3, %arg2 : i64
    %5 = llvm.sdiv exact %4, %1 : i64
    %6 = llvm.srem %arg1, %5 : i64
    %7 = llvm.srem %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg1, %arg2 overflow<nsw, nuw> : i64
    %1 = llvm.ashr exact %arg1, %0 : i64
    %2 = llvm.ashr exact %1, %0 : i64
    %3 = llvm.xor %arg1, %arg1 : i64
    %4 = llvm.srem %2, %3 : i64
    %5 = llvm.xor %arg0, %4 : i64
    %6 = llvm.or disjoint %1, %2 : i64
    %7 = llvm.shl %5, %6 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg1, %arg1 : i64
    %1 = llvm.xor %arg0, %arg2 : i64
    %2 = llvm.lshr exact %0, %1 : i64
    %3 = llvm.ashr exact %arg2, %2 : i64
    %4 = llvm.srem %arg1, %3 : i64
    %5 = llvm.urem %arg0, %4 : i64
    %6 = llvm.lshr exact %4, %5 : i64
    %7 = llvm.xor %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg1, %arg0 : i64
    %1 = llvm.sdiv exact %arg0, %0 : i64
    %2 = llvm.ashr %arg2, %arg0 : i64
    %3 = llvm.and %2, %0 : i64
    %4 = llvm.sdiv exact %1, %3 : i64
    %5 = llvm.add %arg0, %0 overflow<nsw, nuw> : i64
    %6 = llvm.or disjoint %4, %5 : i64
    %7 = llvm.sub %6, %1 overflow<nsw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr %arg0, %arg0 : i64
    %1 = llvm.sdiv exact %0, %arg1 : i64
    %2 = llvm.xor %1, %arg2 : i64
    %3 = llvm.srem %arg1, %1 : i64
    %4 = llvm.lshr exact %1, %arg0 : i64
    %5 = llvm.sdiv %3, %4 : i64
    %6 = llvm.lshr exact %2, %5 : i64
    %7 = llvm.shl %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.or %arg2, %0 : i64
    %2 = llvm.srem %0, %1 : i64
    %3 = llvm.sub %2, %arg1 overflow<nsw> : i64
    %4 = llvm.sdiv exact %1, %arg0 : i64
    %5 = llvm.or disjoint %2, %2 : i64
    %6 = llvm.sub %4, %5 overflow<nsw> : i64
    %7 = llvm.urem %3, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg2, %arg1 : i64
    %1 = llvm.ashr exact %arg2, %arg2 : i64
    %2 = llvm.udiv %1, %arg0 : i64
    %3 = llvm.shl %0, %2 overflow<nuw> : i64
    %4 = llvm.and %arg1, %3 : i64
    %5 = llvm.urem %4, %0 : i64
    %6 = llvm.sdiv %5, %arg2 : i64
    %7 = llvm.sub %arg0, %6 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.lshr %arg1, %arg2 : i64
    %2 = llvm.xor %1, %arg2 : i64
    %3 = llvm.sub %0, %arg2 : i64
    %4 = llvm.shl %3, %0 overflow<nsw> : i64
    %5 = llvm.ashr %2, %4 : i64
    %6 = llvm.and %1, %5 : i64
    %7 = llvm.or disjoint %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg0 : i64
    %1 = llvm.sdiv exact %0, %arg1 : i64
    %2 = llvm.ashr exact %0, %1 : i64
    %3 = llvm.sdiv %arg0, %2 : i64
    %4 = llvm.or %3, %arg2 : i64
    %5 = llvm.and %4, %arg1 : i64
    %6 = llvm.mul %arg2, %5 : i64
    %7 = llvm.srem %3, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.xor %0, %arg1 : i64
    %2 = llvm.or disjoint %1, %0 : i64
    %3 = llvm.shl %arg0, %arg2 overflow<nuw> : i64
    %4 = llvm.or disjoint %0, %2 : i64
    %5 = llvm.add %3, %4 overflow<nuw> : i64
    %6 = llvm.srem %2, %5 : i64
    %7 = llvm.udiv %6, %arg2 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg0, %arg1 : i64
    %1 = llvm.xor %arg0, %arg1 : i64
    %2 = llvm.lshr %arg2, %0 : i64
    %3 = llvm.urem %2, %1 : i64
    %4 = llvm.mul %arg2, %3 overflow<nsw> : i64
    %5 = llvm.udiv %1, %4 : i64
    %6 = llvm.add %0, %5 overflow<nsw, nuw> : i64
    %7 = llvm.and %arg0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr exact %arg0, %arg0 : i64
    %1 = llvm.udiv %0, %arg1 : i64
    %2 = llvm.ashr %1, %arg2 : i64
    %3 = llvm.sub %arg1, %arg2 overflow<nsw> : i64
    %4 = llvm.and %arg1, %3 : i64
    %5 = llvm.shl %4, %arg0 : i64
    %6 = llvm.udiv %2, %5 : i64
    %7 = llvm.add %0, %6 overflow<nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or %arg0, %arg1 : i64
    %1 = llvm.lshr exact %arg2, %0 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.sdiv exact %0, %arg0 : i64
    %4 = llvm.udiv %arg1, %3 : i64
    %5 = llvm.sdiv exact %4, %arg1 : i64
    %6 = llvm.sub %2, %5 : i64
    %7 = llvm.srem %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.mul %arg0, %0 : i64
    %2 = llvm.xor %arg1, %arg1 : i64
    %3 = llvm.srem %arg2, %2 : i64
    %4 = llvm.srem %2, %3 : i64
    %5 = llvm.ashr %2, %arg1 : i64
    %6 = llvm.xor %4, %5 : i64
    %7 = llvm.udiv %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.ashr exact %arg2, %arg0 : i64
    %2 = llvm.sdiv exact %arg0, %1 : i64
    %3 = llvm.urem %2, %0 : i64
    %4 = llvm.sdiv exact %0, %3 : i64
    %5 = llvm.xor %4, %0 : i64
    %6 = llvm.sub %1, %5 overflow<nuw> : i64
    %7 = llvm.sdiv %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg1, %arg1 overflow<nsw, nuw> : i64
    %1 = llvm.shl %arg0, %0 overflow<nsw, nuw> : i64
    %2 = llvm.sdiv exact %arg0, %1 : i64
    %3 = llvm.ashr %arg0, %arg0 : i64
    %4 = llvm.ashr exact %3, %1 : i64
    %5 = llvm.lshr %3, %4 : i64
    %6 = llvm.urem %2, %5 : i64
    %7 = llvm.shl %6, %arg2 overflow<nsw, nuw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg1, %arg2 : i64
    %1 = llvm.lshr %0, %0 : i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.sub %0, %2 overflow<nsw, nuw> : i64
    %4 = llvm.xor %arg1, %3 : i64
    %5 = llvm.xor %4, %arg1 : i64
    %6 = llvm.or disjoint %arg0, %5 : i64
    %7 = llvm.urem %6, %2 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.add %arg2, %arg1 overflow<nuw> : i64
    %3 = llvm.and %2, %2 : i64
    %4 = llvm.mul %3, %arg1 overflow<nuw> : i64
    %5 = llvm.udiv %arg1, %4 : i64
    %6 = llvm.and %5, %arg2 : i64
    %7 = llvm.mul %1, %6 overflow<nsw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg1, %arg2 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.udiv %1, %arg2 : i64
    %3 = llvm.urem %arg0, %2 : i64
    %4 = llvm.shl %arg0, %arg0 : i64
    %5 = llvm.udiv %4, %3 : i64
    %6 = llvm.ashr %3, %5 : i64
    %7 = llvm.mul %arg0, %6 overflow<nsw> : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.mul %arg0, %arg0 overflow<nsw> : i64
    %1 = llvm.udiv %0, %arg1 : i64
    %2 = llvm.and %arg2, %arg1 : i64
    %3 = llvm.sub %1, %2 overflow<nsw, nuw> : i64
    %4 = llvm.shl %arg0, %3 overflow<nuw> : i64
    %5 = llvm.xor %arg2, %4 : i64
    %6 = llvm.or %5, %arg1 : i64
    %7 = llvm.or disjoint %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg1, %arg2 : i64
    %1 = llvm.add %arg0, %0 : i64
    %2 = llvm.udiv %0, %0 : i64
    %3 = llvm.udiv %2, %arg2 : i64
    %4 = llvm.and %0, %3 : i64
    %5 = llvm.add %2, %4 overflow<nsw, nuw> : i64
    %6 = llvm.ashr exact %1, %5 : i64
    %7 = llvm.mul %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg0, %arg1 overflow<nuw> : i64
    %1 = llvm.urem %arg1, %arg2 : i64
    %2 = llvm.or %1, %arg0 : i64
    %3 = llvm.xor %arg1, %2 : i64
    %4 = llvm.urem %3, %arg1 : i64
    %5 = llvm.srem %0, %4 : i64
    %6 = llvm.udiv %3, %5 : i64
    %7 = llvm.lshr exact %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.add %0, %arg1 : i64
    %2 = llvm.mul %arg2, %arg1 : i64
    %3 = llvm.srem %2, %arg0 : i64
    %4 = llvm.srem %arg0, %arg2 : i64
    %5 = llvm.udiv %2, %4 : i64
    %6 = llvm.or disjoint %3, %5 : i64
    %7 = llvm.srem %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.sdiv %arg1, %arg2 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.srem %2, %0 : i64
    %4 = llvm.urem %0, %3 : i64
    %5 = llvm.and %arg0, %3 : i64
    %6 = llvm.sub %4, %5 overflow<nuw> : i64
    %7 = llvm.or %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.shl %arg0, %arg1 overflow<nuw> : i64
    %1 = llvm.xor %arg2, %arg0 : i64
    %2 = llvm.shl %1, %arg1 overflow<nsw> : i64
    %3 = llvm.udiv %0, %2 : i64
    %4 = llvm.xor %1, %0 : i64
    %5 = llvm.add %arg1, %4 : i64
    %6 = llvm.lshr %5, %4 : i64
    %7 = llvm.ashr exact %3, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or %arg0, %arg2 : i64
    %1 = llvm.and %arg1, %0 : i64
    %2 = llvm.add %1, %arg2 overflow<nsw> : i64
    %3 = llvm.ashr exact %arg2, %arg1 : i64
    %4 = llvm.ashr exact %2, %3 : i64
    %5 = llvm.mul %arg0, %4 : i64
    %6 = llvm.mul %5, %3 overflow<nuw> : i64
    %7 = llvm.srem %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sub %arg0, %arg0 overflow<nsw, nuw> : i64
    %1 = llvm.sdiv exact %0, %arg1 : i64
    %2 = llvm.shl %arg0, %1 : i64
    %3 = llvm.srem %0, %arg2 : i64
    %4 = llvm.ashr %2, %3 : i64
    %5 = llvm.or %4, %1 : i64
    %6 = llvm.and %0, %5 : i64
    %7 = llvm.lshr exact %6, %arg2 : i64
    return %7 : i64
  }
}
// -----
