`include "REG_FILE.v"
`include "ALU.v"

module DATAPATH (
    input [7:0] reg_read_addr_1,  // register reading address
    input [7:8] reg_read_addr_2,  // register reading address
    input [7:0] reg_write_addr,   // register writing address
    input [63:0] reg_write_data,  // register write data
    input reg_write_cmd,          // register write appval command

    input [7:0] alu_operation,    // alu operation control input
    input clock,
    input reset,

    output zero_flag,
    output negative_flag,
    output overflow_flag
);

    wire [63:0] reg_read_data_1;
    wire [63:0] reg_read_data_2;
    wire [63:0] alu_output;

    REG_FILE reg_file_module(
        .reg_read_addr_1(reg_read_addr_1),
        .reg_read_addr_2(reg_read_addr_2),
        .reg_write_addr(reg_write_addr),
        .reg_write_data(reg_write_data),
        .reg_write_cmd(reg_write_cmd),
        .reset(reset),
        .reg_read_data_1(reg_read_data_1),
        .reg_read_data_2(reg_read_data_2),
        .clock(clock)
    );

    ALU alu_module(
        .A(reg_read_data_1),
        .B(reg_read_data_2),
        .alu_operation(alu_operation),
        .alu_output(alu_output),
        .zero_flag(zero_flag),
        .negative_flag(negative_flag),
        .overflow_flag(overflow_flag)
    );

endmodule
