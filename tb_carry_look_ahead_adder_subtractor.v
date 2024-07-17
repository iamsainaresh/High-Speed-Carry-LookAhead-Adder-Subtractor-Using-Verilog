`timescale 1ns / 1ps
module tb_carry_look_ahead_adder_subtractor();
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    reg control;
    wire [3:0] sum;
    wire Cout;
    
    carry_look_ahead_adder_subtractor UUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .control(control),
        .sum(sum),
        .Cout(Cout)
    );
    
    initial begin
        // Initialize inputs
        A = 4'b0000;
        B = 4'b0000;
        Cin = 1'b0;
        control = 1'b0;

        // Test addition
        #10 A = 4'b0011; B = 4'b0101; Cin = 1'b0; control = 1'b0; // 3 + 5
        #10 A = 4'b1111; B = 4'b0001; Cin = 1'b1; control = 1'b0; // 15 + 1 + 1

        // Test subtraction
        #10 A = 4'b1010; B = 4'b1010; Cin = 1'b1; control = 1'b1; // 10 - 3
        #10 A = 4'b0000; B = 4'b0000; Cin = 1'b1; control = 1'b1; // 12 - 6

        // End simulation
        #50 $stop;
    end
endmodule
