`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/17 15:49:39
// Design Name: 
// Module Name: data_move_engine
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


module data_move_engine #(
    parameter DATA_WIDTH = 64,
    parameter DATA_DEPTH = 65536
)(

input                                   i_clk                   ,
input                                   i_rst                   ,

/* ------------------------bram读取端口------------------------------------ */
input       [DATA_WIDTH-1:0]            i_bram_portb_dout       ,
output      [$clog2(DATA_DEPTH)-1:0]    o_bram_portb_addr       ,
output      [DATA_WIDTH-1:0]            o_bram_portb_din        ,
output                                  o_bram_portb_en         ,
output      [DATA_WIDTH/8-1:0]          o_bram_portb_we         ,

output      [DATA_WIDTH-1:0]            o_count_data            ,
output                                  o_count_data_valid      ,
output      [7:0]                       o_count_data_len        ,
output      [15:0]                      o_flow_num              ,

input                                   i_calc_complete         ,
input       [63:0]                      i_flow_arbitrate_result ,
output                                  o_success_led

);

reg         [15:0]                      ro_bram_portb_addr      ; 
reg         [DATA_WIDTH-1:0]            ro_bram_portb_din       ;
reg                                     ro_bram_portb_en        ;
reg         [DATA_WIDTH/8-1:0]          ro_bram_portb_we        ;
reg         [DATA_WIDTH-1:0]            ri_bram_portb_dout      ;
reg                                     ri_calc_complete        ;

reg                                     ro_count_data_valid     ;
reg                                     ro_count_data_valid_1d  ;
reg         [7:0]                       ro_count_data_len       ;
reg         [15:0]                      r_flow_num              ;

reg         [3:0]                       r_addr_cnt              ;
reg         [15:0]                      r_pkt_cnt               ;
reg         [3:0]                       r_pkt_cycle_cnt         ;
reg                                     r_success_led           ;


assign      o_bram_portb_addr     = ro_bram_portb_addr          ;
assign      o_bram_portb_din      = ro_bram_portb_din           ; 
assign      o_bram_portb_en       = ro_bram_portb_en            ; 
assign      o_bram_portb_we       = ro_bram_portb_we            ; 

assign      o_count_data_valid    = ro_count_data_valid         ;
assign      o_count_data_len      = ro_count_data_len           ;
assign      o_count_data          = ri_bram_portb_dout          ;
assign      o_flow_num            = r_flow_num                  ;
assign      o_success_led         = r_success_led               ;

/* ------------------------输入打一拍进入寄存器---------------------------- */
always @(posedge i_clk) begin
    if(i_rst)
        ri_bram_portb_dout <= 'd0;
    else
        ri_bram_portb_dout <= i_bram_portb_dout;
end

always @(posedge i_clk) begin
    if(i_rst)
        ri_calc_complete <= 'd0;
    else
        ri_calc_complete <= i_calc_complete;
end

/* -------------------------machine---------------------------------------- */
reg [3:0] current_state;
reg [3:0] next_state;

localparam IDLE         = 4'b0000;
localparam WAITSTART    = 4'b0001;
localparam SENDBYTES    = 4'b0010;
localparam WAITCPLD     = 4'b0100;
localparam BATCHEND     = 4'b1000;

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
                            if(i_bram_portb_dout[7:0] == 8'b0101_0101 && ro_bram_portb_addr == 'd1)
                                next_state = SENDBYTES;
                            else
                                next_state = WAITSTART;
                        end

        SENDBYTES   :   begin
                            if(r_pkt_cycle_cnt == 'd4 && !ro_count_data_valid && ro_count_data_valid_1d && r_pkt_cnt == (r_flow_num + 'd1) * 5)
                                next_state = WAITCPLD;
                            else
                                next_state = SENDBYTES;
                        end

        WAITCPLD    :   begin
                            if(ri_calc_complete)
                                next_state = BATCHEND;
                            else
                                next_state = WAITCPLD;
                        end

        BATCHEND    :   begin
                            if(ri_calc_complete && !i_calc_complete)
                                next_state = WAITSTART;
                            else
                                next_state = BATCHEND;
                        end

        default     :   next_state = IDLE;
    endcase
end
/* -------------------------machine---------------------------------------- */
always @(posedge i_clk) begin
    if(i_rst)
        ro_bram_portb_we <= 'd0;
    else if(r_addr_cnt == 'd5 && r_pkt_cycle_cnt == 'd4 && r_pkt_cnt == (r_flow_num + 'd1) * 5)
/*         ro_bram_portb_we <= 32'b1111_1111_1111_1111_1111_1111_1111_1111; */
        ro_bram_portb_we <= 'd0;
    else if(i_calc_complete)
        ro_bram_portb_we <= 32'b1111_1111_1111_1111_1111_1111_1111_1111;
    else
        ro_bram_portb_we <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_bram_portb_din <= 'd0;
    else if(i_calc_complete)
        ro_bram_portb_din <= i_flow_arbitrate_result;
    else
        ro_bram_portb_din <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_bram_portb_en <= 'd0;
    else if(i_calc_complete)
        ro_bram_portb_en <= 'd1;
    else if(r_pkt_cnt == (r_flow_num + 'd1) * 5 && r_addr_cnt >= 'd6 && r_pkt_cycle_cnt == 'd4)
        ro_bram_portb_en <= 'd0;
    else if(current_state == WAITCPLD && !i_calc_complete)
        ro_bram_portb_en <= 'd0;
    else
        ro_bram_portb_en <= 'd1;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_bram_portb_addr <= 'd0;
    else if(((current_state == WAITSTART | current_state == IDLE) && ri_bram_portb_dout[7:0] == 8'b00000000) | (current_state == WAITCPLD && !i_calc_complete) | current_state == BATCHEND && next_state == WAITSTART)
        ro_bram_portb_addr <= 'd0;
    else if(r_addr_cnt >= 'd5 && r_pkt_cycle_cnt == 'd4 && r_pkt_cnt == (r_flow_num + 'd1) * 5)
        ro_bram_portb_addr <= 'd0;
    else if(i_calc_complete && !ri_calc_complete)
        ro_bram_portb_addr <= 16'hfffc;
    else if(ri_calc_complete)
        ro_bram_portb_addr <= ro_bram_portb_addr + 'd1;
    else if(r_addr_cnt == 'd5 && r_pkt_cycle_cnt < 'd4)
        ro_bram_portb_addr <= ro_bram_portb_addr;
    else
        ro_bram_portb_addr <= ro_bram_portb_addr + 'd1;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_addr_cnt <= 'd0;
    else if(r_addr_cnt == 'd8)
        r_addr_cnt <= 'd0;
    else if(ro_count_data_valid)
        r_addr_cnt <= r_addr_cnt + 'd1;
    else
        r_addr_cnt <= 'd0;
    end

always @(posedge i_clk) begin
    if(i_rst)
        ro_count_data_valid <= 'd0;
    else if(next_state == WAITCPLD)
        ro_count_data_valid <= 'd0;
    else if(current_state == SENDBYTES && r_addr_cnt == 'd0 && ri_bram_portb_dout[7:0] == 8'b01010101 && (ro_bram_portb_addr == 'd2 | ro_bram_portb_addr > 'd2))
        ro_count_data_valid <= 'd1;
    else if(current_state == SENDBYTES && r_addr_cnt == 'd7)
        ro_count_data_valid <= 'd0;
    else if(r_addr_cnt == 'd8)
        ro_count_data_valid <= 'd1;
    else
        ro_count_data_valid <= ro_count_data_valid;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_count_data_valid_1d <= 'd0;
    else 
        ro_count_data_valid_1d <= ro_count_data_valid;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_count_data_len <= 'd0;
    else if(next_state == WAITCPLD)
        ro_count_data_len <= 'd0;
    else if(ro_bram_portb_addr == 'd2 | (!ro_count_data_valid && ro_count_data_valid_1d && r_pkt_cycle_cnt == 'd4))
        ro_count_data_len <= ri_bram_portb_dout[39:32];
    else
        ro_count_data_len <= ro_count_data_len;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_pkt_cycle_cnt <= 'd0;
    else if(!ro_count_data_valid && ro_count_data_valid_1d && r_pkt_cycle_cnt == 'd4)
        r_pkt_cycle_cnt <= 'd0;
    else if(ro_count_data_valid && !ro_count_data_valid_1d)
        r_pkt_cycle_cnt <= r_pkt_cycle_cnt + 'd1;
    else
        r_pkt_cycle_cnt <= r_pkt_cycle_cnt;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_pkt_cnt <= 'd0;
    else if(ro_count_data_valid && !ro_count_data_valid_1d && r_pkt_cycle_cnt == 'd0)
        r_pkt_cnt <= r_pkt_cnt + 'd1;
    else
        r_pkt_cnt <= r_pkt_cnt;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_flow_num <= 'd0;
    else if(ro_bram_portb_addr == 'd2)
        r_flow_num <= ri_bram_portb_dout[23:16];
    else
        r_flow_num <= r_flow_num;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_success_led <= 'd0;
    else if(i_flow_arbitrate_result == 64'hfffffffffffffffe)
        r_success_led <= 'd1;
    else
        r_success_led <= r_success_led;
end

endmodule
