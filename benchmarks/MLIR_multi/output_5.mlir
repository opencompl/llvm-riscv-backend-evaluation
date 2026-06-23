module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.urem %0, %arg1 : i64
    %2 = llvm.sdiv %0, %1 : i64
    %3 = llvm.urem %2, %arg2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i1 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.ashr exact %0, %0 : i64
    %2 = llvm.zext %arg0 : i32 to i64
    %3 = llvm.urem %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg1, %arg2 : i64
    %1 = llvm.udiv %arg1, %0 : i64
    %2 = llvm.and %0, %1 : i64
    %3 = llvm.ashr exact %2, %arg1 : i64
    %4 = llvm.urem %arg0, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.ashr %0, %arg0 : i64
    %2 = llvm.or disjoint %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i32 {
    %0 = llvm.sext %arg1 : i32 to i64
    %1 = llvm.sdiv %arg0, %0 : i64
    %2 = llvm.udiv %arg0, %1 : i64
    %3 = llvm.or disjoint %2, %arg2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.udiv %0, %arg2 : i64
    %2 = llvm.udiv %1, %arg0 : i64
    %3 = llvm.udiv %2, %1 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1) -> i1 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.select %arg1, %0, %0 : i1, i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.icmp "eq" %arg0, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.ashr exact %arg1, %arg2 : i64
    %1 = llvm.or %arg1, %0 : i64
    %2 = llvm.sdiv exact %0, %1 : i64
    %3 = llvm.urem %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.sdiv %arg0, %arg2 : i64
    %1 = llvm.xor %arg1, %0 : i64
    %2 = llvm.udiv %arg0, %1 : i64
    %3 = llvm.srem %2, %1 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
    %1 = llvm.xor %arg1, %arg2 : i64
    %2 = llvm.ashr exact %arg1, %1 : i64
    %3 = llvm.ashr %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.lshr exact %1, %arg1 : i64
    %3 = llvm.srem %2, %arg0 : i64
    %4 = llvm.urem %1, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.sdiv %arg1, %1 : i64
    %3 = llvm.sdiv %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.lshr exact %arg1, %arg1 : i64
    %1 = llvm.sdiv %arg0, %0 : i64
    %2 = llvm.icmp "sgt" %1, %arg2 : i64
    %3 = llvm.select %2, %arg1, %arg2 : i1, i64
    %4 = llvm.icmp "sle" %1, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.zext %arg2 : i32 to i64
    %2 = llvm.lshr %1, %0 : i64
    %3 = llvm.sdiv %2, %1 : i64
    %4 = llvm.icmp "slt" %0, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.icmp "uge" %arg0, %arg0 : i64
    %1 = llvm.urem %arg1, %arg0 : i64
    %2 = llvm.or disjoint %1, %1 : i64
    %3 = llvm.urem %arg2, %2 : i64
    %4 = llvm.select %0, %1, %3 : i1, i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.or %arg0, %arg1 : i64
    %1 = llvm.icmp "slt" %0, %arg0 : i64
    %2 = llvm.select %1, %arg2, %arg0 : i1, i64
    %3 = llvm.sdiv exact %2, %arg2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.sdiv exact %arg0, %0 : i64
    %2 = llvm.udiv %1, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i32 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.or %0, %arg0 : i64
    %2 = llvm.zext %arg1 : i32 to i64
    %3 = llvm.ashr %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.ashr exact %arg0, %arg0 : i64
    %1 = llvm.srem %0, %arg1 : i64
    %2 = llvm.sdiv exact %0, %1 : i64
    %3 = llvm.urem %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    %1 = llvm.ashr exact %arg0, %arg0 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.zext %arg2 : i32 to i64
    %4 = llvm.icmp "ult" %2, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.or disjoint %arg2, %arg0 : i64
    %1 = llvm.lshr %arg1, %0 : i64
    %2 = llvm.udiv %arg1, %1 : i64
    %3 = llvm.xor %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.lshr %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i1
    %2 = llvm.select %1, %0, %arg0 : i1, i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.zext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.xor %arg2, %arg1 : i64
    %2 = llvm.and %1, %arg2 : i64
    %3 = llvm.lshr %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg0 : i64
    %1 = llvm.select %arg1, %arg0, %arg0 : i1, i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.and %2, %arg2 : i64
    %4 = llvm.or disjoint %0, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.and %arg1, %arg2 : i64
    %1 = llvm.icmp "sgt" %arg0, %0 : i64
    %2 = llvm.srem %arg1, %arg0 : i64
    %3 = llvm.select %1, %arg2, %2 : i1, i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.udiv %arg1, %arg1 : i64
    %1 = llvm.sdiv %0, %0 : i64
    %2 = llvm.srem %1, %arg2 : i64
    %3 = llvm.select %arg0, %1, %2 : i1, i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.sdiv exact %0, %arg2 : i64
    %2 = llvm.trunc %arg1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.srem %1, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.sdiv exact %arg2, %arg1 : i64
    %1 = llvm.udiv %arg1, %0 : i64
    %2 = llvm.sdiv exact %1, %1 : i64
    %3 = llvm.or disjoint %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i64 {
    %0 = llvm.lshr exact %arg1, %arg2 : i64
    %1 = llvm.icmp "sge" %arg0, %0 : i64
    %2 = llvm.zext %arg3 : i32 to i64
    %3 = llvm.select %1, %arg0, %2 : i1, i64
    %4 = llvm.xor %3, %arg1 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.xor %0, %arg0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i1 {
    %0 = llvm.udiv %arg2, %arg2 : i64
    %1 = llvm.and %arg2, %0 : i64
    %2 = llvm.select %arg1, %arg0, %1 : i1, i64
    %3 = llvm.and %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.xor %arg1, %0 : i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.or disjoint %arg2, %0 : i64
    %4 = llvm.icmp "ne" %2, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.and %arg2, %arg1 : i64
    %1 = llvm.ashr exact %arg2, %0 : i64
    %2 = llvm.udiv %arg1, %1 : i64
    %3 = llvm.lshr %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.lshr exact %0, %arg2 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i1
    %1 = llvm.zext %arg2 : i32 to i64
    %2 = llvm.or disjoint %arg1, %1 : i64
    %3 = llvm.select %0, %arg0, %2 : i1, i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.and %0, %arg2 : i64
    %2 = llvm.select %arg1, %0, %1 : i1, i64
    %3 = llvm.sdiv %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i1 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.trunc %0 : i64 to i1
    %2 = llvm.xor %0, %0 : i64
    %3 = llvm.select %1, %0, %2 : i1, i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.and %arg1, %arg1 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.ashr exact %arg2, %arg1 : i64
    %4 = llvm.ashr %2, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.or disjoint %2, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.ashr exact %arg0, %arg0 : i64
    %1 = llvm.xor %0, %arg0 : i64
    %2 = llvm.or disjoint %0, %1 : i64
    %3 = llvm.udiv %arg1, %arg2 : i64
    %4 = llvm.icmp "eq" %2, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg2 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.and %2, %arg2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.or disjoint %0, %arg2 : i64
    %2 = llvm.or %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.zext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
    %0 = llvm.zext %arg2 : i32 to i64
    %1 = llvm.sdiv exact %arg1, %0 : i64
    %2 = llvm.xor %arg0, %1 : i64
    %3 = llvm.or %2, %arg1 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.udiv %arg2, %arg1 : i64
    %1 = llvm.select %arg0, %arg1, %0 : i1, i64
    %2 = llvm.urem %1, %1 : i64
    %3 = llvm.srem %0, %2 : i64
    %4 = llvm.icmp "eq" %1, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.udiv %arg0, %0 : i64
    %2 = llvm.xor %0, %0 : i64
    %3 = llvm.ashr %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.srem %arg2, %arg0 : i64
    %1 = llvm.sdiv exact %arg1, %0 : i64
    %2 = llvm.xor %arg0, %1 : i64
    %3 = llvm.lshr exact %2, %arg0 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.and %0, %arg0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.or disjoint %arg1, %arg2 : i64
    %1 = llvm.lshr exact %arg0, %0 : i64
    %2 = llvm.urem %1, %arg0 : i64
    %3 = llvm.and %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.lshr %1, %arg0 : i64
    %3 = llvm.sdiv %2, %arg0 : i64
    %4 = llvm.or disjoint %3, %arg1 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.icmp "eq" %0, %0 : i64
    %2 = llvm.select %1, %arg0, %arg1 : i1, i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.sdiv exact %arg0, %arg1 : i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.and %2, %0 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.icmp "sge" %arg0, %arg1 : i64
    %1 = llvm.select %0, %arg2, %arg2 : i1, i64
    %2 = llvm.urem %1, %arg1 : i64
    %3 = llvm.select %0, %arg2, %2 : i1, i64
    %4 = llvm.icmp "sge" %3, %arg0 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.sdiv exact %arg1, %arg1 : i64
    %3 = llvm.udiv %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr exact %arg1, %arg0 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.ashr %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    %4 = llvm.select %3, %arg2, %arg1 : i1, i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64) -> i64 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.or %arg1, %0 : i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.ashr %arg1, %arg1 : i64
    %1 = llvm.and %0, %arg1 : i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.and %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.select %arg1, %arg2, %2 : i1, i64
    %4 = llvm.icmp "eq" %2, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i32) -> i32 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.zext %arg1 : i32 to i64
    %2 = llvm.sdiv exact %1, %0 : i64
    %3 = llvm.lshr %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i32 {
    %0 = llvm.lshr exact %arg0, %arg1 : i64
    %1 = llvm.select %arg2, %0, %arg0 : i1, i64
    %2 = llvm.or %arg0, %1 : i64
    %3 = llvm.srem %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.trunc %arg2 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.sdiv %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.or %0, %arg0 : i64
    %2 = llvm.urem %1, %arg1 : i64
    %3 = llvm.or %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.srem %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.trunc %arg1 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    %4 = llvm.urem %arg0, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.lshr %arg0, %arg0 : i64
    %1 = llvm.udiv %0, %arg1 : i64
    %2 = llvm.udiv %1, %arg2 : i64
    %3 = llvm.lshr %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.sdiv %arg2, %arg0 : i64
    %2 = llvm.srem %1, %1 : i64
    %3 = llvm.sdiv exact %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.or %arg1, %arg2 : i64
    %1 = llvm.or %arg2, %arg1 : i64
    %2 = llvm.sdiv exact %0, %1 : i64
    %3 = llvm.and %2, %arg1 : i64
    %4 = llvm.icmp "ugt" %arg0, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64) -> i1 {
    %0 = llvm.trunc %arg1 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.lshr exact %arg1, %1 : i64
    %3 = llvm.select %arg0, %2, %arg1 : i1, i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.srem %arg0, %1 : i64
    %3 = llvm.or %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.ashr %arg0, %0 : i64
    %2 = llvm.udiv %1, %arg2 : i64
    %3 = llvm.urem %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i32) -> i32 {
    %0 = llvm.sext %arg2 : i32 to i64
    %1 = llvm.select %arg1, %arg0, %0 : i1, i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.lshr exact %2, %arg0 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.sdiv %arg1, %0 : i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.sdiv %arg1, %1 : i64
    %4 = llvm.srem %2, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i1 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.zext %arg1 : i32 to i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.ashr exact %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.sdiv %0, %0 : i64
    %2 = llvm.and %1, %arg2 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.zext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
    %0 = llvm.sdiv %arg0, %arg0 : i64
    %1 = llvm.lshr exact %0, %arg1 : i64
    %2 = llvm.zext %arg2 : i32 to i64
    %3 = llvm.srem %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.or disjoint %arg0, %arg0 : i64
    %1 = llvm.lshr %0, %arg0 : i64
    %2 = llvm.trunc %arg1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.icmp "ule" %1, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.ashr exact %arg0, %0 : i64
    %2 = llvm.ashr exact %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.zext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.trunc %arg2 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.and %0, %2 : i64
    %4 = llvm.icmp "ule" %3, %0 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.or disjoint %1, %arg0 : i64
    %3 = llvm.lshr exact %arg1, %arg2 : i64
    %4 = llvm.icmp "uge" %2, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
    %0 = llvm.or %arg0, %arg1 : i64
    %1 = llvm.sext %arg2 : i32 to i64
    %2 = llvm.ashr %0, %1 : i64
    %3 = llvm.sdiv exact %arg0, %2 : i64
    %4 = llvm.icmp "sge" %2, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i1 {
    %0 = llvm.select %arg1, %arg2, %arg0 : i1, i64
    %1 = llvm.or disjoint %arg0, %0 : i64
    %2 = llvm.and %1, %arg2 : i64
    %3 = llvm.ashr %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.zext %0 : i32 to i64
    %3 = llvm.lshr %arg1, %2 : i64
    %4 = llvm.sdiv exact %1, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg0 : i64
    %1 = llvm.and %arg0, %arg0 : i64
    %2 = llvm.select %arg1, %0, %1 : i1, i64
    %3 = llvm.urem %2, %arg2 : i64
    %4 = llvm.or %0, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.trunc %arg1 : i64 to i1
    %1 = llvm.sdiv %arg2, %arg1 : i64
    %2 = llvm.select %0, %arg2, %1 : i1, i64
    %3 = llvm.or disjoint %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.or disjoint %arg0, %arg0 : i64
    %1 = llvm.lshr exact %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.ashr %arg1, %arg2 : i64
    %1 = llvm.select %arg0, %0, %arg2 : i1, i64
    %2 = llvm.select %arg0, %arg2, %arg2 : i1, i64
    %3 = llvm.and %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.ashr %0, %arg1 : i64
    %2 = llvm.ashr exact %arg1, %0 : i64
    %3 = llvm.srem %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i1 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.zext %arg1 : i32 to i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.and %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.xor %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg1, %arg2 : i64
    %1 = llvm.trunc %arg0 : i64 to i1
    %2 = llvm.select %1, %arg2, %arg2 : i1, i64
    %3 = llvm.udiv %0, %2 : i64
    %4 = llvm.icmp "sge" %arg0, %3 : i64
    return %4 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.lshr %arg2, %0 : i64
    %4 = llvm.sdiv exact %2, %3 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.or %arg1, %arg0 : i64
    %1 = llvm.or disjoint %0, %arg0 : i64
    %2 = llvm.lshr exact %1, %arg2 : i64
    %3 = llvm.lshr exact %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.urem %arg1, %arg2 : i64
    %1 = llvm.lshr exact %0, %arg0 : i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.srem %2, %arg0 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.sext %0 : i32 to i64
    %3 = llvm.or disjoint %1, %2 : i64
    %4 = llvm.srem %3, %arg1 : i64
    return %4 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64) -> i32 {
    %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
    %1 = llvm.lshr %arg1, %0 : i64
    %2 = llvm.sdiv exact %1, %arg1 : i64
    %3 = llvm.and %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    return %4 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
    %1 = llvm.xor %0, %arg2 : i64
    %2 = llvm.sdiv %arg2, %arg2 : i64
    %3 = llvm.udiv %1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i1
    return %4 : i1
  }
}
// -----
