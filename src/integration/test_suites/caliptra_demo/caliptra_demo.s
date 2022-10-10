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


#include "../includes/caliptra_defines.h"

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
    li x1, 0xaaaaaaaa
    csrw 0x7c0, x1

    // Write IV
    li x3, AES_ADDR_IV_START
    li x1, AES_ADDR_IV_END
    la x4, iv_data_uds
    write_uds_IV_loop:
        lw x5, 0(x4)
        sw x5, 0(x3)
        addi x4, x4, 4
        addi x3, x3, 4
        ble x3, x1, write_uds_IV_loop

    //start UDS and store in KV0
    li x3, AES_ADDR_KV_CTRL
    li x1, 0x00000001
    sw x1, 0(x3)

    // Check that UDS flow is done
    li x3, AES_ADDR_KV_CTRL
    li x1, 0x00000020
    uds_done_poll_loop:
        lw x5, 0(x3)
        and x5, x5, x1
        bne x5, x1, uds_done_poll_loop

   // Write IV
    li x3, AES_ADDR_IV_START
    li x1, AES_ADDR_IV_END
    la x4, iv_data_fe
    write_fe_IV_loop:
        lw x5, 0(x4)
        sw x5, 0(x3)
        addi x4, x4, 4
        addi x3, x3, 4
        ble x3, x1, write_fe_IV_loop

    //start FE and store in KV6/7
    li x3, AES_ADDR_KV_CTRL
    li x1, 0x0000001A
    sw x1, 0(x3)

    // Check that FE flow is done
    li x3, AES_ADDR_KV_CTRL
    li x1, 0x00000020
    fe_done_poll_loop:
        lw x5, 0(x3)
        and x5, x5, x1
        bne x5, x1, fe_done_poll_loop

    // Clear Secrets
    li x3, MBOX_CLEAR_SECRETS
    li x1, 0x00000001
    sw x1, 0(x3)

    //-------
    //CDI IDEVID
    //-------

    // Load key from hw_data and write to PCR
    li x3, KV_BASE_ADDR
    li x2, HMAC_KEY_NUM_DWORDS
    li x1, 0x00000000
    la x4, hw_data
    write_key_loop:
        lw x5, 0(x4)
        sw x5, 0(x3)
        addi x4, x4, 4
        addi x3, x3, 4
        addi x1, x1, 1
        bne x2, x1, write_key_loop

    // Program HMAC_ADDR_KV_CTRL
    li x3, HMAC_ADDR_KV_CTRL
    li x4, 0x07014111
    sw x4, 0(x3)

    // Check that HMAC KEY and BLOCK are loaded
    li x3, HMAC_ADDR_KV_CTRL
    li x1, 0x60000000
    key_done_poll_loop:
        lw x5, 0(x3)
        and x5, x5, x1
        bne x5, x1, key_done_poll_loop

    // Enable HMAC core
    li x3, HMAC_ADDR_CNTRL
    li x4, HMAC_INIT
    sw x4, 0(x3)

    // wait for HMAC process - check dest done
    li x3, HMAC_ADDR_KV_CTRL
    li x1, 0x80000000
    dest_done_loop:
        lw x5, 0(x3)
        and x5, x5, x1
        bne x5, x1, dest_done_loop

    //ecc stuff would be here

    //-------
    //CDI LDEVID
    //-------

    // Program HMAC_ADDR_KV_CTRL
    li x3, HMAC_ADDR_KV_CTRL
    li x4, 0x0701ED01
    sw x4, 0(x3)

    // Check that HMAC KEY and BLOCK are loaded
    li x3, HMAC_ADDR_KV_CTRL
    li x1, 0x60000000
    key_done2_poll_loop:
        lw x5, 0(x3)
        and x5, x5, x1
        bne x5, x1, key_done2_poll_loop

    // Enable HMAC core
    li x3, HMAC_ADDR_CNTRL
    li x4, HMAC_INIT
    sw x4, 0(x3)

    // wait for HMAC process
    li x3, HMAC_ADDR_STATUS
    li x1, HMAC_VALID
    ready_loop:
        lw x5, 0(x3)
        bne x5, x1, ready_loop

    // Write PAD for 1024 size block
    // FE is 1024 so we did init with the full data
    // Now we need to do next with a full pad and size 
    li x3, HMAC_ADDR_BLOCK_START
    li x1, HMAC_ADDR_BLOCK_END
    la x4, pad_block
    write_block_loop:
        lw x5, 0(x4)
        sw x5, 0(x3)
        addi x4, x4, 4
        addi x3, x3, 4
        ble x3, x1, write_block_loop

    // Give the next command to HMAC core
    li x3, HMAC_ADDR_CNTRL
    li x4, HMAC_NEXT
    sw x4, 0(x3)

    // wait for HMAC process - check dest done
    li x3, HMAC_ADDR_KV_CTRL
    li x1, 0x80000000
    dest_done2_loop:
        lw x5, 0(x3)
        and x5, x5, x1
        bne x5, x1, dest_done2_loop

    //set ready for FW
    li x3, MBOX_FLOW_STATUS
    li x4, 0x40000000
    sw x4, 0(x3)

.rept 99
    nop
.endr

    //poll for mbox data avail
    li x3, MBOX_ADDR_EXECUTE
    li x1, 0x00000001
    fw_avail_loop:
        lw x5, 0(x3)
        and x5, x5, x1
        bne x5, x1, fw_avail_loop

    //read mbox command
    li x3, MBOX_ADDR_CMD
    lw x5, 0(x3)

    //read mbox dlen
    li x3, MBOX_ADDR_DLEN
    lw x6, 0(x3)

    //read from mbox
    li x3, MBOX_ADDR_DATAOUT
    li x7, 0x00000001
    read_mbox_loop:
        lw x8, 0(x3)
        addi x7, x7, 4
        ble x7, x6, read_mbox_loop

    //clear FE 
    li x3, KV_KEY_CTRL_ADDR
    addi x3, x3, 24
    li x5, 0x00000008
    sw x5, 0(x3)
    addi x3, x3, 4
    sw x5, 0(x3)

    //set ready for runtime
    li x3, MBOX_FLOW_STATUS
    li x4, 0x80000000
    sw x4, 0(x3)

.rept 99
    nop
.endr

    beq x0, x0, _finish_pass

// Write 0x01 to STDOUT for TB to terminate test with fail.
_finish_fail:
    li x3, STDOUT
    addi x5, x0, 0x01
    sb x5, 0(x3)
    beq x0, x0, _finish_fail

// Write 0xff to STDOUT for TB to terminate test with pass.
_finish_pass:
    li x3, STDOUT
    addi x5, x0, 0xff
    sb x5, 0(x3)
    beq x0, x0, _finish_pass
.rept 99
    nop
.endr

.data
fw_blob:
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
iv_data_uds:
.word 0x2eb94297
.word 0x77285196
.word 0x3dd39a1e
.word 0xb95d438f
iv_data_fe:
.word 0x14451624
.word 0x6a752c32
.word 0x9056d884
.word 0xdaf3c89d
hw_data:
//this is the key 384-bit
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
.word 0x0b0b0b0b
//this is the pad block 1024-bit
pad_block:
.word 0x80000000
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
.word 0x00000800