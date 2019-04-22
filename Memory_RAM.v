module Memory_RAM#(
    parameter DATA_WIDTH=32, 		//data length
	parameter ADDR_WIDTH=8			//bits to add
)(

    input [(ADDR_WIDTH-1):0] addr,	//Address for ram
	input [(DATA_WIDTH-1):0] wdata,	//Write Data for RAM data memory
    input we,						//Write enable signal
	input clk, 		
	/* input MemRead,					 */
	//output
	output [(DATA_WIDTH-1):0] q
);


	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

/* Write to RAM memory at the given address (addr) with the given data*/

	always@(posedge clk)begin
		if(we)
		    ram[addr] <= wdata;		
	end

    assign q = ram[addr];	

endmodule