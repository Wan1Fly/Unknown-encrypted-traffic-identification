`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/23 13:47:58
// Design Name: 
// Module Name: pre_fixed_parse
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


module pre_fixed_parse(

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
output          [63:0]              o_parse_data            ,
output          [7:0]               o_pkt_len               ,
output          [7:0]               o_flow_id               ,
output                              o_entropy_calc_valid    ,
output                              o_pattern_match_valid   ,
output                              o_flow_type_id_valid       

);  

wire            [2:0]               w_flow_type_0           ;
wire            [2:0]               w_flow_type_1           ;
wire            [2:0]               w_flow_type             ;
wire                                w_pkt_data_valid        ;
wire                                w_wr_en                 ;
wire            [63:0]              w_pkt_data              ;
wire            [2:0]               w_pkt_num               ;
wire            [5:0]               w_pkt_cycle_cnt         ;        
wire            [7:0]               w_flow_id               ;
wire            [63:0]              w_dout                  ;
wire            [7:0]               w_pkt_len               ;
wire            [7:0]               w_len_dout              ;    

reg                                 r_rd_en                 ;
reg             [2:0]               r_flow_type             ;
reg             [5:0]               r_pkt_cycle_cnt         ;
reg             [2:0]               r_pkt_num               ;
reg             [7:0]               r_flow_id               ; 
reg                                 r_len_wr_en             ;
reg                                 r_len_rd_en             ;
reg             [7:0]               r_pkt_len               ;
reg             [63:0]              ro_parse_data           ;
reg             [2:0]               ro_flow_type            ;
reg             [7:0]               ro_flow_id              ;
reg                                 r_data_out_valid        ;
reg             [5:0]               r_pkt_cycle_cnt_1d      ;
reg             [2:0]               r_pkt_num_1d            ;                     
reg                                 ro_entropy_calc_valid   ;
reg                                 ro_pattern_match_valid  ;
reg             [2:0]               r_which_pkt             ; 
reg             [2:0]               r_which_pkt_syn         ; 
reg             [2:0]               r_wflow_type_1d         ;
reg             [2:0]               r_which_pkt_syn_1d      ; 
reg                                 ro_flow_type_id_valid   ;  

assign          w_flow_type             =   w_flow_type_0 | w_flow_type_1       ;
assign          w_wr_en                 =   w_pkt_data_valid | i_pkt_data_valid ;
assign          o_flow_type             =   ro_flow_type                        ;
assign          o_parse_data            =   ro_parse_data                       ;
assign          o_pkt_len               =   r_pkt_len                           ;
assign          o_flow_id               =   ro_flow_id                          ;
assign          o_entropy_calc_valid    =   ro_entropy_calc_valid               ;
assign          o_pattern_match_valid   =   ro_pattern_match_valid              ;
assign          o_flow_type_id_valid    =   ro_flow_type_id_valid               ;

always @(posedge i_clk) begin
    ro_parse_data       <=  w_dout          ;
    ro_flow_type        <=  r_flow_type     ;
    ro_flow_id          <=  r_flow_id       ;  
    r_pkt_cycle_cnt_1d  <=  r_pkt_cycle_cnt ;
    r_pkt_num_1d        <=  r_pkt_num       ; 
    r_data_out_valid    <=  r_rd_en         ; 
    r_wflow_type_1d     <=  w_flow_type     ; 
    r_which_pkt_syn_1d  <=  r_which_pkt_syn ;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_rd_en <= 'd0;
    else if(w_pkt_cycle_cnt == 'd32 && w_pkt_num == 'd4 && w_flow_id == 'd0)
        r_rd_en <= 'd1;
    else if(r_pkt_cycle_cnt == 'd32 && r_pkt_num == 'd4 && r_flow_id == 'd255)
        r_rd_en <= 'd0;
    else
        r_rd_en <= r_rd_en;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_flow_type <= 'd0;
    else if(w_pkt_num == 'd4 && w_pkt_cycle_cnt == 'd32)
        r_flow_type <= w_flow_type;
    else
        r_flow_type <= r_flow_type;
end

always @( posedge i_clk) begin
    if(r_pkt_cycle_cnt == 'd32)
        r_pkt_cycle_cnt <= 'd0;
    else if(r_rd_en)
        r_pkt_cycle_cnt <= r_pkt_cycle_cnt + 'd1;
    else
        r_pkt_cycle_cnt <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_pkt_num <= 'd0;
    else if(r_pkt_cycle_cnt == 'd32 && r_pkt_num == 'd4)
        r_pkt_num <= 'd0;
    else if(r_pkt_cycle_cnt == 'd32)
        r_pkt_num <= r_pkt_num + 'd1;
    else
        r_pkt_num <= r_pkt_num;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_flow_id <= 'd0;
    else if(r_pkt_num == 'd4 && r_pkt_cycle_cnt == 'd32 && r_flow_id == 'd255)
        r_flow_id <= 'd0;
    else if(r_pkt_num == 'd4 && r_pkt_cycle_cnt == 'd32)
        r_flow_id <= r_flow_id + 'd1;
    else
        r_flow_id <= r_flow_id;
end

always @(posedge i_clk) begin
    if(w_pkt_cycle_cnt == 'd32)
        r_len_wr_en <= 'd1;
    else
        r_len_wr_en <= 'd0;
end

always @(posedge i_clk) begin
    if(r_pkt_cycle_cnt == 'd0 && r_rd_en)
        r_len_rd_en <= 'd1;
    else
        r_len_rd_en <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_pkt_len <= 'd0;
    else if(r_len_rd_en)
        r_pkt_len <= w_len_dout;
    else
        r_pkt_len <= r_pkt_len;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_entropy_calc_valid <= 'd0;
    else if(ro_flow_type == 3'b000 && r_data_out_valid && r_pkt_cycle_cnt_1d == 'd0)
        ro_entropy_calc_valid <= 'd1;
    else if(ro_flow_type == 3'b000 && r_data_out_valid && r_pkt_cycle_cnt_1d == 'd32)
        ro_entropy_calc_valid <= 'd0;
    else
        ro_entropy_calc_valid <= ro_entropy_calc_valid;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_which_pkt <= 'd0;
    else if(w_flow_type == 3'b001 && r_wflow_type_1d == 3'b000)
        r_which_pkt <= w_pkt_num;
    else if(w_pkt_cycle_cnt == 'd32 && w_pkt_num == 'd4)
        r_which_pkt <= 'd0;
    else
        r_which_pkt <= r_which_pkt;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_which_pkt_syn <= 'd0;
    else if(w_pkt_num == 'd4 && w_pkt_cycle_cnt == 'd32)
        r_which_pkt_syn <= r_which_pkt;
    else
        r_which_pkt_syn <= r_which_pkt_syn;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_pattern_match_valid <= 'd0;
    else if(ro_flow_type == 3'b001 && r_which_pkt_syn_1d == r_pkt_num_1d && r_pkt_cycle_cnt_1d == 'd0)
        ro_pattern_match_valid <= 'd1;
    else if(ro_flow_type == 3'b001 && r_which_pkt_syn_1d == r_pkt_num_1d && r_pkt_cycle_cnt_1d == 'd32)
        ro_pattern_match_valid <= 'd0;
    else
        ro_pattern_match_valid <= ro_pattern_match_valid;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_flow_type_id_valid <= 'd0;
    else if(r_pkt_cycle_cnt == 'd1 && r_pkt_num == 'd0)
        ro_flow_type_id_valid <= 'd1;
    else if(r_pkt_cycle_cnt_1d == 'd32 && r_pkt_num_1d == 'd4)
        ro_flow_type_id_valid <= 'd0;
    else
        ro_flow_type_id_valid <= ro_flow_type_id_valid;
end

parse_out_fifo parse_out_fifo_U0 (
    .clk                            (i_clk                 ),                // input wire clk
    .srst                           (i_rst                 ),                // input wire srst
    .din                            (w_pkt_data            ),                // input wire [63 : 0] din
    .wr_en                          (w_wr_en               ),                // input wire wr_en
    .rd_en                          (r_rd_en               ),                // input wire rd_en
    .dout                           (w_dout                ),                // output wire [63 : 0] dout
    .full                           (                      ),                // output wire full
    .empty                          (                      ),                // output wire empty
    .wr_rst_busy                    (                      ),                // output wire wr_rst_busy
    .rd_rst_busy                    (                      )                 // output wire rd_rst_busy
);

pkt_len_fifo pkt_len_fifo_U0 (
    .clk                            (i_clk                 ),                // input wire clk
    .srst                           (i_rst                 ),                // input wire srst
    .din                            (w_pkt_len             ),                // input wire [7 : 0] din
    .wr_en                          (r_len_wr_en           ),                // input wire wr_en
    .rd_en                          (r_len_rd_en           ),                // input wire rd_en
    .dout                           (w_len_dout            ),                // output wire [7 : 0] dout
    .full                           (                      ),                // output wire full
    .empty                          (                      ),                // output wire empty
    .wr_rst_busy                    (                      ),                // output wire wr_rst_busy
    .rd_rst_busy                    (                      )                 // output wire rd_rst_busy
);

tls_parse tls_parse_U0(

    .i_clk                          (i_clk                 ),
    .i_rst                          (i_rst                 ),
    .i_pkt_data_valid               (i_pkt_data_valid      ),
    .i_pkt_data                     (i_pkt_data            ),
    .i_pkt_len                      (i_pkt_len             ),
    .i_pkt_num                      (i_pkt_num             ),
    .i_pkt_protocol                 (i_pkt_protocol        ),
    .i_pkt_cycle_cnt                (i_pkt_cycle_cnt       ),
    .i_flow_id                      (i_flow_id             ),                             
    .o_flow_type                    (w_flow_type_0         )

);

ssh_parse ssh_parse_U0(

    .i_clk                          (i_clk                 ),
    .i_rst                          (i_rst                 ),
    .i_pkt_data_valid               (i_pkt_data_valid      ),
    .i_pkt_data                     (i_pkt_data            ),
    .i_pkt_len                      (i_pkt_len             ),
    .i_pkt_num                      (i_pkt_num             ),
    .i_pkt_protocol                 (i_pkt_protocol        ),
    .i_pkt_cycle_cnt                (i_pkt_cycle_cnt       ),
    .i_flow_id                      (i_flow_id             ),
    .o_flow_type                    (w_flow_type_1         ),                             
    .o_pkt_data_valid               (w_pkt_data_valid      ),
    .o_pkt_data                     (w_pkt_data            ),
    .o_pkt_len                      (w_pkt_len             ),
    .o_pkt_num                      (w_pkt_num             ),
/*     .o_pkt_protocol                 (o_pkt_protocol        ), */
    .o_pkt_cycle_cnt                (w_pkt_cycle_cnt       ),
    .o_flow_id                      (w_flow_id             )            
);




endmodule
