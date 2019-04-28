module Memory_ROM#(
    parameter DATA_WIDTH=32, 		//data length   
	parameter ADDR_WIDTH=8			//bits to address the elements
)(
    input [(ADDR_WIDTH-1):0] addr,	//Address for rom instruction mem. Program counter
	//output
	output [(DATA_WIDTH-1):0] q
);



// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0]; 

    initial   //no es sintetizable pero le ayuda al sintetizador para inferir una memoria rom y para inicializarla
	begin		
		//$readmemh("Test_MIPS_1inst.hex", rom);	//Test1 -Tarea1: instructions R,I,SW,LW,BEQ,BNE
		//$readmemh("Test_MIPS_jump.hex", rom);		//Test2: instructions jump
		//$readmemh("Test_MIPS_SW_LW.hex", rom);	//Test3: instructions sw, lw
		//$readmemh("testmem.hex", rom);	//Test4: memory
		//$readmemh("Test_S0.hex", rom);	//Test5: few instructions
		//$readmemh("Test_slti.hex", rom);	//Test6: slti instruction
		//$readmemh("Test_mult.hex", rom);	//Test7: mult instruction
		//$readmemh("Test_jr.hex", rom);	//Test8: jr instruction
		//$readmemh("Test_jal.hex", rom);	//Test9: jal instruction
		//$readmemh("Factorial.hex", rom);	//Test9: Factorial program, 5000ps for fact 3, so fact 15 :21ns
		//$readmemh("Recursive_Add.hex", rom);	//Test10: Recursive addition program
		$readmemh("GPIO_test.hex", rom);	//Test11: 
		//$readmemh("Test_uartRx.hex", rom);	//Test12: testing uart reading 
		//$readmemh("Test_uartrxtx.hex", rom);	//Test13: testing uart rx and tx
		//$readmemh("Factorial_uart.hex", rom);	//Test14: Factorial and uart 
		


	end


    assign q = rom[addr];	

endmodule