// SPDX-License-Identifier: Apache-2.0
// Copyright 2019 Western Digital Corporation or its affiliates.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

// Assembly code for Hello World
// Not using only ALU ops for creating the string


#include "../includes/defines.h"

#define STDOUT 0xd0580000
#define SHA512_CNTRL 0x40000010
#define SHA512_NAME  0x40000000
#define SHA512_VER   0x40000008

// Code to execute
.section .text
.global _start
_start:

    // Clear minstret
    csrw minstret, zero
    csrw minstreth, zero

    // Set up MTVEC - not expecting to use it though
    li x1, RV_ICCM_SADR
    csrw mtvec, x1


    // Enable Caches in MRAC
    li x1, 0x5f555555
    csrw 0x7c0, x1

    // Load string from hw_data
    // and write to stdout address

    li x3, SHA512_CNTRL
    la x4, hw_data

// Write data into SHA512 register
    lw x5, 0(x4)
    sw x5, 0(x3)
   
// Read the data back from SHA512 Address Version register
    li x3, SHA512_NAME
    lw x1, 0(x3)
    addi x3, x3, 8 
    lw x1, 0(x3)
    addi x3, x3, 8
    lw x1, 0(x3)

// Write 0xff to STDOUT for TB to termiate test.
_finish:
    li x3, STDOUT
    addi x5, x0, 0xff
    sb x5, 0(x3)
    beq x0, x0, _finish
.rept 100
    nop
.endr

.data
hw_data:
.ascii "----------------------------------\n"
.ascii "Hello World from SweRV EL2 @WDC !!\n"
.ascii "----------------------------------\n"
.byte 0