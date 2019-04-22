module Adder#(
    parameter DATA_WIDTH=32 		//data length   
)
(
    input [DATA_WIDTH-1:0] A,
    input [DATA_WIDTH-1:0] B,
    output [DATA_WIDTH-1:0] C
);

assign C = A+B;

endmodule