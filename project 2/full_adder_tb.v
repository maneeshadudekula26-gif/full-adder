`timescale 1ns/1ps

module full_adder_tb;

reg A;
reg B;
reg Cin;

wire Sum;
wire Carry;

full_adder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Carry(Carry)
);

initial
begin
    $display("A B Cin | Sum Carry");
    $display("----------------------");

    $monitor("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Carry);

    A=0; B=0; Cin=0; #10;
    A=0; B=0; Cin=1; #10;
    A=0; B=1; Cin=0; #10;
    A=0; B=1; Cin=1; #10;
    A=1; B=0; Cin=0; #10;
    A=1; B=0; Cin=1; #10;
    A=1; B=1; Cin=0; #10;
    A=1; B=1; Cin=1; #10;

    $finish;
end

initial
begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, full_adder_tb);
end

endmodule