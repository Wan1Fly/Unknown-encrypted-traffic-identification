`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/23 16:44:25
// Design Name: 
// Module Name: entropy_calc
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


module entropy_calc(

input                                   i_clk                   ,
input                                   i_rst                   ,

input               [15:0]              i_flow_num              ,
output              [15:0]              o_flow_num              ,
input               [7:0]               i_pkt_len               ,
input                                   i_count_sum_valid       ,
input               [8:0]               i_final_sum_0           ,
input               [8:0]               i_final_sum_1           ,                     
input               [8:0]               i_final_sum_2           ,
input               [8:0]               i_final_sum_3           ,
input               [8:0]               i_final_sum_4           ,
input               [8:0]               i_final_sum_5           ,
input               [8:0]               i_final_sum_6           ,
input               [8:0]               i_final_sum_7           ,
input               [8:0]               i_final_sum_8           ,
input               [8:0]               i_final_sum_9           ,
input               [8:0]               i_final_sum_10          ,
input               [8:0]               i_final_sum_11          ,
input               [8:0]               i_final_sum_12          ,
input               [8:0]               i_final_sum_13          ,
input               [8:0]               i_final_sum_14          ,
input               [8:0]               i_final_sum_15          ,
input               [8:0]               i_final_sum_16          ,
input               [8:0]               i_final_sum_17          ,
input               [8:0]               i_final_sum_18          ,
input               [8:0]               i_final_sum_19          ,
input               [8:0]               i_final_sum_20          ,
input               [8:0]               i_final_sum_21          ,
input               [8:0]               i_final_sum_22          ,
input               [8:0]               i_final_sum_23          ,
input               [8:0]               i_final_sum_24          ,
input               [8:0]               i_final_sum_25          ,
input               [8:0]               i_final_sum_26          ,
input               [8:0]               i_final_sum_27          ,
input               [8:0]               i_final_sum_28          ,
input               [8:0]               i_final_sum_29          ,
input               [8:0]               i_final_sum_30          ,
input               [8:0]               i_final_sum_31          ,
output              [15:0]              o_pkt_entropy           ,
output                                  o_pkt_entropy_valid       

);

reg         [3:0]                       r_cycle_cnt             ;
reg         [15:0]                      r_temp1                 ;
reg         [15:0]                      r_temp2                 ;
reg         [15:0]                      r_temp3                 ;
reg         [15:0]                      r_temp4                 ;
reg         [15:0]                      r_temp5                 ;
reg         [15:0]                      r_temp6                 ;
reg         [15:0]                      r_temp7                 ;
reg         [15:0]                      r_temp8                 ;
reg         [15:0]                      r_final_sum             ;
reg                                     r_ena0_1d               ;

reg                                     r_bias_valid            ;
reg                                     r_bias_en               ;
reg         [7:0]                       r_bias_addr             ;
wire        [15:0]                      w_bias_dout             ;
reg                                     ro_pkt_entropy_valid    ;
reg         [15:0]                      r_outvalid_cnt          ;
reg         [15:0]                      ri_flow_num             ;
wire                                    w_final_sum_start_flag  ;


assign              o_pkt_entropy        = r_final_sum;
assign              o_pkt_entropy_valid  = ro_pkt_entropy_valid;
assign              o_flow_num           = ri_flow_num; 

// bram控制信号
(* KEEP = "true" *)reg                 r_ena0      ;
(* KEEP = "true" *)reg                 r_enb0      ;
reg     [8:0]       r_addra0    ;
reg     [8:0]       r_addrb0    ;
wire    [15:0]      w_douta0    ;
wire    [15:0]      w_doutb0    ;

(* KEEP = "true" *)reg                 r_ena1      ;
(* KEEP = "true" *)reg                 r_enb1      ;
reg     [8:0]       r_addra1    ;
reg     [8:0]       r_addrb1    ;
wire    [15:0]      w_douta1    ;
wire    [15:0]      w_doutb1    ;

(* KEEP = "true" *)reg                 r_ena2      ;
(* KEEP = "true" *)reg                 r_enb2      ;
reg     [8:0]       r_addra2    ;
reg     [8:0]       r_addrb2    ;
wire    [15:0]      w_douta2    ;
wire    [15:0]      w_doutb2    ;

(* KEEP = "true" *)reg                 r_ena3      ;
(* KEEP = "true" *)reg                 r_enb3      ;
reg     [8:0]       r_addra3    ;
reg     [8:0]       r_addrb3    ;
wire    [15:0]      w_douta3    ;
wire    [15:0]      w_doutb3    ;

(* KEEP = "true" *)reg                 r_ena4      ;
(* KEEP = "true" *)reg                 r_enb4      ;
reg     [8:0]       r_addra4    ;
reg     [8:0]       r_addrb4    ;
wire    [15:0]      w_douta4    ;
wire    [15:0]      w_doutb4    ;

(* KEEP = "true" *)reg                 r_ena5      ;
(* KEEP = "true" *)reg                 r_enb5      ;
reg     [8:0]       r_addra5    ;
reg     [8:0]       r_addrb5    ;
wire    [15:0]      w_douta5    ;
wire    [15:0]      w_doutb5    ;

(* KEEP = "true" *)reg                 r_ena6      ;
(* KEEP = "true" *)reg                 r_enb6      ;
reg     [8:0]       r_addra6    ;
reg     [8:0]       r_addrb6    ;
wire    [15:0]      w_douta6    ;
wire    [15:0]      w_doutb6    ;

(* KEEP = "true" *)reg                 r_ena7      ;
(* KEEP = "true" *)reg                 r_enb7      ;
reg     [8:0]       r_addra7    ;
reg     [8:0]       r_addrb7    ;
wire    [15:0]      w_douta7    ;
wire    [15:0]      w_doutb7    ;

(* KEEP = "true" *)reg                 r_ena8      ;
(* KEEP = "true" *)reg                 r_enb8      ;
reg     [8:0]       r_addra8    ;
reg     [8:0]       r_addrb8    ;
wire    [15:0]      w_douta8    ;
wire    [15:0]      w_doutb8    ;

(* KEEP = "true" *)reg                 r_ena9      ;
(* KEEP = "true" *)reg                 r_enb9      ;
reg     [8:0]       r_addra9    ;
reg     [8:0]       r_addrb9    ;
wire    [15:0]      w_douta9    ;
wire    [15:0]      w_doutb9    ;

(* KEEP = "true" *)reg                 r_ena10     ;
(* KEEP = "true" *)reg                 r_enb10     ;
reg     [8:0]       r_addra10   ;
reg     [8:0]       r_addrb10   ;
wire    [15:0]      w_douta10   ;
wire    [15:0]      w_doutb10   ;

(* KEEP = "true" *)reg                 r_ena11     ;
(* KEEP = "true" *)reg                 r_enb11     ;
reg     [8:0]       r_addra11   ;
reg     [8:0]       r_addrb11   ;
wire    [15:0]      w_douta11   ;
wire    [15:0]      w_doutb11   ;

(* KEEP = "true" *)reg                 r_ena12     ;
(* KEEP = "true" *)reg                 r_enb12     ;
reg     [8:0]       r_addra12   ;
reg     [8:0]       r_addrb12   ;
wire    [15:0]      w_douta12   ;
wire    [15:0]      w_doutb12   ;

(* KEEP = "true" *)reg                 r_ena13     ;
(* KEEP = "true" *)reg                 r_enb13     ;
reg     [8:0]       r_addra13   ;
reg     [8:0]       r_addrb13   ;
wire    [15:0]      w_douta13   ;
wire    [15:0]      w_doutb13   ;

(* KEEP = "true" *)reg                 r_ena14     ;
(* KEEP = "true" *)reg                 r_enb14     ;
reg     [8:0]       r_addra14   ;
reg     [8:0]       r_addrb14   ;
wire    [15:0]      w_douta14   ;
wire    [15:0]      w_doutb14   ;

(* KEEP = "true" *)reg                 r_ena15     ;
(* KEEP = "true" *)reg                 r_enb15     ;
reg     [8:0]       r_addra15   ;
reg     [8:0]       r_addrb15   ;
wire    [15:0]      w_douta15   ;
wire    [15:0]      w_doutb15   ;

reg     [1:0]       r_sum_cycle_cnt;
reg     [15:0]      r_temp_2_0;
reg     [15:0]      r_temp_2_1;
reg     [15:0]      r_temp_2_2;
reg     [15:0]      r_temp_2_3;
reg     [15:0]      r_temp_3_0;
reg     [15:0]      r_temp_3_1;
reg     [15:0]      r_temp_4_0;

assign              w_final_sum_start_flag = !r_ena0 && r_ena0_1d;

always @(posedge i_clk) begin
    if(w_final_sum_start_flag)
        r_temp_2_0 <= r_temp1 + r_temp2;
    else
        r_temp_2_0 <= 'd0;
end

always @(posedge i_clk) begin
    if(w_final_sum_start_flag)
        r_temp_2_1 <= r_temp3 + r_temp4;
    else
        r_temp_2_1 <= 'd0;
end

always @(posedge i_clk) begin
    if(w_final_sum_start_flag)
        r_temp_2_2 <= r_temp5 + r_temp6;
    else
        r_temp_2_2 <= 'd0;
end

always @(posedge i_clk) begin
    if(w_final_sum_start_flag && r_bias_valid)
        r_temp_2_3 <= r_temp7 + w_bias_dout;
    else if(w_final_sum_start_flag && !r_bias_valid)
        r_temp_2_3 <= r_temp7;
    else
        r_temp_2_3 <= 'd0;
end

always @(posedge i_clk) begin
    if(r_sum_cycle_cnt == 'd1)
        r_temp_3_0 <= r_temp_2_0 + r_temp_2_1;
    else 
        r_temp_3_0 <= 'd0;
end

always @(posedge i_clk) begin
    if(r_sum_cycle_cnt == 'd1)
        r_temp_3_1 <= r_temp_2_2 + r_temp_2_3;
    else 
        r_temp_3_1 <= 'd0;
end

always @(posedge i_clk) begin
    if(r_sum_cycle_cnt == 'd2)
        r_temp_4_0 <= r_temp_3_0 + r_temp_3_1;
    else 
        r_temp_4_0 <= 'd0;
end

always @(posedge i_clk) begin
    if(r_sum_cycle_cnt == 'd3)
        r_final_sum <= r_temp_4_0 + r_temp8;
    else 
        r_final_sum <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_sum_cycle_cnt <= 'd0;
    else if(w_final_sum_start_flag | r_sum_cycle_cnt > 'd0)
        r_sum_cycle_cnt <= r_sum_cycle_cnt + 'd1;
    else if(r_sum_cycle_cnt == 'd3)
        r_sum_cycle_cnt <= 'd0;
    else 
        r_sum_cycle_cnt <= r_sum_cycle_cnt;
end

always @(posedge i_clk) begin
    ri_flow_num <= i_flow_num;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_ena0_1d <= 'd0;
    else 
        r_ena0_1d <= r_ena0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_cycle_cnt <= 'd0;
    else if(r_cycle_cnt == 'd8)
        r_cycle_cnt <= 'd0;
    else if(i_count_sum_valid)
        r_cycle_cnt <= r_cycle_cnt + 'd1;
    else
        r_cycle_cnt <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena0 <= 'd0;
        r_enb0 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena0 <= 'd1;
        r_enb0 <= 'd1;
    end else begin
        r_ena0 <= 'd0;
        r_enb0 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra0 <= 'd0;
    else if(i_count_sum_valid)
        r_addra0 <= i_final_sum_0;
    else
        r_addra0 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb0 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb0 <= i_final_sum_1;
    else
        r_addrb0 <= 'd0;
end 
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena1 <= 'd0;
        r_enb1 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena1 <= 'd1;
        r_enb1 <= 'd1;
    end else begin
        r_ena1 <= 'd0;
        r_enb1 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra1 <= 'd0;
    else if(i_count_sum_valid)
        r_addra1 <= i_final_sum_2;
    else
        r_addra1 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb1 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb1 <= i_final_sum_3;
    else
        r_addrb1 <= 'd0;
end 
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena2 <= 'd0;
        r_enb2 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena2 <= 'd1;
        r_enb2 <= 'd1;
    end else begin
        r_ena2 <= 'd0;
        r_enb2 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra2 <= 'd0;
    else if(i_count_sum_valid)
        r_addra2 <= i_final_sum_4;
    else
        r_addra2 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb2 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb2 <= i_final_sum_5;
    else
        r_addrb2 <= 'd0;
end 
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena3 <= 'd0;
        r_enb3 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena3 <= 'd1;
        r_enb3 <= 'd1;
    end else begin
        r_ena3 <= 'd0;
        r_enb3 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra3 <= 'd0;
    else if(i_count_sum_valid)
        r_addra3 <= i_final_sum_6;
    else
        r_addra3 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb3 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb3 <= i_final_sum_7;
    else
        r_addrb3 <= 'd0;
end 
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena4 <= 'd0;
        r_enb4 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena4 <= 'd1;
        r_enb4 <= 'd1;
    end else begin
        r_ena4 <= 'd0;
        r_enb4 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra4 <= 'd0;
    else if(i_count_sum_valid)
        r_addra4 <= i_final_sum_8;
    else
        r_addra4 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb4 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb4 <= i_final_sum_9;
    else
        r_addrb4 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena5 <= 'd0;
        r_enb5 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena5 <= 'd1;
        r_enb5 <= 'd1;
    end else begin
        r_ena5 <= 'd0;
        r_enb5 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra5 <= 'd0;
    else if(i_count_sum_valid)
        r_addra5 <= i_final_sum_10;
    else
        r_addra5 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb5 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb5 <= i_final_sum_11;
    else
        r_addrb5 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena6 <= 'd0;
        r_enb6 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena6 <= 'd1;
        r_enb6 <= 'd1;
    end else begin
        r_ena6 <= 'd0;
        r_enb6 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra6 <= 'd0;
    else if(i_count_sum_valid)
        r_addra6 <= i_final_sum_12;
    else
        r_addra6 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb6 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb6 <= i_final_sum_13;
    else
        r_addrb6 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena7 <= 'd0;
        r_enb7 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena7 <= 'd1;
        r_enb7 <= 'd1;
    end else begin
        r_ena7 <= 'd0;
        r_enb7 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra7 <= 'd0;
    else if(i_count_sum_valid)
        r_addra7 <= i_final_sum_14;
    else
        r_addra7 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb7 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb7 <= i_final_sum_15;
    else
        r_addrb7 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena8 <= 'd0;
        r_enb8 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena8 <= 'd1;
        r_enb8 <= 'd1;
    end else begin
        r_ena8 <= 'd0;
        r_enb8 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra8 <= 'd0;
    else if(i_count_sum_valid)
        r_addra8 <= i_final_sum_16;
    else
        r_addra8 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb8 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb8 <= i_final_sum_17;
    else
        r_addrb8 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena9 <= 'd0;
        r_enb9 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena9 <= 'd1;
        r_enb9 <= 'd1;
    end else begin
        r_ena9 <= 'd0;
        r_enb9 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra9 <= 'd0;
    else if(i_count_sum_valid)
        r_addra9 <= i_final_sum_18;
    else
        r_addra9 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb9 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb9 <= i_final_sum_19;
    else
        r_addrb9 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena10 <= 'd0;
        r_enb10 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena10 <= 'd1;
        r_enb10 <= 'd1;
    end else begin
        r_ena10 <= 'd0;
        r_enb10 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra10 <= 'd0;
    else if(i_count_sum_valid)
        r_addra10 <= i_final_sum_20;
    else
        r_addra10 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb10 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb10 <= i_final_sum_21;
    else
        r_addrb10 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena11 <= 'd0;
        r_enb11 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena11 <= 'd1;
        r_enb11 <= 'd1;
    end else begin
        r_ena11 <= 'd0;
        r_enb11 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra11 <= 'd0;
    else if(i_count_sum_valid)
        r_addra11 <= i_final_sum_22;
    else
        r_addra11 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb11 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb11 <= i_final_sum_23;
    else
        r_addrb11 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena12 <= 'd0;
        r_enb12 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena12 <= 'd1;
        r_enb12 <= 'd1;
    end else begin
        r_ena12 <= 'd0;
        r_enb12 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra12 <= 'd0;
    else if(i_count_sum_valid)
        r_addra12 <= i_final_sum_24;
    else
        r_addra12 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb12 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb12 <= i_final_sum_25;
    else
        r_addrb12 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena13 <= 'd0;
        r_enb13 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena13 <= 'd1;
        r_enb13 <= 'd1;
    end else begin
        r_ena13 <= 'd0;
        r_enb13 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra13 <= 'd0;
    else if(i_count_sum_valid)
        r_addra13 <= i_final_sum_26;
    else
        r_addra13 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb13 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb13 <= i_final_sum_27;
    else
        r_addrb13 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena14 <= 'd0;
        r_enb14 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena14 <= 'd1;
        r_enb14 <= 'd1;
    end else begin
        r_ena14 <= 'd0;
        r_enb14 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra14 <= 'd0;
    else if(i_count_sum_valid)
        r_addra14 <= i_final_sum_28;
    else
        r_addra14 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb14 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb14 <= i_final_sum_29;
    else
        r_addrb14 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst) begin
        r_ena15 <= 'd0;
        r_enb15 <= 'd0;
    end else if(i_count_sum_valid) begin
        r_ena15 <= 'd1;
        r_enb15 <= 'd1;
    end else begin
        r_ena15 <= 'd0;
        r_enb15 <= 'd0;
    end
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addra15 <= 'd0;
    else if(i_count_sum_valid)
        r_addra15 <= i_final_sum_30;
    else
        r_addra15 <= 'd0;
end 

always @(posedge i_clk) begin
    if(i_rst)
        r_addrb15 <= 'd0;
    else if(i_count_sum_valid)
        r_addrb15 <= i_final_sum_31;
    else
        r_addrb15 <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst)
        r_temp1 <= 'd0;
    else if(r_ena0 && r_cycle_cnt == 'd2)
        r_temp1 <= w_douta0 + w_douta1 + w_douta2 + w_douta3 + w_douta4 + w_douta5 + w_douta6 + w_douta7 + w_douta8 + w_douta9 + w_douta10 + w_douta11 + w_douta12 + w_douta13 + w_douta14 + w_douta15
                    + w_doutb0 + w_doutb1 + w_doutb2 + w_doutb3 + w_doutb4 + w_doutb5 + w_doutb6 + w_doutb7 + w_doutb8 + w_doutb9 + w_doutb10 + w_doutb11 + w_doutb12 + w_doutb13 + w_doutb14 + w_doutb15;
    else
        r_temp1 <= r_temp1;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_temp2 <= 'd0;
    else if(r_ena0 && r_cycle_cnt == 'd3)
        r_temp2 <= w_douta0 + w_douta1 + w_douta2 + w_douta3 + w_douta4 + w_douta5 + w_douta6 + w_douta7 + w_douta8 + w_douta9 + w_douta10 + w_douta11 + w_douta12 + w_douta13 + w_douta14 + w_douta15
                    + w_doutb0 + w_doutb1 + w_doutb2 + w_doutb3 + w_doutb4 + w_doutb5 + w_doutb6 + w_doutb7 + w_doutb8 + w_doutb9 + w_doutb10 + w_doutb11 + w_doutb12 + w_doutb13 + w_doutb14 + w_doutb15;
    else
        r_temp2 <= r_temp2;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_temp3 <= 'd0;
    else if(r_ena0 && r_cycle_cnt == 'd4)
        r_temp3 <= w_douta0 + w_douta1 + w_douta2 + w_douta3 + w_douta4 + w_douta5 + w_douta6 + w_douta7 + w_douta8 + w_douta9 + w_douta10 + w_douta11 + w_douta12 + w_douta13 + w_douta14 + w_douta15
                    + w_doutb0 + w_doutb1 + w_doutb2 + w_doutb3 + w_doutb4 + w_doutb5 + w_doutb6 + w_doutb7 + w_doutb8 + w_doutb9 + w_doutb10 + w_doutb11 + w_doutb12 + w_doutb13 + w_doutb14 + w_doutb15;
    else
        r_temp3 <= r_temp3;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_temp4 <= 'd0;
    else if(r_ena0 && r_cycle_cnt == 'd5)
        r_temp4 <= w_douta0 + w_douta1 + w_douta2 + w_douta3 + w_douta4 + w_douta5 + w_douta6 + w_douta7 + w_douta8 + w_douta9 + w_douta10 + w_douta11 + w_douta12 + w_douta13 + w_douta14 + w_douta15
                    + w_doutb0 + w_doutb1 + w_doutb2 + w_doutb3 + w_doutb4 + w_doutb5 + w_doutb6 + w_doutb7 + w_doutb8 + w_doutb9 + w_doutb10 + w_doutb11 + w_doutb12 + w_doutb13 + w_doutb14 + w_doutb15;
    else
        r_temp4 <= r_temp4;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_temp5 <= 'd0;
    else if(r_ena0 && r_cycle_cnt == 'd6)
        r_temp5 <= w_douta0 + w_douta1 + w_douta2 + w_douta3 + w_douta4 + w_douta5 + w_douta6 + w_douta7 + w_douta8 + w_douta9 + w_douta10 + w_douta11 + w_douta12 + w_douta13 + w_douta14 + w_douta15
                    + w_doutb0 + w_doutb1 + w_doutb2 + w_doutb3 + w_doutb4 + w_doutb5 + w_doutb6 + w_doutb7 + w_doutb8 + w_doutb9 + w_doutb10 + w_doutb11 + w_doutb12 + w_doutb13 + w_doutb14 + w_doutb15;
    else
        r_temp5 <= r_temp5;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_temp6 <= 'd0;
    else if(r_ena0 && r_cycle_cnt == 'd7)
        r_temp6 <= w_douta0 + w_douta1 + w_douta2 + w_douta3 + w_douta4 + w_douta5 + w_douta6 + w_douta7 + w_douta8 + w_douta9 + w_douta10 + w_douta11 + w_douta12 + w_douta13 + w_douta14 + w_douta15
                    + w_doutb0 + w_doutb1 + w_doutb2 + w_doutb3 + w_doutb4 + w_doutb5 + w_doutb6 + w_doutb7 + w_doutb8 + w_doutb9 + w_doutb10 + w_doutb11 + w_doutb12 + w_doutb13 + w_doutb14 + w_doutb15;
    else
        r_temp6 <= r_temp6;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_temp7 <= 'd0;
    else if(r_ena0 && r_cycle_cnt == 'd8)
        r_temp7 <= w_douta0 + w_douta1 + w_douta2 + w_douta3 + w_douta4 + w_douta5 + w_douta6 + w_douta7 + w_douta8 + w_douta9 + w_douta10 + w_douta11 + w_douta12 + w_douta13 + w_douta14 + w_douta15
                    + w_doutb0 + w_doutb1 + w_doutb2 + w_doutb3 + w_doutb4 + w_doutb5 + w_doutb6 + w_doutb7 + w_doutb8 + w_doutb9 + w_doutb10 + w_doutb11 + w_doutb12 + w_doutb13 + w_doutb14 + w_doutb15;
    else
        r_temp7 <= r_temp7;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_temp8 <= 'd0;
    else if(w_final_sum_start_flag)
        r_temp8 <= w_douta0 + w_douta1 + w_douta2 + w_douta3 + w_douta4 + w_douta5 + w_douta6 + w_douta7 + w_douta8 + w_douta9 + w_douta10 + w_douta11 + w_douta12 + w_douta13 + w_douta14 + w_douta15
                    + w_doutb0 + w_doutb1 + w_doutb2 + w_doutb3 + w_doutb4 + w_doutb5 + w_doutb6 + w_doutb7 + w_doutb8 + w_doutb9 + w_doutb10 + w_doutb11 + w_doutb12 + w_doutb13 + w_doutb14 + w_doutb15;
    else
        r_temp8 <= r_temp8;
end

/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst)
        r_bias_en <= 'd0;
    else if(r_cycle_cnt == 'd7 && i_pkt_len < 'd255)
        r_bias_en <= 'd1;
    else
        r_bias_en <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_bias_addr <= 'd0;
    else if(r_cycle_cnt == 'd7)
        r_bias_addr <= i_pkt_len;
    else
        r_bias_addr <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_bias_valid <= 'd0;
    else if(r_bias_en)
        r_bias_valid <= 'd1;
    else
        r_bias_valid <= 'd0;
end
/* --------------------------------------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst)
        ro_pkt_entropy_valid <= 'd0;
    else if(r_sum_cycle_cnt == 'd3)
        ro_pkt_entropy_valid <= 'd1;
    else
        ro_pkt_entropy_valid <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_outvalid_cnt <= 'd0;
    else if(ro_pkt_entropy_valid)
        r_outvalid_cnt <= r_outvalid_cnt + 'd1;
    else
        r_outvalid_cnt <= r_outvalid_cnt;
end


len_bias_rom len_bias_rom_U0 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_bias_en  ),      // input wire ena
  .addra        (r_bias_addr),      // input wire [7 : 0] addra
  .douta        (w_bias_dout)       // output wire [15 : 0] douta
);

fixed_16b2port_rom fixed_16b2port_rom_U0 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena0     ),      // input wire ena
  .addra        (r_addra0   ),      // input wire [8 : 0] addra
  .douta        (w_douta0   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb0     ),      // input wire enb
  .addrb        (r_addrb0   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb0   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U1 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena1     ),      // input wire ena
  .addra        (r_addra1   ),      // input wire [8 : 0] addra
  .douta        (w_douta1   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb1     ),      // input wire enb
  .addrb        (r_addrb1   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb1   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U2 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena2     ),      // input wire ena
  .addra        (r_addra2   ),      // input wire [8 : 0] addra
  .douta        (w_douta2   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb2     ),      // input wire enb
  .addrb        (r_addrb2   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb2   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U3 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena3     ),      // input wire ena
  .addra        (r_addra3   ),      // input wire [8 : 0] addra
  .douta        (w_douta3   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb3     ),      // input wire enb
  .addrb        (r_addrb3   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb3   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U4 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena4     ),      // input wire ena
  .addra        (r_addra4   ),      // input wire [8 : 0] addra
  .douta        (w_douta4   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb4     ),      // input wire enb
  .addrb        (r_addrb4   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb4   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U5 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena5     ),      // input wire ena
  .addra        (r_addra5   ),      // input wire [8 : 0] addra
  .douta        (w_douta5   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb5     ),      // input wire enb
  .addrb        (r_addrb5   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb5   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U6 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena6     ),      // input wire ena
  .addra        (r_addra6   ),      // input wire [8 : 0] addra
  .douta        (w_douta6   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb6     ),      // input wire enb
  .addrb        (r_addrb6   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb6   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U7 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena7     ),      // input wire ena
  .addra        (r_addra7   ),      // input wire [8 : 0] addra
  .douta        (w_douta7   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb7     ),      // input wire enb
  .addrb        (r_addrb7   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb7   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U8 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena8     ),      // input wire ena
  .addra        (r_addra8   ),      // input wire [8 : 0] addra
  .douta        (w_douta8   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb8     ),      // input wire enb
  .addrb        (r_addrb8   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb8   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U9 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena9     ),      // input wire ena
  .addra        (r_addra9   ),      // input wire [8 : 0] addra
  .douta        (w_douta9   ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb9     ),      // input wire enb
  .addrb        (r_addrb9   ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb9   )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U10 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena10    ),      // input wire ena
  .addra        (r_addra10  ),      // input wire [8 : 0] addra
  .douta        (w_douta10  ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb10    ),      // input wire enb
  .addrb        (r_addrb10  ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb10  )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U11 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena11    ),      // input wire ena
  .addra        (r_addra11  ),      // input wire [8 : 0] addra
  .douta        (w_douta11  ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb11    ),      // input wire enb
  .addrb        (r_addrb11  ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb11  )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U12 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena12    ),      // input wire ena
  .addra        (r_addra12  ),      // input wire [8 : 0] addra
  .douta        (w_douta12  ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb12    ),      // input wire enb
  .addrb        (r_addrb12  ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb12  )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U13 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena13    ),      // input wire ena
  .addra        (r_addra13  ),      // input wire [8 : 0] addra
  .douta        (w_douta13  ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb13    ),      // input wire enb
  .addrb        (r_addrb13  ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb13  )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U14 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena14    ),      // input wire ena
  .addra        (r_addra14  ),      // input wire [8 : 0] addra
  .douta        (w_douta14  ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb14    ),      // input wire enb
  .addrb        (r_addrb14  ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb14  )       // output wire [15 : 0] doutb
);

fixed_16b2port_rom fixed_16b2port_rom_U15 (
  .clka         (i_clk      ),      // input wire clka
  .ena          (r_ena15    ),      // input wire ena
  .addra        (r_addra15  ),      // input wire [8 : 0] addra
  .douta        (w_douta15  ),      // output wire [15 : 0] douta
  .clkb         (i_clk      ),      // input wire clkb
  .enb          (r_enb15    ),      // input wire enb
  .addrb        (r_addrb15  ),      // input wire [8 : 0] addrb
  .doutb        (w_doutb15  )       // output wire [15 : 0] doutb
);

endmodule
