`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:32 11/19/2020 
// Design Name: 
// Module Name:    Sqrt2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Sqrt2
          (In,
           Out, clk, reset);


  input   [14:0] In;  // ufix15_En8
  input clk, reset;
  output reg [14:0] Out;  // ufix15_En11


  wire [39:0] C5_out1;  // ufix40_En40
  wire [54:0] Product5_mul_temp;  // ufix55_En48
  wire [36:0] Product5_out1;  // ufix37_En37
  wire signed [36:0] C4_out1;  // sfix37_En36
  wire signed [37:0] Sum4_add_cast;  // sfix38_En37
  wire signed [37:0] Sum4_add_cast_1;  // sfix38_En37
  wire signed [37:0] Sum4_out1;  // sfix38_En37
  wire signed [15:0] Product4_cast;  // sfix16_En8
  wire signed [53:0] Product4_mul_temp;  // sfix54_En45
  wire signed [29:0] Product4_out1;  // sfix30_En29
  wire [22:0] C3_out1;  // ufix23_En23
  wire signed [29:0] Sum3_add_cast;  // sfix30_En29
  wire signed [29:0] Sum3_add_temp;  // sfix30_En29
  wire [28:0] Sum3_out1;  // ufix29_En29
  wire [43:0] Product3_mul_temp;  // ufix44_En37
  wire [22:0] Product3_out1;  // ufix23_En23
  wire signed [23:0] C2_out1;  // sfix24_En23
  wire signed [23:0] Sum2_add_cast;  // sfix24_En23
  wire signed [23:0] Sum2_out1;  // sfix24_En23
  wire signed [15:0] Product2_cast;  // sfix16_En8
  wire signed [39:0] Product2_mul_temp;  // sfix40_En31
  wire signed [17:0] Product2_out1;  // sfix18_En17
  wire [16:0] C1_out1;  // ufix17_En17
  wire signed [17:0] Sum1_add_cast;  // sfix18_En17
  wire signed [17:0] Sum1_add_temp;  // sfix18_En17
  wire [16:0] Sum1_out1;  // ufix17_En17
  wire [31:0] Product1_mul_temp;  // ufix32_En25
  wire [14:0] Product1_out1;  // ufix15_En11
  wire [9:0] C0_out1;  // ufix10_En10
  wire [14:0] Sum0_add_cast;  // ufix15_En11
  wire [14:0] Sum0_out1;  // ufix15_En11
  reg [14:0] In_reg;




  assign C5_out1 = 40'h0000003057;



  assign Product5_mul_temp = In_reg * C5_out1;
  assign Product5_out1 = Product5_mul_temp[47:11];



  assign C4_out1 = 37'sh1FFFFCC305;



  assign Sum4_add_cast = {1'b0, Product5_out1};
  assign Sum4_add_cast_1 = {C4_out1, 1'b0};
  assign Sum4_out1 = Sum4_add_cast + Sum4_add_cast_1;



  assign Product4_cast = {1'b0, In_reg};
  assign Product4_mul_temp = Product4_cast * Sum4_out1;
  assign Product4_out1 = Product4_mul_temp[45:16];



  assign C3_out1 = 23'b00000000000101001000101;



  assign Sum3_add_cast = {1'b0, {C3_out1, 6'b000000}};
  assign Sum3_add_temp = Product4_out1 + Sum3_add_cast;
  assign Sum3_out1 = Sum3_add_temp[28:0];



  assign Product3_mul_temp = In_reg * Sum3_out1;
  assign Product3_out1 = Product3_mul_temp[36:14];



  assign C2_out1 = 24'sb111111100001101010110101;



  assign Sum2_add_cast = {1'b0, Product3_out1};
  assign Sum2_out1 = Sum2_add_cast + C2_out1;



  assign Product2_cast = {1'b0, In_reg};
  assign Product2_mul_temp = Product2_cast * Sum2_out1;
  assign Product2_out1 = Product2_mul_temp[31:14];



  assign C1_out1 = 17'b01100111111011101;



  assign Sum1_add_cast = {1'b0, C1_out1};
  assign Sum1_add_temp = Product2_out1 + Sum1_add_cast;
  assign Sum1_out1 = Sum1_add_temp[16:0];



  assign Product1_mul_temp = In_reg * Sum1_out1;
  assign Product1_out1 = Product1_mul_temp[28:14];



  assign C0_out1 = 10'b0101101101;



  assign Sum0_add_cast = {4'b0, {C0_out1, 1'b0}};
  assign Sum0_out1 = Product1_out1 + Sum0_add_cast;


    always @(posedge clk)
    begin
   if (reset)
begin
   In_reg <= 15'b0;
   Out <= 15'b0;	
end
   else
   begin
  In_reg <= In;
  Out <= Sum0_out1;
   end
   end

  
  
  


endmodule  // Sqrt_test
