`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:45:14 11/20/2020
// Design Name:   Sqrt2
// Module Name:   C:/Users/Aleksandr/Desktop/Labs_verilog/Sqrt2/Sqrt2_TB.v
// Project Name:  Sqrt2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sqrt2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module Sqrt2_TB;

	// Inputs
	reg [14:0] In;
        reg clk;
	reg clk1;
	reg [14:0] out_ref1 = 0;
	reg [14:0] out_ref2 = 0;
	reg [14:0] out_ref = 0;
        reg reset;
	// Outputs
	wire [14:0] Out;
        integer fd, temp;
	integer fd1, temp1;
      

	// Instantiate the Unit Under Test (UUT)
	Sqrt2 uut (
		.In(In), 
		.Out(Out),
	.clk(clk),.reset(reset));

        initial
                $sdf_annotate("../Outputs/Sqrt2.sdf", uut);


	initial begin
	clk1 = 1'b0;
	clk = 1'b0;
	reset = 1'b0;
	fd = $fopen("../Source/In.dat", "r");
		//#33 reset=1'b0;
	fd1 = $fopen("../Source/Out_expected.dat", "r");
	In = 15'b0;
	end

	always @(posedge clk1)
	begin
	if (!$feof(fd))
		temp = $fscanf(fd, "%h", In);
		temp1 = $fscanf(fd1, "%h", out_ref1);
	end
	always @(posedge clk)
	begin
	out_ref2 <= out_ref1;
	out_ref <= out_ref2;
	end

	always begin
	#5 clk1 =~clk1;
	#2 clk = ~clk;
	end
      
endmodule

