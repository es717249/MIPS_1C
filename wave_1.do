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
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/ROM/q
add wave -noupdate -divider VirtualROM
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualAddress_ROM/address
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualAddress_ROM/translated_addr
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/VirtualAddress_ROM/MIPS_address
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
add wave -noupdate /MIPS_1C_TB/testing_mips/MUX_Mem_or_Periph_to_MUXWriteData/mux_sel
add wave -noupdate /MIPS_1C_TB/testing_mips/MUX_Mem_or_Periph_to_MUXWriteData/data1
add wave -noupdate /MIPS_1C_TB/testing_mips/MUX_Mem_or_Periph_to_MUXWriteData/data2
add wave -noupdate /MIPS_1C_TB/testing_mips/MUX_Mem_or_Periph_to_MUXWriteData/Data_out
add wave -noupdate -divider RAM
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
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/RegWrite
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/decoder_module/PC_En
add wave -noupdate -divider Address_prep
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/Mmemory_output
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/opcode
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/funct
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/rs
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/rt
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/rd
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/shamt
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/immediate_data
add wave -noupdate -radix hexadecimal /MIPS_1C_TB/testing_mips/add_prep/address_j
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {75 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 180
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {489 ps}
