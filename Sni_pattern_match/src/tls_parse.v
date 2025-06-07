`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/18 14:57:36
// Design Name: 
// Module Name: tls_parse
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


module tls_parse(

input                               i_clk                   ,
input                               i_rst                   ,
input                               i_pkt_data_valid        ,
input           [63:0]              i_pkt_data              ,
input           [7:0]               i_pkt_len               ,
input           [2:0]               i_pkt_num               ,
input           [7:0]               i_pkt_protocol          ,
input           [5:0]               i_pkt_cycle_cnt         ,
input           [7:0]               i_flow_id               ,
output          [2:0]               o_flow_type                 

);

reg                                 ri_pkt_data_valid       ; 
reg             [63:0]              ri_pkt_data             ; 
reg             [7:0]               ri_pkt_len              ; 
reg             [7:0]               ri_flow_id              ; 
reg             [7:0]               ri_pkt_protocol         ;
reg             [2:0]               ri_pkt_num              ;
reg             [5:0]               ri_pkt_cycle_cnt        ;
reg             [2:0]               ro_flow_type            ;
reg                                 r_tls_app_flag          ;
reg             [2:0]               r_tls_pass_cnt          ;    

assign          o_flow_type     =   ro_flow_type            ;

always @(posedge i_clk) begin
    ri_pkt_data_valid   <=  i_pkt_data_valid ;
    ri_pkt_data         <=  i_pkt_data       ;
    ri_pkt_len          <=  i_pkt_len        ;
    ri_flow_id          <=  i_flow_id        ;
    ri_pkt_protocol     <=  i_pkt_protocol   ;
    ri_pkt_num          <=  i_pkt_num        ;
    ri_pkt_cycle_cnt    <=  i_pkt_cycle_cnt  ;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_flow_type <= 'd0;
    else if(ri_pkt_cycle_cnt == 'd1 && ri_pkt_data[23:0] == 24'h010316 && ri_pkt_data[47:40] == 8'h01 && ri_pkt_protocol == 8'h11)
        ro_flow_type <= 3'b010;
    else if(ri_pkt_cycle_cnt == 'd1 && ri_pkt_data[23:0] == 24'h010316 && ri_pkt_data[47:40] == 8'h01 && ri_pkt_protocol == 8'h06)
        ro_flow_type <= 3'b001;
    else if(ri_pkt_num == 'd4 && ri_pkt_cycle_cnt == 'd32)
        ro_flow_type <= 3'b000;
    else if(r_tls_pass_cnt == 'd4 && ri_pkt_protocol == 8'h11)
        ro_flow_type <= 3'b110;
    else if(r_tls_pass_cnt == 'd4 && ri_pkt_protocol == 8'h06)
        ro_flow_type <= 3'b101;
    else
        ro_flow_type <= ro_flow_type;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_tls_app_flag <= 'd0;
    else if(ri_pkt_cycle_cnt == 'd1 && ri_pkt_data[23:0] == 24'h030317)
        r_tls_app_flag <= 'd1;
    else if(ri_pkt_cycle_cnt == 'd32 && ri_pkt_num == 'd4)
        r_tls_app_flag <= 'd0;
    else
        r_tls_app_flag <= r_tls_app_flag;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_tls_pass_cnt <= 'd0;
    else if(ri_pkt_data[23:0] == 24'h030317 && ri_pkt_cycle_cnt == 'd1 && r_tls_app_flag)
        r_tls_pass_cnt <= r_tls_pass_cnt + 'd1;
    else if(ri_pkt_cycle_cnt == 'd32 && ri_pkt_num == 'd4)
        r_tls_pass_cnt <= 'd0;
    else
        r_tls_pass_cnt <= r_tls_pass_cnt;
end

endmodule
