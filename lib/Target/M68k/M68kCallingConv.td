//===----------------------------------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//
//===----------------------------------------------------------------------===//

def CC_M68k : CallingConv<[
  CCIfType<[i32, i64], CCAssignToStack<0, 0>>,
  // Bytes are passed word aligned
  CCIfType<[i8, i16], CCAssignToStack<2, 0>>
]>;

def RetCC_M68k : CallingConv<[
  // Return in D0
  CCIfType<[ i8], CCAssignToReg<[D0B]>>,
  CCIfType<[i16], CCAssignToReg<[D0W]>>,
  CCIfType<[i32], CCAssignToReg<[D0L]>>
]>;

//===----------------------------------------------------------------------===//
//  Callee Saved Registers
//===----------------------------------------------------------------------===//

def CSR : CalleeSavedRegs<(add (sequence "D%uL", 3, 7),
                               (sequence "A%u",  2, 7))>;
