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
/***************************************************************
Signals to update Program Counter
***************************************************************/
wire PCSrc_wire;					/* Signal for a mux to select the source of PC */
wire [DATA_WIDTH-1:0]PC_current/*synthesis keep*/;					/* Current Program counter */
wire [DATA_WIDTH-1:0] PC_source/*synthesis keep*/;	/* signal from mux to PC register */
wire [DATA_WIDTH-1:0] start_PC;     /* Signal to initialize the PC to x400000 */
//wire [DATA_WIDTH-1:0] PC_source_tmp;	/* signal from mux to PC register */
wire PC_En_wire;
wire startPC_wire;
wire [DATA_WIDTH-1:0] mux_address_Data_out/*synthesis keep*/;
wire [DATA_WIDTH-1 : 0]ALUOut_Translated/*synthesis keep*/;		//Registerd output of ALU

/***************************************************************
Signals for ALU unit
***************************************************************/

wire zero;							//zero flag
wire carry;							//carry flag
wire negative;						//negative flag
wire [DATA_WIDTH-1:0]shifted2/*synthesis keep*/;		//4th input for ALU: shifted by 2 data
wire [DATA_WIDTH-1:0] SrcA/*synthesis keep*/;			//input 0 of ALU
wire [DATA_WIDTH-1:0] SrcB/*synthesis keep*/;			//input 1 of ALU
wire [3:0]ALUControl_wire/*synthesis keep*/; 			//@Control signal: Selects addition operation (010b)
wire [DATA_WIDTH-1 : 0]ALUResult/*synthesis keep*/;	//Output result of ALU unit
wire [DATA_WIDTH-1 : 0]ALUResult_tmp/*synthesis keep*/;	//Output result of ALU unit
wire [DATA_WIDTH-1 : 0]ALUOut/*synthesis keep*/;		//Registerd output of ALU
wire [1:0]sel_muxALU_srcB/*synthesis keep*/; 			//@Control signal: allows to select the operand for getting srcB number on mux 'Mux4_1_forALU'
wire ALUSrcA_wire/*synthesis keep*/;					//@Control signal: allow to select the SrcA source. 0=PC, 1=RD1
wire ALUresult_en_wire/*synthesis keep*/;				//@Control signal: enables the FF at ALUout

/***************************************************************
Signals for Memory unit
***************************************************************/
wire [DATA_WIDTH-1:0]Data_RAM/* synthesis keep */;
wire [DATA_WIDTH-1:0]Instruction_fetched/*synthesis keep*/; 	//signal from FF to Register files to indicate instruction

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
    .addr(translated_addr_wire),	//Address for rom instruction mem. Program counter
	//output
	.q(Instruction_fetched)
);


//#################### Register for Program Counter #################
Register#(
    .WORD_LENGTH(DATA_WIDTH)
)ProgramCounter_Reg
(		
    .clk(clk),
    .reset(reset),
    .enable(1),	        /* Does not need a control signal */
    .Data_Input(PC_source), 	//This comes from the ALU Result after MUX_for_PC_source
    .Data_Output(PC_current)	//output Program counter update
);

//####################     Adder unit   #######################
Adder #(
    .DATA_WIDTH(DATA_WIDTH)
)(
    .A(PC_current),
    .B(32'd4),
    .C(PC_source)
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



//####################     Address preparation   #######################
addres_preparation add_prep
(	
    /* Input */
    .Mmemory_output(Instruction_fetched),	//rom fetched instruction content
    /* Output */
    .opcode(opcode_wire),  			//Opcode  value
    .funct(funct_wire),    				//function value
    .rs(rs_wire),		 				//source 1	(R-I type)		
    .rt(rt_wire),		 				//source 2	(R-I type)		
    .rd(rd_wire),						//Destination: 15:11 bit (R type)		
    .shamt(shamt_wire),					//shamt field (R type)	
    .immediate_data(immediate_data_wire),//immediate field (I type)	
    .address_j(address_j_wire)			//address field for (J type)	
);
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

//####################  Sign extend Module  ###############
SignExtend_module signExt
(
    //.immediate(immediateData_toextend),
    .immediate(immediate_data_wire),
    .extended_sign_out(sign_extended_out)
);

//####################	 Mux RegFile to Alu             ######################
mux2to1#(
    .Nbit(DATA_WIDTH)
)mux_RegFile_to_ALU
(
    .mux_sel(),		/* 1= R type (rd), 0= I type (rt) */
    .data1(RD2),
    .data2(sign_extended_out),
    .Data_out(SrcB)
);

//####################        ALU   #######################
ALU #(
    .WORD_LENGTH(DATA_WIDTH)
)alu_unit
(
    /* inputs */	
    .dataA(RD1),					//From MUX_to_updateSrcA 	, input 1
    .dataB(SrcB),					//From Mux 4 to 1		, input 2 
    .control(ALUControl_wire),		//@Control signal
    .shmt(shamt_wire),				//shamt field to do shift operations
    /* outputs */
    .carry(carry),					//Carry signal
    .zero(zero),					//Zero signal
    .negative(negative),			//Negative signal
    .dataC(ALUResult_tmp) 				//Result	
);


