module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.udiv %arg1, %arg2 : i64
    %1 = llvm.ashr exact %arg0, %0 : i64
    %2 = llvm.or disjoint %1, %arg1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i1 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.udiv %0, %0 : i64
    %2 = llvm.or %0, %1 : i64
    %3 = llvm.icmp "slt" %0, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.srem %arg2, %arg2 : i64
    %2 = llvm.lshr %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.trunc %arg1 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.select %arg0, %1, %arg2 : i1, i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.xor %arg1, %arg0 : i64
    %1 = llvm.or %arg1, %0 : i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.and %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i1
    %1 = llvm.urem %arg0, %arg0 : i64
    %2 = llvm.sdiv %1, %arg2 : i64
    %3 = llvm.select %0, %arg1, %2 : i1, i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64) -> i32 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.or %arg1, %0 : i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64) -> i32 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.trunc %0 : i64 to i1
    %2 = llvm.select %1, %arg1, %0 : i1, i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i1
    %1 = llvm.select %0, %arg1, %arg0 : i1, i64
    %2 = llvm.urem %1, %arg2 : i64
    %3 = llvm.icmp "sge" %2, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64) -> i32 {
    %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.sdiv %arg2, %arg2 : i64
    %1 = llvm.select %arg0, %arg1, %0 : i1, i64
    %2 = llvm.ashr %arg2, %arg1 : i64
    %3 = llvm.icmp "eq" %1, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.urem %0, %0 : i64
    %2 = llvm.xor %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
    %0 = llvm.icmp "sle" %arg0, %arg1 : i64
    %1 = llvm.select %0, %arg1, %arg1 : i1, i64
    %2 = llvm.sext %arg2 : i32 to i64
    %3 = llvm.udiv %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.ashr %0, %0 : i64
    %2 = llvm.and %1, %arg1 : i64
    %3 = llvm.or disjoint %2, %arg2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg2 : i64
    %1 = llvm.lshr %arg1, %0 : i64
    %2 = llvm.xor %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.urem %arg1, %arg2 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.sdiv exact %1, %arg0 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg2, %arg1 : i64
    %1 = llvm.select %arg0, %arg1, %0 : i1, i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.lshr %0, %arg1 : i64
    %2 = llvm.srem %1, %arg0 : i64
    %3 = llvm.icmp "ule" %arg0, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.select %arg1, %arg2, %0 : i1, i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
    %0 = llvm.lshr %arg2, %arg2 : i64
    %1 = llvm.select %arg1, %0, %0 : i1, i64
    %2 = llvm.ashr exact %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.udiv %0, %arg2 : i64
    %2 = llvm.urem %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.and %0, %arg2 : i64
    %2 = llvm.udiv %1, %0 : i64
    %3 = llvm.udiv %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.zext %arg2 : i32 to i64
    %2 = llvm.sdiv exact %1, %1 : i64
    %3 = llvm.sdiv %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.xor %arg2, %arg0 : i64
    %1 = llvm.xor %arg2, %0 : i64
    %2 = llvm.or disjoint %arg1, %1 : i64
    %3 = llvm.udiv %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    %1 = llvm.or %0, %arg2 : i64
    %2 = llvm.or disjoint %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.srem %2, %arg1 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.icmp "uge" %2, %arg1 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.udiv %0, %arg2 : i64
    %2 = llvm.ashr %1, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.ashr %arg0, %arg1 : i64
    %1 = llvm.urem %arg2, %arg2 : i64
    %2 = llvm.sdiv %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.icmp "eq" %arg0, %0 : i64
    %2 = llvm.select %1, %arg0, %arg0 : i1, i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.xor %arg1, %arg2 : i64
    %1 = llvm.ashr %arg0, %0 : i64
    %2 = llvm.udiv %1, %arg0 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.select %arg1, %arg2, %arg0 : i1, i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.lshr exact %0, %0 : i64
    %2 = llvm.sext %arg2 : i32 to i64
    %3 = llvm.udiv %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.udiv %arg0, %0 : i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.and %0, %arg2 : i64
    %2 = llvm.urem %1, %0 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i1 {
    %0 = llvm.zext %arg1 : i32 to i64
    %1 = llvm.icmp "ule" %arg0, %0 : i64
    %2 = llvm.select %1, %arg2, %0 : i1, i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.ashr exact %arg0, %arg0 : i64
    %1 = llvm.urem %arg1, %arg2 : i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg2, %arg0 : i64
    %1 = llvm.or %arg1, %0 : i64
    %2 = llvm.lshr %arg0, %1 : i64
    %3 = llvm.icmp "ugt" %2, %1 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i32) -> i32 {
    %0 = llvm.sext %arg2 : i32 to i64
    %1 = llvm.xor %arg1, %0 : i64
    %2 = llvm.select %arg0, %1, %0 : i1, i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.or disjoint %arg2, %arg2 : i64
    %1 = llvm.xor %arg1, %0 : i64
    %2 = llvm.urem %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.sext %arg2 : i32 to i64
    %2 = llvm.sdiv exact %0, %1 : i64
    %3 = llvm.or %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.ashr exact %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.and %1, %arg1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.sdiv exact %arg0, %arg0 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.or disjoint %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.xor %arg0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.lshr exact %arg0, %arg1 : i64
    %1 = llvm.ashr %0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg0 : i64
    %2 = llvm.sext %arg2 : i32 to i64
    %3 = llvm.icmp "ugt" %1, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
    %0 = llvm.lshr exact %arg0, %arg2 : i64
    %1 = llvm.select %arg1, %arg0, %0 : i1, i64
    %2 = llvm.urem %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.urem %0, %arg2 : i64
    %2 = llvm.srem %1, %0 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr exact %arg0, %arg0 : i64
    %1 = llvm.urem %0, %arg1 : i64
    %2 = llvm.and %arg2, %arg0 : i64
    %3 = llvm.ashr exact %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64, %arg3: i32) -> i1 {
    %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
    %1 = llvm.zext %arg3 : i32 to i64
    %2 = llvm.lshr %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.or disjoint %arg0, %arg2 : i64
    %1 = llvm.or disjoint %arg1, %0 : i64
    %2 = llvm.srem %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.udiv %arg1, %0 : i64
    %2 = llvm.and %1, %arg2 : i64
    %3 = llvm.icmp "sle" %0, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.icmp "eq" %arg0, %arg0 : i64
    %1 = llvm.select %0, %arg0, %arg0 : i1, i64
    %2 = llvm.xor %1, %arg1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i32 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.zext %arg1 : i32 to i64
    %2 = llvm.lshr exact %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.udiv %arg1, %arg2 : i64
    %1 = llvm.or disjoint %0, %arg1 : i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i32) -> i32 {
    %0 = llvm.sext %arg2 : i32 to i64
    %1 = llvm.select %arg1, %arg0, %0 : i1, i64
    %2 = llvm.udiv %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.urem %0, %arg1 : i64
    %2 = llvm.xor %1, %arg2 : i64
    %3 = llvm.icmp "uge" %0, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.icmp "ule" %arg0, %arg1 : i64
    %1 = llvm.select %0, %arg2, %arg0 : i1, i64
    %2 = llvm.or %1, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.trunc %arg1 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.urem %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.lshr exact %arg0, %arg0 : i64
    %1 = llvm.lshr %0, %arg1 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.sdiv exact %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.sdiv exact %arg0, %arg0 : i64
    %1 = llvm.udiv %arg0, %0 : i64
    %2 = llvm.xor %1, %0 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64) -> i1 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.xor %0, %arg1 : i64
    %2 = llvm.udiv %arg1, %1 : i64
    %3 = llvm.icmp "sle" %0, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.xor %0, %arg0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.lshr %arg2, %arg0 : i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i32 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i1 {
    %0 = llvm.zext %arg1 : i32 to i64
    %1 = llvm.ashr exact %0, %arg0 : i64
    %2 = llvm.urem %1, %arg0 : i64
    %3 = llvm.icmp "ult" %arg0, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i1 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.icmp "ule" %0, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.srem %arg1, %arg2 : i64
    %1 = llvm.or %arg0, %0 : i64
    %2 = llvm.sdiv exact %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.or disjoint %arg2, %arg1 : i64
    %1 = llvm.urem %arg1, %0 : i64
    %2 = llvm.lshr exact %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr exact %arg1, %arg1 : i64
    %1 = llvm.udiv %arg0, %0 : i64
    %2 = llvm.xor %1, %1 : i64
    %3 = llvm.or %2, %arg2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.srem %arg0, %1 : i64
    %3 = llvm.ashr exact %1, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.udiv %arg0, %0 : i64
    %2 = llvm.lshr exact %1, %arg2 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.ashr exact %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.icmp "sle" %2, %arg1 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.trunc %arg1 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.sdiv %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.or %0, %arg1 : i64
    %2 = llvm.lshr exact %1, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.sdiv exact %1, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i1
    %2 = llvm.select %1, %arg2, %arg0 : i1, i64
    %3 = llvm.and %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.udiv %arg1, %arg1 : i64
    %1 = llvm.and %0, %arg2 : i64
    %2 = llvm.sdiv %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64) -> i32 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.sdiv exact %arg1, %arg1 : i64
    %2 = llvm.and %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i64 {
    %0 = llvm.zext %arg1 : i32 to i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i64 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.sdiv exact %0, %0 : i64
    %2 = llvm.srem %0, %1 : i64
    %3 = llvm.lshr %2, %0 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.sdiv exact %arg0, %arg0 : i64
    %1 = llvm.urem %arg0, %0 : i64
    %2 = llvm.and %1, %0 : i64
    %3 = llvm.icmp "ult" %1, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.urem %arg1, %arg2 : i64
    %3 = llvm.icmp "ugt" %1, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i32 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.udiv %arg0, %0 : i64
    %2 = llvm.udiv %1, %arg2 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.lshr exact %0, %arg1 : i64
    %2 = llvm.xor %arg0, %1 : i64
    %3 = llvm.icmp "sgt" %0, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.or disjoint %arg2, %arg1 : i64
    %1 = llvm.udiv %arg1, %0 : i64
    %2 = llvm.srem %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i1, %arg2: i64) -> i64 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.select %arg1, %0, %arg2 : i1, i64
    %2 = llvm.srem %1, %arg2 : i64
    %3 = llvm.and %0, %2 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.lshr %arg0, %arg0 : i64
    %1 = llvm.srem %0, %arg1 : i64
    %2 = llvm.urem %1, %arg2 : i64
    %3 = llvm.icmp "slt" %1, %2 : i64
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.urem %2, %arg1 : i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.or %0, %0 : i64
    %2 = llvm.urem %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    return %3 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.lshr exact %0, %arg0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    return %3 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.ashr %arg1, %arg1 : i64
    %1 = llvm.sdiv %arg0, %0 : i64
    %2 = llvm.xor %1, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.trunc %arg1 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.urem %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i1
    return %3 : i1
  }
}
// -----
