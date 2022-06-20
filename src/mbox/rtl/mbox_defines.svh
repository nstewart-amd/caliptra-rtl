// SPDX-License-Identifier: Apache-2.0
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

`ifndef MBOX_DEFINES
`define MBOX_DEFINES

`include "caliptra_macros.svh"


//BOOT FSM
typedef enum logic [1:0] {
    BOOT_IDLE    = 2'b00,
    BOOT_FUSE    = 2'b01,
    BOOT_DONE    = 2'b11,
    BOOT_X       = 'x
} boot_fsm_state_e;

`endif