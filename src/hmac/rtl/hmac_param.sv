  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  localparam BASE_ADDR        = 32'h10010000;
  
  localparam ADDR_NAME0       = BASE_ADDR + 32'h00000000;
  localparam ADDR_NAME1       = BASE_ADDR + 32'h00000004;
  localparam ADDR_VERSION0    = BASE_ADDR + 32'h00000008;
  localparam ADDR_VERSION1    = BASE_ADDR + 32'h0000000C;

  localparam ADDR_CTRL        = BASE_ADDR + 32'h00000010;
  localparam CTRL_INIT_BIT    = 0;
  localparam CTRL_NEXT_BIT    = 1;

  localparam ADDR_STATUS      = BASE_ADDR + 32'h00000018;
  localparam STATUS_READY_BIT = 0;
  localparam STATUS_VALID_BIT = 1;

  localparam ADDR_KEY0        = BASE_ADDR + 32'h00000040;
  localparam ADDR_KEY11       = BASE_ADDR + 32'h0000006C;

  localparam ADDR_BLOCK0      = BASE_ADDR + 32'h00000080;
  localparam ADDR_BLOCK31     = BASE_ADDR + 32'h000000fC;

  localparam ADDR_TAG0        = BASE_ADDR + 32'h00000100;
  localparam ADDR_TAG11       = BASE_ADDR + 32'h0000012C;

  localparam CORE_NAME        = 64'h61327368_6163686d; // "hmacsha2"
  localparam CORE_VERSION     = 64'h00000000_3030312e; // "1.00"