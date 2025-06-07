`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/23 13:23:43
// Design Name: 
// Module Name: ssh_parse
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


module ssh_parse(

input                               i_clk                   ,
input                               i_rst                   ,
input                               i_pkt_data_valid        ,
input           [63:0]              i_pkt_data              ,
input           [7:0]               i_pkt_len               ,
input           [2:0]               i_pkt_num               ,
input           [7:0]               i_pkt_protocol          ,
input           [5:0]               i_pkt_cycle_cnt         ,
input           [7:0]               i_flow_id               ,                             
output          [2:0]               o_flow_type             ,
output                              o_pkt_data_valid        ,
output          [63:0]              o_pkt_data              ,
output          [7:0]               o_pkt_len               ,
output          [2:0]               o_pkt_num               ,
output          [7:0]               o_pkt_protocol          ,
output          [5:0]               o_pkt_cycle_cnt         ,
output          [7:0]               o_flow_id                  
                 
);

reg                                 ri_pkt_data_valid       ; 
reg             [63:0]              ri_pkt_data             ; 
reg             [7:0]               ri_pkt_len              ; 
reg             [7:0]               ri_flow_id              ; 
reg             [7:0]               ri_pkt_protocol         ;
reg             [2:0]               ri_pkt_num              ;
reg             [5:0]               ri_pkt_cycle_cnt        ;
reg             [2:0]               ro_flow_type            ;

assign          o_flow_type      =  ro_flow_type            ;
assign          o_pkt_data_valid =  ri_pkt_data_valid       ;   
assign          o_pkt_data       =  ri_pkt_data             ;       
assign          o_pkt_len        =  ri_pkt_len              ;    
assign          o_pkt_num        =  ri_pkt_num              ;   
assign          o_pkt_protocol   =  ri_pkt_protocol         ;    
assign          o_pkt_cycle_cnt  =  ri_pkt_cycle_cnt        ;        
assign          o_flow_id        =  ri_flow_id              ;        

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
    else if(ri_pkt_cycle_cnt == 'd1 && ri_pkt_data[31:0] == 32'h2d485353 && ri_pkt_protocol == 8'h06)
        ro_flow_type <= 3'b100;
    else if(ri_pkt_num == 'd4 && ri_pkt_cycle_cnt == 'd32)
        ro_flow_type <= 3'b000;
    else
        ro_flow_type <= ro_flow_type;
end

endmodule
