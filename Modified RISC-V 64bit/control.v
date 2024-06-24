module CONTROL (
    input [15:0]    command_code,
    output reg [7:0]    alu_control,
    output reg  regwrite_control;
); 

    always @(command_code)
        begin
            regwrite_control = 1;

            case (command_code)
                16'b0000_0000_0000_0001: alu_control = 8'b0000_0001; // ADD
                16'b0000_0000_0000_0010: alu_control = 8'b0000_0010; // SUB
                16'b0000_0000_0000_0011: alu_control = 8'b0000_0011; // MUL
                16'b0000_0000_0000_0100: alu_control = 8'b0000_0100; // Bitwise AND
                16'b0000_0000_0000_0101: alu_control = 8'b0000_0101; // Bitwise OR
                16'b0000_0000_0000_0110: alu_control = 8'b0000_0110; // Bitwise NOT
                16'b0000_0000_0000_0111: alu_control = 8'b0000_0111; // Bitwise XOR
                16'b0000_0000_0000_1000: alu_control = 8'b0000_1000; // Left Shift B times
                16'b0000_0000_0000_1001: alu_control = 8'b0000_1001; // Right Shift B times
                16'b0000_0000_0000_1010: alu_control = 8'b0000_1010; // A > B
                16'b0000_0000_0000_1011: alu_control = 8'b0000_1011; // A < B
                16'b0000_0000_0000_1100: alu_control = 8'b0000_1100; // A ==     B
                16'b0000_0000_0000_1101: alu_control = 8'b0000_1101; // Set counter value as A
                16'b0000_0000_0000_1110: alu_control = 8'b0000_1110; // Increment counter value
                16'b0000_0000_0000_1111: alu_control = 8'b0000_1111; // Decrement counter value
            endcase
        end
    
endmodule