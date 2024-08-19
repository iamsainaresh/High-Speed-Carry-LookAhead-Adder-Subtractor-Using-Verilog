`timescale 1ns / 1ps
module carry_look_ahead_adder_subtractor(
    input [3:0] A,        // 4-bit input A
    input [3:0] B,        // 4-bit input B
    input Cin,            // Carry input
    //input control,        // Control signal: 0 for addition, 1 for subtraction
    output [3:0] sum,     // 4-bit sum output
    output Cout           // Carry/Borrow output
    );
    
    wire [3:0] P;         // Propagate
    wire [3:0] G;         // Generate
    wire [3:0] C;         // Carry
    wire [3:0] B_xor;     // B after XOR with add_sub
    
    // XOR b with add_sub control signal to get two's complement for subtraction
    assign B_xor = B ^ {4{Cin}};
    
    // Propagate signals
    assign P[0] = A[0] ^ B_xor[0];
    assign P[1] = A[1] ^ B_xor[1];
    assign P[2] = A[2] ^ B_xor[2];
    assign P[3] = A[3] ^ B_xor[3];
    
    //Generate Signals
    assign G[0] = A[0] & B_xor[0];
    assign G[1] = A[1] & B_xor[1];
    assign G[2] = A[2] & B_xor[2];
    assign G[3] = A[3] & B_xor[3];
    
    // Carry signals
    assign C[0] = G[0];
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    
    //Output
    assign sum = P ^ C[3:0];
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);
    
endmodule
