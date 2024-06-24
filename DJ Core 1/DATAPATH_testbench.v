`timescale 1ns / 1ps

module DATAPATH_TB;

    // Inputs
    reg [7:0] reg_read_addr_1;
    reg [7:0] reg_read_addr_2;
    reg [7:0] reg_write_addr;
    reg [63:0] reg_write_data;
    reg reg_write_cmd;
    reg [7:0] alu_operation;
    reg clock;
    reg reset;

    // Outputs
    wire zero_flag;
    wire negative_flag;
    wire overflow_flag;

    // Instantiate the DATAPATH module
    DATAPATH uut (
        .reg_read_addr_1(reg_read_addr_1),
        .reg_read_addr_2(reg_read_addr_2),
        .reg_write_addr(reg_write_addr),
        .reg_write_data(reg_write_data),
        .reg_write_cmd(reg_write_cmd),
        .alu_operation(alu_operation),
        .clock(clock),
        .reset(reset),
        .zero_flag(zero_flag),
        .negative_flag(negative_flag),
        .overflow_flag(overflow_flag)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        reg_read_addr_1 = 0;
        reg_read_addr_2 = 0;
        reg_write_addr = 0;
        reg_write_data = 0;
        reg_write_cmd = 0;
        alu_operation = 0;
        reset = 0;

        // Apply reset
        #10 reset = 1;
        #10 reset = 0;

        // Write data to register 2
        #10;
        reg_write_addr = 8'h02;
        reg_write_data = 64'hAAAAAAAAAAAAAAAA;
        reg_write_cmd = 1;
        #10;
        reg_write_cmd = 0;

        // Write data to register 3
        #10;
        reg_write_addr = 8'h03;
        reg_write_data = 64'hBBBBBBBBBBBBBBBB;
        reg_write_cmd = 1;
        #10;
        reg_write_cmd = 0;

        // Set read addresses
        #10;
        reg_read_addr_1 = 8'h02;
        reg_read_addr_2 = 8'h03;

        // Perform an ADD operation
        #10;
        alu_operation = 8'b0000_0001; // ADD

        // Wait for ALU result
        #10;
        $display("ADD: reg_read_data_1: %h, reg_read_data_2: %h, ALU result: %h", uut.reg_file_module.reg_read_data_1, uut.reg_file_module.reg_read_data_2, uut.alu_module.alu_output);
        $display("Flags - Zero: %b, Negative: %b, Overflow: %b", zero_flag, negative_flag, overflow_flag);

        // Perform a SUB operation
        #10;
        alu_operation = 8'b0000_0010; // SUB

        // Wait for ALU result
        #10;
        $display("SUB: reg_read_data_1: %h, reg_read_data_2: %h, ALU result: %h", uut.reg_file_module.reg_read_data_1, uut.reg_file_module.reg_read_data_2, uut.alu_module.alu_output);
        $display("Flags - Zero: %b, Negative: %b, Overflow: %b", zero_flag, negative_flag, overflow_flag);

        // End the test
        #10 $finish;
    end

endmodule
