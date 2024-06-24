module REG_FILE_TB;

    // Inputs
    reg [7:0] reg_read_addr_1;
    reg [7:0] reg_read_addr_2;
    reg [7:0] reg_write_addr;
    reg [63:0] reg_write_data;
    reg reg_write_cmd;
    reg reset;
    reg clock;

    // Outputs
    wire [63:0] reg_read_data_1;
    wire [63:0] reg_read_data_2;

    // Instantiate the REG_FILE module
    REG_FILE uut (
        .reg_read_addr_1(reg_read_addr_1),
        .reg_read_addr_2(reg_read_addr_2),
        .reg_write_addr(reg_write_addr),
        .reg_write_data(reg_write_data),
        .reg_write_cmd(reg_write_cmd),
        .reset(reset),
        .clock(clock),
        .reg_read_data_1(reg_read_data_1),
        .reg_read_data_2(reg_read_data_2)
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
        reset = 0;

        // Apply reset
        #10 reset = 1;
        #10 reset = 0;

        // Test writing to a register
        #10;
        reg_write_addr = 8'h02;
        reg_write_data = 64'hAAAAAAAAAAAAAAAA;
        reg_write_cmd = 1;
        #10;
        reg_write_cmd = 0;

        // Test reading from the same register
        #10;
        reg_read_addr_1 = 8'h02;
        reg_read_addr_2 = 8'h02;

        #10;
        // Display results
        $display("reg_read_data_1: %h", reg_read_data_1);
        $display("reg_read_data_2: %h", reg_read_data_2);

        // Test writing to another register
        #10;
        reg_write_addr = 8'h03;
        reg_write_data = 64'hBBBBBBBBBBBBBBBB;
        reg_write_cmd = 1;
        #10;
        reg_write_cmd = 0;

        // Test reading from different registers
        #10;
        reg_read_addr_1 = 8'h02;
        reg_read_addr_2 = 8'h03;

        #10;
        // Display results
        $display("reg_read_data_1: %h", reg_read_data_1);
        $display("reg_read_data_2: %h", reg_read_data_2);

        // End the test
        #10 $finish;
    end

endmodule
