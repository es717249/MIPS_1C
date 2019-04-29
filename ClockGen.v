/************************************************************************************************
Name: ClockGen.v
Description: Counter which counts up to MAXIMUM_VALUE and raises a flag when it happens,
then it restarts the counting.
Parameter:
*	MAXIMUM_VALUE = Number of data samples to count
*	NBITS = Number of bits required to count to the maximum value
Inputs:
*	clk :	clock signal
*	reset :	reset signal

Outputs:
*	flag:	signal which indicates the counting reached the maximum value
*	counter:	signal which stores the counting value

Version: 1.0
Autor: Nétor Damián García 
Fecha: Primavera 2018
************************************************************************************************/

module ClockGen
#(
	// Parameter Declarations
	parameter MAXIMUM_VALUE = 5, 
	parameter NBITS = CeilLog2(MAXIMUM_VALUE)
)
(
	// Input Ports
	input clk,
	input reset,
	input enable,	
	// Output Ports
	output flag
	//output[NBITS-1:0] counter
);



reg flag_reg=0;
reg [NBITS-1:0] counter_reg=0;


/*********************************************************************************************/
	always@(posedge clk or negedge reset) begin
		if (reset == 1'b0) begin 
			counter_reg <= {NBITS{1'b0}};			
			flag_reg <= 0;
		end else begin					
				if (enable==1'b1)begin 
					if(counter_reg == MAXIMUM_VALUE-1)begin						
						counter_reg <= { NBITS{1'b0} };
						flag_reg <= ~flag_reg;
					end else begin 
						counter_reg <= counter_reg + 1'b1;						
					end									
				end 
		end
	end

/*********************************************************************************************/

assign flag = flag_reg;
//assign counter = counter_reg;
/*********************************************************************************************/

/*********************************************************************************************/
   
 /*Log Function*/
     function integer CeilLog2;
       input integer data;
       integer i,result;
       begin
          for(i=0; 2**i < data; i=i+1)
             result = i + 1;
          CeilLog2 = result;
       end
    endfunction

/*********************************************************************************************/


endmodule


