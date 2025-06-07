`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/21 14:52:09
// Design Name: 
// Module Name: mul_cycle_byte_times_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mul_cycle_byte_times_wrapper(
input                                   i_clk                   ,
input                                   i_rst                   ,
input                                   i_countreg_valid        ,
input       [63:0]                      i_countreg_0_0          ,
input       [63:0]                      i_countreg_0_1          ,
input       [63:0]                      i_countreg_0_2          ,
input       [63:0]                      i_countreg_0_3          ,
input       [63:0]                      i_countreg_0_4          ,
input       [63:0]                      i_countreg_0_5          ,
input       [63:0]                      i_countreg_0_6          ,
input       [63:0]                      i_countreg_0_7          ,
input       [63:0]                      i_countreg_1_0          ,
input       [63:0]                      i_countreg_1_1          ,
input       [63:0]                      i_countreg_1_2          ,
input       [63:0]                      i_countreg_1_3          ,
input       [63:0]                      i_countreg_1_4          ,
input       [63:0]                      i_countreg_1_5          ,
input       [63:0]                      i_countreg_1_6          ,
input       [63:0]                      i_countreg_1_7          ,
input       [63:0]                      i_countreg_2_0          ,
input       [63:0]                      i_countreg_2_1          ,
input       [63:0]                      i_countreg_2_2          ,
input       [63:0]                      i_countreg_2_3          ,
input       [63:0]                      i_countreg_2_4          ,
input       [63:0]                      i_countreg_2_5          ,
input       [63:0]                      i_countreg_2_6          ,
input       [63:0]                      i_countreg_2_7          ,
input       [63:0]                      i_countreg_3_0          ,
input       [63:0]                      i_countreg_3_1          ,
input       [63:0]                      i_countreg_3_2          ,
input       [63:0]                      i_countreg_3_3          ,
input       [63:0]                      i_countreg_3_4          ,
input       [63:0]                      i_countreg_3_5          ,
input       [63:0]                      i_countreg_3_6          ,
input       [63:0]                      i_countreg_3_7          ,
output      [8:0]                       o_final_sum_0           ,
output      [8:0]                       o_final_sum_1           ,                     
output      [8:0]                       o_final_sum_2           ,
output      [8:0]                       o_final_sum_3           ,
output      [8:0]                       o_final_sum_4           ,
output      [8:0]                       o_final_sum_5           ,
output      [8:0]                       o_final_sum_6           ,
output      [8:0]                       o_final_sum_7           ,
output      [8:0]                       o_final_sum_8           ,
output      [8:0]                       o_final_sum_9           ,
output      [8:0]                       o_final_sum_10          ,
output      [8:0]                       o_final_sum_11          ,
output      [8:0]                       o_final_sum_12          ,
output      [8:0]                       o_final_sum_13          ,
output      [8:0]                       o_final_sum_14          ,
output      [8:0]                       o_final_sum_15          ,
output      [8:0]                       o_final_sum_16          ,
output      [8:0]                       o_final_sum_17          ,
output      [8:0]                       o_final_sum_18          ,
output      [8:0]                       o_final_sum_19          ,
output      [8:0]                       o_final_sum_20          ,
output      [8:0]                       o_final_sum_21          ,
output      [8:0]                       o_final_sum_22          ,
output      [8:0]                       o_final_sum_23          ,
output      [8:0]                       o_final_sum_24          ,
output      [8:0]                       o_final_sum_25          ,
output      [8:0]                       o_final_sum_26          ,
output      [8:0]                       o_final_sum_27          ,
output      [8:0]                       o_final_sum_28          ,
output      [8:0]                       o_final_sum_29          ,
output      [8:0]                       o_final_sum_30          ,
output      [8:0]                       o_final_sum_31          ,          
output                                  o_final_sum_valid
);
reg                                     r_countreg_valid_1d     ;
reg                                     r_countreg_valid_2d     ;

always @(posedge i_clk) begin
    r_countreg_valid_1d <= i_countreg_valid;
    r_countreg_valid_2d <= r_countreg_valid_1d;
end

mul_cycle_byte_times mul_cycle_byte_times_U0(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_0_0[7:0]    ),
    .i_countreg_1            (i_countreg_0_1[7:0]    ),
    .i_countreg_2            (i_countreg_0_2[7:0]    ),
    .i_countreg_3            (i_countreg_0_3[7:0]    ),
    .i_countreg_4            (i_countreg_0_4[7:0]    ),
    .i_countreg_5            (i_countreg_0_5[7:0]    ),
    .i_countreg_6            (i_countreg_0_6[7:0]    ),
    .i_countreg_7            (i_countreg_0_7[7:0]    ),
    .o_final_sum             (o_final_sum_0          ),
    .o_final_sum_valid       (o_final_sum_valid      )      
);

mul_cycle_byte_times mul_cycle_byte_times_U1(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_0_0[15:8]   ),
    .i_countreg_1            (i_countreg_0_1[15:8]   ),
    .i_countreg_2            (i_countreg_0_2[15:8]   ),
    .i_countreg_3            (i_countreg_0_3[15:8]   ),
    .i_countreg_4            (i_countreg_0_4[15:8]   ),
    .i_countreg_5            (i_countreg_0_5[15:8]   ),
    .i_countreg_6            (i_countreg_0_6[15:8]   ),
    .i_countreg_7            (i_countreg_0_7[15:8]   ),
    .o_final_sum             (o_final_sum_1          )      
);

mul_cycle_byte_times mul_cycle_byte_times_U2(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_0_0[23:16]  ),
    .i_countreg_1            (i_countreg_0_1[23:16]  ),
    .i_countreg_2            (i_countreg_0_2[23:16]  ),
    .i_countreg_3            (i_countreg_0_3[23:16]  ),
    .i_countreg_4            (i_countreg_0_4[23:16]  ),
    .i_countreg_5            (i_countreg_0_5[23:16]  ),
    .i_countreg_6            (i_countreg_0_6[23:16]  ),
    .i_countreg_7            (i_countreg_0_7[23:16]  ),
    .o_final_sum             (o_final_sum_2          )      
);

mul_cycle_byte_times mul_cycle_byte_times_U3(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_0_0[31:24]  ),
    .i_countreg_1            (i_countreg_0_1[31:24]  ),
    .i_countreg_2            (i_countreg_0_2[31:24]  ),
    .i_countreg_3            (i_countreg_0_3[31:24]  ),
    .i_countreg_4            (i_countreg_0_4[31:24]  ),
    .i_countreg_5            (i_countreg_0_5[31:24]  ),
    .i_countreg_6            (i_countreg_0_6[31:24]  ),
    .i_countreg_7            (i_countreg_0_7[31:24]  ),
    .o_final_sum             (o_final_sum_3          )      
);

mul_cycle_byte_times mul_cycle_byte_times_U4(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_0_0[39:32]  ),
    .i_countreg_1            (i_countreg_0_1[39:32]  ),
    .i_countreg_2            (i_countreg_0_2[39:32]  ),
    .i_countreg_3            (i_countreg_0_3[39:32]  ),
    .i_countreg_4            (i_countreg_0_4[39:32]  ),
    .i_countreg_5            (i_countreg_0_5[39:32]  ),
    .i_countreg_6            (i_countreg_0_6[39:32]  ),
    .i_countreg_7            (i_countreg_0_7[39:32]  ),
    .o_final_sum             (o_final_sum_4          )      
);

mul_cycle_byte_times mul_cycle_byte_times_U5(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_0_0[47:40]  ),
    .i_countreg_1            (i_countreg_0_1[47:40]  ),
    .i_countreg_2            (i_countreg_0_2[47:40]  ),
    .i_countreg_3            (i_countreg_0_3[47:40]  ),
    .i_countreg_4            (i_countreg_0_4[47:40]  ),
    .i_countreg_5            (i_countreg_0_5[47:40]  ),
    .i_countreg_6            (i_countreg_0_6[47:40]  ),
    .i_countreg_7            (i_countreg_0_7[47:40]  ),
    .o_final_sum             (o_final_sum_5          )      
);

mul_cycle_byte_times mul_cycle_byte_times_U6(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_0_0[55:48]  ),
    .i_countreg_1            (i_countreg_0_1[55:48]  ),
    .i_countreg_2            (i_countreg_0_2[55:48]  ),
    .i_countreg_3            (i_countreg_0_3[55:48]  ),
    .i_countreg_4            (i_countreg_0_4[55:48]  ),
    .i_countreg_5            (i_countreg_0_5[55:48]  ),
    .i_countreg_6            (i_countreg_0_6[55:48]  ),
    .i_countreg_7            (i_countreg_0_7[55:48]  ),
    .o_final_sum             (o_final_sum_6          )      
);

mul_cycle_byte_times mul_cycle_byte_times_U7(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_0_0[63:56]  ),
    .i_countreg_1            (i_countreg_0_1[63:56]  ),
    .i_countreg_2            (i_countreg_0_2[63:56]  ),
    .i_countreg_3            (i_countreg_0_3[63:56]  ),
    .i_countreg_4            (i_countreg_0_4[63:56]  ),
    .i_countreg_5            (i_countreg_0_5[63:56]  ),
    .i_countreg_6            (i_countreg_0_6[63:56]  ),
    .i_countreg_7            (i_countreg_0_7[63:56]  ),
    .o_final_sum             (o_final_sum_7          )      
);

mul_cycle_byte_times mul_cycle_byte_times_U8(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_1_0[7:0]    ),
    .i_countreg_1            (i_countreg_1_1[7:0]    ),
    .i_countreg_2            (i_countreg_1_2[7:0]    ),
    .i_countreg_3            (i_countreg_1_3[7:0]    ),
    .i_countreg_4            (i_countreg_1_4[7:0]    ),
    .i_countreg_5            (i_countreg_1_5[7:0]    ),
    .i_countreg_6            (i_countreg_1_6[7:0]    ),
    .i_countreg_7            (i_countreg_1_7[7:0]    ),
    .o_final_sum             (o_final_sum_8          )      
);

mul_cycle_byte_times mul_cycle_byte_times_U9(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_1_0[15:8]   ),
    .i_countreg_1            (i_countreg_1_1[15:8]   ),
    .i_countreg_2            (i_countreg_1_2[15:8]   ),
    .i_countreg_3            (i_countreg_1_3[15:8]   ),
    .i_countreg_4            (i_countreg_1_4[15:8]   ),
    .i_countreg_5            (i_countreg_1_5[15:8]   ),
    .i_countreg_6            (i_countreg_1_6[15:8]   ),
    .i_countreg_7            (i_countreg_1_7[15:8]   ),
    .o_final_sum             (o_final_sum_9          )      
);

mul_cycle_byte_times mul_cycle_byte_times_U10(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_1_0[23:16]  ),
    .i_countreg_1            (i_countreg_1_1[23:16]  ),
    .i_countreg_2            (i_countreg_1_2[23:16]  ),
    .i_countreg_3            (i_countreg_1_3[23:16]  ),
    .i_countreg_4            (i_countreg_1_4[23:16]  ),
    .i_countreg_5            (i_countreg_1_5[23:16]  ),
    .i_countreg_6            (i_countreg_1_6[23:16]  ),
    .i_countreg_7            (i_countreg_1_7[23:16]  ),
    .o_final_sum             (o_final_sum_10         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U11(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_1_0[31:24]  ),
    .i_countreg_1            (i_countreg_1_1[31:24]  ),
    .i_countreg_2            (i_countreg_1_2[31:24]  ),
    .i_countreg_3            (i_countreg_1_3[31:24]  ),
    .i_countreg_4            (i_countreg_1_4[31:24]  ),
    .i_countreg_5            (i_countreg_1_5[31:24]  ),
    .i_countreg_6            (i_countreg_1_6[31:24]  ),
    .i_countreg_7            (i_countreg_1_7[31:24]  ),
    .o_final_sum             (o_final_sum_11         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U12(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_1_0[39:32]  ),
    .i_countreg_1            (i_countreg_1_1[39:32]  ),
    .i_countreg_2            (i_countreg_1_2[39:32]  ),
    .i_countreg_3            (i_countreg_1_3[39:32]  ),
    .i_countreg_4            (i_countreg_1_4[39:32]  ),
    .i_countreg_5            (i_countreg_1_5[39:32]  ),
    .i_countreg_6            (i_countreg_1_6[39:32]  ),
    .i_countreg_7            (i_countreg_1_7[39:32]  ),
    .o_final_sum             (o_final_sum_12         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U13(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_1_0[47:40]  ),
    .i_countreg_1            (i_countreg_1_1[47:40]  ),
    .i_countreg_2            (i_countreg_1_2[47:40]  ),
    .i_countreg_3            (i_countreg_1_3[47:40]  ),
    .i_countreg_4            (i_countreg_1_4[47:40]  ),
    .i_countreg_5            (i_countreg_1_5[47:40]  ),
    .i_countreg_6            (i_countreg_1_6[47:40]  ),
    .i_countreg_7            (i_countreg_1_7[47:40]  ),
    .o_final_sum             (o_final_sum_13         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U14(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_1_0[55:48]  ),
    .i_countreg_1            (i_countreg_1_1[55:48]  ),
    .i_countreg_2            (i_countreg_1_2[55:48]  ),
    .i_countreg_3            (i_countreg_1_3[55:48]  ),
    .i_countreg_4            (i_countreg_1_4[55:48]  ),
    .i_countreg_5            (i_countreg_1_5[55:48]  ),
    .i_countreg_6            (i_countreg_1_6[55:48]  ),
    .i_countreg_7            (i_countreg_1_7[55:48]  ),
    .o_final_sum             (o_final_sum_14         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U15(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_1_0[63:56]  ),
    .i_countreg_1            (i_countreg_1_1[63:56]  ),
    .i_countreg_2            (i_countreg_1_2[63:56]  ),
    .i_countreg_3            (i_countreg_1_3[63:56]  ),
    .i_countreg_4            (i_countreg_1_4[63:56]  ),
    .i_countreg_5            (i_countreg_1_5[63:56]  ),
    .i_countreg_6            (i_countreg_1_6[63:56]  ),
    .i_countreg_7            (i_countreg_1_7[63:56]  ),
    .o_final_sum             (o_final_sum_15         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U16(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_2_0[7:0]    ),
    .i_countreg_1            (i_countreg_2_1[7:0]    ),
    .i_countreg_2            (i_countreg_2_2[7:0]    ),
    .i_countreg_3            (i_countreg_2_3[7:0]    ),
    .i_countreg_4            (i_countreg_2_4[7:0]    ),
    .i_countreg_5            (i_countreg_2_5[7:0]    ),
    .i_countreg_6            (i_countreg_2_6[7:0]    ),
    .i_countreg_7            (i_countreg_2_7[7:0]    ),
    .o_final_sum             (o_final_sum_16         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U17(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_2_0[15:8]   ),
    .i_countreg_1            (i_countreg_2_1[15:8]   ),
    .i_countreg_2            (i_countreg_2_2[15:8]   ),
    .i_countreg_3            (i_countreg_2_3[15:8]   ),
    .i_countreg_4            (i_countreg_2_4[15:8]   ),
    .i_countreg_5            (i_countreg_2_5[15:8]   ),
    .i_countreg_6            (i_countreg_2_6[15:8]   ),
    .i_countreg_7            (i_countreg_2_7[15:8]   ),
    .o_final_sum             (o_final_sum_17         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U18(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_2_0[23:16]  ),
    .i_countreg_1            (i_countreg_2_1[23:16]  ),
    .i_countreg_2            (i_countreg_2_2[23:16]  ),
    .i_countreg_3            (i_countreg_2_3[23:16]  ),
    .i_countreg_4            (i_countreg_2_4[23:16]  ),
    .i_countreg_5            (i_countreg_2_5[23:16]  ),
    .i_countreg_6            (i_countreg_2_6[23:16]  ),
    .i_countreg_7            (i_countreg_2_7[23:16]  ),
    .o_final_sum             (o_final_sum_18         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U19(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_2_0[31:24]  ),
    .i_countreg_1            (i_countreg_2_1[31:24]  ),
    .i_countreg_2            (i_countreg_2_2[31:24]  ),
    .i_countreg_3            (i_countreg_2_3[31:24]  ),
    .i_countreg_4            (i_countreg_2_4[31:24]  ),
    .i_countreg_5            (i_countreg_2_5[31:24]  ),
    .i_countreg_6            (i_countreg_2_6[31:24]  ),
    .i_countreg_7            (i_countreg_2_7[31:24]  ),
    .o_final_sum             (o_final_sum_19         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U20(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_2_0[39:32]  ),
    .i_countreg_1            (i_countreg_2_1[39:32]  ),
    .i_countreg_2            (i_countreg_2_2[39:32]  ),
    .i_countreg_3            (i_countreg_2_3[39:32]  ),
    .i_countreg_4            (i_countreg_2_4[39:32]  ),
    .i_countreg_5            (i_countreg_2_5[39:32]  ),
    .i_countreg_6            (i_countreg_2_6[39:32]  ),
    .i_countreg_7            (i_countreg_2_7[39:32]  ),
    .o_final_sum             (o_final_sum_20         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U21(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_2_0[47:40]  ),
    .i_countreg_1            (i_countreg_2_1[47:40]  ),
    .i_countreg_2            (i_countreg_2_2[47:40]  ),
    .i_countreg_3            (i_countreg_2_3[47:40]  ),
    .i_countreg_4            (i_countreg_2_4[47:40]  ),
    .i_countreg_5            (i_countreg_2_5[47:40]  ),
    .i_countreg_6            (i_countreg_2_6[47:40]  ),
    .i_countreg_7            (i_countreg_2_7[47:40]  ),
    .o_final_sum             (o_final_sum_21         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U22(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_2_0[55:48]  ),
    .i_countreg_1            (i_countreg_2_1[55:48]  ),
    .i_countreg_2            (i_countreg_2_2[55:48]  ),
    .i_countreg_3            (i_countreg_2_3[55:48]  ),
    .i_countreg_4            (i_countreg_2_4[55:48]  ),
    .i_countreg_5            (i_countreg_2_5[55:48]  ),
    .i_countreg_6            (i_countreg_2_6[55:48]  ),
    .i_countreg_7            (i_countreg_2_7[55:48]  ),
    .o_final_sum             (o_final_sum_22         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U23(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_2_0[63:56]  ),
    .i_countreg_1            (i_countreg_2_1[63:56]  ),
    .i_countreg_2            (i_countreg_2_2[63:56]  ),
    .i_countreg_3            (i_countreg_2_3[63:56]  ),
    .i_countreg_4            (i_countreg_2_4[63:56]  ),
    .i_countreg_5            (i_countreg_2_5[63:56]  ),
    .i_countreg_6            (i_countreg_2_6[63:56]  ),
    .i_countreg_7            (i_countreg_2_7[63:56]  ),
    .o_final_sum             (o_final_sum_23         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U24(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_3_0[7:0]    ),
    .i_countreg_1            (i_countreg_3_1[7:0]    ),
    .i_countreg_2            (i_countreg_3_2[7:0]    ),
    .i_countreg_3            (i_countreg_3_3[7:0]    ),
    .i_countreg_4            (i_countreg_3_4[7:0]    ),
    .i_countreg_5            (i_countreg_3_5[7:0]    ),
    .i_countreg_6            (i_countreg_3_6[7:0]    ),
    .i_countreg_7            (i_countreg_3_7[7:0]    ),
    .o_final_sum             (o_final_sum_24         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U25(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_3_0[15:8]   ),
    .i_countreg_1            (i_countreg_3_1[15:8]   ),
    .i_countreg_2            (i_countreg_3_2[15:8]   ),
    .i_countreg_3            (i_countreg_3_3[15:8]   ),
    .i_countreg_4            (i_countreg_3_4[15:8]   ),
    .i_countreg_5            (i_countreg_3_5[15:8]   ),
    .i_countreg_6            (i_countreg_3_6[15:8]   ),
    .i_countreg_7            (i_countreg_3_7[15:8]   ),
    .o_final_sum             (o_final_sum_25         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U26(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_3_0[23:16]  ),
    .i_countreg_1            (i_countreg_3_1[23:16]  ),
    .i_countreg_2            (i_countreg_3_2[23:16]  ),
    .i_countreg_3            (i_countreg_3_3[23:16]  ),
    .i_countreg_4            (i_countreg_3_4[23:16]  ),
    .i_countreg_5            (i_countreg_3_5[23:16]  ),
    .i_countreg_6            (i_countreg_3_6[23:16]  ),
    .i_countreg_7            (i_countreg_3_7[23:16]  ),
    .o_final_sum             (o_final_sum_26         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U27(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_3_0[31:24]  ),
    .i_countreg_1            (i_countreg_3_1[31:24]  ),
    .i_countreg_2            (i_countreg_3_2[31:24]  ),
    .i_countreg_3            (i_countreg_3_3[31:24]  ),
    .i_countreg_4            (i_countreg_3_4[31:24]  ),
    .i_countreg_5            (i_countreg_3_5[31:24]  ),
    .i_countreg_6            (i_countreg_3_6[31:24]  ),
    .i_countreg_7            (i_countreg_3_7[31:24]  ),
    .o_final_sum             (o_final_sum_27         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U28(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_3_0[39:32]  ),
    .i_countreg_1            (i_countreg_3_1[39:32]  ),
    .i_countreg_2            (i_countreg_3_2[39:32]  ),
    .i_countreg_3            (i_countreg_3_3[39:32]  ),
    .i_countreg_4            (i_countreg_3_4[39:32]  ),
    .i_countreg_5            (i_countreg_3_5[39:32]  ),
    .i_countreg_6            (i_countreg_3_6[39:32]  ),
    .i_countreg_7            (i_countreg_3_7[39:32]  ),
    .o_final_sum             (o_final_sum_28         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U29(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_3_0[47:40]  ),
    .i_countreg_1            (i_countreg_3_1[47:40]  ),
    .i_countreg_2            (i_countreg_3_2[47:40]  ),
    .i_countreg_3            (i_countreg_3_3[47:40]  ),
    .i_countreg_4            (i_countreg_3_4[47:40]  ),
    .i_countreg_5            (i_countreg_3_5[47:40]  ),
    .i_countreg_6            (i_countreg_3_6[47:40]  ),
    .i_countreg_7            (i_countreg_3_7[47:40]  ),
    .o_final_sum             (o_final_sum_29         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U30(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_3_0[55:48]  ),
    .i_countreg_1            (i_countreg_3_1[55:48]  ),
    .i_countreg_2            (i_countreg_3_2[55:48]  ),
    .i_countreg_3            (i_countreg_3_3[55:48]  ),
    .i_countreg_4            (i_countreg_3_4[55:48]  ),
    .i_countreg_5            (i_countreg_3_5[55:48]  ),
    .i_countreg_6            (i_countreg_3_6[55:48]  ),
    .i_countreg_7            (i_countreg_3_7[55:48]  ),
    .o_final_sum             (o_final_sum_30         )      
);

mul_cycle_byte_times mul_cycle_byte_times_U31(
    .i_clk                   (i_clk                  ),
    .i_rst                   (i_rst                  ),
    .i_countreg_valid        (r_countreg_valid_2d    ),
    .i_countreg_0            (i_countreg_3_0[63:56]  ),
    .i_countreg_1            (i_countreg_3_1[63:56]  ),
    .i_countreg_2            (i_countreg_3_2[63:56]  ),
    .i_countreg_3            (i_countreg_3_3[63:56]  ),
    .i_countreg_4            (i_countreg_3_4[63:56]  ),
    .i_countreg_5            (i_countreg_3_5[63:56]  ),
    .i_countreg_6            (i_countreg_3_6[63:56]  ),
    .i_countreg_7            (i_countreg_3_7[63:56]  ),
    .o_final_sum             (o_final_sum_31         )      
);
endmodule
