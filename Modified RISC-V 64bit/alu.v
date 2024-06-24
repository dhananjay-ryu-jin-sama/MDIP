module ALU (   //  use Vector Length Agnosticism (VLA). VLA allows for the dynamic adjustment of vector register size use vector isa 1.0 drsft
    input [63:0] A, B,
    input [7:0] alu_control,//
    output reg [63:0] alu_output,
    output reg zero_flag
);

reg counter;

    always @(*) 
    begin
        case (alu_control)
            8'b00000001 : alu_output = A + B;   //ADD
            8'b00000010 : alu_output = A - B;   //SUB   
            8'b00000011 : alu_output = A * B;   //MUL
            8'b00000100 : alu_output = A & B;   //Bitwise AND
            8'b00000101 : alu_output = A | B;   //Bitwise OR
            8'b00000110 : alu_output = A ~ B;   //Bitwise NOT
            8'b00000111 : alu_output = A ^ B;   //Bitwise XOR
            8'b00001000 : alu_output = A << B;  //Left Shift B times
            8'b00001001 : alu_output = A >> B;  //Right Shift B times
            8'b00001010:    //A greater than B or not
                begin 
                    if(A > B)
                    alu_result = 1'b1;
                    else
                    alu_result = 1'b0;
                end
            8'b00001011:    //A lesser than B or not
                begin 
                    if(A < B)
                    alu_result = 1'b1;
                    else
                    alu_result = 1'b0;
                end
            8'b00001100:    //A equal to B or not
                begin 
                    if(A == B)
                    alu_result = 1'b1;
                    else
                    alu_result = 1'b0;
                end
            8'b00001101 : counter = A;  //Set counter values as A
            8'b00001110 : counter <= counter + 1;  //Increment counter by 1
            8'b00001111 : counter <= counter - 1;  //Decrement counter by 1
            
            
        endcase

        if (alu_output == 0)
            zero_flag == 1'b1;
        else
            zero_flag == 1'b0;
        

    end
endmodule