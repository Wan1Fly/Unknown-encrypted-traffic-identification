`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/31 15:49:14
// Design Name: 
// Module Name: flow_arbitrate
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


module flow_arbitrate(

input                                   i_clk                     ,
input                                   i_rst                     ,

input               [15:0]              i_pkt_entropy             ,
input                                   i_pkt_entropy_valid       ,
input               [15:0]              i_flow_num                ,  
output                                  o_calc_complete           ,
output              [63:0]              o_flow_arbitrate_result              

);

reg                 [2:0]               r_pkt_num_cnt             ;
reg                 [15:0]              r_flow_num_cnt            ;
reg                 [15:0]              ri_pkt_entropy            ;    
reg                                     ri_pkt_entropy_valid      ;    
reg                 [15:0]              ri_flow_num               ; 
reg                 [2:0]               r_flow_arbitrate          ;  
reg                 [63:0]              r_dina                    ;
reg                                     r_ena                     ;
reg                                     r_wea                     ;
reg                                     ro_calc_complete_flag     ;
reg                 [5:0]               r_addr_mux_cnt            ;
reg                 [1:0]               r_addra                   ;
reg                 [2:0]               r_rd_cycle_cnt            ;   

assign              o_calc_complete  =  ro_calc_complete_flag     ;

always @(posedge i_clk) begin
      ri_pkt_entropy       <= i_pkt_entropy       ; 
      ri_pkt_entropy_valid <= i_pkt_entropy_valid ;
      ri_flow_num          <= i_flow_num          ;
end

always @(posedge i_clk) begin
      if(i_rst)
            r_pkt_num_cnt <= 'd0;
      else if(ri_pkt_entropy_valid)
            r_pkt_num_cnt <= r_pkt_num_cnt + 'd1;
      else if(r_pkt_num_cnt == 'd5)
            r_pkt_num_cnt <= 'd0;
      else
            r_pkt_num_cnt <= r_pkt_num_cnt;
end

always @(posedge i_clk) begin
      if(i_rst)
            r_flow_num_cnt <= 'd0;
      else if(r_pkt_num_cnt == 'd5)
            r_flow_num_cnt <= r_flow_num_cnt + 'd1;
      else
            r_flow_num_cnt <= r_flow_num_cnt;
end

always @(posedge i_clk) begin
      if(i_rst)
            r_flow_arbitrate <= 'd0;
      else if(r_pkt_num_cnt == 'd5)
            r_flow_arbitrate <= 'd0;
      else if(ri_pkt_entropy_valid && ri_pkt_entropy[15:12] == 'd7)
            r_flow_arbitrate <= r_flow_arbitrate + 'd1;
      else
            r_flow_arbitrate <= r_flow_arbitrate;
end

always @(posedge i_clk) begin
      if(i_rst)
            r_dina <= 'd0;
      else if(r_pkt_num_cnt == 'd5 && r_flow_arbitrate > 'd3)
            r_dina[r_addr_mux_cnt] <= 1'b1;
      else if(r_pkt_num_cnt == 'd5 && r_flow_arbitrate <= 'd3)
            r_dina[r_addr_mux_cnt] <= 1'b0;
      else if(r_addr_mux_cnt == 'd63 && r_ena)
            r_dina <= 'd0;
      else
            r_dina <= r_dina;
end

always @(posedge i_clk) begin
      if(i_rst)
            r_ena <= 'd0;
      else if(r_pkt_num_cnt == 'd5 | (r_flow_num_cnt == ri_flow_num + 'd1 && r_wea) | (r_rd_cycle_cnt > 'd0 && r_rd_cycle_cnt < 'd4))
            r_ena <= 'd1;
      else
            r_ena <= 'd0;
end

always @(posedge i_clk) begin
      if(i_rst)
            r_wea <= 'd0;
      else if(r_pkt_num_cnt == 'd5 && r_flow_num_cnt <= 'd255)
            r_wea <= 'd1;
      else
            r_wea <= 'd0;
end

always @(posedge i_clk) begin
      if(i_rst)
            ro_calc_complete_flag <= 'd0;
      else if(r_ena && !r_wea)
            ro_calc_complete_flag <= 'd1;
      else
            ro_calc_complete_flag <= 'd0;
end

always @(posedge i_clk) begin
      if(i_rst)
            r_addr_mux_cnt <= 'd0;
      else if(r_ena && r_wea)
            r_addr_mux_cnt <= r_addr_mux_cnt + 'd1;
      else
            r_addr_mux_cnt <= r_addr_mux_cnt;
end

always @(posedge i_clk) begin
      if(i_rst)
            r_addra <= 'd0;
      else if((r_addr_mux_cnt == 'd63 && r_ena) | r_rd_cycle_cnt > 'd0)
            r_addra <= r_addra + 'd1;
      else
            r_addra <= r_addra;
end

always @(posedge i_clk) begin
      if((r_addra == 'd3 && r_ena && r_addr_mux_cnt == 'd63) | r_rd_cycle_cnt > 'd0 && r_rd_cycle_cnt < 'd4)
            r_rd_cycle_cnt <= r_rd_cycle_cnt + 'd1;
      else
            r_rd_cycle_cnt <= 'd0;
end

s1p_flow_arbitrate_result_ram s1p_flow_arbitrate_result_ram_U0 (
      .clka                   (i_clk                  ),     // input wire clka
      .ena                    (r_ena                  ),     // input wire ena
      .wea                    (r_wea                  ),     // input wire [0 : 0] wea
      .addra                  (r_addra                ),     // input wire [1 : 0] addra
      .dina                   (r_dina                 ),     // input wire [63 : 0] dina
      .douta                  (o_flow_arbitrate_result)      // output wire [63 : 0] douta
);

endmodule
