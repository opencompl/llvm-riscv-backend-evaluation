module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i1 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.urem %0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.lshr exact %arg1, %arg1 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.xor %0, %arg2 : i64
    %2 = llvm.icmp "sle" %0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.xor %0, %arg1 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.sdiv %arg1, %arg2 : i64
    %1 = llvm.ashr exact %arg0, %0 : i64
    %2 = llvm.icmp "ne" %1, %arg1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.lshr %arg2, %arg2 : i64
    %1 = llvm.lshr exact %arg1, %0 : i64
    %2 = llvm.lshr %arg0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.xor %arg1, %arg2 : i64
    %2 = llvm.icmp "sge" %0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.icmp "ne" %arg0, %arg0 : i64
    %1 = llvm.select %0, %arg0, %arg0 : i1, i64
    %2 = llvm.icmp "sle" %1, %arg0 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg1 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.lshr %arg0, %arg0 : i64
    %1 = llvm.udiv %arg1, %arg1 : i64
    %2 = llvm.and %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.udiv %arg1, %arg2 : i64
    %1 = llvm.and %arg1, %0 : i64
    %2 = llvm.icmp "sle" %arg0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
    %1 = llvm.xor %0, %arg2 : i64
    %2 = llvm.srem %1, %arg1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.or disjoint %arg0, %0 : i64
    %2 = llvm.icmp "ult" %1, %arg1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.sdiv %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.and %0, %arg1 : i64
    %2 = llvm.and %1, %arg2 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.lshr %arg1, %arg0 : i64
    %1 = llvm.sdiv exact %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.lshr exact %arg1, %arg0 : i64
    %1 = llvm.lshr exact %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.icmp "eq" %arg0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.ashr %0, %arg2 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.or %arg1, %arg2 : i64
    %1 = llvm.select %arg0, %0, %arg1 : i1, i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64) -> i64 {
    %0 = llvm.trunc %arg1 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.select %arg0, %arg1, %1 : i1, i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.ashr exact %arg0, %arg0 : i64
    %1 = llvm.and %0, %arg0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.or disjoint %arg0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.or disjoint %arg2, %arg1 : i64
    %1 = llvm.select %arg0, %arg1, %0 : i1, i64
    %2 = llvm.icmp "eq" %1, %arg2 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.icmp "sge" %1, %arg0 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.or %arg0, %0 : i64
    %2 = llvm.icmp "sle" %arg0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.ashr exact %0, %arg2 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.sdiv exact %0, %arg2 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.ashr %arg0, %arg0 : i64
    %1 = llvm.sdiv %0, %0 : i64
    %2 = llvm.xor %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.xor %0, %arg2 : i64
    %2 = llvm.icmp "ult" %arg0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.icmp "sle" %1, %arg0 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg1, %arg2 : i64
    %1 = llvm.select %arg0, %arg1, %0 : i1, i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.or %arg1, %arg0 : i64
    %2 = llvm.srem %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv %arg1, %arg2 : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.and %1, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
    %1 = llvm.ashr exact %arg1, %0 : i64
    %2 = llvm.lshr %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.ashr %arg0, %arg0 : i64
    %1 = llvm.srem %0, %arg0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.ashr %arg0, %arg1 : i64
    %1 = llvm.sdiv %arg2, %0 : i64
    %2 = llvm.icmp "eq" %0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.sdiv exact %arg2, %arg2 : i64
    %2 = llvm.urem %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.sdiv %arg0, %arg0 : i64
    %1 = llvm.xor %0, %arg1 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.or %0, %arg0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.sdiv %1, %arg1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i32 {
    %0 = llvm.icmp "sge" %arg0, %arg0 : i64
    %1 = llvm.select %0, %arg0, %arg0 : i1, i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.urem %arg1, %arg0 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.trunc %arg1 : i64 to i1
    %1 = llvm.select %0, %arg2, %arg2 : i1, i64
    %2 = llvm.icmp "ule" %arg0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.icmp "ule" %1, %arg1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.xor %arg1, %arg0 : i64
    %1 = llvm.ashr %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.sdiv exact %arg1, %arg0 : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.sdiv exact %arg0, %0 : i64
    %2 = llvm.sdiv exact %1, %arg1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.sdiv %arg0, %arg0 : i64
    %1 = llvm.lshr %0, %arg1 : i64
    %2 = llvm.urem %1, %0 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.ashr exact %0, %arg1 : i64
    %2 = llvm.lshr exact %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.ashr exact %arg0, %arg1 : i64
    %1 = llvm.urem %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
    %0 = llvm.lshr exact %arg0, %arg1 : i64
    %1 = llvm.zext %arg2 : i32 to i64
    %2 = llvm.ashr %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.ashr %arg0, %arg0 : i64
    %1 = llvm.or disjoint %arg1, %0 : i64
    %2 = llvm.udiv %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.srem %arg1, %arg2 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.xor %0, %arg2 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.ashr %arg0, %arg1 : i64
    %1 = llvm.ashr %0, %arg2 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i32 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.srem %0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i1 {
    %0 = llvm.zext %arg1 : i32 to i64
    %1 = llvm.xor %0, %0 : i64
    %2 = llvm.icmp "sle" %arg0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.ashr exact %arg1, %arg1 : i64
    %1 = llvm.ashr %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg0 : i64
    %1 = llvm.ashr %0, %arg1 : i64
    %2 = llvm.srem %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i1 {
    %0 = llvm.zext %arg1 : i32 to i64
    %1 = llvm.or %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.lshr %arg0, %arg0 : i64
    %2 = llvm.icmp "ule" %0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64) -> i1 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.and %0, %arg1 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64) -> i1 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.urem %0, %arg1 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64) -> i1 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.sdiv %0, %0 : i64
    %2 = llvm.icmp "sge" %1, %arg1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.icmp "sge" %arg0, %arg1 : i64
    %1 = llvm.select %0, %arg2, %arg0 : i1, i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.xor %arg1, %arg2 : i64
    %1 = llvm.lshr %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.icmp "ule" %arg0, %arg1 : i64
    %1 = llvm.select %0, %arg1, %arg2 : i1, i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
    %1 = llvm.srem %0, %arg1 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i64 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.or %arg0, %0 : i64
    %2 = llvm.sdiv exact %arg0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i32, %arg2: i64) -> i32 {
    %0 = llvm.zext %arg1 : i32 to i64
    %1 = llvm.select %arg0, %0, %arg2 : i1, i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.icmp "ugt" %arg0, %arg1 : i64
    %1 = llvm.select %0, %arg0, %arg2 : i1, i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32) -> i32 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.udiv %0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.srem %arg1, %arg1 : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.udiv %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.ashr exact %0, %arg0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.icmp "ule" %arg0, %arg1 : i64
    %1 = llvm.select %0, %arg2, %arg0 : i1, i64
    %2 = llvm.icmp "sge" %arg0, %1 : i64
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i32 {
    %0 = llvm.zext %arg1 : i32 to i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.and %arg1, %arg0 : i64
    %1 = llvm.sdiv %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.sext %arg2 : i32 to i64
    %2 = llvm.udiv %0, %1 : i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i1
    %1 = llvm.or %arg1, %arg0 : i64
    %2 = llvm.select %0, %arg0, %1 : i1, i64
    return %2 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.trunc %1 : i64 to i1
    return %2 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64) -> i32 {
    %0 = llvm.sdiv %arg1, %arg1 : i64
    %1 = llvm.select %arg0, %0, %0 : i1, i64
    %2 = llvm.trunc %1 : i64 to i32
    return %2 : i32
  }
}
// -----
