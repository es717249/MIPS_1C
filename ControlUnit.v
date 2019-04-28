module ControlUnit
#(
    //Machine states
	parameter IDLE=0,
	parameter NORMAL=1	
)
(
    /* Inputs */
    input clk,              //clk signal
	input reset,            //async signal to reset
    input sw_flag,
    /* Outputs */
    
    output Start_PC,
    output RegWrite

    );

//###################### Variables ########################


//####################     Assignations   #######################


reg Start_PC_reg;
reg state;
reg RegWrite_reg;

assign Start_PC = Start_PC_reg;
assign RegWrite = RegWrite_reg;





always @(posedge clk or negedge reset) begin
    if(reset==1'b0) begin
        state <= IDLE;
    end else begin
        case(state)
            IDLE:
            begin
                state <= NORMAL;
            end
            NORMAL:
            begin
                state <= NORMAL;
            end
            
        endcase
    end 
end

always@(state,sw_flag)begin 
    case(state)
        
        IDLE:
        begin
            Start_PC_reg = 0;
            RegWrite_reg = 0;
        end
        NORMAL:
        begin
            if(sw_flag==1'b1)begin    
               RegWrite_reg = 0;
            end else begin            
               RegWrite_reg = 1;
            end

            Start_PC_reg = 1;
                        
        end
        
        default:
        begin 
            Start_PC_reg = 0;
            RegWrite_reg = 0;
        end
    endcase
end 



endmodule