`include "reg_file.v"
`include "alu.v"    

module DATAPATH (
    input [7:0] reg_read_1,
    input [7:0] reg_read_2,
    input [7:0] reg_write,
    input reg_write_cmd,

    input [7:0] alu_control,

    input clock,
    input reset,

    output zero_flag
);

    wire [63:0]read_data1;
    wire [63:0]read_data2;
    wire [63:0]write_data;


    reg_file reg_file_module(
        reg_read_1,
        reg_read_2,
        reg_write,
        reg_write_data,

        reg_write_cmd,
        reset,

        reg_read_data_1,
        reg_read_data_2,

        clock
    );

    alu alu_module(
        read_data1,
        read_data2,
        alu_control,
        write_data,
        zero_flag
    );
    
endmodule