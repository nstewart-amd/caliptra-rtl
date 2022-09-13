# SPDX-License-Identifier: Apache-2.0
# Copyright 2020 Western Digital Corporation or its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
// startup code to support HLL programs

#include "../includes/defines.h"

.section .text.init
.global _start
_start:

    // Clear minstret
    csrw minstret, zero
    csrw minstreth, zero

    // Enable Caches in MRAC
    li t0, 0xaaaaaaaa
    csrw 0x7c0, t0

    // Initialize MTVEC to point to a dummy interrupt handler prior to entering
    // main and subsequent (more complex) initialization procedure
    la t0, early_trap_vector
    csrw mtvec, t0

    // Init. the stack and transfer operation to main
    la sp, STACK

    call main


.global _finish
// Write 0xff to STDOUT for TB to termiate test.
_finish:
    li x3, STDOUT
    addi x5, x0, 0xff
    sb x5, 0(x3)
    beq x0, x0, _finish
.rept 100
    nop
.endr

// From SiFive Interrupt Cookbook:
// https://sifive.cdn.prismic.io/sifive/0d163928-2128-42be-a75a-464df65e04e0_sifive-interrupt-cookbook.pdf
//
/* For sanity's sake we set up an early trap vector that just does nothing. If
* you end up here then there's a bug in the early boot code somewhere. */
.section .text.metal.init.trapvec
.align 2 /* Aligns to 4-bytes (log2(4) = 2) */
.global early_trap_vector
early_trap_vector:
.cfi_startproc
csrr t0, mcause
csrr t1, mepc
csrr t2, mtval
j early_trap_vector
.cfi_endproc

.section .data.io
.global tohost
tohost: .word 0
