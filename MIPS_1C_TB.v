/*
Testing MIPS_1C.v:

    Simulation with modelsim:
    vsim -voptargs=+acc=npr
*/
module MIPS_1C_TB;

    localparam DATA_WIDTH = 32;
    localparam ADDR_WIDTH = 8;
    localparam MAXIMUM_VALUE = 4'd6;
    localparam Nbit =8;

    localparam clk_freq =50;
    localparam baudrate= 5;
	reg clk=0; 				        /* clk signal */
	reg reset=0; 			        /* async signal to reset */
    reg enable=0;                   /* enable signal*/

    wire [7:0]leds;            /* output leds */    
    //UART     
    reg SerialDataIn; //it's the input data port 
    reg clr_rx_flag; //to clear the Rx signal
    wire [Nbit-1:0] DataRx; //Port where Rx information is available
    wire Rx_flag; //indicates a data was received 
    wire SerialDataOut;

MIPS_1C#(
    .DATA_WIDTH(DATA_WIDTH),/* length of data */
    .ADDR_WIDTH(ADDR_WIDTH),/* bits to address the elements */
    .UART_Nbit(8),
    .baudrate(baudrate),
    .clk_freq(clk_freq)
)testing_mips
(
	.clk(clk), 				        /* clk signal */
	.reset(reset), 			        /* async signal to reset */        
    //###### UART 
    .SerialDataIn(SerialDataIn),    
    .Rx_flag(Rx_flag),
    .DataRx_out(DataRx),
    .SerialDataOut(SerialDataOut),
    .gpio_data_out(leds)    
);


initial begin
 	//forever #10 clk=!clk;
    forever #(clk_freq/2) clk=!clk;
end

initial begin 
    /* Beginning of simulation */
    #0  reset=1'b0;
    #0  enable =1'b0;
    SerialDataIn=1;
	#(clk_freq/2) clr_rx_flag = 1;
    #50 reset =1'b1;
    #0  enable =1'b1;

    /* Send start bit */
	#(500) SerialDataIn = 1'b0;
	/* Send 8 data bits */
	/* Send less significant bit first */
	#(500) SerialDataIn = 1'b1;
	#(500) SerialDataIn = 1'b0;
   	#(500) SerialDataIn = 1'b0;
	#(500) SerialDataIn = 1'b1;
	#(500) SerialDataIn = 1'b1;
	#(500) SerialDataIn = 1'b1;
	#(500) SerialDataIn = 1'b0;
	#(500) SerialDataIn = 1'b0;
    	/* #(500) SerialDataIn = 1'b1;
        #(500) SerialDataIn = 1'b0;
        #(500) SerialDataIn = 1'b1;
        #(500) SerialDataIn = 1'b0;
        #(500) SerialDataIn = 1'b1;
        #(500) SerialDataIn = 1'b0;
        #(500) SerialDataIn = 1'b1;
        #(500) SerialDataIn = 1'b0;*/
	/* Send stop bit */ 
	#(500) SerialDataIn = 1'b1;    
end 

endmodule 