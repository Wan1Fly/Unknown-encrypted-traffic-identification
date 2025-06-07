`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 14:20:55
// Design Name: 
// Module Name: top_test
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


module top_test(

input                               i_clk_p                     ,
input                               i_clk_n                     ,
/* input                               i_wr_clk                    ,              
input                               i_test_ena                  ,
input                               i_test_wea                  ,
input           [15:0]              i_test_addra                ,
input           [63:0]              i_test_dina                 , */                                                      

);


wire                                w_app_clk                   ;     
wire                                w_app_rst                   ;     

clock_and_reset clock_and_reset_U0(
	.clkin_200M_p                   (i_clk_p                    ),
	.clkin_200M_n                   (i_clk_n                    ),
	.clkout_200M                    (w_app_clk                  ),
	.reset                          (w_app_rst                  )
);

wire                                w_bram_portb_en             ;  
wire          [7:0]                 w_bram_portb_we             ;  
wire          [15:0]                w_bram_portb_addr           ;  
wire          [63:0]                w_bram_portb_din            ;  
wire          [63:0]                w_bram_portb_dout           ;  

/* test_bram_gen test_bram_gen_U0 (
    .clka                           (i_wr_clk                   ),      // input wire clka
    .ena                            (i_test_ena                 ),      // input wire ena
    .wea                            (i_test_wea                 ),      // input wire [0 : 0] wea
    .addra                          (i_test_addra               ),      // input wire [15 : 0] addra
    .dina                           (i_test_dina                ),      // input wire [63 : 0] dina
    .douta                          (                           ),      // output wire [63 : 0] douta
    .clkb                           (w_app_clk                  ),      // input wire clkb
    .enb                            (w_bram_portb_en            ),      // input wire enb
    .web                            (w_bram_portb_we            ),      // input wire [0 : 0] web
    .addrb                          (w_bram_portb_addr          ),      // input wire [15 : 0] addrb
    .dinb                           (w_bram_portb_din           ),      // input wire [63 : 0] dinb
    .doutb                          (w_bram_portb_dout          )       // output wire [63 : 0] doutb
); */

test_bram_gen test_bram_gen_U0 (
    .clka                           (w_app_clk                  ),      // input wire clka
    .ena                            (w_bram_portb_en            ),      // input wire ena
    .wea                            (w_bram_portb_we            ),      // input wire [0 : 0] wea
    .addra                          (w_bram_portb_addr          ),      // input wire [15 : 0] addra
    .dina                           (w_bram_portb_din           ),      // input wire [63 : 0] dina
    .douta                          (w_bram_portb_dout          )       // output wire [63 : 0] douta
);

wire                                w_pkt_data_valid            ;
wire          [63:0]                w_pkt_data                  ;
wire          [7:0]                 w_pkt_len                   ;
wire          [2:0]                 w_pkt_num                   ;
wire          [7:0]                 w_pkt_protocol              ;
wire          [5:0]                 w_pkt_cycle_cnt             ;
wire          [7:0]                 w_flow_id                   ;  

data_mover_engine data_mover_engine_U0(

    .i_clk                          (w_app_clk                  ),
    .i_rst                          (w_app_rst                  ),
    .o_bram_portb_en                (w_bram_portb_en            ),
    .o_bram_portb_we                (w_bram_portb_we[0]         ),
    .o_bram_portb_addr              (w_bram_portb_addr          ),
    .o_bram_portb_din               (w_bram_portb_din           ),
    .i_bram_portb_dout              (w_bram_portb_dout          ),   
    .o_pkt_data_valid               (w_pkt_data_valid           ),
    .o_pkt_data                     (w_pkt_data                 ),
    .o_pkt_len                      (w_pkt_len                  ),
    .o_pkt_num                      (w_pkt_num                  ),
    .o_pkt_protocol                 (w_pkt_protocol             ),
    .o_pkt_cycle_cnt                (w_pkt_cycle_cnt            ),
    .o_flow_id                      (w_flow_id                  )
);

wire          [2:0]                 w_parse_flow_type           ;  
wire          [63:0]                w_parse_data                ;
wire          [7:0]                 w_parse_pkt_len             ;
wire          [7:0]                 w_parse_flow_id             ;
wire                                w_entropy_calc_valid        ;
wire                                w_pattern_match_valid       ;
wire                                w_flow_type_id_valid        ;   

pre_fixed_parse pre_fixed_parse_U0(

    .i_clk                          (w_app_clk                  ),
    .i_rst                          (w_app_rst                  ),
    .i_pkt_data_valid               (w_pkt_data_valid           ),
    .i_pkt_data                     (w_pkt_data                 ),
    .i_pkt_len                      (w_pkt_len                  ),
    .i_pkt_num                      (w_pkt_num                  ),
    .i_pkt_protocol                 (w_pkt_protocol             ),
    .i_pkt_cycle_cnt                (w_pkt_cycle_cnt            ),
    .i_flow_id                      (w_flow_id                  ),          
    .o_flow_type                    (w_parse_flow_type          ),  
    .o_parse_data                   (w_parse_data               ),
    .o_pkt_len                      (w_parse_pkt_len            ),
    .o_flow_id                      (w_parse_flow_id            ),
    .o_entropy_calc_valid           (w_entropy_calc_valid       ),
    .o_pattern_match_valid          (w_pattern_match_valid      ),
    .o_flow_type_id_valid           (w_flow_type_id_valid       )         

);

wire          [63:0]                w_sni_match_data            ;
wire                                w_sni_match_data_valid      ;
wire          [2:0]                 w_sync_flow_type            ;
wire          [7:0]                 w_sync_flow_id              ;
wire                                w_sync_flow_type_id_valid   ;

bytes_table_screen bytes_table_screen_U0(

    .i_clk                          (w_app_clk                  ),
    .i_rst                          (w_app_rst                  ),
    .i_flow_type                    (w_parse_flow_type          ),  
    .i_parse_data                   (w_parse_data               ),
    .i_flow_id                      (w_parse_flow_id            ),
    .i_pattern_match_valid          (w_pattern_match_valid      ),
    .i_flow_type_id_valid           (w_flow_type_id_valid       ),
    .o_sni_match_data               (w_sni_match_data           ),
    .o_sni_match_data_valid         (w_sni_match_data_valid     ),
    .o_sync_flow_type               (w_sync_flow_type           ),
    .o_sync_flow_id                 (w_sync_flow_id             ),
    .o_sync_flow_type_id_valid      (w_sync_flow_type_id_valid  )      

);

sni_pattern_match sni_pattern_match_U0(

    .i_clk                          (w_app_clk                  ),
    .i_rst                          (w_app_rst                  ),
    .i_flow_type                    (w_sync_flow_type           ),  
    .i_parse_data                   (w_sni_match_data           ),
    .i_flow_id                      (w_sync_flow_id             ),
    .i_pattern_match_valid          (w_sni_match_data_valid     ),
    .i_sync_flow_type_id_valid      (w_sync_flow_type_id_valid  ),       
    .o_flow_id_type                 (),
    .o_flow_id_type_valid           ()  

);



endmodule
