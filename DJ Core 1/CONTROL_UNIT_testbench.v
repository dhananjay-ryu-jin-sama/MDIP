module CONTROL_tb;

  // Testbench signals
  reg [15:0] command_code;
  wire [7:0] alu_control_command;
  wire regwrite_control;

  // Instantiate the CONTROL module
  CONTROL uut (
    .command_code(command_code),
    .alu_control_command(alu_control_command),
    .regwrite_control(regwrite_control)
  );

  initial begin
    // Initialize inputs
    command_code = 16'b0;
    
    // Wait for global reset
    #100;

    // Test ADD
    command_code = 16'b0000_0000_0000_0001;
    #10;
    $display("ADD: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test SUB
    command_code = 16'b0000_0000_0000_0010;
    #10;
    $display("SUB: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test MUL
    command_code = 16'b0000_0000_0000_0011;
    #10;
    $display("MUL: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test Bitwise AND
    command_code = 16'b0000_0000_0000_0100;
    #10;
    $display("AND: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test Bitwise OR
    command_code = 16'b0000_0000_0000_0101;
    #10;
    $display("OR: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test Bitwise NOT
    command_code = 16'b0000_0000_0000_0110;
    #10;
    $display("NOT: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test Bitwise XOR
    command_code = 16'b0000_0000_0000_0111;
    #10;
    $display("XOR: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test Left Shift
    command_code = 16'b0000_0000_0000_1000;
    #10;
    $display("LSHIFT: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test Right Shift
    command_code = 16'b0000_0000_0000_1001;
    #10;
    $display("RSHIFT: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test A > B
    command_code = 16'b0000_0000_0000_1010;
    #10;
    $display("A > B: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test A < B
    command_code = 16'b0000_0000_0000_1011;
    #10;
    $display("A < B: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test A == B
    command_code = 16'b0000_0000_0000_1100;
    #10;
    $display("A == B: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test Set counter value as A
    command_code = 16'b0000_0000_0000_1101;
    #10;
    $display("Set counter: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test Increment counter value
    command_code = 16'b0000_0000_0000_1110;
    #10;
    $display("Increment counter: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test Decrement counter value
    command_code = 16'b0000_0000_0000_1111;
    #10;
    $display("Decrement counter: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Test ADD using carry
    command_code = 16'b0000_0000_0001_0000;
    #10;
    $display("ADD using carry: command_code = %b, alu_control_command = %b, regwrite_control = %b", command_code, alu_control_command, regwrite_control);

    // Finish the simulation
    #100;
    $finish;
  end

endmodule
