`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/19 16:38:45
// Design Name: 
// Module Name: byte_count_wrapper
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


module byte_count_wrapper #(

    parameter DATA_WIDTH = 64

)(

input                                   i_clk                   ,
input                                   i_rst                   ,

input       [DATA_WIDTH-1:0]            count_data              ,
input                                   count_data_valid        ,
input       [7:0]                       count_data_len          ,
input       [15:0]                      i_flow_num              ,
output      [15:0]                      o_flow_num              ,
output      [7:0]                       o_pkt_len               ,
output                                  o_count_sum_valid       ,
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
output      [8:0]                       o_final_sum_31                    
/* output      [8:0]                       o_total_sum            */                    

);
/* assign      o_total_sum = o_final_sum_0 + o_final_sum_1 + o_final_sum_2 + o_final_sum_3 + o_final_sum_4 + o_final_sum_5 + o_final_sum_6 + o_final_sum_7
                        + o_final_sum_8 + o_final_sum_9 + o_final_sum_10 + o_final_sum_11 + o_final_sum_12 + o_final_sum_13 + o_final_sum_14 + o_final_sum_15
                        + o_final_sum_16 + o_final_sum_17 + o_final_sum_18 + o_final_sum_19 + o_final_sum_20 + o_final_sum_21 + o_final_sum_22 + o_final_sum_23
                        + o_final_sum_24 + o_final_sum_25 + o_final_sum_26 + o_final_sum_27 + o_final_sum_28 + o_final_sum_29 + o_final_sum_30 + o_final_sum_31; */
wire        [63:0]                      w_countreg_0_0 ;
wire        [63:0]                      w_countreg_1_0 ;
wire        [63:0]                      w_countreg_2_0 ;
wire        [63:0]                      w_countreg_3_0 ;
wire        [63:0]                      w_countreg_4_0 ;
wire        [63:0]                      w_countreg_5_0 ;
wire        [63:0]                      w_countreg_6_0 ;
wire        [63:0]                      w_countreg_7_0 ;
wire        [63:0]                      w_countreg_8_0 ;
wire        [63:0]                      w_countreg_9_0 ;
wire        [63:0]                      w_countreg_10_0;
wire        [63:0]                      w_countreg_11_0;
wire        [63:0]                      w_countreg_12_0;
wire        [63:0]                      w_countreg_13_0;
wire        [63:0]                      w_countreg_14_0;
wire        [63:0]                      w_countreg_15_0;
wire        [63:0]                      w_countreg_16_0;
wire        [63:0]                      w_countreg_17_0;
wire        [63:0]                      w_countreg_18_0;
wire        [63:0]                      w_countreg_19_0;
wire        [63:0]                      w_countreg_20_0;
wire        [63:0]                      w_countreg_21_0;
wire        [63:0]                      w_countreg_22_0;
wire        [63:0]                      w_countreg_23_0;
wire        [63:0]                      w_countreg_24_0;
wire        [63:0]                      w_countreg_25_0;
wire        [63:0]                      w_countreg_26_0;
wire        [63:0]                      w_countreg_27_0;
wire        [63:0]                      w_countreg_28_0;
wire        [63:0]                      w_countreg_29_0;
wire        [63:0]                      w_countreg_30_0;
wire        [63:0]                      w_countreg_31_0;
wire        [63:0]                      w_countreg_0_1 ;
wire        [63:0]                      w_countreg_1_1 ;
wire        [63:0]                      w_countreg_2_1 ;
wire        [63:0]                      w_countreg_3_1 ;
wire        [63:0]                      w_countreg_4_1 ;
wire        [63:0]                      w_countreg_5_1 ;
wire        [63:0]                      w_countreg_6_1 ;
wire        [63:0]                      w_countreg_7_1 ;
wire        [63:0]                      w_countreg_8_1 ;
wire        [63:0]                      w_countreg_9_1 ;
wire        [63:0]                      w_countreg_10_1;
wire        [63:0]                      w_countreg_11_1;
wire        [63:0]                      w_countreg_12_1;
wire        [63:0]                      w_countreg_13_1;
wire        [63:0]                      w_countreg_14_1;
wire        [63:0]                      w_countreg_15_1;
wire        [63:0]                      w_countreg_16_1;
wire        [63:0]                      w_countreg_17_1;
wire        [63:0]                      w_countreg_18_1;
wire        [63:0]                      w_countreg_19_1;
wire        [63:0]                      w_countreg_20_1;
wire        [63:0]                      w_countreg_21_1;
wire        [63:0]                      w_countreg_22_1;
wire        [63:0]                      w_countreg_23_1;
wire        [63:0]                      w_countreg_24_1;
wire        [63:0]                      w_countreg_25_1;
wire        [63:0]                      w_countreg_26_1;
wire        [63:0]                      w_countreg_27_1;
wire        [63:0]                      w_countreg_28_1;
wire        [63:0]                      w_countreg_29_1;
wire        [63:0]                      w_countreg_30_1;
wire        [63:0]                      w_countreg_31_1;
wire        [63:0]                      w_countreg_0_2 ;
wire        [63:0]                      w_countreg_1_2 ;
wire        [63:0]                      w_countreg_2_2 ;
wire        [63:0]                      w_countreg_3_2 ;
wire        [63:0]                      w_countreg_4_2 ;
wire        [63:0]                      w_countreg_5_2 ;
wire        [63:0]                      w_countreg_6_2 ;
wire        [63:0]                      w_countreg_7_2 ;
wire        [63:0]                      w_countreg_8_2 ;
wire        [63:0]                      w_countreg_9_2 ;
wire        [63:0]                      w_countreg_10_2;
wire        [63:0]                      w_countreg_11_2;
wire        [63:0]                      w_countreg_12_2;
wire        [63:0]                      w_countreg_13_2;
wire        [63:0]                      w_countreg_14_2;
wire        [63:0]                      w_countreg_15_2;
wire        [63:0]                      w_countreg_16_2;
wire        [63:0]                      w_countreg_17_2;
wire        [63:0]                      w_countreg_18_2;
wire        [63:0]                      w_countreg_19_2;
wire        [63:0]                      w_countreg_20_2;
wire        [63:0]                      w_countreg_21_2;
wire        [63:0]                      w_countreg_22_2;
wire        [63:0]                      w_countreg_23_2;
wire        [63:0]                      w_countreg_24_2;
wire        [63:0]                      w_countreg_25_2;
wire        [63:0]                      w_countreg_26_2;
wire        [63:0]                      w_countreg_27_2;
wire        [63:0]                      w_countreg_28_2;
wire        [63:0]                      w_countreg_29_2;
wire        [63:0]                      w_countreg_30_2;
wire        [63:0]                      w_countreg_31_2;
wire        [63:0]                      w_countreg_0_3 ;
wire        [63:0]                      w_countreg_1_3 ;
wire        [63:0]                      w_countreg_2_3 ;
wire        [63:0]                      w_countreg_3_3 ;
wire        [63:0]                      w_countreg_4_3 ;
wire        [63:0]                      w_countreg_5_3 ;
wire        [63:0]                      w_countreg_6_3 ;
wire        [63:0]                      w_countreg_7_3 ;
wire        [63:0]                      w_countreg_8_3 ;
wire        [63:0]                      w_countreg_9_3 ;
wire        [63:0]                      w_countreg_10_3;
wire        [63:0]                      w_countreg_11_3;
wire        [63:0]                      w_countreg_12_3;
wire        [63:0]                      w_countreg_13_3;
wire        [63:0]                      w_countreg_14_3;
wire        [63:0]                      w_countreg_15_3;
wire        [63:0]                      w_countreg_16_3;
wire        [63:0]                      w_countreg_17_3;
wire        [63:0]                      w_countreg_18_3;
wire        [63:0]                      w_countreg_19_3;
wire        [63:0]                      w_countreg_20_3;
wire        [63:0]                      w_countreg_21_3;
wire        [63:0]                      w_countreg_22_3;
wire        [63:0]                      w_countreg_23_3;
wire        [63:0]                      w_countreg_24_3;
wire        [63:0]                      w_countreg_25_3;
wire        [63:0]                      w_countreg_26_3;
wire        [63:0]                      w_countreg_27_3;
wire        [63:0]                      w_countreg_28_3;
wire        [63:0]                      w_countreg_29_3;
wire        [63:0]                      w_countreg_30_3;
wire        [63:0]                      w_countreg_31_3;
wire        [63:0]                      w_countreg_0_4 ;
wire        [63:0]                      w_countreg_1_4 ;
wire        [63:0]                      w_countreg_2_4 ;
wire        [63:0]                      w_countreg_3_4 ;
wire        [63:0]                      w_countreg_4_4 ;
wire        [63:0]                      w_countreg_5_4 ;
wire        [63:0]                      w_countreg_6_4 ;
wire        [63:0]                      w_countreg_7_4 ;
wire        [63:0]                      w_countreg_8_4 ;
wire        [63:0]                      w_countreg_9_4 ;
wire        [63:0]                      w_countreg_10_4;
wire        [63:0]                      w_countreg_11_4;
wire        [63:0]                      w_countreg_12_4;
wire        [63:0]                      w_countreg_13_4;
wire        [63:0]                      w_countreg_14_4;
wire        [63:0]                      w_countreg_15_4;
wire        [63:0]                      w_countreg_16_4;
wire        [63:0]                      w_countreg_17_4;
wire        [63:0]                      w_countreg_18_4;
wire        [63:0]                      w_countreg_19_4;
wire        [63:0]                      w_countreg_20_4;
wire        [63:0]                      w_countreg_21_4;
wire        [63:0]                      w_countreg_22_4;
wire        [63:0]                      w_countreg_23_4;
wire        [63:0]                      w_countreg_24_4;
wire        [63:0]                      w_countreg_25_4;
wire        [63:0]                      w_countreg_26_4;
wire        [63:0]                      w_countreg_27_4;
wire        [63:0]                      w_countreg_28_4;
wire        [63:0]                      w_countreg_29_4;
wire        [63:0]                      w_countreg_30_4;
wire        [63:0]                      w_countreg_31_4;
wire        [63:0]                      w_countreg_0_5 ;
wire        [63:0]                      w_countreg_1_5 ;
wire        [63:0]                      w_countreg_2_5 ;
wire        [63:0]                      w_countreg_3_5 ;
wire        [63:0]                      w_countreg_4_5 ;
wire        [63:0]                      w_countreg_5_5 ;
wire        [63:0]                      w_countreg_6_5 ;
wire        [63:0]                      w_countreg_7_5 ;
wire        [63:0]                      w_countreg_8_5 ;
wire        [63:0]                      w_countreg_9_5 ;
wire        [63:0]                      w_countreg_10_5;
wire        [63:0]                      w_countreg_11_5;
wire        [63:0]                      w_countreg_12_5;
wire        [63:0]                      w_countreg_13_5;
wire        [63:0]                      w_countreg_14_5;
wire        [63:0]                      w_countreg_15_5;
wire        [63:0]                      w_countreg_16_5;
wire        [63:0]                      w_countreg_17_5;
wire        [63:0]                      w_countreg_18_5;
wire        [63:0]                      w_countreg_19_5;
wire        [63:0]                      w_countreg_20_5;
wire        [63:0]                      w_countreg_21_5;
wire        [63:0]                      w_countreg_22_5;
wire        [63:0]                      w_countreg_23_5;
wire        [63:0]                      w_countreg_24_5;
wire        [63:0]                      w_countreg_25_5;
wire        [63:0]                      w_countreg_26_5;
wire        [63:0]                      w_countreg_27_5;
wire        [63:0]                      w_countreg_28_5;
wire        [63:0]                      w_countreg_29_5;
wire        [63:0]                      w_countreg_30_5;
wire        [63:0]                      w_countreg_31_5;
wire        [63:0]                      w_countreg_0_6 ;
wire        [63:0]                      w_countreg_1_6 ;
wire        [63:0]                      w_countreg_2_6 ;
wire        [63:0]                      w_countreg_3_6 ;
wire        [63:0]                      w_countreg_4_6 ;
wire        [63:0]                      w_countreg_5_6 ;
wire        [63:0]                      w_countreg_6_6 ;
wire        [63:0]                      w_countreg_7_6 ;
wire        [63:0]                      w_countreg_8_6 ;
wire        [63:0]                      w_countreg_9_6 ;
wire        [63:0]                      w_countreg_10_6;
wire        [63:0]                      w_countreg_11_6;
wire        [63:0]                      w_countreg_12_6;
wire        [63:0]                      w_countreg_13_6;
wire        [63:0]                      w_countreg_14_6;
wire        [63:0]                      w_countreg_15_6;
wire        [63:0]                      w_countreg_16_6;
wire        [63:0]                      w_countreg_17_6;
wire        [63:0]                      w_countreg_18_6;
wire        [63:0]                      w_countreg_19_6;
wire        [63:0]                      w_countreg_20_6;
wire        [63:0]                      w_countreg_21_6;
wire        [63:0]                      w_countreg_22_6;
wire        [63:0]                      w_countreg_23_6;
wire        [63:0]                      w_countreg_24_6;
wire        [63:0]                      w_countreg_25_6;
wire        [63:0]                      w_countreg_26_6;
wire        [63:0]                      w_countreg_27_6;
wire        [63:0]                      w_countreg_28_6;
wire        [63:0]                      w_countreg_29_6;
wire        [63:0]                      w_countreg_30_6;
wire        [63:0]                      w_countreg_31_6;
wire        [63:0]                      w_countreg_0_7 ;
wire        [63:0]                      w_countreg_1_7 ;
wire        [63:0]                      w_countreg_2_7 ;
wire        [63:0]                      w_countreg_3_7 ;
wire        [63:0]                      w_countreg_4_7 ;
wire        [63:0]                      w_countreg_5_7 ;
wire        [63:0]                      w_countreg_6_7 ;
wire        [63:0]                      w_countreg_7_7 ;
wire        [63:0]                      w_countreg_8_7 ;
wire        [63:0]                      w_countreg_9_7 ;
wire        [63:0]                      w_countreg_10_7;
wire        [63:0]                      w_countreg_11_7;
wire        [63:0]                      w_countreg_12_7;
wire        [63:0]                      w_countreg_13_7;
wire        [63:0]                      w_countreg_14_7;
wire        [63:0]                      w_countreg_15_7;
wire        [63:0]                      w_countreg_16_7;
wire        [63:0]                      w_countreg_17_7;
wire        [63:0]                      w_countreg_18_7;
wire        [63:0]                      w_countreg_19_7;
wire        [63:0]                      w_countreg_20_7;
wire        [63:0]                      w_countreg_21_7;
wire        [63:0]                      w_countreg_22_7;
wire        [63:0]                      w_countreg_23_7;
wire        [63:0]                      w_countreg_24_7;
wire        [63:0]                      w_countreg_25_7;
wire        [63:0]                      w_countreg_26_7;
wire        [63:0]                      w_countreg_27_7;
wire        [63:0]                      w_countreg_28_7;
wire        [63:0]                      w_countreg_29_7;
wire        [63:0]                      w_countreg_30_7;
wire        [63:0]                      w_countreg_31_7;

reg         [63:0]                      r_countreg_0_0  ;
reg         [63:0]                      r_countreg_0_1  ;
reg         [63:0]                      r_countreg_0_2  ;
reg         [63:0]                      r_countreg_0_3  ;
reg         [63:0]                      r_countreg_0_4  ;
reg         [63:0]                      r_countreg_0_5  ;
reg         [63:0]                      r_countreg_0_6  ;
reg         [63:0]                      r_countreg_0_7  ;
reg         [63:0]                      r_countreg_1_0  ;
reg         [63:0]                      r_countreg_1_1  ;
reg         [63:0]                      r_countreg_1_2  ;
reg         [63:0]                      r_countreg_1_3  ;
reg         [63:0]                      r_countreg_1_4  ;
reg         [63:0]                      r_countreg_1_5  ;
reg         [63:0]                      r_countreg_1_6  ;
reg         [63:0]                      r_countreg_1_7  ;
reg         [63:0]                      r_countreg_2_0  ;
reg         [63:0]                      r_countreg_2_1  ;
reg         [63:0]                      r_countreg_2_2  ;
reg         [63:0]                      r_countreg_2_3  ;
reg         [63:0]                      r_countreg_2_4  ;
reg         [63:0]                      r_countreg_2_5  ;
reg         [63:0]                      r_countreg_2_6  ;
reg         [63:0]                      r_countreg_2_7  ;
reg         [63:0]                      r_countreg_3_0  ;
reg         [63:0]                      r_countreg_3_1  ;
reg         [63:0]                      r_countreg_3_2  ;
reg         [63:0]                      r_countreg_3_3  ;
reg         [63:0]                      r_countreg_3_4  ;
reg         [63:0]                      r_countreg_3_5  ;
reg         [63:0]                      r_countreg_3_6  ;
reg         [63:0]                      r_countreg_3_7  ;

reg         [7:0]                       ro_pkt_len      ;
reg         [15:0]                      ri_flow_num     ;
reg                                     r_count_sum_valid;
reg                                     r_count_sum_valid_1d;
reg                                     r_count_sum_valid_2d;
reg                                     r_count_sum_valid_3d;
reg                                     r_count_sum_valid_4d;
reg                                     r_count_sum_valid_5d;
reg                                     r_count_sum_valid_6d;
reg                                     r_count_sum_valid_7d;
reg                                     r_count_sum_valid_8d;
reg                                     r_count_data_valid;
reg         [1:0]                       r_pkt_cycle_cnt;

assign      o_pkt_len            =      ro_pkt_len;
assign      o_flow_num           =      ri_flow_num; 

always @(posedge i_clk) begin
    ri_flow_num <= i_flow_num;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_count_sum_valid <= 'd0;
    else if(~count_data_valid & r_count_data_valid)
        r_count_sum_valid <= 'd1;
    else
        r_count_sum_valid <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_pkt_len <= 'd0;
    else if(!count_data_valid && r_pkt_cycle_cnt == 'd3)
        ro_pkt_len <= count_data_len;
    else
        ro_pkt_len <= ro_pkt_len;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_pkt_cycle_cnt <= 'd0;
    else if(!count_data_valid && r_count_data_valid)
        r_pkt_cycle_cnt <= r_pkt_cycle_cnt + 'd1;
    else
        r_pkt_cycle_cnt <= r_pkt_cycle_cnt;
end

always @(posedge i_clk) begin
    r_count_data_valid   <= count_data_valid;
    r_count_sum_valid_1d <= r_count_sum_valid;
    r_count_sum_valid_2d <= r_count_sum_valid_1d;
    r_count_sum_valid_3d <= r_count_sum_valid_2d;
    r_count_sum_valid_4d <= r_count_sum_valid_3d;
    r_count_sum_valid_5d <= r_count_sum_valid_4d;
    r_count_sum_valid_6d <= r_count_sum_valid_5d;
    r_count_sum_valid_7d <= r_count_sum_valid_6d;
    r_count_sum_valid_8d <= r_count_sum_valid_7d;
end

always @(posedge i_clk) begin
    if(r_count_sum_valid_1d)begin
        r_countreg_0_0  <= w_countreg_0_0 ;
        r_countreg_0_1  <= w_countreg_0_1 ;
        r_countreg_0_2  <= w_countreg_0_2 ;
        r_countreg_0_3  <= w_countreg_0_3 ;
        r_countreg_0_4  <= w_countreg_0_4 ;
        r_countreg_0_5  <= w_countreg_0_5 ;
        r_countreg_0_6  <= w_countreg_0_6 ;
        r_countreg_0_7  <= w_countreg_0_7 ;
    end else if(r_count_sum_valid_2d)begin
        r_countreg_0_0  <= w_countreg_4_0 ;
        r_countreg_0_1  <= w_countreg_4_1 ;
        r_countreg_0_2  <= w_countreg_4_2 ;
        r_countreg_0_3  <= w_countreg_4_3 ;
        r_countreg_0_4  <= w_countreg_4_4 ;
        r_countreg_0_5  <= w_countreg_4_5 ;
        r_countreg_0_6  <= w_countreg_4_6 ;
        r_countreg_0_7  <= w_countreg_4_7 ;
    end else if(r_count_sum_valid_3d)begin
        r_countreg_0_0  <= w_countreg_8_0 ;
        r_countreg_0_1  <= w_countreg_8_1 ;
        r_countreg_0_2  <= w_countreg_8_2 ;
        r_countreg_0_3  <= w_countreg_8_3 ;
        r_countreg_0_4  <= w_countreg_8_4 ;
        r_countreg_0_5  <= w_countreg_8_5 ;
        r_countreg_0_6  <= w_countreg_8_6 ;
        r_countreg_0_7  <= w_countreg_8_7 ;
    end else if(r_count_sum_valid_4d)begin
        r_countreg_0_0  <= w_countreg_12_0 ;
        r_countreg_0_1  <= w_countreg_12_1 ;
        r_countreg_0_2  <= w_countreg_12_2 ;
        r_countreg_0_3  <= w_countreg_12_3 ;
        r_countreg_0_4  <= w_countreg_12_4 ;
        r_countreg_0_5  <= w_countreg_12_5 ;
        r_countreg_0_6  <= w_countreg_12_6 ;
        r_countreg_0_7  <= w_countreg_12_7 ;
    end else if(r_count_sum_valid_5d)begin
        r_countreg_0_0  <= w_countreg_16_0 ;
        r_countreg_0_1  <= w_countreg_16_1 ;
        r_countreg_0_2  <= w_countreg_16_2 ;
        r_countreg_0_3  <= w_countreg_16_3 ;
        r_countreg_0_4  <= w_countreg_16_4 ;
        r_countreg_0_5  <= w_countreg_16_5 ;
        r_countreg_0_6  <= w_countreg_16_6 ;
        r_countreg_0_7  <= w_countreg_16_7 ;
    end else if(r_count_sum_valid_6d)begin
        r_countreg_0_0  <= w_countreg_20_0 ;
        r_countreg_0_1  <= w_countreg_20_1 ;
        r_countreg_0_2  <= w_countreg_20_2 ;
        r_countreg_0_3  <= w_countreg_20_3 ;
        r_countreg_0_4  <= w_countreg_20_4 ;
        r_countreg_0_5  <= w_countreg_20_5 ;
        r_countreg_0_6  <= w_countreg_20_6 ;
        r_countreg_0_7  <= w_countreg_20_7 ;
    end else if(r_count_sum_valid_7d)begin
        r_countreg_0_0  <= w_countreg_24_0 ;
        r_countreg_0_1  <= w_countreg_24_1 ;
        r_countreg_0_2  <= w_countreg_24_2 ;
        r_countreg_0_3  <= w_countreg_24_3 ;
        r_countreg_0_4  <= w_countreg_24_4 ;
        r_countreg_0_5  <= w_countreg_24_5 ;
        r_countreg_0_6  <= w_countreg_24_6 ;
        r_countreg_0_7  <= w_countreg_24_7 ;
    end else if(r_count_sum_valid_8d)begin
        r_countreg_0_0  <= w_countreg_28_0 ;
        r_countreg_0_1  <= w_countreg_28_1 ;
        r_countreg_0_2  <= w_countreg_28_2 ;
        r_countreg_0_3  <= w_countreg_28_3 ;
        r_countreg_0_4  <= w_countreg_28_4 ;
        r_countreg_0_5  <= w_countreg_28_5 ;
        r_countreg_0_6  <= w_countreg_28_6 ;
        r_countreg_0_7  <= w_countreg_28_7 ;
    end
end

always @(posedge i_clk) begin
    if(r_count_sum_valid_1d)begin
        r_countreg_1_0  <= w_countreg_1_0 ;
        r_countreg_1_1  <= w_countreg_1_1 ;
        r_countreg_1_2  <= w_countreg_1_2 ;
        r_countreg_1_3  <= w_countreg_1_3 ;
        r_countreg_1_4  <= w_countreg_1_4 ;
        r_countreg_1_5  <= w_countreg_1_5 ;
        r_countreg_1_6  <= w_countreg_1_6 ;
        r_countreg_1_7  <= w_countreg_1_7 ;
    end else if(r_count_sum_valid_2d)begin
        r_countreg_1_0  <= w_countreg_5_0 ;
        r_countreg_1_1  <= w_countreg_5_1 ;
        r_countreg_1_2  <= w_countreg_5_2 ;
        r_countreg_1_3  <= w_countreg_5_3 ;
        r_countreg_1_4  <= w_countreg_5_4 ;
        r_countreg_1_5  <= w_countreg_5_5 ;
        r_countreg_1_6  <= w_countreg_5_6 ;
        r_countreg_1_7  <= w_countreg_5_7 ;
    end else if(r_count_sum_valid_3d)begin
        r_countreg_1_0  <= w_countreg_9_0 ;
        r_countreg_1_1  <= w_countreg_9_1 ;
        r_countreg_1_2  <= w_countreg_9_2 ;
        r_countreg_1_3  <= w_countreg_9_3 ;
        r_countreg_1_4  <= w_countreg_9_4 ;
        r_countreg_1_5  <= w_countreg_9_5 ;
        r_countreg_1_6  <= w_countreg_9_6 ;
        r_countreg_1_7  <= w_countreg_9_7 ;
    end else if(r_count_sum_valid_4d)begin
        r_countreg_1_0  <= w_countreg_13_0 ;
        r_countreg_1_1  <= w_countreg_13_1 ;
        r_countreg_1_2  <= w_countreg_13_2 ;
        r_countreg_1_3  <= w_countreg_13_3 ;
        r_countreg_1_4  <= w_countreg_13_4 ;
        r_countreg_1_5  <= w_countreg_13_5 ;
        r_countreg_1_6  <= w_countreg_13_6 ;
        r_countreg_1_7  <= w_countreg_13_7 ;
    end else if(r_count_sum_valid_5d)begin
        r_countreg_1_0  <= w_countreg_17_0 ;
        r_countreg_1_1  <= w_countreg_17_1 ;
        r_countreg_1_2  <= w_countreg_17_2 ;
        r_countreg_1_3  <= w_countreg_17_3 ;
        r_countreg_1_4  <= w_countreg_17_4 ;
        r_countreg_1_5  <= w_countreg_17_5 ;
        r_countreg_1_6  <= w_countreg_17_6 ;
        r_countreg_1_7  <= w_countreg_17_7 ;
    end else if(r_count_sum_valid_6d)begin
        r_countreg_1_0  <= w_countreg_21_0 ;
        r_countreg_1_1  <= w_countreg_21_1 ;
        r_countreg_1_2  <= w_countreg_21_2 ;
        r_countreg_1_3  <= w_countreg_21_3 ;
        r_countreg_1_4  <= w_countreg_21_4 ;
        r_countreg_1_5  <= w_countreg_21_5 ;
        r_countreg_1_6  <= w_countreg_21_6 ;
        r_countreg_1_7  <= w_countreg_21_7 ;
    end else if(r_count_sum_valid_7d)begin
        r_countreg_1_0  <= w_countreg_25_0 ;
        r_countreg_1_1  <= w_countreg_25_1 ;
        r_countreg_1_2  <= w_countreg_25_2 ;
        r_countreg_1_3  <= w_countreg_25_3 ;
        r_countreg_1_4  <= w_countreg_25_4 ;
        r_countreg_1_5  <= w_countreg_25_5 ;
        r_countreg_1_6  <= w_countreg_25_6 ;
        r_countreg_1_7  <= w_countreg_25_7 ;
    end else if(r_count_sum_valid_8d)begin
        r_countreg_1_0  <= w_countreg_29_0 ;
        r_countreg_1_1  <= w_countreg_29_1 ;
        r_countreg_1_2  <= w_countreg_29_2 ;
        r_countreg_1_3  <= w_countreg_29_3 ;
        r_countreg_1_4  <= w_countreg_29_4 ;
        r_countreg_1_5  <= w_countreg_29_5 ;
        r_countreg_1_6  <= w_countreg_29_6 ;
        r_countreg_1_7  <= w_countreg_29_7 ;
    end
end

always @(posedge i_clk) begin
    if(r_count_sum_valid_1d)begin
        r_countreg_2_0  <= w_countreg_2_0 ;
        r_countreg_2_1  <= w_countreg_2_1 ;
        r_countreg_2_2  <= w_countreg_2_2 ;
        r_countreg_2_3  <= w_countreg_2_3 ;
        r_countreg_2_4  <= w_countreg_2_4 ;
        r_countreg_2_5  <= w_countreg_2_5 ;
        r_countreg_2_6  <= w_countreg_2_6 ;
        r_countreg_2_7  <= w_countreg_2_7 ;
    end else if(r_count_sum_valid_2d)begin
        r_countreg_2_0  <= w_countreg_6_0 ;
        r_countreg_2_1  <= w_countreg_6_1 ;
        r_countreg_2_2  <= w_countreg_6_2 ;
        r_countreg_2_3  <= w_countreg_6_3 ;
        r_countreg_2_4  <= w_countreg_6_4 ;
        r_countreg_2_5  <= w_countreg_6_5 ;
        r_countreg_2_6  <= w_countreg_6_6 ;
        r_countreg_2_7  <= w_countreg_6_7 ;
    end else if(r_count_sum_valid_3d)begin
        r_countreg_2_0  <= w_countreg_10_0 ;
        r_countreg_2_1  <= w_countreg_10_1 ;
        r_countreg_2_2  <= w_countreg_10_2 ;
        r_countreg_2_3  <= w_countreg_10_3 ;
        r_countreg_2_4  <= w_countreg_10_4 ;
        r_countreg_2_5  <= w_countreg_10_5 ;
        r_countreg_2_6  <= w_countreg_10_6 ;
        r_countreg_2_7  <= w_countreg_10_7 ;
    end else if(r_count_sum_valid_4d)begin
        r_countreg_2_0  <= w_countreg_14_0 ;
        r_countreg_2_1  <= w_countreg_14_1 ;
        r_countreg_2_2  <= w_countreg_14_2 ;
        r_countreg_2_3  <= w_countreg_14_3 ;
        r_countreg_2_4  <= w_countreg_14_4 ;
        r_countreg_2_5  <= w_countreg_14_5 ;
        r_countreg_2_6  <= w_countreg_14_6 ;
        r_countreg_2_7  <= w_countreg_14_7 ;
    end else if(r_count_sum_valid_5d)begin
        r_countreg_2_0  <= w_countreg_18_0 ;
        r_countreg_2_1  <= w_countreg_18_1 ;
        r_countreg_2_2  <= w_countreg_18_2 ;
        r_countreg_2_3  <= w_countreg_18_3 ;
        r_countreg_2_4  <= w_countreg_18_4 ;
        r_countreg_2_5  <= w_countreg_18_5 ;
        r_countreg_2_6  <= w_countreg_18_6 ;
        r_countreg_2_7  <= w_countreg_18_7 ;
    end else if(r_count_sum_valid_6d)begin
        r_countreg_2_0  <= w_countreg_22_0 ;
        r_countreg_2_1  <= w_countreg_22_1 ;
        r_countreg_2_2  <= w_countreg_22_2 ;
        r_countreg_2_3  <= w_countreg_22_3 ;
        r_countreg_2_4  <= w_countreg_22_4 ;
        r_countreg_2_5  <= w_countreg_22_5 ;
        r_countreg_2_6  <= w_countreg_22_6 ;
        r_countreg_2_7  <= w_countreg_22_7 ;
    end else if(r_count_sum_valid_7d)begin
        r_countreg_2_0  <= w_countreg_26_0 ;
        r_countreg_2_1  <= w_countreg_26_1 ;
        r_countreg_2_2  <= w_countreg_26_2 ;
        r_countreg_2_3  <= w_countreg_26_3 ;
        r_countreg_2_4  <= w_countreg_26_4 ;
        r_countreg_2_5  <= w_countreg_26_5 ;
        r_countreg_2_6  <= w_countreg_26_6 ;
        r_countreg_2_7  <= w_countreg_26_7 ;
    end else if(r_count_sum_valid_8d)begin
        r_countreg_2_0  <= w_countreg_30_0 ;
        r_countreg_2_1  <= w_countreg_30_1 ;
        r_countreg_2_2  <= w_countreg_30_2 ;
        r_countreg_2_3  <= w_countreg_30_3 ;
        r_countreg_2_4  <= w_countreg_30_4 ;
        r_countreg_2_5  <= w_countreg_30_5 ;
        r_countreg_2_6  <= w_countreg_30_6 ;
        r_countreg_2_7  <= w_countreg_30_7 ;
    end
end

always @(posedge i_clk) begin
    if(r_count_sum_valid_1d)begin
        r_countreg_3_0  <= w_countreg_3_0 ;
        r_countreg_3_1  <= w_countreg_3_1 ;
        r_countreg_3_2  <= w_countreg_3_2 ;
        r_countreg_3_3  <= w_countreg_3_3 ;
        r_countreg_3_4  <= w_countreg_3_4 ;
        r_countreg_3_5  <= w_countreg_3_5 ;
        r_countreg_3_6  <= w_countreg_3_6 ;
        r_countreg_3_7  <= w_countreg_3_7 ;
    end else if(r_count_sum_valid_2d)begin
        r_countreg_3_0  <= w_countreg_7_0 ;
        r_countreg_3_1  <= w_countreg_7_1 ;
        r_countreg_3_2  <= w_countreg_7_2 ;
        r_countreg_3_3  <= w_countreg_7_3 ;
        r_countreg_3_4  <= w_countreg_7_4 ;
        r_countreg_3_5  <= w_countreg_7_5 ;
        r_countreg_3_6  <= w_countreg_7_6 ;
        r_countreg_3_7  <= w_countreg_7_7 ;
    end else if(r_count_sum_valid_3d)begin
        r_countreg_3_0  <= w_countreg_11_0 ;
        r_countreg_3_1  <= w_countreg_11_1 ;
        r_countreg_3_2  <= w_countreg_11_2 ;
        r_countreg_3_3  <= w_countreg_11_3 ;
        r_countreg_3_4  <= w_countreg_11_4 ;
        r_countreg_3_5  <= w_countreg_11_5 ;
        r_countreg_3_6  <= w_countreg_11_6 ;
        r_countreg_3_7  <= w_countreg_11_7 ;
    end else if(r_count_sum_valid_4d)begin
        r_countreg_3_0  <= w_countreg_15_0 ;
        r_countreg_3_1  <= w_countreg_15_1 ;
        r_countreg_3_2  <= w_countreg_15_2 ;
        r_countreg_3_3  <= w_countreg_15_3 ;
        r_countreg_3_4  <= w_countreg_15_4 ;
        r_countreg_3_5  <= w_countreg_15_5 ;
        r_countreg_3_6  <= w_countreg_15_6 ;
        r_countreg_3_7  <= w_countreg_15_7 ;
    end else if(r_count_sum_valid_5d)begin
        r_countreg_3_0  <= w_countreg_19_0 ;
        r_countreg_3_1  <= w_countreg_19_1 ;
        r_countreg_3_2  <= w_countreg_19_2 ;
        r_countreg_3_3  <= w_countreg_19_3 ;
        r_countreg_3_4  <= w_countreg_19_4 ;
        r_countreg_3_5  <= w_countreg_19_5 ;
        r_countreg_3_6  <= w_countreg_19_6 ;
        r_countreg_3_7  <= w_countreg_19_7 ;
    end else if(r_count_sum_valid_6d)begin
        r_countreg_3_0  <= w_countreg_23_0 ;
        r_countreg_3_1  <= w_countreg_23_1 ;
        r_countreg_3_2  <= w_countreg_23_2 ;
        r_countreg_3_3  <= w_countreg_23_3 ;
        r_countreg_3_4  <= w_countreg_23_4 ;
        r_countreg_3_5  <= w_countreg_23_5 ;
        r_countreg_3_6  <= w_countreg_23_6 ;
        r_countreg_3_7  <= w_countreg_23_7 ;
    end else if(r_count_sum_valid_7d)begin
        r_countreg_3_0  <= w_countreg_27_0 ;
        r_countreg_3_1  <= w_countreg_27_1 ;
        r_countreg_3_2  <= w_countreg_27_2 ;
        r_countreg_3_3  <= w_countreg_27_3 ;
        r_countreg_3_4  <= w_countreg_27_4 ;
        r_countreg_3_5  <= w_countreg_27_5 ;
        r_countreg_3_6  <= w_countreg_27_6 ;
        r_countreg_3_7  <= w_countreg_27_7 ;
    end else if(r_count_sum_valid_8d)begin
        r_countreg_3_0  <= w_countreg_31_0 ;
        r_countreg_3_1  <= w_countreg_31_1 ;
        r_countreg_3_2  <= w_countreg_31_2 ;
        r_countreg_3_3  <= w_countreg_31_3 ;
        r_countreg_3_4  <= w_countreg_31_4 ;
        r_countreg_3_5  <= w_countreg_31_5 ;
        r_countreg_3_6  <= w_countreg_31_6 ;
        r_countreg_3_7  <= w_countreg_31_7 ;
    end
end

mul_cycle_byte_times_wrapper mul_cycle_byte_times_wrapper_U0(
    .i_clk                   (i_clk             ),
    .i_rst                   (i_rst             ),
    .i_countreg_valid        (r_count_sum_valid_2d),
    .i_countreg_0_0          (r_countreg_0_0    ),
    .i_countreg_0_1          (r_countreg_0_1    ),
    .i_countreg_0_2          (r_countreg_0_2    ),
    .i_countreg_0_3          (r_countreg_0_3    ),
    .i_countreg_0_4          (r_countreg_0_4    ),
    .i_countreg_0_5          (r_countreg_0_5    ),
    .i_countreg_0_6          (r_countreg_0_6    ),
    .i_countreg_0_7          (r_countreg_0_7    ),
    .i_countreg_1_0          (r_countreg_1_0    ),
    .i_countreg_1_1          (r_countreg_1_1    ),
    .i_countreg_1_2          (r_countreg_1_2    ),
    .i_countreg_1_3          (r_countreg_1_3    ),
    .i_countreg_1_4          (r_countreg_1_4    ),
    .i_countreg_1_5          (r_countreg_1_5    ),
    .i_countreg_1_6          (r_countreg_1_6    ),
    .i_countreg_1_7          (r_countreg_1_7    ),
    .i_countreg_2_0          (r_countreg_2_0    ),
    .i_countreg_2_1          (r_countreg_2_1    ),
    .i_countreg_2_2          (r_countreg_2_2    ),
    .i_countreg_2_3          (r_countreg_2_3    ),
    .i_countreg_2_4          (r_countreg_2_4    ),
    .i_countreg_2_5          (r_countreg_2_5    ),
    .i_countreg_2_6          (r_countreg_2_6    ),
    .i_countreg_2_7          (r_countreg_2_7    ),
    .i_countreg_3_0          (r_countreg_3_0    ),
    .i_countreg_3_1          (r_countreg_3_1    ),
    .i_countreg_3_2          (r_countreg_3_2    ),
    .i_countreg_3_3          (r_countreg_3_3    ),
    .i_countreg_3_4          (r_countreg_3_4    ),
    .i_countreg_3_5          (r_countreg_3_5    ),
    .i_countreg_3_6          (r_countreg_3_6    ),
    .i_countreg_3_7          (r_countreg_3_7    ),
    .o_final_sum_0           (o_final_sum_0     ),
    .o_final_sum_1           (o_final_sum_1     ),                     
    .o_final_sum_2           (o_final_sum_2     ),
    .o_final_sum_3           (o_final_sum_3     ),
    .o_final_sum_4           (o_final_sum_4     ),
    .o_final_sum_5           (o_final_sum_5     ),
    .o_final_sum_6           (o_final_sum_6     ),
    .o_final_sum_7           (o_final_sum_7     ),
    .o_final_sum_8           (o_final_sum_8     ),
    .o_final_sum_9           (o_final_sum_9     ),
    .o_final_sum_10          (o_final_sum_10    ),
    .o_final_sum_11          (o_final_sum_11    ),
    .o_final_sum_12          (o_final_sum_12    ),
    .o_final_sum_13          (o_final_sum_13    ),
    .o_final_sum_14          (o_final_sum_14    ),
    .o_final_sum_15          (o_final_sum_15    ),
    .o_final_sum_16          (o_final_sum_16    ),
    .o_final_sum_17          (o_final_sum_17    ),
    .o_final_sum_18          (o_final_sum_18    ),
    .o_final_sum_19          (o_final_sum_19    ),
    .o_final_sum_20          (o_final_sum_20    ),
    .o_final_sum_21          (o_final_sum_21    ),
    .o_final_sum_22          (o_final_sum_22    ),
    .o_final_sum_23          (o_final_sum_23    ),
    .o_final_sum_24          (o_final_sum_24    ),
    .o_final_sum_25          (o_final_sum_25    ),
    .o_final_sum_26          (o_final_sum_26    ),
    .o_final_sum_27          (o_final_sum_27    ),
    .o_final_sum_28          (o_final_sum_28    ),
    .o_final_sum_29          (o_final_sum_29    ),
    .o_final_sum_30          (o_final_sum_30    ),
    .o_final_sum_31          (o_final_sum_31    ),
    .o_final_sum_valid       (o_count_sum_valid )

);
/* ============================================================================================================================= */

byte_count #(
    .DATA_WIDTH              (8)
)
byte_count_U0
(

    .i_clk                   (i_clk             ),
    .i_rst                   (i_rst             ),  
    .count_data              (count_data[7:0]   ),
    .count_data_valid        (count_data_valid  ),
    .o_countreg_0            (w_countreg_0_0    ),
    .o_countreg_1            (w_countreg_1_0    ),
    .o_countreg_2            (w_countreg_2_0    ),
    .o_countreg_3            (w_countreg_3_0    ),
    .o_countreg_4            (w_countreg_4_0    ),
    .o_countreg_5            (w_countreg_5_0    ),
    .o_countreg_6            (w_countreg_6_0    ),
    .o_countreg_7            (w_countreg_7_0    ),
    .o_countreg_8            (w_countreg_8_0    ),
    .o_countreg_9            (w_countreg_9_0    ),
    .o_countreg_10           (w_countreg_10_0   ),
    .o_countreg_11           (w_countreg_11_0   ),
    .o_countreg_12           (w_countreg_12_0   ),
    .o_countreg_13           (w_countreg_13_0   ),
    .o_countreg_14           (w_countreg_14_0   ),
    .o_countreg_15           (w_countreg_15_0   ),
    .o_countreg_16           (w_countreg_16_0   ),
    .o_countreg_17           (w_countreg_17_0   ),
    .o_countreg_18           (w_countreg_18_0   ),
    .o_countreg_19           (w_countreg_19_0   ),
    .o_countreg_20           (w_countreg_20_0   ),
    .o_countreg_21           (w_countreg_21_0   ),
    .o_countreg_22           (w_countreg_22_0   ),
    .o_countreg_23           (w_countreg_23_0   ),
    .o_countreg_24           (w_countreg_24_0   ),
    .o_countreg_25           (w_countreg_25_0   ),
    .o_countreg_26           (w_countreg_26_0   ),
    .o_countreg_27           (w_countreg_27_0   ),
    .o_countreg_28           (w_countreg_28_0   ),
    .o_countreg_29           (w_countreg_29_0   ),
    .o_countreg_30           (w_countreg_30_0   ),
    .o_countreg_31           (w_countreg_31_0   )                                       
);

byte_count #(
    .DATA_WIDTH              (8)
)
byte_count_U1
(

    .i_clk                   (i_clk             ),
    .i_rst                   (i_rst             ),  
    .count_data              (count_data[15:8]  ),
    .count_data_valid        (count_data_valid  ),
    .o_countreg_0            (w_countreg_0_1    ),
    .o_countreg_1            (w_countreg_1_1    ),
    .o_countreg_2            (w_countreg_2_1    ),
    .o_countreg_3            (w_countreg_3_1    ),
    .o_countreg_4            (w_countreg_4_1    ),
    .o_countreg_5            (w_countreg_5_1    ),
    .o_countreg_6            (w_countreg_6_1    ),
    .o_countreg_7            (w_countreg_7_1    ),
    .o_countreg_8            (w_countreg_8_1    ),
    .o_countreg_9            (w_countreg_9_1    ),
    .o_countreg_10           (w_countreg_10_1   ),
    .o_countreg_11           (w_countreg_11_1   ),
    .o_countreg_12           (w_countreg_12_1   ),
    .o_countreg_13           (w_countreg_13_1   ),
    .o_countreg_14           (w_countreg_14_1   ),
    .o_countreg_15           (w_countreg_15_1   ),
    .o_countreg_16           (w_countreg_16_1   ),
    .o_countreg_17           (w_countreg_17_1   ),
    .o_countreg_18           (w_countreg_18_1   ),
    .o_countreg_19           (w_countreg_19_1   ),
    .o_countreg_20           (w_countreg_20_1   ),
    .o_countreg_21           (w_countreg_21_1   ),
    .o_countreg_22           (w_countreg_22_1   ),
    .o_countreg_23           (w_countreg_23_1   ),
    .o_countreg_24           (w_countreg_24_1   ),
    .o_countreg_25           (w_countreg_25_1   ),
    .o_countreg_26           (w_countreg_26_1   ),
    .o_countreg_27           (w_countreg_27_1   ),
    .o_countreg_28           (w_countreg_28_1   ),
    .o_countreg_29           (w_countreg_29_1   ),
    .o_countreg_30           (w_countreg_30_1   ),
    .o_countreg_31           (w_countreg_31_1   )                                       
);

byte_count #(
    .DATA_WIDTH              (8)
)
byte_count_U2
(

    .i_clk                   (i_clk             ),
    .i_rst                   (i_rst             ),  
    .count_data              (count_data[23:16] ),
    .count_data_valid        (count_data_valid  ),
    .o_countreg_0            (w_countreg_0_2    ),
    .o_countreg_1            (w_countreg_1_2    ),
    .o_countreg_2            (w_countreg_2_2    ),
    .o_countreg_3            (w_countreg_3_2    ),
    .o_countreg_4            (w_countreg_4_2    ),
    .o_countreg_5            (w_countreg_5_2    ),
    .o_countreg_6            (w_countreg_6_2    ),
    .o_countreg_7            (w_countreg_7_2    ),
    .o_countreg_8            (w_countreg_8_2    ),
    .o_countreg_9            (w_countreg_9_2    ),
    .o_countreg_10           (w_countreg_10_2   ),
    .o_countreg_11           (w_countreg_11_2   ),
    .o_countreg_12           (w_countreg_12_2   ),
    .o_countreg_13           (w_countreg_13_2   ),
    .o_countreg_14           (w_countreg_14_2   ),
    .o_countreg_15           (w_countreg_15_2   ),
    .o_countreg_16           (w_countreg_16_2   ),
    .o_countreg_17           (w_countreg_17_2   ),
    .o_countreg_18           (w_countreg_18_2   ),
    .o_countreg_19           (w_countreg_19_2   ),
    .o_countreg_20           (w_countreg_20_2   ),
    .o_countreg_21           (w_countreg_21_2   ),
    .o_countreg_22           (w_countreg_22_2   ),
    .o_countreg_23           (w_countreg_23_2   ),
    .o_countreg_24           (w_countreg_24_2   ),
    .o_countreg_25           (w_countreg_25_2   ),
    .o_countreg_26           (w_countreg_26_2   ),
    .o_countreg_27           (w_countreg_27_2   ),
    .o_countreg_28           (w_countreg_28_2   ),
    .o_countreg_29           (w_countreg_29_2   ),
    .o_countreg_30           (w_countreg_30_2   ),
    .o_countreg_31           (w_countreg_31_2   )                                       
);

byte_count #(
    .DATA_WIDTH              (8)
) byte_count_U3 (
    .i_clk                   (i_clk             ),
    .i_rst                   (i_rst             ),  
    .count_data              (count_data[31:24] ),
    .count_data_valid        (count_data_valid  ),
    .o_countreg_0            (w_countreg_0_3    ),
    .o_countreg_1            (w_countreg_1_3    ),
    .o_countreg_2            (w_countreg_2_3    ),
    .o_countreg_3            (w_countreg_3_3    ),
    .o_countreg_4            (w_countreg_4_3    ),
    .o_countreg_5            (w_countreg_5_3    ),
    .o_countreg_6            (w_countreg_6_3    ),
    .o_countreg_7            (w_countreg_7_3    ),
    .o_countreg_8            (w_countreg_8_3    ),
    .o_countreg_9            (w_countreg_9_3    ),
    .o_countreg_10           (w_countreg_10_3   ),
    .o_countreg_11           (w_countreg_11_3   ),
    .o_countreg_12           (w_countreg_12_3   ),
    .o_countreg_13           (w_countreg_13_3   ),
    .o_countreg_14           (w_countreg_14_3   ),
    .o_countreg_15           (w_countreg_15_3   ),
    .o_countreg_16           (w_countreg_16_3   ),
    .o_countreg_17           (w_countreg_17_3   ),
    .o_countreg_18           (w_countreg_18_3   ),
    .o_countreg_19           (w_countreg_19_3   ),
    .o_countreg_20           (w_countreg_20_3   ),
    .o_countreg_21           (w_countreg_21_3   ),
    .o_countreg_22           (w_countreg_22_3   ),
    .o_countreg_23           (w_countreg_23_3   ),
    .o_countreg_24           (w_countreg_24_3   ),
    .o_countreg_25           (w_countreg_25_3   ),
    .o_countreg_26           (w_countreg_26_3   ),
    .o_countreg_27           (w_countreg_27_3   ),
    .o_countreg_28           (w_countreg_28_3   ),
    .o_countreg_29           (w_countreg_29_3   ),
    .o_countreg_30           (w_countreg_30_3   ),
    .o_countreg_31           (w_countreg_31_3   )                                       
);

byte_count #(
    .DATA_WIDTH              (8)
) byte_count_U4 (
    .i_clk                   (i_clk             ),
    .i_rst                   (i_rst             ),  
    .count_data              (count_data[39:32] ),
    .count_data_valid        (count_data_valid  ),
    .o_countreg_0            (w_countreg_0_4    ),
    .o_countreg_1            (w_countreg_1_4    ),
    .o_countreg_2            (w_countreg_2_4    ),
    .o_countreg_3            (w_countreg_3_4    ),
    .o_countreg_4            (w_countreg_4_4    ),
    .o_countreg_5            (w_countreg_5_4    ),
    .o_countreg_6            (w_countreg_6_4    ),
    .o_countreg_7            (w_countreg_7_4    ),
    .o_countreg_8            (w_countreg_8_4    ),
    .o_countreg_9            (w_countreg_9_4    ),
    .o_countreg_10           (w_countreg_10_4   ),
    .o_countreg_11           (w_countreg_11_4   ),
    .o_countreg_12           (w_countreg_12_4   ),
    .o_countreg_13           (w_countreg_13_4   ),
    .o_countreg_14           (w_countreg_14_4   ),
    .o_countreg_15           (w_countreg_15_4   ),
    .o_countreg_16           (w_countreg_16_4   ),
    .o_countreg_17           (w_countreg_17_4   ),
    .o_countreg_18           (w_countreg_18_4   ),
    .o_countreg_19           (w_countreg_19_4   ),
    .o_countreg_20           (w_countreg_20_4   ),
    .o_countreg_21           (w_countreg_21_4   ),
    .o_countreg_22           (w_countreg_22_4   ),
    .o_countreg_23           (w_countreg_23_4   ),
    .o_countreg_24           (w_countreg_24_4   ),
    .o_countreg_25           (w_countreg_25_4   ),
    .o_countreg_26           (w_countreg_26_4   ),
    .o_countreg_27           (w_countreg_27_4   ),
    .o_countreg_28           (w_countreg_28_4   ),
    .o_countreg_29           (w_countreg_29_4   ),
    .o_countreg_30           (w_countreg_30_4   ),
    .o_countreg_31           (w_countreg_31_4   )                                       
);

byte_count #(
    .DATA_WIDTH              (8)
) byte_count_U5 (
    .i_clk                   (i_clk             ),
    .i_rst                   (i_rst             ),  
    .count_data              (count_data[47:40] ),
    .count_data_valid        (count_data_valid  ),
    .o_countreg_0            (w_countreg_0_5    ),
    .o_countreg_1            (w_countreg_1_5    ),
    .o_countreg_2            (w_countreg_2_5    ),
    .o_countreg_3            (w_countreg_3_5    ),
    .o_countreg_4            (w_countreg_4_5    ),
    .o_countreg_5            (w_countreg_5_5    ),
    .o_countreg_6            (w_countreg_6_5    ),
    .o_countreg_7            (w_countreg_7_5    ),
    .o_countreg_8            (w_countreg_8_5    ),
    .o_countreg_9            (w_countreg_9_5    ),
    .o_countreg_10           (w_countreg_10_5   ),
    .o_countreg_11           (w_countreg_11_5   ),
    .o_countreg_12           (w_countreg_12_5   ),
    .o_countreg_13           (w_countreg_13_5   ),
    .o_countreg_14           (w_countreg_14_5   ),
    .o_countreg_15           (w_countreg_15_5   ),
    .o_countreg_16           (w_countreg_16_5   ),
    .o_countreg_17           (w_countreg_17_5   ),
    .o_countreg_18           (w_countreg_18_5   ),
    .o_countreg_19           (w_countreg_19_5   ),
    .o_countreg_20           (w_countreg_20_5   ),
    .o_countreg_21           (w_countreg_21_5   ),
    .o_countreg_22           (w_countreg_22_5   ),
    .o_countreg_23           (w_countreg_23_5   ),
    .o_countreg_24           (w_countreg_24_5   ),
    .o_countreg_25           (w_countreg_25_5   ),
    .o_countreg_26           (w_countreg_26_5   ),
    .o_countreg_27           (w_countreg_27_5   ),
    .o_countreg_28           (w_countreg_28_5   ),
    .o_countreg_29           (w_countreg_29_5   ),
    .o_countreg_30           (w_countreg_30_5   ),
    .o_countreg_31           (w_countreg_31_5   )                                       
);

byte_count #(
    .DATA_WIDTH              (8)
) byte_count_U6 (
    .i_clk                   (i_clk             ),
    .i_rst                   (i_rst             ),  
    .count_data              (count_data[55:48] ),
    .count_data_valid        (count_data_valid  ),
    .o_countreg_0            (w_countreg_0_6    ),
    .o_countreg_1            (w_countreg_1_6    ),
    .o_countreg_2            (w_countreg_2_6    ),
    .o_countreg_3            (w_countreg_3_6    ),
    .o_countreg_4            (w_countreg_4_6    ),
    .o_countreg_5            (w_countreg_5_6    ),
    .o_countreg_6            (w_countreg_6_6    ),
    .o_countreg_7            (w_countreg_7_6    ),
    .o_countreg_8            (w_countreg_8_6    ),
    .o_countreg_9            (w_countreg_9_6    ),
    .o_countreg_10           (w_countreg_10_6   ),
    .o_countreg_11           (w_countreg_11_6   ),
    .o_countreg_12           (w_countreg_12_6   ),
    .o_countreg_13           (w_countreg_13_6   ),
    .o_countreg_14           (w_countreg_14_6   ),
    .o_countreg_15           (w_countreg_15_6   ),
    .o_countreg_16           (w_countreg_16_6   ),
    .o_countreg_17           (w_countreg_17_6   ),
    .o_countreg_18           (w_countreg_18_6   ),
    .o_countreg_19           (w_countreg_19_6   ),
    .o_countreg_20           (w_countreg_20_6   ),
    .o_countreg_21           (w_countreg_21_6   ),
    .o_countreg_22           (w_countreg_22_6   ),
    .o_countreg_23           (w_countreg_23_6   ),
    .o_countreg_24           (w_countreg_24_6   ),
    .o_countreg_25           (w_countreg_25_6   ),
    .o_countreg_26           (w_countreg_26_6   ),
    .o_countreg_27           (w_countreg_27_6   ),
    .o_countreg_28           (w_countreg_28_6   ),
    .o_countreg_29           (w_countreg_29_6   ),
    .o_countreg_30           (w_countreg_30_6   ),
    .o_countreg_31           (w_countreg_31_6   )                                       
);

byte_count #(
    .DATA_WIDTH              (8)
) byte_count_U7 (
    .i_clk                   (i_clk             ),
    .i_rst                   (i_rst             ),  
    .count_data              (count_data[63:56] ),
    .count_data_valid        (count_data_valid  ),
    .o_countreg_0            (w_countreg_0_7    ),
    .o_countreg_1            (w_countreg_1_7    ),
    .o_countreg_2            (w_countreg_2_7    ),
    .o_countreg_3            (w_countreg_3_7    ),
    .o_countreg_4            (w_countreg_4_7    ),
    .o_countreg_5            (w_countreg_5_7    ),
    .o_countreg_6            (w_countreg_6_7    ),
    .o_countreg_7            (w_countreg_7_7    ),
    .o_countreg_8            (w_countreg_8_7    ),
    .o_countreg_9            (w_countreg_9_7    ),
    .o_countreg_10           (w_countreg_10_7   ),
    .o_countreg_11           (w_countreg_11_7   ),
    .o_countreg_12           (w_countreg_12_7   ),
    .o_countreg_13           (w_countreg_13_7   ),
    .o_countreg_14           (w_countreg_14_7   ),
    .o_countreg_15           (w_countreg_15_7   ),
    .o_countreg_16           (w_countreg_16_7   ),
    .o_countreg_17           (w_countreg_17_7   ),
    .o_countreg_18           (w_countreg_18_7   ),
    .o_countreg_19           (w_countreg_19_7   ),
    .o_countreg_20           (w_countreg_20_7   ),
    .o_countreg_21           (w_countreg_21_7   ),
    .o_countreg_22           (w_countreg_22_7   ),
    .o_countreg_23           (w_countreg_23_7   ),
    .o_countreg_24           (w_countreg_24_7   ),
    .o_countreg_25           (w_countreg_25_7   ),
    .o_countreg_26           (w_countreg_26_7   ),
    .o_countreg_27           (w_countreg_27_7   ),
    .o_countreg_28           (w_countreg_28_7   ),
    .o_countreg_29           (w_countreg_29_7   ),
    .o_countreg_30           (w_countreg_30_7   ),
    .o_countreg_31           (w_countreg_31_7   )                                       
);

endmodule
