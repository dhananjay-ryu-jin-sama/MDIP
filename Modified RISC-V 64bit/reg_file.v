module REG_FILE(
    input [7;0] reg_read_1,//
    input [7:0] reg_read_2,//

    input [7:0] reg_write,//
    input [63:0] reg_write_data,

    input reg_write_cmd,//
    input reset,//

    output [63:0] reg_read_data_1,
    output [63:0] reg_read_data_2,

    input clock//
);

    reg [63:0] reg_memory [99:0]; // 32 memory locations each 32 bits wide
    integer i=0;

    always @(posedge reset) 
        begin

            reg_memory[0] = 64'h0;
            reg_memory[1] = 64'hffff;
            reg_memory[2] = 64'h0;
            reg_memory[3] = 64'h0;
            reg_memory[4] = 64'h0;
            reg_memory[5] = 64'h0;
            reg_memory[6] = 64'h0;
            reg_memory[7] = 64'h0;
            reg_memory[8] = 64'h0;
            reg_memory[9] = 64'h0;
            reg_memory[10] = 64'h0;
            reg_memory[11] = 64'h0;
            reg_memory[12] = 64'h0;
            reg_memory[13] = 64'h0;
            reg_memory[14] = 64'h0;
            reg_memory[15] = 64'h0;
            reg_memory[16] = 64'h0;
            reg_memory[17] = 64'h0;
            reg_memory[18] = 64'h0;
            reg_memory[19] = 64'h0;
            reg_memory[20] = 64'h0;
            reg_memory[21] = 64'h0;
            reg_memory[22] = 64'h0;
            reg_memory[23] = 64'h0;
            reg_memory[24] = 64'h0;
            reg_memory[25] = 64'h0;
            reg_memory[26] = 64'h0;
            reg_memory[27] = 64'h0;
            reg_memory[28] = 64'h0;
            reg_memory[29] = 64'h0;
            reg_memory[30] = 64'h0;
            reg_memory[31] = 64'h0;
            reg_memory[32] = 64'h0;
            reg_memory[33] = 64'h0;
            reg_memory[34] = 64'h0;
            reg_memory[35] = 64'h0;
            reg_memory[36] = 64'h0;
            reg_memory[37] = 64'h0;
            reg_memory[38] = 64'h0;
            reg_memory[39] = 64'h0;
            reg_memory[40] = 64'h0;
            reg_memory[41] = 64'h0;
            reg_memory[42] = 64'h0;
            reg_memory[43] = 64'h0;
            reg_memory[44] = 64'h0;
            reg_memory[45] = 64'h0;
            reg_memory[46] = 64'h0;
            reg_memory[47] = 64'h0;
            reg_memory[48] = 64'h0;
            reg_memory[49] = 64'h0;
            reg_memory[50] = 64'h0;
            reg_memory[51] = 64'h0;
            reg_memory[52] = 64'h0;
            reg_memory[53] = 64'h0;
            reg_memory[54] = 64'h0;
            reg_memory[55] = 64'h0;
            reg_memory[56] = 64'h0;
            reg_memory[57] = 64'h0;
            reg_memory[58] = 64'h0;
            reg_memory[59] = 64'h0;
            reg_memory[60] = 64'h0;
            reg_memory[61] = 64'h0;
            reg_memory[62] = 64'h0;
            reg_memory[63] = 64'h0;
            reg_memory[64] = 64'h0;
            reg_memory[65] = 64'h0;
            reg_memory[66] = 64'h0;
            reg_memory[67] = 64'h0;
            reg_memory[68] = 64'h0;
            reg_memory[69] = 64'h0;
            reg_memory[70] = 64'h0;
            reg_memory[71] = 64'h0;
            reg_memory[72] = 64'h0;
            reg_memory[73] = 64'h0;
            reg_memory[74] = 64'h0;
            reg_memory[75] = 64'h0;
            reg_memory[76] = 64'h0;
            reg_memory[77] = 64'h0;
            reg_memory[78] = 64'h0;
            reg_memory[79] = 64'h0;
            reg_memory[80] = 64'h0;
            reg_memory[81] = 64'h0;
            reg_memory[82] = 64'h0;
            reg_memory[83] = 64'h0;
            reg_memory[84] = 64'h0;
            reg_memory[85] = 64'h0;
            reg_memory[86] = 64'h0;
            reg_memory[87] = 64'h0;
            reg_memory[88] = 64'h0;
            reg_memory[89] = 64'h0;
            reg_memory[90] = 64'h0;
            reg_memory[91] = 64'h0;
            reg_memory[92] = 64'h0;
            reg_memory[93] = 64'h0;
            reg_memory[94] = 64'h0;
            reg_memory[95] = 64'h0;
            reg_memory[96] = 64'h0;
            reg_memory[97] = 64'h0;
            reg_memory[98] = 64'h0;
            reg_memory[99] = 64'h0;
        end


    assign reg_read_data_1 = reg_memory[reg_read_1];
    assign reg_read_data_2 = reg_memory[reg_read_2];


    always @(posedge clk ) begin
        
        if (reg_write_cmd && reg_write != 8'b0000_0000 && reg_write != 8'b0000_0001) begin
            reg_memory[reg_write] = reg_write_data
        end
    end
    
endmodule