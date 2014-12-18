
module DE2_Basic_Computer (
	// Inputs
	CLOCK_50,
	CLOCK_27,
	KEY,
	SW,

	//  Communication
	UART_RXD,
	
/*****************************************************************************/
	// Bidirectionals
	GPIO_0,
	GPIO_1,

	// 	Memory (SRAM)
	SRAM_DQ,
	
	// Memory (SDRAM)
	DRAM_DQ,


/*****************************************************************************/
	// Outputs
	// 	Simple
	LEDG,
	LEDR,

	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,
	
	// 	Memory (SRAM)
	SRAM_ADDR,

	SRAM_CE_N,
	SRAM_WE_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_LB_N,
	
	//  Communication
	UART_TXD,
	
	// Memory (SDRAM)
	DRAM_ADDR,
	
	DRAM_BA_1,
	DRAM_BA_0,
	DRAM_CAS_N,
	DRAM_RAS_N,
	DRAM_CLK,
	DRAM_CKE,
	DRAM_CS_N,
	DRAM_WE_N,
	DRAM_UDQM,
	DRAM_LDQM,

);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				CLOCK_50;
input				CLOCK_27;
input		[3:0]	KEY;
input		[17:0]	SW;


//  Communication
input				UART_RXD;

// Bidirectionals
inout		[35:0]	GPIO_0;
inout		[35:0]	GPIO_1;

// 	Memory (SRAM)
inout		[15:0]	SRAM_DQ;

//  Memory (SDRAM)
inout		[15:0]	DRAM_DQ;

// Outputs
// 	Simple
output		[8:0]	LEDG;
output		[17:0]	LEDR;

output		[6:0]	HEX0;
output		[6:0]	HEX1;
output		[6:0]	HEX2;
output		[6:0]	HEX3;
output		[6:0]	HEX4;
output		[6:0]	HEX5;
output		[6:0]	HEX6;
output		[6:0]	HEX7;

// 	Memory (SRAM)
output		[17:0]	SRAM_ADDR;

output				SRAM_CE_N;
output				SRAM_WE_N;
output				SRAM_OE_N;
output				SRAM_UB_N;
output				SRAM_LB_N;

//  Communication
output				UART_TXD;

//  Memory (SDRAM)
output		[11:0]	DRAM_ADDR;

output				DRAM_BA_1;
output				DRAM_BA_0;
output				DRAM_CAS_N;
output				DRAM_RAS_N;
output				DRAM_CLK;
output				DRAM_CKE;
output				DRAM_CS_N;
output				DRAM_WE_N;
output				DRAM_UDQM;
output				DRAM_LDQM;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
// Used to connect the Nios 2 system clock to the non-shifted output of the PLL
wire				system_clock;

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign GPIO_0[ 0] = 1'bZ;
assign GPIO_0[ 2] = 1'bZ;
assign GPIO_0[16] = 1'bZ;
assign GPIO_0[18] = 1'bZ;
assign GPIO_1[ 0] = 1'bZ;
assign GPIO_1[ 2] = 1'bZ;
assign GPIO_1[16] = 1'bZ;
assign GPIO_1[18] = 1'bZ;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
nios_system NiosII (
	// 1) global signals:
	.clk									(system_clock),
	.reset_n								(KEY[0]),

	// the_Slider_switches
	.SW_to_the_Slider_switches				(SW),

	// the_Pushbuttons
	.KEY_to_the_Pushbuttons					({KEY[3:1], 1'b1}),

	// the_Expansion_JP1
	.GPIO_0_to_and_from_the_Expansion_JP1	({GPIO_0[35:19], GPIO_0[17], GPIO_0[15:3], GPIO_0[1]}),

	// the_Expansion_JP2
	.GPIO_1_to_and_from_the_Expansion_JP2	({GPIO_1[35:19], GPIO_1[17], GPIO_1[15:3], GPIO_1[1]}),

	// the_Green_LEDs
	.LEDG_from_the_Green_LEDs				(LEDG),

	// the_Red_LEDs
	.LEDR_from_the_Red_LEDs					(LEDR),
	
	// the_HEX3_HEX0
	.HEX0_from_the_HEX3_HEX0				(HEX0),
	.HEX1_from_the_HEX3_HEX0				(HEX1),
	.HEX2_from_the_HEX3_HEX0				(HEX2),
	.HEX3_from_the_HEX3_HEX0				(HEX3),
	
	// the_HEX7_HEX4
	.HEX4_from_the_HEX7_HEX4				(HEX4),
	.HEX5_from_the_HEX7_HEX4				(HEX5),
	.HEX6_from_the_HEX7_HEX4				(HEX6),
	.HEX7_from_the_HEX7_HEX4				(HEX7),

	// the_SRAM
	.SRAM_ADDR_from_the_SRAM				(SRAM_ADDR),
	.SRAM_CE_N_from_the_SRAM				(SRAM_CE_N),
	.SRAM_DQ_to_and_from_the_SRAM			(SRAM_DQ),
	.SRAM_LB_N_from_the_SRAM				(SRAM_LB_N),
	.SRAM_OE_N_from_the_SRAM				(SRAM_OE_N),
	.SRAM_UB_N_from_the_SRAM				(SRAM_UB_N),
	.SRAM_WE_N_from_the_SRAM				(SRAM_WE_N),

	// the_Serial_port
	.UART_RXD_to_the_Serial_port			(UART_RXD),
	.UART_TXD_from_the_Serial_port			(UART_TXD),
	
	// the sdram
	.zs_addr_from_the_SDRAM					(DRAM_ADDR),
	.zs_ba_from_the_SDRAM					({DRAM_BA_1, DRAM_BA_0}),
	.zs_cas_n_from_the_SDRAM				(DRAM_CAS_N),
	.zs_cke_from_the_SDRAM					(DRAM_CKE),
	.zs_cs_n_from_the_SDRAM					(DRAM_CS_N),
	.zs_dq_to_and_from_the_SDRAM			(DRAM_DQ),
	.zs_dqm_from_the_SDRAM					({DRAM_UDQM, DRAM_LDQM}),
	.zs_ras_n_from_the_SDRAM				(DRAM_RAS_N),
	.zs_we_n_from_the_SDRAM					(DRAM_WE_N)

);

sdram_pll neg_3ns (CLOCK_50, DRAM_CLK, system_clock);

endmodule
