onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_1C_TB/clk
add wave -noupdate /MIPS_1C_TB/reset
add wave -noupdate /MIPS_1C_TB/enable
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/leds
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/SerialDataIn
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/clr_rx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/DataRx
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/Rx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/SerialDataOut
add wave -noupdate -divider ROM
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/ROM/addr
add wave -noupdate -color Cyan -radix hexadecimal /MIPS_1C_TB/testing_mips/ROM/q
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider VirtualROM
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualAddress_ROM/MIPS_address
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualAddress_ROM/translated_addr
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualAddress_ROM/aligment_error
add wave -noupdate -divider ProgramCounter
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/ProgramCounter_Reg/clk
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/ProgramCounter_Reg/reset
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/ProgramCounter_Reg/enable
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/ProgramCounter_Reg/Data_Input
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/ProgramCounter_Reg/Data_Output
add wave -noupdate -divider Mux_Boot_StartPC
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_Boot_startAddr/mux_sel
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_Boot_startAddr/data1
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_Boot_startAddr/data2
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_Boot_startAddr/Data_out
add wave -noupdate -divider Mux_Mem_Periph_muxwriteData
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_Mem_or_Periph_to_MUXWriteData/mux_sel
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_Mem_or_Periph_to_MUXWriteData/data1
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_Mem_or_Periph_to_MUXWriteData/data2
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_Mem_or_Periph_to_MUXWriteData/Data_out
add wave -noupdate -divider RAM
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/mem_RAM/addr
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/mem_RAM/wdata
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/mem_RAM/we
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/mem_RAM/clk
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/mem_RAM/q
add wave -noupdate -divider VirtualRAM
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/address
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/swdetect
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/translated_addr
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/MIPS_address
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/aligment_error
add wave -noupdate -color Red -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/dataBack_Selector_out
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/Data_selector_periph_or_mem
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/clr_rx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/clr_tx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/Start_uart_tx
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualRAM_Mem/enable_StoreTxbuff
add wave -noupdate -divider GPIO
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/GPIO/addr_ram
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/GPIO/wdata
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/GPIO/clk
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/GPIO/reset
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/GPIO/enable_sw
add wave -noupdate -color Red -radix hexadecimal /MIPS_1C_TB/testing_mips/GPIO/gpio_data_out
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/GPIO/enable_write
add wave -noupdate -divider Decoder
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/opcode_reg
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/funct_reg
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/addr_input
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/RegDst_reg
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/ALUControl
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/flag_sw
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/flag_lw
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/flag_R_type
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/flag_I_type
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/flag_J_type
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/ALUSrcBselector
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/mult_operation
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/mflo_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/MemtoReg
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/see_uartflag_ind
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/MemWrite
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/PC_En
add wave -noupdate /MIPS_1C_TB/testing_mips/decoder_module/zero
add wave -noupdate /MIPS_1C_TB/testing_mips/decoder_module/flag_J_type_reg
add wave -noupdate -divider Prep_instruction
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/Mmemory_output
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/opcode
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/funct
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/rs
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/rt
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/rd
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/shamt
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/immediate_data
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/address_j
add wave -noupdate -divider Mux_to_WriteData_RegF
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/mux_sel
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/data1
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/data2
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/data3
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/data4
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/Data_out
add wave -noupdate -divider Demux_aluout
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/demux_aluout/Demux_Input
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/demux_aluout/Selector
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/demux_aluout/Dataout0
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/demux_aluout/Dataout1
add wave -noupdate -divider RegFile
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/RegisterFile_Unit/clk
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/RegisterFile_Unit/reset
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/RegisterFile_Unit/Read_Reg1
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/RegisterFile_Unit/Read_Reg2
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/RegisterFile_Unit/Write_Reg
add wave -noupdate -color Red -radix hexadecimal /MIPS_1C_TB/testing_mips/RegisterFile_Unit/Write_Data
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/RegisterFile_Unit/Write
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/RegisterFile_Unit/Read_Data1
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/RegisterFile_Unit/Read_Data2
add wave -noupdate -divider Mux_UART_bitRXorTx
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_UART_bitRxorTx/mux_sel
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_UART_bitRxorTx/data1
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_UART_bitRxorTx/data2
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_UART_bitRxorTx/Data_out
add wave -noupdate -divider muxA3_dest
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/mux_A3_destination/mux_sel
add wave -noupdate -label rt_wire -radix unsigned /MIPS_1C_TB/testing_mips/mux_A3_destination/data1
add wave -noupdate -label rd_wire -radix unsigned /MIPS_1C_TB/testing_mips/mux_A3_destination/data2
add wave -noupdate -label 5'd31 -radix unsigned /MIPS_1C_TB/testing_mips/mux_A3_destination/data3
add wave -noupdate -label nothing -radix hexadecimal /MIPS_1C_TB/testing_mips/mux_A3_destination/data4
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/mux_A3_destination/Data_out
add wave -noupdate -divider Mux_WriteData_RegFile
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/mux_sel
add wave -noupdate -label Demux_Aluout -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/data1
add wave -noupdate -label Periph_Or_Memory -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/data2
add wave -noupdate -label PC_current -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/data3
add wave -noupdate -label bit_periph_data -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/data4
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_WriteData_RegFile/Data_out
add wave -noupdate -divider Lo_reg
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Lo_Reg/clk
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Lo_Reg/reset
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Lo_Reg/enable
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Lo_Reg/Data_Input
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Lo_Reg/Data_Output
add wave -noupdate -divider Adder
add wave -noupdate -color Magenta -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/dataA
add wave -noupdate -color Magenta -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/dataB
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/control
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/shmt
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/carry
add wave -noupdate -color Gold -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/zero
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/negative
add wave -noupdate -color Red -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/dataC
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/result_reg
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/mask
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/compl_B
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/alu_unit/negative_reg
add wave -noupdate -divider Shift_and_concat
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/shiftConcat_mod/J_address
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/shiftConcat_mod/PC_add
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/shiftConcat_mod/new_jumpAddr
add wave -noupdate -divider Adder_nextPC
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Adder_nextPC/A
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Adder_nextPC/B
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Adder_nextPC/C
add wave -noupdate -divider Adder_branch
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Adder_branch/A
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Adder_branch/B
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/Adder_branch/C
add wave -noupdate -divider Mux_to_updatePC_withJump
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_updatePC_withJump/mux_sel
add wave -noupdate -label PC_next -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_updatePC_withJump/data1
add wave -noupdate -label New_jumpAddr -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_updatePC_withJump/data2
add wave -noupdate -label A -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_updatePC_withJump/data3
add wave -noupdate -label Branch_addr -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_updatePC_withJump/data4
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/MUX_to_updatePC_withJump/Data_out
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/SerialDataIn
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/clk
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/reset
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/clr_rx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/clr_tx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/uart_tx
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/Start_Tx
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/enable_StoreTxbuff
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/UART_data
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/SerialDataOut
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/Rx_flag_out
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/Tx_flag_out
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/state_tx
add wave -noupdate -color Red -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/Rx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DataRx_tmp
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DataRx
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/endTx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/Send_byte_indicator
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/clr_tx_8bit_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/Data_to_Tx_tmp_wire
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/uart_ctrlUnit/Data_to_Tx
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/uart_ctrlUnit/byte_number
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/uart_tx_copy
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/Data_to_Tx_tmp_reg
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/Send_byte_indicator_reg
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/cleanTx_flag_reg
add wave -noupdate -divider tx
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/clk
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/reset
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/Transmit
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/DataTx
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/clr_tx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/SerialDataOut
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/endTx_flag
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/bit_number
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/state
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/buff_tx
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/baud_count
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/uart_ctrlUnit/DUV_UART_TX/end_Tx_reg
add wave -noupdate -divider asci
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/uart_ctrlUnit/ASCII_Trans/Data_in_Rx
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/uart_ctrlUnit/ASCII_Trans/Data_out_Rx
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/uart_ctrlUnit/ASCII_Trans/Data_in_Tx
add wave -noupdate -radix unsigned /MIPS_1C_TB/testing_mips/uart_ctrlUnit/ASCII_Trans/Data_out_Tx
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {54692 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 181
configure wave -valuecolwidth 166
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {54663 ps} {55255 ps}