//####################     RAM Address translator unit   #######################
VirtualAddress_RAM #(
    .ADDR_WIDTH(DATA_WIDTH)
)VirtualRAM_Mem
(
    .address(demux_aluout_0),	
    .swdetect(sw_inst_detector),
    .translated_addr(ALUOut_Translated),
    .MIPS_address(MIPS_RAM_address),
    .aligment_error(aligment_error_RAM_wire),
    .dataBack_Selector_out(dataBack_Selector_wire ),
    .Data_selector_periph_or_mem(Data_selector_uart_or_mem),
    .clr_rx_flag(clr_rx_flag),
    .clr_tx_flag(clr_tx_flag),
    .Start_uart_tx(Start_uartTx_input_wire ),       /* Output from memory controller */
    .enable_StoreTxbuff(enable_StoreTxbuff_fromMem)
);

//####################     Control unit   #######################
ControlUnit CtrlUnit(
    /* Inputs */
    .clk(clk), 						//clk signal
    .reset(reset), 					//async signal to reset 	
    .Opcode(opcode_wire),
    .Funct(funct_wire),
    .Zero(zero),    
    .Start_uart_tx_input(Start_uartTx_input_wire),
    /* Outputs */
    .IorD(IorD_wire),
    .MemWrite(MemWrite_wire),
    .IRWrite(IRWrite_wire),
    .RegDst(RegDst_wire),
    .MemtoReg(MemtoReg_wire),
    .PCWrite(PCWrite_wire),			//@TODO: probably not needed
    .Branch(Branch_wire),
    .PCSrc(PCSrc_wire),
    .ALUControl(ALUControl_wire),
    .ALUSrcB(sel_muxALU_srcB),
    .ALUSrcA(ALUSrcA_wire),
    .RegWrite(RegWrite_wire),
    .Mem_select(mem_sel_wire),		//@Control signal: Memory selection: 0=ROM, 1=RAM
    .DataWrite(DataWrite_wire),
    .RDx_FF_en(RDx_FF_en_wire),
    .ALUresult_en(ALUresult_en_wire),
    .PC_En(PC_En_wire),
    .flag_J_type_out(flag_Jtype_wire),
    .flag_sw_out(sw_inst_detector),
    .flag_lw_out(lw_inst_detector),
    .mult_operation_out(demux_aluout_sel),		//this controls if the result is saved in Lo-Hi reg(1) or Reg file (0)
    .mflo_flag_out(mflo_flag),
    .selectPC_out(startPC_wire),
    .see_uartflag(see_uartflag_wire),
    .Start_uart_tx_output( Start_uartTx_output_wire  )	 
    );

//####################     RAM  unit   #######################

Memory_RAM #(
    .DATA_WIDTH(DATA_WIDTH), 		//data length
	.ADDR_WIDTH(8)			//bits to add
)mem_RAM(

    .addr(ALUOut_Translated),	//Address for ram
	.wdata(RD2),	//Write Data for RAM data memory
    .we(MemWrite_wire),						//Write enable signal
	.clk(clk), 							
	//output
	.q(Data_RAM)
);

//####################	 Mux RAM Memory to Reg File   ######################
mux2to1#(
    .Nbit(DATA_WIDTH)
)mux_RAM_to_RegFile
(
    .mux_sel(MemtoReg_wire),		/* 1= R type (rd), 0= I type (rt) */
    .data1(Data_RAM),
    .data2(ALUResult_tmp),
    .Data_out(datatoWD3)
);


endmodule