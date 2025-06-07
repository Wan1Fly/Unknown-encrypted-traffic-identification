`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/07 14:43:13
// Design Name: 
// Module Name: bytes_table_screen
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


module bytes_table_screen(

input                               i_clk                      ,
input                               i_rst                      ,
input           [2:0]               i_flow_type                ,  
input           [63:0]              i_parse_data               ,
input           [7:0]               i_flow_id                  ,
input                               i_pattern_match_valid      ,
input                               i_flow_type_id_valid       ,   
output          [63:0]              o_sni_match_data           ,
output                              o_sni_match_data_valid     ,
output          [2:0]               o_sync_flow_type           ,
output          [7:0]               o_sync_flow_id             ,
output                              o_sync_flow_type_id_valid         

);

reg             [2:0]               ri_flow_type               ;  
reg             [2:0]               ri_flow_type_1d            ; 
reg             [2:0]               ri_flow_type_2d            ;
reg             [2:0]               ri_flow_type_3d            ;     
reg             [63:0]              ri_parse_data              ;
reg             [7:0]               ri_flow_id                 ;
reg             [7:0]               ri_flow_id_1d              ;
reg             [7:0]               ri_flow_id_2d              ;
reg             [7:0]               ri_flow_id_3d              ;
reg                                 ri_pattern_match_valid     ;
reg                                 ri_flow_type_id_valid      ;
reg                                 ri_flow_type_id_valid_1d   ;
reg                                 ri_flow_type_id_valid_2d   ;
reg                                 ri_flow_type_id_valid_3d   ;
reg             [63:0]              r_match_data               ;
reg             [63:0]              r_match_data_1d            ;
reg             [63:0]              r_match_data_2d            ;
reg                                 r_match_data_valid         ;
reg                                 r_match_data_valid_1d      ;
reg             [7:0]               r_2nd_byte_value_0         ;
reg             [7:0]               r_2nd_byte_value_1         ;
reg             [7:0]               r_2nd_byte_value_2         ;
reg             [7:0]               r_2nd_byte_value_3         ;
reg             [7:0]               r_2nd_byte_value_4         ;
reg             [7:0]               r_2nd_byte_value_5         ;
reg             [7:0]               r_2nd_byte_value_6         ;
reg             [7:0]               r_2nd_byte_value_7         ;
reg                                 r_pre2bytes_valid          ;
reg                                 r_pre2bytes_valid_1d       ;
reg             [1:0]               r_valid_cycle_cnt          ;
/* reg                                 r_https_pre2bytes_valid    ; 
reg                                 r_ftps_pre2bytes_valid     ;
reg                                 r_smtps_pre2bytes_valid    ; 
reg                                 r_imaps_pre2bytes_valid    ;
reg                                 r_pop3s_pre2bytes_valid    ;
reg                                 r_ldaps_pre2bytes_valid    ;
reg                                 r_xmpps_pre2bytes_valid    ;
reg                                 r_nntps_pre2bytes_valid    ; */

wire            [15:0]              w_2bytes_table_in_0        ;
wire            [15:0]              w_2bytes_table_in_1        ;
wire            [15:0]              w_2bytes_table_in_2        ;
wire            [15:0]              w_2bytes_table_in_3        ;
wire            [15:0]              w_2bytes_table_in_4        ;
wire            [15:0]              w_2bytes_table_in_5        ;
wire            [15:0]              w_2bytes_table_in_6        ;
wire            [15:0]              w_2bytes_table_in_7        ;
wire            [7:0]               w_value_out_0              ;
wire            [7:0]               w_value_out_1              ;
wire            [7:0]               w_value_out_2              ;
wire            [7:0]               w_value_out_3              ;
wire            [7:0]               w_value_out_4              ;
wire            [7:0]               w_value_out_5              ;
wire            [7:0]               w_value_out_6              ;
wire            [7:0]               w_value_out_7              ;
wire                                w_pre2bytes_valid_pos      ;
wire                                w_match_data_valid         ;

assign   w_2bytes_table_in_0    =   r_match_data_valid? r_match_data[63:48] : 'd0                       ;
assign   w_2bytes_table_in_1    =   r_match_data_valid? r_match_data[55:40] : 'd0                       ;
assign   w_2bytes_table_in_2    =   r_match_data_valid? r_match_data[47:32] : 'd0                       ;
assign   w_2bytes_table_in_3    =   r_match_data_valid? r_match_data[39:24] : 'd0                       ;
assign   w_2bytes_table_in_4    =   r_match_data_valid? r_match_data[31:16] : 'd0                       ;
assign   w_2bytes_table_in_5    =   r_match_data_valid? r_match_data[23:8]  : 'd0                       ;
assign   w_2bytes_table_in_6    =   r_match_data_valid? r_match_data[15:0]  : 'd0                       ;
assign   w_2bytes_table_in_7    =   r_match_data_valid? {r_match_data[7:0],ri_parse_data[63:56]} : 'd0  ;
assign   w_rd_en                =   r_match_data_valid                                                  ;
assign   o_sni_match_data       =   r_match_data_2d                                                     ; 
assign   w_pre2bytes_valid_pos  =   r_pre2bytes_valid && !r_pre2bytes_valid_1d                          ;
assign   w_match_data_valid     =   r_valid_cycle_cnt > 'd0                                             ;
assign   o_sni_match_data_valid =   w_pre2bytes_valid_pos | w_match_data_valid                          ;
assign   o_sync_flow_type         = ri_flow_type_3d                                                     ;             
assign   o_sync_flow_id           = ri_flow_id_3d                                                       ;               
assign   o_sync_flow_type_id_valid= ri_flow_type_id_valid_3d                                            ;

always @(posedge i_clk) begin  
    ri_flow_type              <=    i_flow_type                ;
    ri_flow_id                <=    i_flow_id                  ;
    ri_pattern_match_valid    <=    i_pattern_match_valid      ;
    r_match_data_valid        <=    ri_pattern_match_valid     ;
    r_match_data              <=    ri_parse_data              ;
    r_match_data_1d           <=    r_match_data               ;
    r_match_data_2d           <=    r_match_data_1d            ;
    r_pre2bytes_valid_1d      <=    r_pre2bytes_valid          ;
    ri_flow_type_id_valid     <=    i_flow_type_id_valid       ;
    ri_flow_type_1d           <=    ri_flow_type               ; 
    ri_flow_type_2d           <=    ri_flow_type_1d            ; 
    ri_flow_type_3d           <=    ri_flow_type_2d            ;
    ri_flow_id_1d             <=    ri_flow_id                 ;   
    ri_flow_id_2d             <=    ri_flow_id_1d              ;
    ri_flow_id_3d             <=    ri_flow_id_2d              ;
    ri_flow_type_id_valid_1d  <=    ri_flow_type_id_valid      ;
    ri_flow_type_id_valid_2d  <=    ri_flow_type_id_valid_1d   ;
    ri_flow_type_id_valid_3d  <=    ri_flow_type_id_valid_2d   ; 
    r_match_data_valid_1d     <=    r_match_data_valid         ;

end

always @(posedge i_clk) begin
        ri_parse_data <= {i_parse_data[7:0],i_parse_data[15:8],i_parse_data[23:16],i_parse_data[31:24],i_parse_data[39:32],i_parse_data[47:40],i_parse_data[55:48],i_parse_data[63:56]};
end

always @(posedge i_clk) begin
    if(w_rd_en) begin
        r_2nd_byte_value_0 <= w_2bytes_table_in_0[7:0];
        r_2nd_byte_value_1 <= w_2bytes_table_in_1[7:0];
        r_2nd_byte_value_2 <= w_2bytes_table_in_2[7:0];
        r_2nd_byte_value_3 <= w_2bytes_table_in_3[7:0];
        r_2nd_byte_value_4 <= w_2bytes_table_in_4[7:0];
        r_2nd_byte_value_5 <= w_2bytes_table_in_5[7:0];
        r_2nd_byte_value_6 <= w_2bytes_table_in_6[7:0];
        r_2nd_byte_value_7 <= w_2bytes_table_in_7[7:0];
    end else begin
        r_2nd_byte_value_0 <= 'd0;
        r_2nd_byte_value_1 <= 'd0;
        r_2nd_byte_value_2 <= 'd0;
        r_2nd_byte_value_3 <= 'd0;
        r_2nd_byte_value_4 <= 'd0;
        r_2nd_byte_value_5 <= 'd0;
        r_2nd_byte_value_6 <= 'd0;
        r_2nd_byte_value_7 <= 'd0;
    end
end
/* 8'h77
8'h74
8'h61
8'h6D
8'h6F
8'h64
8'h68
8'h65
*/
always @(posedge i_clk) begin
    if(w_value_out_0 == r_2nd_byte_value_0 && w_value_out_0 > 'd0) 
        r_pre2bytes_valid <= 1'b1;
    else if(w_value_out_1 == r_2nd_byte_value_1 && w_value_out_1 > 'd0) 
        r_pre2bytes_valid <= 1'b1;
    else if(w_value_out_2 == r_2nd_byte_value_2 && w_value_out_2 > 'd0)
        r_pre2bytes_valid <= 1'b1;
    else if(w_value_out_3 == r_2nd_byte_value_3 && w_value_out_3 > 'd0)
        r_pre2bytes_valid <= 1'b1;
    else if(w_value_out_4 == r_2nd_byte_value_4 && w_value_out_4 > 'd0)
        r_pre2bytes_valid <= 1'b1;
    else if(w_value_out_5 == r_2nd_byte_value_5 && w_value_out_5 > 'd0)
        r_pre2bytes_valid <= 1'b1;
    else if(w_value_out_6 == r_2nd_byte_value_6 && w_value_out_6 > 'd0)
        r_pre2bytes_valid <= 1'b1;
    else if(w_value_out_7 == r_2nd_byte_value_7 && w_value_out_7 > 'd0)
        r_pre2bytes_valid <= 1'b1;
    else 
        r_pre2bytes_valid <= 1'b0;
end

always @(posedge i_clk) begin
    if(r_valid_cycle_cnt == 'd3 | !ri_flow_type_id_valid_2d)
        r_valid_cycle_cnt <= 'd0;
    else if((w_pre2bytes_valid_pos | r_valid_cycle_cnt > 'd0) && (r_match_data_valid | (r_match_data_valid_1d && !r_match_data_valid)))
        r_valid_cycle_cnt <= r_valid_cycle_cnt + 'd1;
    else
        r_valid_cycle_cnt <= 'd0;
end


bytes_table_rom bytes_table_rom_U0 (
    .clka                       (i_clk                    ),      // input wire clka
    .ena                        (w_rd_en                  ),      // input wire ena
    .addra                      (w_2bytes_table_in_0[15:8]),      // input wire [7 : 0] addra
    .douta                      (w_value_out_0            ),      // output wire [7 : 0] douta
    .clkb                       (i_clk                    ),      // input wire clkb
    .enb                        (w_rd_en                  ),      // input wire enb
    .addrb                      (w_2bytes_table_in_1[15:8]),      // input wire [7 : 0] addrb
    .doutb                      (w_value_out_1            )       // output wire [7 : 0] doutb
);

bytes_table_rom bytes_table_rom_U1 (
    .clka                       (i_clk                    ),      // input wire clka
    .ena                        (w_rd_en                  ),      // input wire ena
    .addra                      (w_2bytes_table_in_2[15:8]),      // input wire [7 : 0] addra
    .douta                      (w_value_out_2            ),      // output wire [7 : 0] douta
    .clkb                       (i_clk                    ),      // input wire clkb
    .enb                        (w_rd_en                  ),      // input wire enb
    .addrb                      (w_2bytes_table_in_3[15:8]),      // input wire [7 : 0] addrb
    .doutb                      (w_value_out_3            )       // output wire [7 : 0] doutb
);

bytes_table_rom bytes_table_rom_U2 (
    .clka                       (i_clk                    ),      // input wire clka
    .ena                        (w_rd_en                  ),      // input wire ena
    .addra                      (w_2bytes_table_in_4[15:8]),      // input wire [7 : 0] addra
    .douta                      (w_value_out_4            ),      // output wire [7 : 0] douta
    .clkb                       (i_clk                    ),      // input wire clkb
    .enb                        (w_rd_en                  ),      // input wire enb
    .addrb                      (w_2bytes_table_in_5[15:8]),      // input wire [7 : 0] addrb
    .doutb                      (w_value_out_5            )       // output wire [7 : 0] doutb
);

bytes_table_rom bytes_table_rom_U3 (
    .clka                       (i_clk                    ),      // input wire clka
    .ena                        (w_rd_en                  ),      // input wire ena
    .addra                      (w_2bytes_table_in_6[15:8]),      // input wire [7 : 0] addra
    .douta                      (w_value_out_6            ),      // output wire [7 : 0] douta
    .clkb                       (i_clk                    ),      // input wire clkb
    .enb                        (w_rd_en                  ),      // input wire enb
    .addrb                      (w_2bytes_table_in_7[15:8]),      // input wire [7 : 0] addrb
    .doutb                      (w_value_out_7            )       // output wire [7 : 0] doutb
);

endmodule
