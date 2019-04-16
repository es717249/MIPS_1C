module decode_instruction
(
	/* input */
	input [5:0] opcode_reg,
	input [5:0] funct_reg,
	/* output */
	output [1:0] destination_indicator,	//1: R type, 0: I type
	output [3:0]ALUControl,
	output flag_sw,
	output flag_lw,
	output flag_R_type,				//R type =1
	output flag_I_type,				//I type =1
	output [1:0]flag_J_type,				//J type =1
	output [1:0]ALUSrcBselector,		//allows to select the operand for getting srcB number
	output mult_operation,			//indicates if the multiplication operation was selected
	output mflo_flag,				//indicates mflo is requested
	output [1:0]writedata_indicator,		//to select the source of the WriteData for Register file	
	output see_uartflag_ind					//indicator to select Rx flag or Tx flag for the register file
	)				//to control the source data for srcA
;

reg [1:0]ALUSrcBselector_reg;
reg mult_operation_reg;
reg mflo_flag_reg;
reg [1:0] destination_reg_indicator; 		//1: R type (rd), 0: I type (rt)
reg [3:0]ALUControl_reg;
reg flag_sw_reg;
reg flag_lw_reg;
reg flag_R_type_reg;
reg flag_I_type_reg;
reg [1:0]flag_J_type_reg;


reg [1:0] writedata_indicator_reg;
reg see_uartflag_ind_reg;

assign see_uartflag_ind = see_uartflag_ind_reg;
assign ALUControl =ALUControl_reg;

always @(opcode_reg,funct_reg) begin	

