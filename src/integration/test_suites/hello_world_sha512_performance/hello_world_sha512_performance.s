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
#define DCCM_SADR                   0xf0040000

#define SHA512_ADDR_NAME            0x40000000
#define SHA512_ADDR_VER             0x40000008
#define SHA512_ADDR_CNTRL           0x40000010
#define SHA512_ADDR_STATUS          0x40000018
#define SHA512_ADDR_BLOCK_START     0x40000080
#define SHA512_ADDR_BLOCK_END       0x400000ff
#define SHA512_ADDR_DIGEST_START    0x40000100
#define SHA512_ADDR_DIGEST_END      0x4000013f

#define SHA512_INIT                 0x0000000D
#define SHA512_NEXT                 0x0000000E
#define SHA512_VALID                0x00000003

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
    li x1, 0xafaaaaaa
    csrw 0x7c0, x1


    // Load block from hw_data and write to SHA512 core
    li x3, SHA512_ADDR_BLOCK_START
    li x1, SHA512_ADDR_BLOCK_END
    la x4, hw_data
    write_block_loop:
        lw x5, 0(x4)
        sw x5, 0(x3)
        addi x4, x4, 4
        addi x3, x3, 4
        ble x3, x1, write_block_loop

    // Enable SHA512 core
    li x3, SHA512_ADDR_CNTRL
    li x4, SHA512_INIT
    sw x4, 0(x3)

    // wait for SHA512 process
    li x3, SHA512_ADDR_STATUS
    li x1, SHA512_VALID
    ready_loop:
        lw x5, 0(x3)
        bne x5, x1, ready_loop

    // Read the data back from SHA512 register
    li x3, SHA512_ADDR_DIGEST_START
    li x1, SHA512_ADDR_DIGEST_END
    read_result_loop:
        lw x5, 0(x3)
        addi x3, x3, 4
        ble x3, x1, read_result_loop
        

// Write 0xff to STDOUT for TB to termiate test.
_finish:
    li x3, STDOUT
    addi x5, x0, 0xff
    sb x5, 0(x3)
    beq x0, x0, _finish
.rept 99
    nop
.endr

.data
hw_data:
.word 0x61626380
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000018
.ascii "----------------------------------\n"
.ascii "Hello World from SweRV EL2 @WDC !!\n"
.ascii "----------------------------------\n"
.byte 0