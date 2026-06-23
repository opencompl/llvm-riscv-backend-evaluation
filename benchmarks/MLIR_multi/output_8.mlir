module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.ashr exact %arg0, %2 : i64
    %4 = llvm.or disjoint %arg1, %arg2 : i64
    %5 = llvm.udiv %4, %arg2 : i64
    %6 = llvm.and %3, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i32, %arg2: i1) -> i64 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.srem %0, %2 : i64
    %4 = llvm.sext %arg1 : i32 to i64
    %5 = llvm.select %arg2, %0, %4 : i1, i64
    %6 = llvm.srem %4, %5 : i64
    %7 = llvm.srem %3, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i64 {
    %0 = llvm.sext %arg1 : i32 to i64
    %1 = llvm.and %0, %0 : i64
    %2 = llvm.sext %arg1 : i32 to i64
    %3 = llvm.urem %arg2, %2 : i64
    %4 = llvm.lshr exact %1, %3 : i64
    %5 = llvm.and %arg0, %4 : i64
    %6 = llvm.urem %arg2, %0 : i64
    %7 = llvm.urem %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.ashr exact %1, %arg1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.urem %arg0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) -> i1 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.lshr exact %arg2, %arg1 : i64
    %2 = llvm.ashr exact %0, %1 : i64
    %3 = llvm.select %arg3, %arg2, %arg0 : i1, i64
    %4 = llvm.ashr %3, %2 : i64
    %5 = llvm.or %2, %4 : i64
    %6 = llvm.urem %arg2, %5 : i64
    %7 = llvm.icmp "ult" %5, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.ashr exact %arg1, %arg1 : i64
    %1 = llvm.lshr exact %arg1, %arg2 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.srem %0, %3 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.icmp "ne" %arg0, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64, %arg3: i1) -> i64 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.select %arg3, %arg2, %0 : i1, i64
    %2 = llvm.or %arg2, %1 : i64
    %3 = llvm.srem %2, %1 : i64
    %4 = llvm.xor %2, %3 : i64
    %5 = llvm.udiv %4, %2 : i64
    %6 = llvm.srem %arg1, %5 : i64
    %7 = llvm.ashr exact %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64, %arg3: i1) -> i64 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.and %arg1, %0 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.select %arg3, %1, %2 : i1, i64
    %4 = llvm.and %arg1, %3 : i64
    %5 = llvm.and %2, %4 : i64
    %6 = llvm.urem %arg2, %5 : i64
    %7 = llvm.or %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i1 {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.xor %1, %arg2 : i64
    %3 = llvm.and %arg1, %arg1 : i64
    %4 = llvm.zext %arg3 : i32 to i64
    %5 = llvm.and %4, %arg0 : i64
    %6 = llvm.or %3, %5 : i64
    %7 = llvm.icmp "eq" %2, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.ashr exact %arg0, %arg1 : i64
    %1 = llvm.trunc %arg2 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.urem %2, %0 : i64
    %4 = llvm.and %0, %arg1 : i64
    %5 = llvm.udiv %3, %4 : i64
    %6 = llvm.srem %5, %4 : i64
    %7 = llvm.sdiv %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.or %arg0, %0 : i64
    %2 = llvm.xor %1, %arg2 : i64
    %3 = llvm.trunc %2 : i64 to i1
    %4 = llvm.lshr %0, %arg2 : i64
    %5 = llvm.icmp "slt" %4, %2 : i64
    %6 = llvm.select %5, %0, %2 : i1, i64
    %7 = llvm.select %3, %6, %arg2 : i1, i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i32 {
    %0 = llvm.lshr %arg0, %arg1 : i64
    %1 = llvm.ashr %arg0, %arg2 : i64
    %2 = llvm.urem %arg0, %1 : i64
    %3 = llvm.urem %2, %0 : i64
    %4 = llvm.sdiv %0, %3 : i64
    %5 = llvm.zext %arg3 : i32 to i64
    %6 = llvm.and %4, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.trunc %arg2 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.lshr %0, %2 : i64
    %4 = llvm.and %arg0, %0 : i64
    %5 = llvm.sdiv exact %arg1, %4 : i64
    %6 = llvm.lshr %3, %5 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.or disjoint %0, %arg1 : i64
    %4 = llvm.and %arg0, %3 : i64
    %5 = llvm.xor %2, %4 : i64
    %6 = llvm.trunc %5 : i64 to i32
    %7 = llvm.zext %6 : i32 to i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32, %arg3: i1) -> i1 {
    %0 = llvm.sext %arg2 : i32 to i64
    %1 = llvm.ashr exact %arg1, %0 : i64
    %2 = llvm.udiv %arg0, %1 : i64
    %3 = llvm.urem %2, %arg0 : i64
    %4 = llvm.select %arg3, %arg1, %arg0 : i1, i64
    %5 = llvm.lshr exact %4, %3 : i64
    %6 = llvm.urem %3, %5 : i64
    %7 = llvm.icmp "ule" %2, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i32 {
    %0 = llvm.ashr %arg0, %arg1 : i64
    %1 = llvm.urem %0, %arg1 : i64
    %2 = llvm.icmp "ult" %arg0, %1 : i64
    %3 = llvm.sdiv %arg0, %0 : i64
    %4 = llvm.select %2, %arg2, %3 : i1, i64
    %5 = llvm.zext %arg3 : i32 to i64
    %6 = llvm.and %4, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i64 {
    %0 = llvm.sext %arg1 : i32 to i64
    %1 = llvm.or disjoint %arg0, %0 : i64
    %2 = llvm.srem %0, %arg2 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.zext %3 : i32 to i64
    %5 = llvm.urem %arg0, %4 : i64
    %6 = llvm.urem %5, %arg2 : i64
    %7 = llvm.sdiv exact %1, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.urem %0, %arg1 : i64
    %2 = llvm.urem %arg1, %0 : i64
    %3 = llvm.sdiv exact %arg2, %0 : i64
    %4 = llvm.and %2, %3 : i64
    %5 = llvm.xor %arg1, %4 : i64
    %6 = llvm.ashr %1, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.lshr exact %arg1, %arg2 : i64
    %3 = llvm.urem %1, %2 : i64
    %4 = llvm.lshr exact %1, %3 : i64
    %5 = llvm.trunc %arg2 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.icmp "ult" %4, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.or %arg0, %arg1 : i64
    %1 = llvm.or disjoint %0, %arg2 : i64
    %2 = llvm.urem %1, %0 : i64
    %3 = llvm.trunc %2 : i64 to i1
    %4 = llvm.select %3, %arg2, %2 : i1, i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.icmp "ugt" %6, %4 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.ashr %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg2 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    %4 = llvm.lshr exact %3, %1 : i64
    %5 = llvm.udiv %0, %4 : i64
    %6 = llvm.and %5, %arg0 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.trunc %arg1 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.srem %arg0, %1 : i64
    %3 = llvm.udiv %arg2, %arg1 : i64
    %4 = llvm.and %2, %3 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i1
    %1 = llvm.lshr %arg0, %arg0 : i64
    %2 = llvm.ashr exact %1, %arg2 : i64
    %3 = llvm.urem %arg1, %2 : i64
    %4 = llvm.lshr %arg2, %arg1 : i64
    %5 = llvm.select %0, %4, %arg0 : i1, i64
    %6 = llvm.select %0, %3, %5 : i1, i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.udiv %1, %arg0 : i64
    %3 = llvm.sdiv %arg1, %1 : i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.zext %4 : i32 to i64
    %6 = llvm.srem %2, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.trunc %arg1 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.trunc %arg2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    %5 = llvm.udiv %arg2, %4 : i64
    %6 = llvm.lshr exact %2, %5 : i64
    %7 = llvm.icmp "sle" %0, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64, %arg3: i32) -> i1 {
    %0 = llvm.select %arg1, %arg0, %arg2 : i1, i64
    %1 = llvm.sdiv exact %arg0, %0 : i64
    %2 = llvm.sext %arg3 : i32 to i64
    %3 = llvm.lshr exact %1, %2 : i64
    %4 = llvm.lshr exact %3, %2 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i64 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.sext %arg1 : i32 to i64
    %2 = llvm.udiv %arg0, %1 : i64
    %3 = llvm.and %2, %arg2 : i64
    %4 = llvm.ashr exact %3, %2 : i64
    %5 = llvm.udiv %2, %4 : i64
    %6 = llvm.ashr %0, %5 : i64
    %7 = llvm.sdiv %6, %4 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
    %0 = llvm.select %arg1, %arg0, %arg2 : i1, i64
    %1 = llvm.ashr exact %0, %arg0 : i64
    %2 = llvm.and %arg0, %1 : i64
    %3 = llvm.lshr exact %arg0, %arg0 : i64
    %4 = llvm.ashr exact %2, %3 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.urem %arg0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i1
    %1 = llvm.zext %arg1 : i32 to i64
    %2 = llvm.select %0, %1, %arg2 : i1, i64
    %3 = llvm.zext %arg1 : i32 to i64
    %4 = llvm.ashr exact %2, %3 : i64
    %5 = llvm.trunc %arg2 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.icmp "uge" %4, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) -> i32 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.srem %arg2, %arg0 : i64
    %2 = llvm.xor %0, %1 : i64
    %3 = llvm.xor %arg2, %arg1 : i64
    %4 = llvm.select %arg3, %0, %3 : i1, i64
    %5 = llvm.srem %2, %4 : i64
    %6 = llvm.lshr %5, %arg0 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i1 {
    %0 = llvm.xor %arg0, %arg0 : i64
    %1 = llvm.zext %arg1 : i32 to i64
    %2 = llvm.and %0, %1 : i64
    %3 = llvm.ashr %arg0, %2 : i64
    %4 = llvm.and %3, %arg2 : i64
    %5 = llvm.lshr %2, %4 : i64
    %6 = llvm.ashr %3, %5 : i64
    %7 = llvm.icmp "slt" %2, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg1, %arg0 : i64
    %1 = llvm.udiv %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.lshr %1, %arg2 : i64
    %5 = llvm.icmp "ult" %3, %4 : i64
    %6 = llvm.srem %3, %0 : i64
    %7 = llvm.select %5, %arg2, %6 : i1, i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i1, %arg2: i64) -> i32 {
    %0 = llvm.select %arg1, %arg2, %arg2 : i1, i64
    %1 = llvm.and %arg2, %0 : i64
    %2 = llvm.lshr %1, %0 : i64
    %3 = llvm.lshr %0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.sext %4 : i32 to i64
    %6 = llvm.select %arg0, %5, %arg2 : i1, i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.urem %0, %arg2 : i64
    %2 = llvm.lshr %1, %0 : i64
    %3 = llvm.trunc %arg1 : i64 to i1
    %4 = llvm.select %3, %2, %1 : i1, i64
    %5 = llvm.urem %2, %4 : i64
    %6 = llvm.and %1, %5 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.ashr %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg1 : i64
    %2 = llvm.sdiv exact %arg2, %1 : i64
    %3 = llvm.or disjoint %0, %2 : i64
    %4 = llvm.or disjoint %0, %0 : i64
    %5 = llvm.sdiv exact %4, %2 : i64
    %6 = llvm.srem %3, %5 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg1, %arg0 : i64
    %1 = llvm.sdiv %0, %arg2 : i64
    %2 = llvm.lshr exact %arg0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64, %arg3: i32) -> i32 {
    %0 = llvm.urem %arg1, %arg2 : i64
    %1 = llvm.zext %arg3 : i32 to i64
    %2 = llvm.urem %1, %1 : i64
    %3 = llvm.xor %arg1, %2 : i64
    %4 = llvm.srem %3, %0 : i64
    %5 = llvm.sdiv exact %arg1, %4 : i64
    %6 = llvm.select %arg0, %0, %5 : i1, i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg0 : i64
    %2 = llvm.udiv %arg1, %1 : i64
    %3 = llvm.or %arg2, %2 : i64
    %4 = llvm.xor %1, %3 : i64
    %5 = llvm.urem %0, %4 : i64
    %6 = llvm.urem %5, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i64 {
    %0 = llvm.icmp "ule" %arg0, %arg1 : i64
    %1 = llvm.or %arg0, %arg1 : i64
    %2 = llvm.udiv %arg1, %arg2 : i64
    %3 = llvm.xor %1, %2 : i64
    %4 = llvm.xor %arg0, %3 : i64
    %5 = llvm.and %3, %4 : i64
    %6 = llvm.zext %arg3 : i32 to i64
    %7 = llvm.select %0, %5, %6 : i1, i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.ashr exact %arg0, %0 : i64
    %2 = llvm.select %arg1, %arg2, %arg0 : i1, i64
    %3 = llvm.and %2, %arg0 : i64
    %4 = llvm.or disjoint %3, %2 : i64
    %5 = llvm.udiv %4, %4 : i64
    %6 = llvm.or disjoint %1, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.icmp "uge" %1, %1 : i64
    %3 = llvm.select %2, %arg0, %arg0 : i1, i64
    %4 = llvm.or %arg0, %3 : i64
    %5 = llvm.ashr exact %arg2, %arg2 : i64
    %6 = llvm.or disjoint %arg1, %5 : i64
    %7 = llvm.ashr %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.icmp "sge" %arg0, %arg1 : i64
    %1 = llvm.select %0, %arg2, %arg0 : i1, i64
    %2 = llvm.ashr exact %arg2, %1 : i64
    %3 = llvm.and %arg0, %2 : i64
    %4 = llvm.xor %1, %3 : i64
    %5 = llvm.urem %1, %4 : i64
    %6 = llvm.select %0, %3, %5 : i1, i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i1
    %2 = llvm.lshr %0, %arg2 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.zext %3 : i32 to i64
    %5 = llvm.srem %0, %4 : i64
    %6 = llvm.lshr exact %5, %2 : i64
    %7 = llvm.select %1, %arg2, %6 : i1, i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i1, %arg2: i64) -> i32 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.select %arg1, %arg2, %0 : i1, i64
    %2 = llvm.ashr exact %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    %5 = llvm.urem %0, %arg2 : i64
    %6 = llvm.udiv %4, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.sdiv %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.urem %0, %0 : i64
    %4 = llvm.and %arg2, %3 : i64
    %5 = llvm.sdiv exact %arg1, %arg0 : i64
    %6 = llvm.or disjoint %4, %5 : i64
    %7 = llvm.icmp "sge" %2, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.lshr exact %arg0, %arg0 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.sext %arg1 : i32 to i64
    %4 = llvm.ashr %2, %3 : i64
    %5 = llvm.and %arg2, %arg2 : i64
    %6 = llvm.srem %5, %2 : i64
    %7 = llvm.lshr %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.icmp "ugt" %arg0, %arg1 : i64
    %1 = llvm.select %0, %arg0, %arg0 : i1, i64
    %2 = llvm.udiv %arg0, %arg2 : i64
    %3 = llvm.sdiv %1, %2 : i64
    %4 = llvm.sdiv exact %3, %arg0 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.trunc %0 : i64 to i1
    %2 = llvm.srem %0, %0 : i64
    %3 = llvm.select %1, %2, %arg1 : i1, i64
    %4 = llvm.xor %arg1, %arg1 : i64
    %5 = llvm.udiv %4, %arg2 : i64
    %6 = llvm.srem %3, %5 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.sdiv exact %arg0, %1 : i64
    %3 = llvm.udiv %arg0, %arg2 : i64
    %4 = llvm.lshr exact %arg1, %3 : i64
    %5 = llvm.urem %1, %arg1 : i64
    %6 = llvm.xor %4, %5 : i64
    %7 = llvm.srem %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i1, %arg3: i32) -> i32 {
    %0 = llvm.select %arg2, %arg0, %arg0 : i1, i64
    %1 = llvm.sext %arg3 : i32 to i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.and %arg1, %2 : i64
    %4 = llvm.select %arg2, %3, %arg0 : i1, i64
    %5 = llvm.and %3, %4 : i64
    %6 = llvm.and %arg0, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) -> i1 {
    %0 = llvm.ashr exact %arg0, %arg0 : i64
    %1 = llvm.sdiv %arg1, %arg2 : i64
    %2 = llvm.udiv %0, %1 : i64
    %3 = llvm.or disjoint %0, %2 : i64
    %4 = llvm.or %3, %3 : i64
    %5 = llvm.select %arg3, %4, %2 : i1, i64
    %6 = llvm.lshr exact %2, %5 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i32 {
    %0 = llvm.ashr %arg0, %arg1 : i64
    %1 = llvm.and %0, %0 : i64
    %2 = llvm.or disjoint %0, %1 : i64
    %3 = llvm.xor %arg2, %arg2 : i64
    %4 = llvm.zext %arg3 : i32 to i64
    %5 = llvm.lshr exact %3, %4 : i64
    %6 = llvm.sdiv exact %2, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.sdiv %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.urem %arg0, %2 : i64
    %4 = llvm.lshr exact %arg0, %3 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i1
    %1 = llvm.and %arg0, %arg0 : i64
    %2 = llvm.select %0, %1, %1 : i1, i64
    %3 = llvm.lshr exact %2, %arg1 : i64
    %4 = llvm.or %3, %arg1 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
    %0 = llvm.or %arg0, %arg0 : i64
    %1 = llvm.zext %arg2 : i32 to i64
    %2 = llvm.lshr %arg1, %1 : i64
    %3 = llvm.sext %arg2 : i32 to i64
    %4 = llvm.urem %2, %3 : i64
    %5 = llvm.and %4, %3 : i64
    %6 = llvm.srem %0, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.or %0, %arg2 : i64
    %2 = llvm.udiv %arg2, %0 : i64
    %3 = llvm.sdiv exact %1, %2 : i64
    %4 = llvm.udiv %arg0, %3 : i64
    %5 = llvm.urem %0, %4 : i64
    %6 = llvm.trunc %5 : i64 to i32
    %7 = llvm.zext %6 : i32 to i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.trunc %arg0 : i64 to i32
    %2 = llvm.zext %1 : i32 to i64
    %3 = llvm.or %arg1, %arg0 : i64
    %4 = llvm.urem %arg2, %3 : i64
    %5 = llvm.sdiv %2, %4 : i64
    %6 = llvm.srem %0, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.icmp "slt" %arg1, %arg2 : i64
    %3 = llvm.select %2, %0, %0 : i1, i64
    %4 = llvm.icmp "ugt" %3, %1 : i64
    %5 = llvm.select %4, %arg0, %3 : i1, i64
    %6 = llvm.or %3, %5 : i64
    %7 = llvm.icmp "sgt" %1, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.sdiv %arg1, %arg0 : i64
    %1 = llvm.and %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.urem %0, %1 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.icmp "slt" %3, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.udiv %arg2, %arg0 : i64
    %4 = llvm.udiv %2, %3 : i64
    %5 = llvm.srem %3, %arg1 : i64
    %6 = llvm.srem %4, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.trunc %arg1 : i64 to i1
    %3 = llvm.select %2, %arg2, %arg0 : i1, i64
    %4 = llvm.srem %arg1, %3 : i64
    %5 = llvm.xor %arg0, %4 : i64
    %6 = llvm.sdiv %1, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.trunc %arg1 : i64 to i32
    %1 = llvm.zext %0 : i32 to i64
    %2 = llvm.xor %1, %arg2 : i64
    %3 = llvm.or %arg0, %arg0 : i64
    %4 = llvm.srem %3, %1 : i64
    %5 = llvm.xor %2, %4 : i64
    %6 = llvm.lshr exact %arg0, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.udiv %arg1, %arg2 : i64
    %2 = llvm.sdiv %1, %arg2 : i64
    %3 = llvm.xor %0, %2 : i64
    %4 = llvm.trunc %arg2 : i64 to i32
    %5 = llvm.sext %4 : i32 to i64
    %6 = llvm.ashr %3, %5 : i64
    %7 = llvm.and %6, %arg2 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg1, %arg0 : i64
    %1 = llvm.icmp "ule" %0, %arg2 : i64
    %2 = llvm.lshr %arg1, %arg2 : i64
    %3 = llvm.sdiv exact %0, %2 : i64
    %4 = llvm.select %1, %arg1, %3 : i1, i64
    %5 = llvm.urem %arg0, %4 : i64
    %6 = llvm.lshr exact %3, %4 : i64
    %7 = llvm.icmp "ule" %5, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.lshr exact %arg0, %arg1 : i64
    %1 = llvm.or disjoint %arg1, %arg1 : i64
    %2 = llvm.udiv %1, %arg2 : i64
    %3 = llvm.xor %arg2, %arg0 : i64
    %4 = llvm.sdiv exact %3, %arg2 : i64
    %5 = llvm.urem %2, %4 : i64
    %6 = llvm.srem %0, %5 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.srem %arg1, %arg2 : i64
    %1 = llvm.lshr %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.zext %4 : i32 to i64
    %6 = llvm.srem %5, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.trunc %arg1 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.sdiv exact %0, %arg2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.zext %4 : i32 to i64
    %6 = llvm.srem %2, %5 : i64
    %7 = llvm.and %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.and %arg2, %arg0 : i64
    %2 = llvm.or %0, %1 : i64
    %3 = llvm.or %arg2, %2 : i64
    %4 = llvm.sdiv %0, %3 : i64
    %5 = llvm.and %3, %4 : i64
    %6 = llvm.or disjoint %0, %5 : i64
    %7 = llvm.icmp "uge" %6, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.sdiv %arg0, %arg0 : i64
    %1 = llvm.udiv %arg0, %0 : i64
    %2 = llvm.srem %1, %arg1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.sext %3 : i32 to i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.srem %arg0, %arg1 : i64
    %1 = llvm.udiv %arg2, %arg2 : i64
    %2 = llvm.sdiv exact %0, %1 : i64
    %3 = llvm.srem %0, %0 : i64
    %4 = llvm.or disjoint %1, %3 : i64
    %5 = llvm.sdiv exact %1, %4 : i64
    %6 = llvm.sdiv exact %5, %arg2 : i64
    %7 = llvm.srem %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i1, %arg2: i32) -> i1 {
    %0 = llvm.sext %arg2 : i32 to i64
    %1 = llvm.icmp "eq" %0, %arg0 : i64
    %2 = llvm.select %arg1, %arg0, %arg0 : i1, i64
    %3 = llvm.select %1, %0, %2 : i1, i64
    %4 = llvm.lshr exact %arg0, %0 : i64
    %5 = llvm.select %arg1, %3, %4 : i1, i64
    %6 = llvm.lshr exact %arg0, %5 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.or disjoint %arg0, %arg0 : i64
    %1 = llvm.icmp "sgt" %0, %arg1 : i64
    %2 = llvm.select %1, %0, %arg2 : i1, i64
    %3 = llvm.trunc %2 : i64 to i1
    %4 = llvm.trunc %2 : i64 to i1
    %5 = llvm.lshr %arg0, %2 : i64
    %6 = llvm.select %4, %arg2, %5 : i1, i64
    %7 = llvm.select %3, %2, %6 : i1, i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.xor %arg0, %arg0 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.zext %3 : i32 to i64
    %5 = llvm.udiv %4, %arg1 : i64
    %6 = llvm.ashr %1, %5 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.srem %arg1, %arg2 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.udiv %arg0, %2 : i64
    %4 = llvm.udiv %3, %3 : i64
    %5 = llvm.xor %4, %3 : i64
    %6 = llvm.ashr %3, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.and %0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i1
    %3 = llvm.udiv %arg0, %arg0 : i64
    %4 = llvm.or %3, %1 : i64
    %5 = llvm.and %arg1, %arg2 : i64
    %6 = llvm.select %2, %4, %5 : i1, i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.xor %arg2, %arg2 : i64
    %4 = llvm.and %2, %3 : i64
    %5 = llvm.trunc %arg2 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.or %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.sdiv %0, %arg1 : i64
    %2 = llvm.trunc %arg2 : i64 to i1
    %3 = llvm.select %2, %arg0, %arg2 : i1, i64
    %4 = llvm.srem %1, %3 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.xor %1, %arg1 : i64
    %3 = llvm.select %arg2, %2, %arg0 : i1, i64
    %4 = llvm.sdiv %arg1, %arg0 : i64
    %5 = llvm.srem %3, %4 : i64
    %6 = llvm.or disjoint %arg0, %5 : i64
    %7 = llvm.xor %2, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64, %arg3: i1) -> i64 {
    %0 = llvm.zext %arg0 : i32 to i64
    %1 = llvm.or %arg1, %arg2 : i64
    %2 = llvm.select %arg3, %arg1, %arg2 : i1, i64
    %3 = llvm.select %arg3, %arg2, %2 : i1, i64
    %4 = llvm.sdiv exact %2, %0 : i64
    %5 = llvm.lshr %3, %4 : i64
    %6 = llvm.urem %1, %5 : i64
    %7 = llvm.udiv %0, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i1 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.select %arg2, %arg0, %arg1 : i1, i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.zext %4 : i32 to i64
    %6 = llvm.sdiv exact %arg1, %5 : i64
    %7 = llvm.icmp "ult" %2, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.urem %arg2, %arg2 : i64
    %2 = llvm.lshr %arg2, %1 : i64
    %3 = llvm.or disjoint %arg1, %arg1 : i64
    %4 = llvm.srem %3, %2 : i64
    %5 = llvm.lshr exact %2, %4 : i64
    %6 = llvm.srem %0, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i1
    %1 = llvm.select %0, %arg0, %arg1 : i1, i64
    %2 = llvm.sdiv exact %arg2, %arg1 : i64
    %3 = llvm.ashr exact %1, %2 : i64
    %4 = llvm.and %3, %1 : i64
    %5 = llvm.sdiv exact %4, %arg1 : i64
    %6 = llvm.sdiv %3, %5 : i64
    %7 = llvm.ashr exact %4, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i32 {
    %0 = llvm.urem %arg0, %arg1 : i64
    %1 = llvm.select %arg2, %arg1, %arg1 : i1, i64
    %2 = llvm.icmp "sgt" %0, %1 : i64
    %3 = llvm.or %arg1, %arg1 : i64
    %4 = llvm.select %2, %3, %0 : i1, i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.udiv %arg0, %arg0 : i64
    %1 = llvm.sdiv exact %arg0, %arg1 : i64
    %2 = llvm.urem %0, %1 : i64
    %3 = llvm.ashr exact %0, %1 : i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.sext %4 : i32 to i64
    %6 = llvm.lshr exact %2, %5 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i32) -> i32 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.zext %arg1 : i32 to i64
    %3 = llvm.srem %arg0, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.sext %4 : i32 to i64
    %6 = llvm.and %1, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.and %arg0, %arg1 : i64
    %1 = llvm.trunc %0 : i64 to i1
    %2 = llvm.trunc %arg0 : i64 to i32
    %3 = llvm.zext %2 : i32 to i64
    %4 = llvm.urem %3, %arg2 : i64
    %5 = llvm.select %1, %4, %4 : i1, i64
    %6 = llvm.udiv %arg2, %3 : i64
    %7 = llvm.icmp "sgt" %5, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.zext %arg2 : i32 to i64
    %2 = llvm.lshr %0, %1 : i64
    %3 = llvm.and %arg1, %2 : i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.sext %4 : i32 to i64
    %6 = llvm.xor %2, %5 : i64
    %7 = llvm.icmp "sle" %6, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.urem %0, %arg1 : i64
    %2 = llvm.lshr %1, %arg1 : i64
    %3 = llvm.trunc %arg2 : i64 to i32
    %4 = llvm.zext %3 : i32 to i64
    %5 = llvm.ashr exact %2, %4 : i64
    %6 = llvm.trunc %5 : i64 to i32
    %7 = llvm.sext %6 : i32 to i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.xor %arg0, %0 : i64
    %2 = llvm.xor %arg1, %arg2 : i64
    %3 = llvm.xor %0, %2 : i64
    %4 = llvm.sdiv %1, %3 : i64
    %5 = llvm.srem %4, %arg1 : i64
    %6 = llvm.xor %arg2, %arg0 : i64
    %7 = llvm.icmp "ugt" %5, %6 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i32 {
    %0 = llvm.xor %arg0, %arg1 : i64
    %1 = llvm.and %arg1, %arg0 : i64
    %2 = llvm.sdiv exact %0, %1 : i64
    %3 = llvm.trunc %2 : i64 to i32
    %4 = llvm.zext %3 : i32 to i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.and %arg0, %arg0 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.icmp "eq" %arg0, %2 : i64
    %4 = llvm.select %3, %arg1, %arg2 : i1, i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.zext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64) -> i1 {
    %0 = llvm.srem %arg0, %arg0 : i64
    %1 = llvm.or disjoint %arg0, %0 : i64
    %2 = llvm.xor %1, %arg0 : i64
    %3 = llvm.udiv %1, %2 : i64
    %4 = llvm.sdiv %3, %arg1 : i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.icmp "sgt" %6, %1 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64) -> i64 {
    %0 = llvm.and %arg1, %arg1 : i64
    %1 = llvm.udiv %arg1, %0 : i64
    %2 = llvm.or %0, %1 : i64
    %3 = llvm.select %arg0, %arg1, %2 : i1, i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.sext %4 : i32 to i64
    %6 = llvm.and %5, %arg1 : i64
    %7 = llvm.urem %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.srem %arg1, %arg2 : i64
    %1 = llvm.trunc %0 : i64 to i32
    %2 = llvm.sext %1 : i32 to i64
    %3 = llvm.udiv %2, %arg1 : i64
    %4 = llvm.select %arg0, %2, %3 : i1, i64
    %5 = llvm.trunc %4 : i64 to i32
    %6 = llvm.sext %5 : i32 to i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i64 {
    %0 = llvm.sdiv exact %arg0, %arg1 : i64
    %1 = llvm.icmp "sgt" %0, %arg1 : i64
    %2 = llvm.ashr exact %arg2, %0 : i64
    %3 = llvm.sext %arg3 : i32 to i64
    %4 = llvm.srem %2, %3 : i64
    %5 = llvm.select %1, %0, %4 : i1, i64
    %6 = llvm.srem %arg2, %3 : i64
    %7 = llvm.ashr exact %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.ashr %arg0, %arg1 : i64
    %1 = llvm.icmp "uge" %0, %arg2 : i64
    %2 = llvm.urem %arg2, %arg1 : i64
    %3 = llvm.select %1, %arg1, %2 : i1, i64
    %4 = llvm.udiv %arg1, %0 : i64
    %5 = llvm.ashr exact %3, %4 : i64
    %6 = llvm.udiv %3, %5 : i64
    %7 = llvm.icmp "ugt" %6, %3 : i64
    return %7 : i1
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.srem %arg0, %0 : i64
    %2 = llvm.trunc %1 : i64 to i32
    %3 = llvm.sext %2 : i32 to i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.zext %4 : i32 to i64
    %6 = llvm.urem %arg2, %arg2 : i64
    %7 = llvm.udiv %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
    %0 = llvm.trunc %arg0 : i64 to i32
    %1 = llvm.sext %0 : i32 to i64
    %2 = llvm.xor %1, %arg1 : i64
    %3 = llvm.zext %arg2 : i32 to i64
    %4 = llvm.urem %3, %arg1 : i64
    %5 = llvm.or %2, %4 : i64
    %6 = llvm.sext %arg2 : i32 to i64
    %7 = llvm.udiv %5, %6 : i64
    return %7 : i64
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
    %0 = llvm.udiv %arg0, %arg1 : i64
    %1 = llvm.srem %0, %arg1 : i64
    %2 = llvm.or %0, %0 : i64
    %3 = llvm.xor %1, %2 : i64
    %4 = llvm.udiv %arg1, %arg2 : i64
    %5 = llvm.ashr exact %3, %4 : i64
    %6 = llvm.udiv %0, %5 : i64
    %7 = llvm.trunc %6 : i64 to i32
    return %7 : i32
  }
}
// -----
module {
  func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
    %0 = llvm.icmp "ugt" %arg0, %arg0 : i64
    %1 = llvm.or disjoint %arg1, %arg2 : i64
    %2 = llvm.lshr exact %1, %arg0 : i64
    %3 = llvm.sdiv exact %1, %2 : i64
    %4 = llvm.select %0, %3, %arg2 : i1, i64
    %5 = llvm.xor %4, %arg0 : i64
    %6 = llvm.urem %5, %3 : i64
    %7 = llvm.trunc %6 : i64 to i1
    return %7 : i1
  }
}
// -----