//Starts decoding 
	if(opcode_reg==6'd0)begin //is an R type instruction, destination_reg_indicator=1
		
		flag_R_type_reg = 1;	//Indicate that a R type instruction was detected
		flag_I_type_reg = 0;	//Not an I type instruction
		//flag_J_type_reg = 0;	//Not a J type instruction
		flag_lw_reg		=1'd0;
		writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
		see_uartflag_ind_reg = 0;			//select Rx flag

		flag_sw_reg		=1'b0;
		
		

		case(funct_reg)
			6'h0:  //sll
			begin
				destination_reg_indicator=1;	//destination will be rd
				ALUControl_reg<=4'd8;			//operation Shift to left				
				ALUSrcBselector_reg=2'd0;
				mult_operation_reg =0;			//indicates no mult operation
				mflo_flag_reg		<=0;			//mflo operation not selected;
				flag_J_type_reg = 0;	//Not a J type instruction
			end
			6'h8: //jump register (jr)
			begin
				destination_reg_indicator=1;	//destination will be rd
				ALUControl_reg<=4'd0;			//operation to be defined
				ALUSrcBselector_reg=2'd0;
				mult_operation_reg =0;			//indicates no mult operation
				mflo_flag_reg		<=0;			//mflo operation not selected;
				flag_J_type_reg = 2;			// jr type instruction,send 2 to mux 4_1
			end
			6'h12: //mflo
			begin
				destination_reg_indicator=1;	//destination will be rd
				ALUControl_reg		<=4'd0;			//operation multiplication
				ALUSrcBselector_reg	<=2'd0;
				mult_operation_reg 	<=0;			//indicates no mult operation
				mflo_flag_reg		<=1;			//mflo operation selected;
				flag_J_type_reg = 0;	//Not a J type instruction
			end
			6'h18: //mult
			begin
				destination_reg_indicator=1;	//destination will be rd
				ALUControl_reg<=4'd0;			//operation multiplication
				ALUSrcBselector_reg=2'd0;
				mult_operation_reg =1;			//indicates mult operation
				mflo_flag_reg		<=0;			//mflo operation not selected;
				flag_J_type_reg = 0;	//Not a J type instruction
			end
			6'h20: //add
			begin
				destination_reg_indicator=1;	//destination will be rd
				ALUControl_reg<=4'd2;			//operation OR				
				ALUSrcBselector_reg=2'd0;
				mult_operation_reg =0;			//indicates no mult operation
				mflo_flag_reg		<=0;			//mflo operation not selected;
				flag_J_type_reg = 0;	//Not a J type instruction
			end
			6'h25: ///or
			begin
				destination_reg_indicator=1;	//destination will be rd
				ALUControl_reg<=4'd6;			//operation OR				
				ALUSrcBselector_reg=2'd0;
				mult_operation_reg =0;			//indicates no mult operation
				mflo_flag_reg		<=0;			//mflo operation not selected;
				flag_J_type_reg = 0;	//Not a J type instruction
			end
			6'h2a:	//slt - 0x2A
			begin
			  	destination_reg_indicator=1;	//destination will be rd
				ALUControl_reg<=4'd12;			//operation slt
				/*@TODO: The operation subtract could be used, and the flag negative could be used to compare the values */
				ALUSrcBselector_reg=2'd0;			//select immediate value
				mult_operation_reg =0;			//indicates no mult operation
				mflo_flag_reg		<=0;			//mflo operation not selected;
				flag_J_type_reg = 0;	//Not a J type instruction
			end
			
			default:
			begin
				destination_reg_indicator=1;	//destination will be rd
				ALUControl_reg<=4'd2;			//operation add 				
				ALUSrcBselector_reg=2'd0;
				mult_operation_reg =0;			//indicates no mult operation
				mflo_flag_reg		<=0;			//mflo operation not selected;
				flag_J_type_reg = 0;	//Not a J type instruction
			end
		endcase

	end else begin  //It is an I or J type instruction, destination_reg_indicator=0
		
		flag_R_type_reg = 0;	//Not a R type instruction 
		mult_operation_reg =0;
		mflo_flag_reg		=0;			//mflo operation not selected;

		case(opcode_reg)
			6'b000010: //Jump(j) - 0x02
			begin
			  	flag_I_type_reg = 0;	//Not an I type instruction
				flag_J_type_reg = 1;	//J type instruction
				flag_lw_reg=1'd0;		//not relevant
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;		//not relevant
				destination_reg_indicator=0;	//not relevant
				ALUControl_reg<=4'd0;			//not relevant
				ALUSrcBselector_reg=2'd0;			//not relevant
				
				
			end
			6'b000011: //Jump and link(jal)- 0x03
			begin
				flag_I_type_reg = 0;	//Not an I type instruction
				flag_J_type_reg = 1;	//J type instruction
				flag_lw_reg=1'd0;		//this will help to use a Mux for WD3 in register file to pass new jump address on JAL inst
				writedata_indicator_reg = 2'd2;		//this will help to use a Mux for WD3 in register file to pass new jump address on JAL inst
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;		//not relevant
				destination_reg_indicator=2;	//Use the 3rd source: 5'd31 for $ra register
				ALUControl_reg<=4'd0;			//not relevant
				ALUSrcBselector_reg=2'd0;			//not relevant
				
				
			end

			6'b000100: //beq - 0x04
			begin
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd2;			//operation add 				
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;		
				ALUSrcBselector_reg=2'd0;	
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end 
			6'b000101: //bne - 0x05
			begin 
				/* Edit these values */
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd2;			//operation add 				
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;		
				ALUSrcBselector_reg=2'd0;	
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end 
			6'b000110: //Uart_readFlag_rx  - 0x06
			begin 
				/* Edit these values */
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd2;			//operation add 				
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd3;		//useful to save Rx_flag into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag
				flag_sw_reg=1'b0;		
				ALUSrcBselector_reg=2'd2;		//ALU SrcB select : immediate
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end
			6'b000111: //Uart_readFlag_tx  - 0x07
			begin 
				/* Edit these values */
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd2;			//operation add 				
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd3;		//useful to save Rx_flag into the register file
				see_uartflag_ind_reg = 1;			//select Rx flag
				flag_sw_reg=1'b0;		
				ALUSrcBselector_reg=2'd2;		//ALU SrcB select : immediate
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end 

			6'b001000: //addi - 0x08
			//Tengo que guardar estos datos en el register file
			begin
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd2;			//operation add 				
				ALUSrcBselector_reg=2'd2;			//ALU SrcB select : immediate
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end			
			6'b001010:	//slti - 0x0A
			begin
			  	destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd12;			//operation slti
				/*@TODO: The operation subtract could be used, and the flag negative could be used to compare the values */
				ALUSrcBselector_reg=2'd2;			//select immediate value
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end
			6'b001100: //andi - 0x0C
			begin
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd5;			//operation and 	
				ALUSrcBselector_reg=2'd2;			
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end
			6'b001101: //ori - 0x0D
			begin
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd6;			//operation or
				ALUSrcBselector_reg=2'd2;			
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end
			6'b001111:	//lui - 0x0F
			begin
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'b1011;			//shift <<16 operation
				//create a flag so we can pass to write back 
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b1;	
				ALUSrcBselector_reg=2'd2;	
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end
			6'b100011: /* lw	- 0x23 */
			begin
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd2;			//
				flag_lw_reg=1'd1;	/* @TODO: modify this to be writedata_indicator */
				writedata_indicator_reg = 2'd1;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;		
				ALUSrcBselector_reg=2'd0;		
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
				
			end
			6'b101011: //sw - 0x2B
			begin
				destination_reg_indicator=0;	//destination will be rt
				ALUControl_reg<=4'd2;			//operation add 				
				//create a flag so we can pass to write back 
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b1;	
				ALUSrcBselector_reg=2'd0;	
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 0;	//Not a J type instruction
				
			end
			

			default:
			begin
				ALUControl_reg<=4'd2;//operation add  /**** CHECK **/
				destination_reg_indicator=0;//destination will be rt
				flag_lw_reg=1'd0;
				writedata_indicator_reg = 2'd0;		//useful to save ALUout result into the register file
				see_uartflag_ind_reg = 0;			//select Rx flag

				flag_sw_reg=1'b0;	
				ALUSrcBselector_reg=2'd0;
				flag_I_type_reg = 1;	//Indicate it is I type instruction
				flag_J_type_reg = 1;	//Not a J type instruction
				
				
			end
		endcase 
	end 
end

assign destination_indicator= destination_reg_indicator ;
assign ALUControl= ALUControl_reg ;
assign flag_lw = flag_lw_reg;
assign flag_sw = flag_sw_reg ;
assign ALUSrcBselector= ALUSrcBselector_reg;
assign flag_R_type = flag_R_type_reg;
assign flag_I_type = flag_I_type_reg;
assign flag_J_type = flag_J_type_reg;
assign mult_operation = mult_operation_reg;
assign mflo_flag = mflo_flag_reg;

assign writedata_indicator = writedata_indicator_reg;

endmodule