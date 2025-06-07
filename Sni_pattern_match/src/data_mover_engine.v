`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 14:13:03
// Design Name: 
// Module Name: data_mover_engine
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


module data_mover_engine(

input                               i_clk                   ,
input                               i_rst                   ,
output                              o_bram_portb_en         ,
output          [7:0]               o_bram_portb_we         ,
output          [15:0]              o_bram_portb_addr       ,
output          [63:0]              o_bram_portb_din        ,
input           [63:0]              i_bram_portb_dout       ,
output                              o_pkt_data_valid        ,
output          [63:0]              o_pkt_data              ,
output          [7:0]               o_pkt_len               ,
output          [2:0]               o_pkt_num               ,
output          [7:0]               o_pkt_protocol          ,
output          [5:0]               o_pkt_cycle_cnt         ,
output          [7:0]               o_flow_id                                            

);

reg                                 ro_bram_portb_en        ; 
reg             [7:0]               ro_bram_portb_we        ; 
reg             [15:0]              ro_bram_portb_addr      ; 
reg             [63:0]              ro_bram_portb_din       ; 
reg             [63:0]              ri_bram_portb_dout      ; 
reg             [5:0]               r_pkt_cycle_cnt         ;
reg             [2:0]               r_pkt_cnt               ;
reg             [7:0]               ro_pkt_len              ; 
reg             [7:0]               ro_pkt_protocol         ;
reg             [7:0]               ro_flow_id              ;       

wire                                w_trans_start_flag      ;  


assign          o_bram_portb_en   = ro_bram_portb_en        ;
assign          o_bram_portb_we   = ro_bram_portb_we        ;
assign          o_bram_portb_addr = ro_bram_portb_addr      ;
assign          o_bram_portb_din  = ro_bram_portb_din       ;
assign          o_pkt_data        = ri_bram_portb_dout      ;
assign          o_pkt_len         = ro_pkt_len              ;
assign          o_pkt_protocol    = ro_pkt_protocol         ;
assign          o_flow_id         = ro_flow_id              ;
assign          o_pkt_num         = r_pkt_cnt               ;
assign          o_pkt_cycle_cnt   = r_pkt_cycle_cnt         ;
assign          o_pkt_data_valid  = r_pkt_cnt >= 'd0 && r_pkt_cycle_cnt > 'd0;

always @(posedge i_clk) begin
    ri_bram_portb_dout <= i_bram_portb_dout;
end

/* --------------------------machine--------------------------------- */
reg             [3:0]               current_state           ;
reg             [3:0]               next_state              ;

localparam      IDLE        =   4'b0000;
localparam      WAITTRANS   =   4'b0001;
localparam      TRANS       =   4'b0010;
localparam      WAITCPLD    =   4'b0100;
localparam      BATCHEND    =   4'b1000;

assign          w_trans_start_flag = i_bram_portb_dout[7:0] == 8'b0101_0101 && ri_bram_portb_dout[7:0] == 'd0 && current_state == WAITTRANS;

always @(posedge i_clk) begin
    if(i_rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

always @(*) begin
    case (current_state)
        IDLE        :   next_state = WAITTRANS;

        WAITTRANS   :   begin
                            if(w_trans_start_flag)
                                next_state = TRANS;
                            else
                                next_state = WAITTRANS;
                        end
                        
        TRANS       :   begin
                            if(r_pkt_cnt == 'd4 && r_pkt_cycle_cnt == 'd32 && ro_flow_id == 'd255)
                                next_state = WAITCPLD;
                            else
                                next_state = TRANS;
                        end  
/*         WAITCPLD    :
        BATCHEND    :
        default     :  */
    endcase
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_bram_portb_addr <= 'd42207;
    else if(w_trans_start_flag)
        ro_bram_portb_addr <= 'd0;
    else if(current_state == TRANS)
        ro_bram_portb_addr <= ro_bram_portb_addr + 'd1;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_bram_portb_en <= 'd0;
    else if(current_state <= 'd2)
        ro_bram_portb_en <= 'd1;
    else 
        ro_bram_portb_en <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_bram_portb_we <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_pkt_cycle_cnt <= 'd0;
    else if(r_pkt_cycle_cnt == 'd32)
        r_pkt_cycle_cnt <= 'd0;     
    else if(ro_bram_portb_addr >= 'd2 && current_state == TRANS)
        r_pkt_cycle_cnt <= r_pkt_cycle_cnt + 'd1;
    else 
        r_pkt_cycle_cnt <= 'd0;
end

always @(posedge i_clk) begin
    if(i_rst)
        r_pkt_cnt <= 'd0;
    else if(r_pkt_cnt == 'd4 && r_pkt_cycle_cnt == 'd32)
        r_pkt_cnt <= 'd0;
    else if(r_pkt_cycle_cnt == 'd32)
        r_pkt_cnt <= r_pkt_cnt + 'd1;
    else
        r_pkt_cnt <= r_pkt_cnt;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_pkt_len <= 'd0;
    else if(r_pkt_cycle_cnt == 'd0 && ro_bram_portb_addr >= 'd2)
        ro_pkt_len <= ri_bram_portb_dout[39:32];
    else
        ro_pkt_len <= ro_pkt_len;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_pkt_protocol <= 'd0;
    else if(r_pkt_cycle_cnt == 'd0 && ro_bram_portb_addr >= 'd2)
        ro_pkt_protocol <= ri_bram_portb_dout[47:40];
    else
        ro_pkt_protocol <= ro_pkt_protocol;
end

always @(posedge i_clk) begin
    if(i_rst)
        ro_flow_id <= 'd0;
    else if(r_pkt_cnt == 'd4 && r_pkt_cycle_cnt == 'd32)
        ro_flow_id <= ro_flow_id + 'd1;
    else
        ro_flow_id <= ro_flow_id;
end

endmodule
