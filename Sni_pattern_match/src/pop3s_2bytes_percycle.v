`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/14 14:53:21
// Design Name: 
// Module Name: pop3s_2bytes_percycle
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


module pop3s_2bytes_percycle(

input                               i_clk                   ,
input                               i_rst                   ,
input                               i_match_data_valid      ,
input           [15:0]              i_match_data            ,
output                              o_pop3s_matched            

);

wire            [7:0]               w_douta                 ;
wire            [7:0]               w_doutb                 ;
wire            [7:0]               w_m2                    ;
wire            [7:0]               w_m1                    ;
wire                                w_wildcard_flag         ;
wire                                w_wildcard_end_flag     ;
wire                                w_douta_start_flag      ;
wire                                w_doutb_start_flag      ;

reg             [7:0]               r_st_state              ;
reg                                 ri_match_data_valid     ;
reg                                 r_st_state_flag         ;
reg             [7:0]               r_douta                 ;
reg             [7:0]               r_doutb                 ;
reg                                 r_mask_valid            ;
reg                                 r_pop3s_matched         ;
reg             [1:0]               current_state           ;
reg             [1:0]               next_state              ;
reg                                 r_wildcard_end_flag     ;

localparam      IDLE        =       2'b00                   ;
localparam      MATCH       =       2'b01                   ;
localparam      WILDCARD    =       2'b10                   ;

assign          w_m1                =   w_douta_start_flag? r_douta : (r_st_state << 1) | r_douta                   ;
assign          w_m2                =   w_doutb_start_flag? r_doutb : (w_m1 << 1) | r_doutb                         ;
assign          w_wildcard_flag     =   ((w_m1[4] == 1'b0) | (w_m2[4] == 1'b0)) && !r_wildcard_end_flag             ;
assign          w_wildcard_end_flag =   ((w_douta[4] == 1'b0) | (w_doutb[4] == 1'b0)) && current_state == WILDCARD  ;
assign          o_pop3s_matched     =   r_pop3s_matched                                                             ;
assign          w_douta_start_flag  =   r_wildcard_end_flag && r_st_state == r_douta                                ;
assign          w_doutb_start_flag  =   r_wildcard_end_flag && r_st_state == r_doutb                                ;

always @(posedge i_clk) begin
    ri_match_data_valid <= i_match_data_valid ;
    r_douta             <= w_douta            ;
    r_doutb             <= w_doutb            ;
    r_mask_valid        <= ri_match_data_valid;
    r_wildcard_end_flag <= w_wildcard_end_flag; 
end

always @(posedge i_clk) begin
    if(i_rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

always @(*) begin
    case (current_state)

        IDLE        :   next_state = MATCH;

        MATCH       :   begin
                            if(w_wildcard_flag)
                                next_state = WILDCARD;
                            else
                                next_state = MATCH;
                        end 

        WILDCARD    :   begin
                            if(w_wildcard_end_flag)
                                next_state = MATCH;
                            else
                                next_state = WILDCARD;
                        end

        default     :   next_state = IDLE;

    endcase
end

always @(posedge i_clk) begin
    if(i_rst)
        r_st_state <= 8'b1111_1111;
    else if(current_state == WILDCARD | next_state == WILDCARD)
        r_st_state <= 8'b1110_1111;
    else if(r_mask_valid)
        r_st_state <= w_m2;
    else
        r_st_state <= r_st_state;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_st_state_flag <= 'd0;
    else if(ri_match_data_valid)
        r_st_state_flag <= ~r_st_state_flag;
    else
        r_st_state_flag <= 'd0;
end

always @(posedge i_clk) begin
    if(w_m1[7] == 1'b0 | w_m2[7] == 1'b0)
        r_pop3s_matched <= 'd1;
    else
        r_pop3s_matched <= 'd0;
end

pop3s_mask_table pop3s_mask_table_U0 (
    .clka                           (i_clk                  ),         // input wire clka
    .ena                            (i_match_data_valid     ),         // input wire ena
    .addra                          (i_match_data[15:8]     ),         // input wire [7 : 0] addra
    .douta                          (w_douta                ),         // output wire [7 : 0] douta
    .clkb                           (i_clk                  ),         // input wire clkb
    .enb                            (i_match_data_valid     ),         // input wire enb
    .addrb                          (i_match_data[7:0]      ),         // input wire [7 : 0] addrb
    .doutb                          (w_doutb                )          // output wire [7 : 0] doutb
);

endmodule
