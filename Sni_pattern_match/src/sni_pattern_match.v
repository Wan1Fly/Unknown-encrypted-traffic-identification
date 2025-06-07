`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/25 15:28:52
// Design Name: 
// Module Name: sni_pattern_match
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


module sni_pattern_match(

input                               i_clk                       ,
input                               i_rst                       ,
input           [2:0]               i_flow_type                 ,  
input           [63:0]              i_parse_data                ,
input           [7:0]               i_flow_id                   ,
input                               i_pattern_match_valid       ,
input                               i_sync_flow_type_id_valid   ,
output          [15:0]              o_flow_id_type              ,
output                              o_flow_id_type_valid                       

);

reg             [2:0]               ri_flow_type                ;  
reg             [7:0]               ri_flow_id                  ;
reg                                 ri_pattern_match_valid      ;
reg                                 r_rd_en                     ;
reg             [4:0]               r_rd_data_cnt               ;
reg             [63:0]              r_match_data                ;
reg                                 r_empty                     ;
reg                                 r_empty_1d                  ;
reg             [15:0]              r_16b_match_data            ;
reg                                 r_match_data_valid          ;
reg                                 ri_sync_flow_type_id_valid  ;
/* reg                                 r_type_wait_flag            ; */
reg             [15:0]              ro_flow_id_type             ;
reg             [15:0]              r_flow_id_type_din          ;
reg                                 r_id_type_fifo_wr_en        ;
reg             [3:0]               r_fifo_wait_rd_cnt          ;
reg                                 r_id_type_fifo_rd_en        ;
reg                                 r_id_type_fifo_rd_en_1d     ;
reg             [15:0]              r_flow_id_type_dout         ;
reg             [7:0]               r_flow_id_out_cnt           ;
reg                                 ro_flow_id_type_valid       ;

wire            [15:0]              w_dout_16b                  ;
wire                                w_empty                     ;
wire                                w_https_matched             ;
wire                                w_ftps_matched              ; 
wire                                w_smtps_matched             ;
wire                                w_imaps_matched             ;
wire                                w_pop3s_matched             ;
wire                                w_ldaps_matched             ;
wire                                w_xmpps_matched             ;
wire                                w_nntps_matched             ;
wire                                w_type_id_valid_neg         ;
wire                                w_type_id_valid_pos         ;
wire            [15:0]              w_flow_id_type_dout         ;
wire            [7:0]               w_matched_protocol_state    ;

assign     w_type_id_valid_neg  =   ri_sync_flow_type_id_valid && !i_sync_flow_type_id_valid;  
assign     w_type_id_valid_pos  =   !ri_sync_flow_type_id_valid && i_sync_flow_type_id_valid;
assign     w_matched_protocol_state = {w_nntps_matched,w_xmpps_matched,w_ldaps_matched,w_pop3s_matched,w_imaps_matched,w_smtps_matched,w_ftps_matched,w_https_matched};
assign     o_flow_id_type       =   ro_flow_id_type;
assign     o_flow_id_type_valid =   ro_flow_id_type_valid;
  
always @(posedge i_clk) begin  
    ri_flow_type              <=    i_flow_type                 ;
    r_match_data              <=    i_parse_data                ;
    ri_flow_id                <=    i_flow_id                   ;
    ri_pattern_match_valid    <=    i_pattern_match_valid       ;
    r_empty                   <=    w_empty                     ;
    r_empty_1d                <=    r_empty                     ;
    r_16b_match_data          <=    w_dout_16b                  ;
    r_match_data_valid        <=    r_rd_en                     ;
    ri_sync_flow_type_id_valid <=   i_sync_flow_type_id_valid   ;
    r_id_type_fifo_wr_en      <=    w_type_id_valid_pos         ;
    r_id_type_fifo_rd_en_1d   <=    r_id_type_fifo_rd_en        ;

end

/* always @(posedge i_clk) begin
    if(i_rst)
        r_type_wait_flag <= 'd0;
    else if(i_pattern_match_valid && !ri_pattern_match_valid)
        r_type_wait_flag <= 'd1;
    else if(w_type_id_valid_neg)
        r_type_wait_flag <= 'd0;
    else
        r_type_wait_flag <= r_type_wait_flag;
end */

always @(posedge i_clk) begin
    if(w_type_id_valid_pos)
        r_flow_id_type_din <= {ri_flow_id,ri_flow_type,5'b00000};
    else
        r_flow_id_type_din <= 'd0;
end

always @(posedge i_clk) begin
    if(r_fifo_wait_rd_cnt == 'd12)
        r_fifo_wait_rd_cnt <= 'd0;
    else if(r_id_type_fifo_wr_en | r_fifo_wait_rd_cnt > 'd0)
        r_fifo_wait_rd_cnt  <= r_fifo_wait_rd_cnt + 'd1;
    else
        r_fifo_wait_rd_cnt <= 'd0;
end

always @(posedge i_clk) begin
    if(r_fifo_wait_rd_cnt == 'd12)
        r_id_type_fifo_rd_en <= 'd1;
    else
        r_id_type_fifo_rd_en <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_flow_id_type_dout <= 'd0;
    else if(r_id_type_fifo_rd_en)
        r_flow_id_type_dout <= w_flow_id_type_dout;
    else
        r_flow_id_type_dout <= r_flow_id_type_dout;
end

always @(posedge i_clk) begin
    if(i_rst) begin
        ro_flow_id_type <= 'd0;
    end else if(r_id_type_fifo_rd_en_1d) begin
        ro_flow_id_type <= r_flow_id_type_dout;
    end else if(w_matched_protocol_state > 'd0) begin
        case (w_matched_protocol_state)
            8'b0000_0001    :    ro_flow_id_type[4:0] <= 'd1;
            8'b0000_0010    :    ro_flow_id_type[4:0] <= 'd2;
            8'b0000_0100    :    ro_flow_id_type[4:0] <= 'd3;
            8'b0000_1000    :    ro_flow_id_type[4:0] <= 'd4;
            8'b0001_0000    :    ro_flow_id_type[4:0] <= 'd5;
            8'b0010_0000    :    ro_flow_id_type[4:0] <= 'd6;
            8'b0100_0000    :    ro_flow_id_type[4:0] <= 'd7;
            8'b1000_0000    :    ro_flow_id_type[4:0] <= 'd8;
            default         :    ro_flow_id_type[4:0] <= 'd0;
        endcase
    end else
        ro_flow_id_type <= ro_flow_id_type;
end

always @(posedge i_clk) begin
    if(r_flow_id_out_cnt == 'd164)
        r_flow_id_out_cnt <= 'd0;
    else if(r_id_type_fifo_rd_en_1d | r_flow_id_out_cnt > 'd0)
        r_flow_id_out_cnt <= r_flow_id_out_cnt + 'd1;
    else
        r_flow_id_out_cnt <= 'd0;
end

always @(posedge i_clk) begin
    if(r_flow_id_out_cnt == 'd164)
        ro_flow_id_type_valid <= 'd1;
    else
        ro_flow_id_type_valid <= 'd0;
end

/* ------------------------------------------machine------------------------------------------------- */
reg             [2:0]               current_state               ;
reg             [2:0]               next_state                  ;

localparam      IDLE        =       3'b000                      ;
localparam      WAITSTART   =       3'b001                      ;
localparam      READ        =       3'b010                      ;
localparam      WAITNEXT    =       3'b100                      ;

always @(posedge i_clk) begin
    if(i_rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

always @(*) begin
    case (current_state)
        IDLE        :   next_state = WAITSTART;

        WAITSTART   :   begin
                            if(!r_empty && r_empty_1d)
                                next_state = READ;
                            else
                                next_state = WAITSTART;
                        end  

        READ        :   begin
                            if(r_rd_data_cnt == 'd16)
                                next_state = WAITNEXT;
                            else
                                next_state = READ;
                        end

        WAITNEXT    :   begin
                            if(!r_empty)
                                next_state = READ;
                            else
                                next_state = WAITNEXT;
                        end   
        default     :   next_state = IDLE;
    endcase
end

always @(posedge i_clk) begin
    if(r_rd_data_cnt == 'd15)
        r_rd_en <= 'd0;
    else if(next_state == READ)
        r_rd_en <= 'd1;
    else
        r_rd_en <= 'd0;
end

always @(posedge i_clk) begin
    if(r_rd_en)
        r_rd_data_cnt <= r_rd_data_cnt + 'd1;
    else
        r_rd_data_cnt <= 'd0;
end

string_d64to16_fifo string_d64to16_fifo_U0 (
    .clk                            (i_clk                      ),                  // input wire clk
    .srst                           (i_rst                      ),                  // input wire srst
    .din                            (r_match_data               ),                  // input wire [63 : 0] din
    .wr_en                          (ri_pattern_match_valid     ),                  // input wire wr_en
    .rd_en                          (r_rd_en                    ),                  // input wire rd_en
    .dout                           (w_dout_16b                 ),                  // output wire [15 : 0] dout
    .full                           (                           ),                  // output wire full
    .empty                          (w_empty                    ),                  // output wire empty
    .wr_rst_busy                    (                           ),                  // output wire wr_rst_busy
    .rd_rst_busy                    (                           )                   // output wire rd_rst_busy
);

https_2bytes_percycle https_2bytes_percycle_U0(

    .i_clk                          (i_clk                      ),
    .i_rst                          (i_rst                      ),
    .i_match_data_valid             (r_match_data_valid         ),
    .i_match_data                   (r_16b_match_data           ),
    .o_https_matched                (w_https_matched            )   

);

ftps_2bytes_percycle ftps_2bytes_percycle_U0(

    .i_clk                          (i_clk                      ),
    .i_rst                          (i_rst                      ),
    .i_match_data_valid             (r_match_data_valid         ),
    .i_match_data                   (r_16b_match_data           ),
    .o_ftps_matched                 (w_ftps_matched             )  

);

smtps_2bytes_percycle smtps_2bytes_percycle_U0(

    .i_clk                          (i_clk                      ),
    .i_rst                          (i_rst                      ),
    .i_match_data_valid             (r_match_data_valid         ),
    .i_match_data                   (r_16b_match_data           ),
    .o_smtps_matched                (w_smtps_matched            )   

);

imaps_2bytes_percycle imaps_2bytes_percycle_U0(

    .i_clk                          (i_clk                      ),
    .i_rst                          (i_rst                      ),
    .i_match_data_valid             (r_match_data_valid         ),
    .i_match_data                   (r_16b_match_data           ),
    .o_imaps_matched                (w_imaps_matched            )   

);

pop3s_2bytes_percycle pop3s_2bytes_percycle_U0(

    .i_clk                          (i_clk                      ),
    .i_rst                          (i_rst                      ),
    .i_match_data_valid             (r_match_data_valid         ),
    .i_match_data                   (r_16b_match_data           ),
    .o_pop3s_matched                (w_pop3s_matched            )   

);

ldaps_2bytes_percycle ldaps_2bytes_percycle_U0(

    .i_clk                          (i_clk                      ),
    .i_rst                          (i_rst                      ),
    .i_match_data_valid             (r_match_data_valid         ),
    .i_match_data                   (r_16b_match_data           ),
    .o_ldaps_matched                (w_ldaps_matched            )   

);

xmpps_2bytes_percycle xmpps_2bytes_percycle_U0(

    .i_clk                          (i_clk                      ),
    .i_rst                          (i_rst                      ),
    .i_match_data_valid             (r_match_data_valid         ),
    .i_match_data                   (r_16b_match_data           ),
    .o_xmpps_matched                (w_xmpps_matched            )   

);

nntps_2bytes_percycle nntps_2bytes_percycle_U0(

    .i_clk                          (i_clk                      ),
    .i_rst                          (i_rst                      ),
    .i_match_data_valid             (r_match_data_valid         ),
    .i_match_data                   (r_16b_match_data           ),
    .o_nntps_matched                (w_nntps_matched            )   

);

flow_type_id_fifo flow_type_id_fifo_U0 (
    .clk                            (i_clk                      ),                  // input wire clk
    .srst                           (i_rst                      ),                  // input wire srst
    .din                            (r_flow_id_type_din         ),                  // input wire [15 : 0] din
    .wr_en                          (r_id_type_fifo_wr_en       ),                  // input wire wr_en
    .rd_en                          (r_id_type_fifo_rd_en       ),                  // input wire rd_en
    .dout                           (w_flow_id_type_dout        ),                  // output wire [15 : 0] dout
    .full                           (                           ),                  // output wire full
    .empty                          (                           ),                  // output wire empty
    .wr_rst_busy                    (                           ),                  // output wire wr_rst_busy
    .rd_rst_busy                    (                           )                   // output wire rd_rst_busy
);

endmodule
