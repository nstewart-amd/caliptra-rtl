parameter el2_param_t pt = '{
	BHT_ADDR_HI            : 8'h09         ,
	BHT_ADDR_LO            : 6'h02         ,
	BHT_ARRAY_DEPTH        : 15'h0100       ,
	BHT_GHR_HASH_1         : 5'h00         ,
	BHT_GHR_SIZE           : 8'h08         ,
	BHT_SIZE               : 16'h0200       ,
	BITMANIP_ZBA           : 5'h01         ,
	BITMANIP_ZBB           : 5'h01         ,
	BITMANIP_ZBC           : 5'h01         ,
	BITMANIP_ZBE           : 5'h00         ,
	BITMANIP_ZBF           : 5'h00         ,
	BITMANIP_ZBP           : 5'h00         ,
	BITMANIP_ZBR           : 5'h00         ,
	BITMANIP_ZBS           : 5'h01         ,
	BTB_ADDR_HI            : 9'h009        ,
	BTB_ADDR_LO            : 6'h02         ,
	BTB_ARRAY_DEPTH        : 13'h0100       ,
	BTB_BTAG_FOLD          : 5'h00         ,
	BTB_BTAG_SIZE          : 9'h005        ,
	BTB_ENABLE             : 5'h01         ,
	BTB_FOLD2_INDEX_HASH   : 5'h00         ,
	BTB_FULLYA             : 5'h00         ,
	BTB_INDEX1_HI          : 9'h009        ,
	BTB_INDEX1_LO          : 9'h002        ,
	BTB_INDEX2_HI          : 9'h011        ,
	BTB_INDEX2_LO          : 9'h00A        ,
	BTB_INDEX3_HI          : 9'h019        ,
	BTB_INDEX3_LO          : 9'h012        ,
	BTB_SIZE               : 14'h0200       ,
	BTB_TOFFSET_SIZE       : 9'h00C        ,
	BUILD_AHB_LITE         : 5'h01         ,
	BUILD_AXI4             : 4'h0          ,
	BUILD_AXI_NATIVE       : 5'h01         ,
	BUS_PRTY_DEFAULT       : 6'h03         ,
	DATA_ACCESS_ADDR0      : 36'h000000000  ,
	DATA_ACCESS_ADDR1      : 36'h000000000  ,
	DATA_ACCESS_ADDR2      : 36'h000000000  ,
	DATA_ACCESS_ADDR3      : 36'h000000000  ,
	DATA_ACCESS_ADDR4      : 36'h000000000  ,
	DATA_ACCESS_ADDR5      : 36'h000000000  ,
	DATA_ACCESS_ADDR6      : 36'h000000000  ,
	DATA_ACCESS_ADDR7      : 36'h000000000  ,
	DATA_ACCESS_ENABLE0    : 5'h00         ,
	DATA_ACCESS_ENABLE1    : 5'h00         ,
	DATA_ACCESS_ENABLE2    : 5'h00         ,
	DATA_ACCESS_ENABLE3    : 5'h00         ,
	DATA_ACCESS_ENABLE4    : 5'h00         ,
	DATA_ACCESS_ENABLE5    : 5'h00         ,
	DATA_ACCESS_ENABLE6    : 5'h00         ,
	DATA_ACCESS_ENABLE7    : 5'h00         ,
	DATA_ACCESS_MASK0      : 36'h0FFFFFFFF  ,
	DATA_ACCESS_MASK1      : 36'h0FFFFFFFF  ,
	DATA_ACCESS_MASK2      : 36'h0FFFFFFFF  ,
	DATA_ACCESS_MASK3      : 36'h0FFFFFFFF  ,
	DATA_ACCESS_MASK4      : 36'h0FFFFFFFF  ,
	DATA_ACCESS_MASK5      : 36'h0FFFFFFFF  ,
	DATA_ACCESS_MASK6      : 36'h0FFFFFFFF  ,
	DATA_ACCESS_MASK7      : 36'h0FFFFFFFF  ,
	DCCM_BANK_BITS         : 7'h02         ,
	DCCM_BITS              : 9'h010        ,
	DCCM_BYTE_WIDTH        : 7'h04         ,
	DCCM_DATA_WIDTH        : 10'h020        ,
	DCCM_ECC_WIDTH         : 7'h07         ,
	DCCM_ENABLE            : 5'h01         ,
	DCCM_FDATA_WIDTH       : 10'h027        ,
	DCCM_INDEX_BITS        : 8'h0C         ,
	DCCM_NUM_BANKS         : 9'h004        ,
	DCCM_REGION            : 8'h0F         ,
	DCCM_SADR              : 36'h0F0040000  ,
	DCCM_SIZE              : 14'h0040       ,
	DCCM_WIDTH_BITS        : 6'h02         ,
	DIV_BIT                : 7'h04         ,
	DIV_NEW                : 5'h01         ,
	DMA_BUF_DEPTH          : 7'h05         ,
	DMA_BUS_ID             : 9'h001        ,
	DMA_BUS_PRTY           : 6'h02         ,
	DMA_BUS_TAG            : 8'h01         ,
	FAST_INTERRUPT_REDIRECT : 5'h01         ,
	ICACHE_2BANKS          : 5'h01         ,
	ICACHE_BANK_BITS       : 7'h01         ,
	ICACHE_BANK_HI         : 7'h03         ,
	ICACHE_BANK_LO         : 6'h03         ,
	ICACHE_BANK_WIDTH      : 8'h08         ,
	ICACHE_BANKS_WAY       : 7'h02         ,
	ICACHE_BEAT_ADDR_HI    : 8'h05         ,
	ICACHE_BEAT_BITS       : 8'h03         ,
	ICACHE_BYPASS_ENABLE   : 5'h01         ,
	ICACHE_DATA_DEPTH      : 18'h00200      ,
	ICACHE_DATA_INDEX_LO   : 7'h04         ,
	ICACHE_DATA_WIDTH      : 11'h040        ,
	ICACHE_ECC             : 5'h01         ,
	ICACHE_ENABLE          : 5'h01         ,
	ICACHE_FDATA_WIDTH     : 11'h047        ,
	ICACHE_INDEX_HI        : 9'h00C        ,
	ICACHE_LN_SZ           : 11'h040        ,
	ICACHE_NUM_BEATS       : 8'h08         ,
	ICACHE_NUM_BYPASS      : 8'h02         ,
	ICACHE_NUM_BYPASS_WIDTH : 8'h02         ,
	ICACHE_NUM_WAYS        : 7'h02         ,
	ICACHE_ONLY            : 5'h00         ,
	ICACHE_SCND_LAST       : 8'h06         ,
	ICACHE_SIZE            : 13'h0010       ,
	ICACHE_STATUS_BITS     : 7'h01         ,
	ICACHE_TAG_BYPASS_ENABLE : 5'h01         ,
	ICACHE_TAG_DEPTH       : 17'h00080      ,
	ICACHE_TAG_INDEX_LO    : 7'h06         ,
	ICACHE_TAG_LO          : 9'h00D        ,
	ICACHE_TAG_NUM_BYPASS  : 8'h02         ,
	ICACHE_TAG_NUM_BYPASS_WIDTH : 8'h02         ,
	ICACHE_WAYPACK         : 5'h01         ,
	ICCM_BANK_BITS         : 7'h02         ,
	ICCM_BANK_HI           : 9'h003        ,
	ICCM_BANK_INDEX_LO     : 9'h004        ,
	ICCM_BITS              : 9'h010        ,
	ICCM_ENABLE            : 5'h01         ,
	ICCM_ICACHE            : 5'h01         ,
	ICCM_INDEX_BITS        : 8'h0C         ,
	ICCM_NUM_BANKS         : 9'h004        ,
	ICCM_ONLY              : 5'h00         ,
	ICCM_REGION            : 8'h0E         ,
	ICCM_SADR              : 36'h0EE000000  ,
	ICCM_SIZE              : 14'h0040       ,
	IFU_BUS_ID             : 5'h01         ,
	IFU_BUS_PRTY           : 6'h02         ,
	IFU_BUS_TAG            : 8'h03         ,
	INST_ACCESS_ADDR0      : 36'h000000000  ,
	INST_ACCESS_ADDR1      : 36'h000000000  ,
	INST_ACCESS_ADDR2      : 36'h000000000  ,
	INST_ACCESS_ADDR3      : 36'h000000000  ,
	INST_ACCESS_ADDR4      : 36'h000000000  ,
	INST_ACCESS_ADDR5      : 36'h000000000  ,
	INST_ACCESS_ADDR6      : 36'h000000000  ,
	INST_ACCESS_ADDR7      : 36'h000000000  ,
	INST_ACCESS_ENABLE0    : 5'h00         ,
	INST_ACCESS_ENABLE1    : 5'h00         ,
	INST_ACCESS_ENABLE2    : 5'h00         ,
	INST_ACCESS_ENABLE3    : 5'h00         ,
	INST_ACCESS_ENABLE4    : 5'h00         ,
	INST_ACCESS_ENABLE5    : 5'h00         ,
	INST_ACCESS_ENABLE6    : 5'h00         ,
	INST_ACCESS_ENABLE7    : 5'h00         ,
	INST_ACCESS_MASK0      : 36'h0FFFFFFFF  ,
	INST_ACCESS_MASK1      : 36'h0FFFFFFFF  ,
	INST_ACCESS_MASK2      : 36'h0FFFFFFFF  ,
	INST_ACCESS_MASK3      : 36'h0FFFFFFFF  ,
	INST_ACCESS_MASK4      : 36'h0FFFFFFFF  ,
	INST_ACCESS_MASK5      : 36'h0FFFFFFFF  ,
	INST_ACCESS_MASK6      : 36'h0FFFFFFFF  ,
	INST_ACCESS_MASK7      : 36'h0FFFFFFFF  ,
	LOAD_TO_USE_PLUS1      : 5'h00         ,
	LSU2DMA                : 5'h00         ,
	LSU_BUS_ID             : 5'h01         ,
	LSU_BUS_PRTY           : 6'h02         ,
	LSU_BUS_TAG            : 8'h03         ,
	LSU_NUM_NBLOAD         : 9'h004        ,
	LSU_NUM_NBLOAD_WIDTH   : 7'h02         ,
	LSU_SB_BITS            : 9'h010        ,
	LSU_STBUF_DEPTH        : 8'h04         ,
	NO_ICCM_NO_ICACHE      : 5'h00         ,
	PIC_2CYCLE             : 5'h00         ,
	PIC_BASE_ADDR          : 36'h0F00C0000  ,
	PIC_BITS               : 9'h00F        ,
	PIC_INT_WORDS          : 8'h01         ,
	PIC_REGION             : 8'h0F         ,
	PIC_SIZE               : 13'h0020       ,
	PIC_TOTAL_INT          : 12'h01F        ,
	PIC_TOTAL_INT_PLUS1    : 13'h0020       ,
	RET_STACK_SIZE         : 8'h08         ,
	SB_BUS_ID              : 5'h01         ,
	SB_BUS_PRTY            : 6'h02         ,
	SB_BUS_TAG             : 8'h01         ,
	TIMER_LEGAL_EN         : 5'h01         
}
// parameter el2_param_t pt = 2271'h04840400010040010840000020908200002840004808220A0C848200060410C00000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFFFFFC3FFFFFFFC3FFFFFFFC3FFFFFFFC3FFFFFFFC3FFFFFFFC3FFFFFFFC3FFFFFFFC104020401C213860103C3C01000000400820428042010840830C2010281840200081002108E0C0801004040800C01002100400606810104100C0810084300800E0EE00000001002101800000000000000000000000000000000000000000000000000000000000000000000000000000000007FFFFFFF87FFFFFFF87FFFFFFF87FFFFFFF87FFFFFFF87FFFFFFF87FFFFFFF87FFFFFFF8001080C080820080007806000003C043C04003E02008084021
