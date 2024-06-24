module ALU_tb;

  // Testbench signals
  reg [63:0] A, B;
  reg [7:0] alu_operation;
  wire [63:0] alu_output;
  wire zero_flag;
  wire negative_flag;
  wire overflow_flag;
  wire carry_flag;

  // Instantiate the ALU module
  ALU uut (
    .A(A),
    .B(B),
    .alu_operation(alu_operation),
    .alu_output(alu_output),
    .zero_flag(zero_flag),
    .negative_flag(negative_flag),
    .overflow_flag(overflow_flag),
    .carry_flag(carry_flag)
  );

  initial begin
    // Initialize inputs
    A = 64'b0;
    B = 64'b0;
    alu_operation = 8'b0;
    
    // Wait for global reset
    #100;

    // Test ADD
    A = 64'd15;
    B = 64'd10;
    alu_operation = 8'b0000_0001;
    #10;
    $display("ADD: A = %d, B = %d, Output = %d", A, B, alu_output);
    
    // Test SUB
    A = 64'd20;
    B = 64'd10;
    alu_operation = 8'b0000_0010;
    #10;
    $display("SUB: A = %d, B = %d, Output = %d", A, B, alu_output);

    // Test MUL
    A = 64'd3;
    B = 64'd4;
    alu_operation = 8'b0000_0011;
    #10;
    $display("MUL: A = %d, B = %d, Output = %d", A, B, alu_output);

    // Test AND
    A = 64'hF0F0F0F0F0F0F0F0;
    B = 64'h0F0F0F0F0F0F0F0F;
    alu_operation = 8'b0000_0100;
    #10;
    $display("AND: A = %h, B = %h, Output = %h", A, B, alu_output);

    // Test OR
    A = 64'hF0F0F0F0F0F0F0F0;
    B = 64'h0F0F0F0F0F0F0F0F;
    alu_operation = 8'b0000_0101;
    #10;
    $display("OR: A = %h, B = %h, Output = %h", A, B, alu_output);

    // Test XOR
    A = 64'hFF00FF00FF00FF00;
    B = 64'h00FF00FF00FF00FF;
    alu_operation = 8'b0000_0111;
    #10;
    $display("XOR: A = %h, B = %h, Output = %h", A, B, alu_output);

    // Test NOT
    A = 64'hFFFFFFFFFFFFFFFF;
    alu_operation = 8'b0000_0110;
    #10;
    $display("NOT: A = %h, Output = %h", A, alu_output);

    // Test Left Shift
    A = 64'h0000000000000001;
    B = 64'd4;
    alu_operation = 8'b0000_1000;
    #10;
    $display("LSHIFT: A = %h, B = %d, Output = %h", A, B, alu_output);

    // Test Right Shift
    A = 64'h0000000000000010;
    B = 64'd4;
    alu_operation = 8'b0000_1001;
    #10;
    $display("RSHIFT: A = %h, B = %d, Output = %h", A, B, alu_output);

    // Add more test cases as needed

    // Finish the simulation
    #100;
    $finish;
  end

endmodule
