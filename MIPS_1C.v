module MIPS_1C #(
    parameter DATA_WIDTH=32,	/* length of data */
    parameter ADDR_WIDTH=8,		/* bits to address the elements */    
    //UART TX/RX
    parameter UART_Nbit =8,
    parameter baudrate =9600,
    parameter clk_freq = 50000000
    /* parameter baudrate= 5,	
	parameter clk_freq =50 */
)(
    input clk, 					/* clk signal */
    input reset, 				/* async signal to reset */	
    //UART RX
    input SerialDataIn, //it's the input data port     
    output Rx_flag,  //indicates the data was completely received 
    output [UART_Nbit-1:0] DataRx_out/*synthesis keep*/, //Port where Rx information is available
    //UART TX
    output SerialDataOut,
    output [7:0] gpio_data_out
);


/***************************************************************
Signals for Register File
***************************************************************/
wire [DATA_WIDTH-1 : 0] RD1/*synthesis keep*/; 
wire [DATA_WIDTH-1 : 0] RD2/*synthesis keep*/;
wire [1:0] RegDst_wire/*synthesis keep*/;					/*@Control signal: for Write reg in Register File */

/***************************************************************
Signals for Sign Extend module
***************************************************************/
wire [DATA_WIDTH-1:0] sign_extended_out/*synthesis keep*/;
/***************************************************************
Signals for Address preparation module
***************************************************************/
wire [DATA_WIDTH-1:0]Instruction_fetched/*synthesis keep*/; 	//signal from FF to Register files to indicate instruction
wire [5 :0 ]opcode_wire/*synthesis keep*/;							//Opcode field of the instruction
wire [4 : 0]rs_wire/*synthesis keep*/;		 			//source 1	(R-I type)
wire [4 : 0]rt_wire/*synthesis keep*/;		 			//source 2	(R-I type)
wire [4 : 0]rd_wire/*synthesis keep*/;		  			//Destination: 15:11 bit (R type)
wire [4 : 0]shamt_wire/*synthesis keep*/;				//shamt field (R type)
wire [5 : 0]funct_wire/*synthesis keep*/;				//select the function
wire [15: 0]immediate_data_wire/*synthesis keep*/;		//immediate field (I type)
wire [15: 0]immediateData_toextend/*synthesis keep*/;		
wire [25: 0]address_j_wire/*synthesis keep*/;			//address field for (J type)
/***************************************************************
Signals for A3 Destination mux
***************************************************************/
wire [4:0]mux_A3out/*synthesis keep*/;


////####################  Register File  #######################
Register_File #(
    .WORD_LENGTH(DATA_WIDTH),	
    .NBITS(5)
)RegisterFile_Unit
(
    /* Inputs */
    .clk(clk),
    .reset(reset),
    .Read_Reg1(rs_wire),		//It'll always be 'Rs'-> 25:21. 
    .Read_Reg2(rt_wire), 			//It'll always be 'Rt'-> 20:16
    .Write_Reg(mux_A3out),		//(A3)Register destination; bits I->20:16 ; R->15:11
    .Write_Data(datatoWD3),  	//(WD3) data to write 
    .Write(RegWrite_wire),		//@Control Signal:(WE3) enable signal
    /* Outputs */
    .Read_Data1(RD1),
    .Read_Data2(RD2)	
);



//###############   Mux for Target register, for Register File    ##################


mux4to1#(
    .Nbit(3'd5)
)mux_A3_destination
(
    .mux_sel(RegDst_wire),		/* 1= R type (rd), 0= I type (rt) */
    .data1(rt_wire),
    .data2(rd_wire),
    .data3(5'd31),			/* For writing to $ra (31) register */
    .data4(5'd0),           /* @TODO: for future use */
    .Data_out(mux_A3out)
);


// ################ ROM Memory

Memory_ROM#(
    .DATA_WIDTH(DATA_WIDTH), 		//data length   
	.ADDR_WIDTH(8)			//bits to address the elements
)(
    .addr(),	//Address for rom instruction mem. Program counter
	//output
	.q()
);

//####################     ROM Address translator unit   #######################
VirtualMemory_unit #(
    .ADDR_WIDTH(DATA_WIDTH)
)VirtualMem
(
    .address(PC_current),
    .translated_addr(translated_addr_wire),
    .MIPS_address(MIPS_address),
    .aligment_error(aligment_error_wire)
);








endmodule