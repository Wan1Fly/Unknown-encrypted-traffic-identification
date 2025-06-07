`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/20 15:24:35
// Design Name: 
// Module Name: mul_cycle_byte_times
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


module mul_cycle_byte_times(
input                                   i_clk                   ,
input                                   i_rst                   ,
input                                   i_countreg_valid        ,
input       [7:0]                       i_countreg_0            ,
input       [7:0]                       i_countreg_1            ,
input       [7:0]                       i_countreg_2            ,
input       [7:0]                       i_countreg_3            ,
input       [7:0]                       i_countreg_4            ,
input       [7:0]                       i_countreg_5            ,
input       [7:0]                       i_countreg_6            ,
input       [7:0]                       i_countreg_7            ,
output      [8:0]                       o_final_sum             ,
output                                  o_final_sum_valid
);

wire        [4:0]                       w_times_0               ;
wire        [4:0]                       w_times_1               ;
wire        [4:0]                       w_times_2               ;
wire        [4:0]                       w_times_3               ;
reg         [6:0]                       r_sum2_0                ;
reg         [5:0]                       r_sum1_0, r_sum1_1      ;
reg         [2:0]                       r_cycle_cnt             ;
reg         [1:0]                       r_sum_cnt               ;
reg         [8:0]                       r_sum_temp_0            ;
reg         [8:0]                       r_sum_temp_1            ;
reg         [8:0]                       r_sum_temp_2            ;
reg         [8:0]                       r_sum_temp_3            ;
reg         [8:0]                       r_sum_temp_4            ;
reg         [8:0]                       r_sum_temp_5            ;
reg         [8:0]                       r_sum_temp_6            ;
reg         [8:0]                       r_sum_temp_7            ;
reg         [8:0]                       ro_final_sum            ;
reg                                     r_final_sum_flag        ;
reg                                     ro_final_sum_valid      ;

assign          o_final_sum = ro_final_sum;
assign          o_final_sum_valid = ro_final_sum_valid;

assign w_times_0 = i_countreg_0[0] + i_countreg_0[1] + i_countreg_0[2] + i_countreg_0[3] + i_countreg_0[4] + i_countreg_0[5] + i_countreg_0[6] + i_countreg_0[7]
                  +i_countreg_1[0] + i_countreg_1[1] + i_countreg_1[2] + i_countreg_1[3] + i_countreg_1[4] + i_countreg_1[5] + i_countreg_1[6] + i_countreg_1[7];

assign w_times_1 = i_countreg_2[0] + i_countreg_2[1] + i_countreg_2[2] + i_countreg_2[3] + i_countreg_2[4] + i_countreg_2[5] + i_countreg_2[6] + i_countreg_2[7]
                  +i_countreg_3[0] + i_countreg_3[1] + i_countreg_3[2] + i_countreg_3[3] + i_countreg_3[4] + i_countreg_3[5] + i_countreg_3[6] + i_countreg_3[7];

assign w_times_2 = i_countreg_4[0] + i_countreg_4[1] + i_countreg_4[2] + i_countreg_4[3] + i_countreg_4[4] + i_countreg_4[5] + i_countreg_4[6] + i_countreg_4[7]
                  +i_countreg_5[0] + i_countreg_5[1] + i_countreg_5[2] + i_countreg_5[3] + i_countreg_5[4] + i_countreg_5[5] + i_countreg_5[6] + i_countreg_5[7];

assign w_times_3 = i_countreg_6[0] + i_countreg_6[1] + i_countreg_6[2] + i_countreg_6[3] + i_countreg_6[4] + i_countreg_6[5] + i_countreg_6[6] + i_countreg_6[7]
                  +i_countreg_7[0] + i_countreg_7[1] + i_countreg_7[2] + i_countreg_7[3] + i_countreg_7[4] + i_countreg_7[5] + i_countreg_7[6] + i_countreg_7[7];


// 第一级相加：将每一对相邻的 w_times 值相加，时序逻辑
always @(posedge i_clk) begin
    r_sum1_0 <= w_times_0 + w_times_1;
    r_sum1_1 <= w_times_2 + w_times_3;
end

// 第二级相加：将第一轮相加的结果两两相加，组合逻辑
always @(posedge i_clk) begin
    r_sum2_0 <= r_sum1_0 + r_sum1_1;
end
always @(posedge i_clk) begin
    if(i_rst)
        r_cycle_cnt <= 'd0;
    else if(i_countreg_valid | r_cycle_cnt >'d0)
        r_cycle_cnt <= r_cycle_cnt + 'd1;
    else
        r_cycle_cnt <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_sum_cnt <= 'd0;
    else if(r_cycle_cnt == 'd7)
        r_sum_cnt <= r_sum_cnt + 'd1;
    else
        r_sum_cnt <= r_sum_cnt;
end

always @(posedge i_clk) begin
    if(i_countreg_valid && r_sum_cnt == 'd0)
        r_sum_temp_0 <= r_sum2_0; 
    else if(i_countreg_valid && r_sum_cnt > 'd0)
        r_sum_temp_0 <= r_sum_temp_0 + r_sum2_0;
    else
        r_sum_temp_0 <= r_sum_temp_0;
end

always @(posedge i_clk) begin
    if(r_cycle_cnt == 'd1 && r_sum_cnt == 'd0)
        r_sum_temp_1 <= r_sum2_0; 
    else if(r_cycle_cnt == 'd1 && r_sum_cnt > 'd0)
        r_sum_temp_1 <= r_sum_temp_1 + r_sum2_0;
    else
        r_sum_temp_1 <= r_sum_temp_1;
end

always @(posedge i_clk) begin
    if(r_cycle_cnt == 'd2 && r_sum_cnt == 'd0)
        r_sum_temp_2 <= r_sum2_0; 
    else if(r_cycle_cnt == 'd2 && r_sum_cnt > 'd0)
        r_sum_temp_2 <= r_sum_temp_2 + r_sum2_0;
    else
        r_sum_temp_2 <= r_sum_temp_2;
end

always @(posedge i_clk) begin
    if(r_cycle_cnt == 'd3 && r_sum_cnt == 'd0)
        r_sum_temp_3 <= r_sum2_0; 
    else if(r_cycle_cnt == 'd3 && r_sum_cnt > 'd0)
        r_sum_temp_3 <= r_sum_temp_3 + r_sum2_0;
    else
        r_sum_temp_3 <= r_sum_temp_3;
end

always @(posedge i_clk) begin
    if(r_cycle_cnt == 'd4 && r_sum_cnt == 'd0)
        r_sum_temp_4 <= r_sum2_0; 
    else if(r_cycle_cnt == 'd4 && r_sum_cnt > 'd0)
        r_sum_temp_4 <= r_sum_temp_4 + r_sum2_0;
    else
        r_sum_temp_4 <= r_sum_temp_4;
end

always @(posedge i_clk) begin
    if(r_cycle_cnt == 'd5 && r_sum_cnt == 'd0)
        r_sum_temp_5 <= r_sum2_0; 
    else if(r_cycle_cnt == 'd5 && r_sum_cnt > 'd0)
        r_sum_temp_5 <= r_sum_temp_5 + r_sum2_0;
    else
        r_sum_temp_5 <= r_sum_temp_5;
end

always @(posedge i_clk) begin
    if(r_cycle_cnt == 'd6 && r_sum_cnt == 'd0)
        r_sum_temp_6 <= r_sum2_0; 
    else if(r_cycle_cnt == 'd6 && r_sum_cnt > 'd0)
        r_sum_temp_6 <= r_sum_temp_6 + r_sum2_0;
    else
        r_sum_temp_6 <= r_sum_temp_6;
end

always @(posedge i_clk) begin
    if(r_cycle_cnt == 'd7 && r_sum_cnt == 'd0)
        r_sum_temp_7 <= r_sum2_0; 
    else if(r_cycle_cnt == 'd7 && r_sum_cnt > 'd0)
        r_sum_temp_7 <= r_sum_temp_7 + r_sum2_0;
    else
        r_sum_temp_7 <= r_sum_temp_7;
end

always @(posedge i_clk) begin
    if(r_cycle_cnt == 'd7 && r_sum_cnt == 'd3)
        r_final_sum_flag <= 'd1;
    else
        r_final_sum_flag <= 'd0;
end

always @(posedge i_clk) begin
    if(r_cycle_cnt == 'd1 && r_sum_cnt == 'd3)
        ro_final_sum <= r_sum_temp_0;
    else if(r_cycle_cnt == 'd2 && r_sum_cnt == 'd3)
        ro_final_sum <= r_sum_temp_1;
    else if(r_cycle_cnt == 'd3 && r_sum_cnt == 'd3)
        ro_final_sum <= r_sum_temp_2;
    else if(r_cycle_cnt == 'd4 && r_sum_cnt == 'd3)
        ro_final_sum <= r_sum_temp_3;
    else if(r_cycle_cnt == 'd5 && r_sum_cnt == 'd3)
        ro_final_sum <= r_sum_temp_4;
    else if(r_cycle_cnt == 'd6 && r_sum_cnt == 'd3)
        ro_final_sum <= r_sum_temp_5;
    else if(r_cycle_cnt == 'd7 && r_sum_cnt == 'd3)
        ro_final_sum <= r_sum_temp_6;
    else if(r_final_sum_flag)
        ro_final_sum <= r_sum_temp_7;
    else
        ro_final_sum <= 'd0;
end

always @(posedge i_clk) begin
    if((r_cycle_cnt > 'd0 && r_sum_cnt == 'd3) | r_final_sum_flag)
        ro_final_sum_valid <= 'd1;
    else
        ro_final_sum_valid <= 'd0;
end

endmodule
