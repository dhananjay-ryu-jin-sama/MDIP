module ALU (
    input [63:0] A, B,
    input [7:0] alu_operation,
    output reg [63:0] alu_output,
    output reg zero_flag,
    output reg negative_flag,
    output reg overflow_flag,
    output reg carry_flag
);

reg [63:0] counter;
reg [64:0] temp;

    always @(*) 
    begin
        case (alu_operation)
            8'b0000_0001 : alu_output = A + B;   // ADD
            8'b0000_0010 : alu_output = A - B;   // SUB
            8'b0000_0011 : alu_output = A * B;   // MUL
            8'b0000_0100 : alu_output = A & B;   // Bitwise AND
            8'b0000_0105 : alu_output = A | B;   // Bitwise OR
            8'b0000_0110 : alu_output = ~A;      // Bitwise NOT
            8'b0000_0111 : alu_output = A ^ B;   // Bitwise XOR
            8'b0000_1000 : alu_output = A << B;  // Left Shift B times
            8'b0000_1001 : alu_output = A >> B;  // Right Shift B times
            8'b0000_1010:                       // A greater than B or not
                begin 
                    if (A > B)
                        alu_output = 1'b1;
                    else
                        alu_output = 1'b0;
                end
            8'b0000_1011:                       // A less than B or not
                begin 
                    if (A < B)
                        alu_output = 1'b1;
                    else
                        alu_output = 1'b0;
                end
            8'b0000_1100:                       // A equal to B or not
                begin 
                    if (A == B)
                        alu_output = 1'b1;
                    else
                        alu_output = 1'b0;
                end
            8'b0000_1101 : counter = A;         // Set counter values as A
            8'b0000_1110 : counter = counter + 1;  // Increment counter by 1
            8'b0000_1111 : counter = counter - 1;  // Decrement counter by 1
            8'b0001_0000 : {carry_flag, alu_output} = A + B + carry_flag; // ADD using carry
            default: alu_output = 64'd0; // Default case
        endcase

        // Zero Flag
        if (alu_output == 0)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;

        // Negative Flag
        if (alu_output[63] == 1'b1)
            negative_flag = 1'b1;
        else
            negative_flag = 1'b0;

        // Overflow Flag
        if ((A[63] == B[63]) && (alu_output[63] != A[63]))
            overflow_flag = 1'b1;
        else
            overflow_flag = 1'b0;
    end
endmodule
