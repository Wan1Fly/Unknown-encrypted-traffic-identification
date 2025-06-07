`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/18 11:29:12
// Design Name: 
// Module Name: byte_count
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


module byte_count #(

    parameter DATA_WIDTH = 8

)(

input                                   i_clk                   ,
input                                   i_rst                   ,

input       [DATA_WIDTH-1:0]            count_data              ,
input                                   count_data_valid        ,
output      [63:0]                      o_countreg_0            ,
output      [63:0]                      o_countreg_1            ,
output      [63:0]                      o_countreg_2            ,
output      [63:0]                      o_countreg_3            ,
output      [63:0]                      o_countreg_4            ,
output      [63:0]                      o_countreg_5            ,
output      [63:0]                      o_countreg_6            ,
output      [63:0]                      o_countreg_7            ,
output      [63:0]                      o_countreg_8            ,
output      [63:0]                      o_countreg_9            ,
output      [63:0]                      o_countreg_10           ,
output      [63:0]                      o_countreg_11           ,
output      [63:0]                      o_countreg_12           ,
output      [63:0]                      o_countreg_13           ,
output      [63:0]                      o_countreg_14           ,
output      [63:0]                      o_countreg_15           ,
output      [63:0]                      o_countreg_16           ,
output      [63:0]                      o_countreg_17           ,
output      [63:0]                      o_countreg_18           ,
output      [63:0]                      o_countreg_19           ,
output      [63:0]                      o_countreg_20           ,
output      [63:0]                      o_countreg_21           ,
output      [63:0]                      o_countreg_22           ,
output      [63:0]                      o_countreg_23           ,
output      [63:0]                      o_countreg_24           ,
output      [63:0]                      o_countreg_25           ,
output      [63:0]                      o_countreg_26           ,
output      [63:0]                      o_countreg_27           ,
output      [63:0]                      o_countreg_28           ,
output      [63:0]                      o_countreg_29           ,
output      [63:0]                      o_countreg_30           ,
output      [63:0]                      o_countreg_31                                                     

);

reg         [DATA_WIDTH-1:0]            ri_count_data           ;
reg         [DATA_WIDTH-1:0]            ri_count_data_1d        ;
reg                                     ri_count_data_valid     ;
reg         [3:0]                       r_pkt_cycle_cnt         ;
reg         [3:0]                       r_pkt_cycle_cnt_1d      ;

reg         [5:0]                       r_reg_mux               ;

reg         [63:0]                      r_countreg_0            ;
reg         [63:0]                      r_countreg_1            ;
reg         [63:0]                      r_countreg_2            ;
reg         [63:0]                      r_countreg_3            ;
reg         [63:0]                      r_countreg_4            ;
reg         [63:0]                      r_countreg_5            ;
reg         [63:0]                      r_countreg_6            ;
reg         [63:0]                      r_countreg_7            ;
reg         [63:0]                      r_countreg_8            ;
reg         [63:0]                      r_countreg_9            ;
reg         [63:0]                      r_countreg_10           ;
reg         [63:0]                      r_countreg_11           ;
reg         [63:0]                      r_countreg_12           ;
reg         [63:0]                      r_countreg_13           ;
reg         [63:0]                      r_countreg_14           ;
reg         [63:0]                      r_countreg_15           ;
reg         [63:0]                      r_countreg_16           ;
reg         [63:0]                      r_countreg_17           ;
reg         [63:0]                      r_countreg_18           ;
reg         [63:0]                      r_countreg_19           ;
reg         [63:0]                      r_countreg_20           ;
reg         [63:0]                      r_countreg_21           ;
reg         [63:0]                      r_countreg_22           ;
reg         [63:0]                      r_countreg_23           ;
reg         [63:0]                      r_countreg_24           ;
reg         [63:0]                      r_countreg_25           ;
reg         [63:0]                      r_countreg_26           ;
reg         [63:0]                      r_countreg_27           ;
reg         [63:0]                      r_countreg_28           ;
reg         [63:0]                      r_countreg_29           ;
reg         [63:0]                      r_countreg_30           ;
reg         [63:0]                      r_countreg_31           ;

reg         [63:0]                      countreg_0              ;
reg         [63:0]                      countreg_1              ;
reg         [63:0]                      countreg_2              ;
reg         [63:0]                      countreg_3              ;
reg         [63:0]                      countreg_4              ;
reg         [63:0]                      countreg_5              ;
reg         [63:0]                      countreg_6              ;
reg         [63:0]                      countreg_7              ;
reg         [63:0]                      countreg_8              ;
reg         [63:0]                      countreg_9              ;
reg         [63:0]                      countreg_10             ;
reg         [63:0]                      countreg_11             ;
reg         [63:0]                      countreg_12             ;
reg         [63:0]                      countreg_13             ;
reg         [63:0]                      countreg_14             ;
reg         [63:0]                      countreg_15             ;
reg         [63:0]                      countreg_16             ;
reg         [63:0]                      countreg_17             ;
reg         [63:0]                      countreg_18             ;
reg         [63:0]                      countreg_19             ;
reg         [63:0]                      countreg_20             ;
reg         [63:0]                      countreg_21             ;
reg         [63:0]                      countreg_22             ;
reg         [63:0]                      countreg_23             ;
reg         [63:0]                      countreg_24             ;
reg         [63:0]                      countreg_25             ;
reg         [63:0]                      countreg_26             ;
reg         [63:0]                      countreg_27             ;
reg         [63:0]                      countreg_28             ;
reg         [63:0]                      countreg_29             ;
reg         [63:0]                      countreg_30             ;
reg         [63:0]                      countreg_31             ;

assign      o_countreg_0        =       countreg_0              ; 
assign      o_countreg_1        =       countreg_1              ; 
assign      o_countreg_2        =       countreg_2              ; 
assign      o_countreg_3        =       countreg_3              ; 
assign      o_countreg_4        =       countreg_4              ; 
assign      o_countreg_5        =       countreg_5              ; 
assign      o_countreg_6        =       countreg_6              ; 
assign      o_countreg_7        =       countreg_7              ; 
assign      o_countreg_8        =       countreg_8              ; 
assign      o_countreg_9        =       countreg_9              ; 
assign      o_countreg_10       =       countreg_10             ; 
assign      o_countreg_11       =       countreg_11             ; 
assign      o_countreg_12       =       countreg_12             ; 
assign      o_countreg_13       =       countreg_13             ; 
assign      o_countreg_14       =       countreg_14             ; 
assign      o_countreg_15       =       countreg_15             ; 
assign      o_countreg_16       =       countreg_16             ; 
assign      o_countreg_17       =       countreg_17             ; 
assign      o_countreg_18       =       countreg_18             ; 
assign      o_countreg_19       =       countreg_19             ; 
assign      o_countreg_20       =       countreg_20             ; 
assign      o_countreg_21       =       countreg_21             ; 
assign      o_countreg_22       =       countreg_22             ; 
assign      o_countreg_23       =       countreg_23             ; 
assign      o_countreg_24       =       countreg_24             ; 
assign      o_countreg_25       =       countreg_25             ; 
assign      o_countreg_26       =       countreg_26             ; 
assign      o_countreg_27       =       countreg_27             ; 
assign      o_countreg_28       =       countreg_28             ; 
assign      o_countreg_29       =       countreg_29             ; 
assign      o_countreg_30       =       countreg_30             ; 
assign      o_countreg_31       =       countreg_31             ; 

always @(posedge i_clk) begin
    if(r_pkt_cycle_cnt_1d == 'd8)begin
        countreg_0  <= r_countreg_0 ;
        countreg_1  <= r_countreg_1 ;
        countreg_2  <= r_countreg_2 ;
        countreg_3  <= r_countreg_3 ;
        countreg_4  <= r_countreg_4 ;
        countreg_5  <= r_countreg_5 ;
        countreg_6  <= r_countreg_6 ;
        countreg_7  <= r_countreg_7 ;
        countreg_8  <= r_countreg_8 ;
        countreg_9  <= r_countreg_9 ;
        countreg_10 <= r_countreg_10;
        countreg_11 <= r_countreg_11;
        countreg_12 <= r_countreg_12;
        countreg_13 <= r_countreg_13;
        countreg_14 <= r_countreg_14;
        countreg_15 <= r_countreg_15;
        countreg_16 <= r_countreg_16;
        countreg_17 <= r_countreg_17;
        countreg_18 <= r_countreg_18;
        countreg_19 <= r_countreg_19;
        countreg_20 <= r_countreg_20;
        countreg_21 <= r_countreg_21;
        countreg_22 <= r_countreg_22;
        countreg_23 <= r_countreg_23;
        countreg_24 <= r_countreg_24;
        countreg_25 <= r_countreg_25;
        countreg_26 <= r_countreg_26;
        countreg_27 <= r_countreg_27;
        countreg_28 <= r_countreg_28;
        countreg_29 <= r_countreg_29;
        countreg_30 <= r_countreg_30;
        countreg_31 <= r_countreg_31;
    end else begin
        countreg_0  <= countreg_0 ;
        countreg_1  <= countreg_1 ;
        countreg_2  <= countreg_2 ;
        countreg_3  <= countreg_3 ;
        countreg_4  <= countreg_4 ;
        countreg_5  <= countreg_5 ;
        countreg_6  <= countreg_6 ;
        countreg_7  <= countreg_7 ;
        countreg_8  <= countreg_8 ;
        countreg_9  <= countreg_9 ;
        countreg_10 <= countreg_10;
        countreg_11 <= countreg_11;
        countreg_12 <= countreg_12;
        countreg_13 <= countreg_13;
        countreg_14 <= countreg_14;
        countreg_15 <= countreg_15;
        countreg_16 <= countreg_16;
        countreg_17 <= countreg_17;
        countreg_18 <= countreg_18;
        countreg_19 <= countreg_19;
        countreg_20 <= countreg_20;
        countreg_21 <= countreg_21;
        countreg_22 <= countreg_22;
        countreg_23 <= countreg_23;
        countreg_24 <= countreg_24;
        countreg_25 <= countreg_25;
        countreg_26 <= countreg_26;
        countreg_27 <= countreg_27;
        countreg_28 <= countreg_28;
        countreg_29 <= countreg_29;
        countreg_30 <= countreg_30;
        countreg_31 <= countreg_31;
    end
end

always @(posedge i_clk) begin
    ri_count_data       <= count_data      ;
    ri_count_data_1d    <= ri_count_data   ;
    ri_count_data_valid <= count_data_valid;
    r_pkt_cycle_cnt_1d  <= r_pkt_cycle_cnt ;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_pkt_cycle_cnt <= 'd0;
    else if(r_pkt_cycle_cnt == 'd8)
        r_pkt_cycle_cnt <= 'd0;
    else if(count_data_valid)
        r_pkt_cycle_cnt <= r_pkt_cycle_cnt + 'd1;
    else
        r_pkt_cycle_cnt <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_reg_mux <= 'd0;
    else if(count_data_valid) begin
        case (count_data[7:3])
            5'd0    :    r_reg_mux <= 'd0;  // 0  to 7
            5'd1    :    r_reg_mux <= 'd1;  // 8  to 15
            5'd2    :    r_reg_mux <= 'd2;  // 16 to 23
            5'd3    :    r_reg_mux <= 'd3;  // 24 to 31
            5'd4    :    r_reg_mux <= 'd4;  // 32 to 39
            5'd5    :    r_reg_mux <= 'd5;  // 40 to 47
            5'd6    :    r_reg_mux <= 'd6;  // 48 to 55
            5'd7    :    r_reg_mux <= 'd7;  // 56 to 63
            5'd8    :    r_reg_mux <= 'd8;  // 64 to 71
            5'd9    :    r_reg_mux <= 'd9;  // 72 to 79
            5'd10   :    r_reg_mux <= 'd10; // 80 to 87
            5'd11   :    r_reg_mux <= 'd11; // 88 to 95
            5'd12   :    r_reg_mux <= 'd12; // 96 to 103
            5'd13   :    r_reg_mux <= 'd13; // 104 to 111
            5'd14   :    r_reg_mux <= 'd14; // 112 to 119
            5'd15   :    r_reg_mux <= 'd15; // 120 to 127
            5'd16   :    r_reg_mux <= 'd16; // 128 to 135
            5'd17   :    r_reg_mux <= 'd17; // 136 to 143
            5'd18   :    r_reg_mux <= 'd18; // 144 to 151
            5'd19   :    r_reg_mux <= 'd19; // 152 to 159
            5'd20   :    r_reg_mux <= 'd20; // 160 to 167
            5'd21   :    r_reg_mux <= 'd21; // 168 to 175
            5'd22   :    r_reg_mux <= 'd22; // 176 to 183
            5'd23   :    r_reg_mux <= 'd23; // 184 to 191
            5'd24   :    r_reg_mux <= 'd24; // 192 to 199
            5'd25   :    r_reg_mux <= 'd25; // 200 to 207
            5'd26   :    r_reg_mux <= 'd26; // 208 to 215
            5'd27   :    r_reg_mux <= 'd27; // 216 to 223
            5'd28   :    r_reg_mux <= 'd28; // 224 to 231
            5'd29   :    r_reg_mux <= 'd29; // 232 to 239
            5'd30   :    r_reg_mux <= 'd30; // 240 to 247
            5'd31   :    r_reg_mux <= 'd31; // 248 to 255
            default :    r_reg_mux <= 'd0;
        endcase
    end else
        r_reg_mux <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_0 <= 'd0;
    else if(ri_count_data_valid && r_reg_mux == 'd0)
        r_countreg_0[ri_count_data[7:0] * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_0 <= 'd0;
    else
        r_countreg_0 <= r_countreg_0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_1 <= 'd0;
    else if(r_reg_mux == 'd1)
        r_countreg_1[(ri_count_data[7:0] - 8'd8) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_1 <= 'd0;
    else
        r_countreg_1 <= r_countreg_1;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_2 <= 'd0;
    else if(r_reg_mux == 'd2)
        r_countreg_2[(ri_count_data[7:0] - 8'd16) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_2 <= 'd0;    
    else
        r_countreg_2 <= r_countreg_2;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_3 <= 'd0;
    else if(r_reg_mux == 'd3)
        r_countreg_3[(ri_count_data[7:0] - 8'd24) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_3 <= 'd0;
    else
        r_countreg_3 <= r_countreg_3;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_4 <= 'd0;
    else if(r_reg_mux == 'd4)
        r_countreg_4[(ri_count_data[7:0] - 8'd32) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_4 <= 'd0;    
    else
        r_countreg_4 <= r_countreg_4;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_5 <= 'd0;
    else if(r_reg_mux == 'd5)
        r_countreg_5[(ri_count_data[7:0] - 8'd40) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_5 <= 'd0;
    else
        r_countreg_5 <= r_countreg_5;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_6 <= 'd0;
    else if(r_reg_mux == 'd6)
        r_countreg_6[(ri_count_data[7:0] - 8'd48) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_6 <= 'd0;
    else
        r_countreg_6 <= r_countreg_6;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_7 <= 'd0;
    else if(r_reg_mux == 'd7)
        r_countreg_7[(ri_count_data[7:0] - 8'd56) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_7 <= 'd0;
    else
        r_countreg_7 <= r_countreg_7;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_8 <= 'd0;
    else if(r_reg_mux == 'd8)
        r_countreg_8[(ri_count_data[7:0] - 8'd64) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_8 <= 'd0;
    else
        r_countreg_8 <= r_countreg_8;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_9 <= 'd0;
    else if(r_reg_mux == 'd9)
        r_countreg_9[(ri_count_data[7:0] - 8'd72) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_9 <= 'd0;    
    else
        r_countreg_9 <= r_countreg_9;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_10 <= 'd0;
    else if(r_reg_mux == 'd10)
        r_countreg_10[(ri_count_data[7:0] - 8'd80) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_10 <= 'd0;
    else
        r_countreg_10 <= r_countreg_10;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_11 <= 'd0;
    else if(r_reg_mux == 'd11)
        r_countreg_11[(ri_count_data[7:0] - 8'd88) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_11 <= 'd0;    
    else
        r_countreg_11 <= r_countreg_11;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_12 <= 'd0;
    else if(r_reg_mux == 'd12)
        r_countreg_12[(ri_count_data[7:0] - 8'd96) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_12 <= 'd0;
    else
        r_countreg_12 <= r_countreg_12;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_13 <= 'd0;
    else if(r_reg_mux == 'd13)
        r_countreg_13[(ri_count_data[7:0] - 8'd104) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_13 <= 'd0;
    else
        r_countreg_13 <= r_countreg_13;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_14 <= 'd0;
    else if(r_reg_mux == 'd14)
        r_countreg_14[(ri_count_data[7:0] - 8'd112) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_14 <= 'd0;
    else
        r_countreg_14 <= r_countreg_14;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_15 <= 'd0;
    else if(r_reg_mux == 'd15)
        r_countreg_15[(ri_count_data[7:0] - 8'd120) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_15 <= 'd0;    
    else
        r_countreg_15 <= r_countreg_15;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_16 <= 'd0;
    else if(r_reg_mux == 'd16)
        r_countreg_16[(ri_count_data[7:0] - 8'd128) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_16 <= 'd0;
    else
        r_countreg_16 <= r_countreg_16;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_17 <= 'd0;
    else if(r_reg_mux == 'd17)
        r_countreg_17[(ri_count_data[7:0] - 8'd136) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_17 <= 'd0;
    else
        r_countreg_17 <= r_countreg_17;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_18 <= 'd0;
    else if(r_reg_mux == 'd18)
        r_countreg_18[(ri_count_data[7:0] - 8'd144) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_18 <= 'd0;
    else
        r_countreg_18 <= r_countreg_18;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_19 <= 'd0;
    else if(r_reg_mux == 'd19)
        r_countreg_19[(ri_count_data[7:0] - 8'd152) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_19 <= 'd0;    
    else
        r_countreg_19 <= r_countreg_19;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_20 <= 'd0;
    else if(r_reg_mux == 'd20)
        r_countreg_20[(ri_count_data[7:0] - 8'd160) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_20 <= 'd0;
    else
        r_countreg_20 <= r_countreg_20;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_21 <= 'd0;
    else if(r_reg_mux == 'd21)
        r_countreg_21[(ri_count_data[7:0] - 8'd168) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_21 <= 'd0;
    else
        r_countreg_21 <= r_countreg_21;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_22 <= 'd0;
    else if(r_reg_mux == 'd22)
        r_countreg_22[(ri_count_data[7:0] - 8'd176) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_22 <= 'd0;
    else
        r_countreg_22 <= r_countreg_22;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_23 <= 'd0;
    else if(r_reg_mux == 'd23)
        r_countreg_23[(ri_count_data[7:0] - 8'd184) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_23 <= 'd0;    
    else
        r_countreg_23 <= r_countreg_23;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_24 <= 'd0;
    else if(r_reg_mux == 'd24)
        r_countreg_24[(ri_count_data[7:0] - 8'd192) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_24 <= 'd0;
    else
        r_countreg_24 <= r_countreg_24;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_25 <= 'd0;
    else if(r_reg_mux == 'd25)
        r_countreg_25[(ri_count_data[7:0] - 8'd200) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_25 <= 'd0;
    else
        r_countreg_25 <= r_countreg_25;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_26 <= 'd0;
    else if(r_reg_mux == 'd26)
        r_countreg_26[(ri_count_data[7:0] - 8'd208) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_26 <= 'd0;
    else
        r_countreg_26 <= r_countreg_26;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_27 <= 'd0;
    else if(r_reg_mux == 'd27)
        r_countreg_27[(ri_count_data[7:0] - 8'd216) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_27 <= 'd0;
    else
        r_countreg_27 <= r_countreg_27;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_28 <= 'd0;
    else if(r_reg_mux == 'd28)
        r_countreg_28[(ri_count_data[7:0] - 8'd224) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_28 <= 'd0;
    else
        r_countreg_28 <= r_countreg_28;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_29 <= 'd0;
    else if(r_reg_mux == 'd29)
        r_countreg_29[(ri_count_data[7:0] - 8'd232) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_29 <= 'd0;
    else
        r_countreg_29 <= r_countreg_29;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_30 <= 'd0;
    else if(r_reg_mux == 'd30)
        r_countreg_30[(ri_count_data[7:0] - 8'd240) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_30 <= 'd0;
    else
        r_countreg_30 <= r_countreg_30;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_countreg_31 <= 'd0;
    else if(r_reg_mux == 'd31)
        r_countreg_31[(ri_count_data[7:0] - 8'd248) * 8 + r_pkt_cycle_cnt_1d]<= 1'b1;
    else if(r_pkt_cycle_cnt_1d == 'd8)
        r_countreg_31 <= 'd0;
    else
        r_countreg_31 <= r_countreg_31;
end




endmodule
