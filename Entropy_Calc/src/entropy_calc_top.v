`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/26 13:27:19
// Design Name: 
// Module Name: entropy_calc_top
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


module entropy_calc_top(

input                           i_clk_p                 ,
input                           i_clk_n                 ,
output                          o_success_led                 
 
);

wire                            w_sys_clk               ;
wire                            w_sys_rst               ;
wire          [63:0]            w_bram_portb_dout       ;
wire          [15:0]            w_bram_portb_addr       ;
wire          [63:0]            w_bram_portb_din        ;
wire                            w_bram_portb_en         ;
wire          [7:0]             w_bram_portb_we         ;

wire          [63:0]            w_count_data            ;
wire                            w_count_data_valid      ;
wire          [7:0]             w_count_data_len        ;
wire          [15:0]            w_flow_num              ;  

wire          [15:0]            w_flow_num_count2calc   ;
wire          [7:0]             w_pkt_len               ;         
wire                            w_count_sum_valid       ;         
wire          [8:0]             w_final_sum_0           ;         
wire          [8:0]             w_final_sum_1           ;         
wire          [8:0]             w_final_sum_2           ;         
wire          [8:0]             w_final_sum_3           ;         
wire          [8:0]             w_final_sum_4           ;         
wire          [8:0]             w_final_sum_5           ;         
wire          [8:0]             w_final_sum_6           ;         
wire          [8:0]             w_final_sum_7           ;         
wire          [8:0]             w_final_sum_8           ;         
wire          [8:0]             w_final_sum_9           ;         
wire          [8:0]             w_final_sum_10          ;         
wire          [8:0]             w_final_sum_11          ;         
wire          [8:0]             w_final_sum_12          ;         
wire          [8:0]             w_final_sum_13          ;         
wire          [8:0]             w_final_sum_14          ;         
wire          [8:0]             w_final_sum_15          ;         
wire          [8:0]             w_final_sum_16          ;         
wire          [8:0]             w_final_sum_17          ;         
wire          [8:0]             w_final_sum_18          ;         
wire          [8:0]             w_final_sum_19          ;         
wire          [8:0]             w_final_sum_20          ;         
wire          [8:0]             w_final_sum_21          ;         
wire          [8:0]             w_final_sum_22          ;         
wire          [8:0]             w_final_sum_23          ;         
wire          [8:0]             w_final_sum_24          ;         
wire          [8:0]             w_final_sum_25          ;         
wire          [8:0]             w_final_sum_26          ;         
wire          [8:0]             w_final_sum_27          ;         
wire          [8:0]             w_final_sum_28          ;         
wire          [8:0]             w_final_sum_29          ;         
wire          [8:0]             w_final_sum_30          ;         
wire          [8:0]             w_final_sum_31          ; 

wire          [15:0]            w_pkt_entropy           ;
wire                            w_pkt_entropy_valid     ; 
wire          [15:0]            w_flow_num_calc2arbitrate;

wire                            w_calc_complete         ;  
wire          [63:0]            w_flow_arbitrate_result ;  

clock_and_reset clock_and_reset_U0(
	.clkin_200M_p               (i_clk_p                   ),
	.clkin_200M_n               (i_clk_n                   ),
	.clkout_200M                (w_sys_clk                 ),
	.reset                      (w_sys_rst                 )        
);  

example_batch_ram example_batch_ram_U0 (    
    .clka                       (w_sys_clk                 ),      // input wire clka
    .ena                        (w_bram_portb_en           ),      // input wire ena
    .wea                        (w_bram_portb_we[0]        ),      // input wire [0 : 0] wea
    .addra                      (w_bram_portb_addr         ),      // input wire [15 : 0] addra
    .dina                       (w_bram_portb_din          ),      // input wire [63 : 0] dina
    .douta                      (w_bram_portb_dout         )       // output wire [63 : 0] douta
);  

data_move_engine #( 
    .DATA_WIDTH                 (64                        ),
    .DATA_DEPTH                 (65536                     )
)   
data_move_engine_U0 
(   

    .i_clk                      (w_sys_clk                 ),
    .i_rst                      (w_sys_rst                 ),

    .i_bram_portb_dout          (w_bram_portb_dout         ),
    .o_bram_portb_addr          (w_bram_portb_addr         ),
    .o_bram_portb_din           (w_bram_portb_din          ),
    .o_bram_portb_en            (w_bram_portb_en           ),
    .o_bram_portb_we            (w_bram_portb_we           ),

    .o_count_data               (w_count_data              ),
    .o_count_data_valid         (w_count_data_valid        ),
    .o_count_data_len           (w_count_data_len          ),
    .o_flow_num                 (w_flow_num                ),

    .i_calc_complete            (w_calc_complete           ),
    .i_flow_arbitrate_result    (w_flow_arbitrate_result   ),
    .o_success_led              (o_success_led             )       

);

byte_count_wrapper #(

    .DATA_WIDTH                 (64)

)
byte_count_wrapper_U0
(

    .i_clk                      (w_sys_clk                 ),
    .i_rst                      (w_sys_rst                 ),  
    .count_data                 (w_count_data              ),
    .count_data_valid           (w_count_data_valid        ),
    .count_data_len             (w_count_data_len          ),
    .i_flow_num                 (w_flow_num                ),
    .o_flow_num                 (w_flow_num_count2calc     ),
    .o_pkt_len                  (w_pkt_len                 ),
    .o_count_sum_valid          (w_count_sum_valid         ),
    .o_final_sum_0              (w_final_sum_0             ),
    .o_final_sum_1              (w_final_sum_1             ),                     
    .o_final_sum_2              (w_final_sum_2             ),
    .o_final_sum_3              (w_final_sum_3             ),
    .o_final_sum_4              (w_final_sum_4             ),
    .o_final_sum_5              (w_final_sum_5             ),
    .o_final_sum_6              (w_final_sum_6             ),
    .o_final_sum_7              (w_final_sum_7             ),
    .o_final_sum_8              (w_final_sum_8             ),
    .o_final_sum_9              (w_final_sum_9             ),
    .o_final_sum_10             (w_final_sum_10            ),
    .o_final_sum_11             (w_final_sum_11            ),
    .o_final_sum_12             (w_final_sum_12            ),
    .o_final_sum_13             (w_final_sum_13            ),
    .o_final_sum_14             (w_final_sum_14            ),
    .o_final_sum_15             (w_final_sum_15            ),
    .o_final_sum_16             (w_final_sum_16            ),
    .o_final_sum_17             (w_final_sum_17            ),
    .o_final_sum_18             (w_final_sum_18            ),
    .o_final_sum_19             (w_final_sum_19            ),
    .o_final_sum_20             (w_final_sum_20            ),
    .o_final_sum_21             (w_final_sum_21            ),
    .o_final_sum_22             (w_final_sum_22            ),
    .o_final_sum_23             (w_final_sum_23            ),
    .o_final_sum_24             (w_final_sum_24            ),
    .o_final_sum_25             (w_final_sum_25            ),
    .o_final_sum_26             (w_final_sum_26            ),
    .o_final_sum_27             (w_final_sum_27            ),
    .o_final_sum_28             (w_final_sum_28            ),
    .o_final_sum_29             (w_final_sum_29            ),
    .o_final_sum_30             (w_final_sum_30            ),
    .o_final_sum_31             (w_final_sum_31            )               

);

entropy_calc entropy_calc_U0(

    .i_clk                      (w_sys_clk                 ),
    .i_rst                      (w_sys_rst                 ),

    .i_flow_num                 (w_flow_num_count2calc     ),
    .o_flow_num                 (w_flow_num_calc2arbitrate ),
    .i_pkt_len                  (w_pkt_len                 ),
    .i_count_sum_valid          (w_count_sum_valid         ),
    .i_final_sum_0              (w_final_sum_0             ),
    .i_final_sum_1              (w_final_sum_1             ),                     
    .i_final_sum_2              (w_final_sum_2             ),
    .i_final_sum_3              (w_final_sum_3             ),
    .i_final_sum_4              (w_final_sum_4             ),
    .i_final_sum_5              (w_final_sum_5             ),
    .i_final_sum_6              (w_final_sum_6             ),
    .i_final_sum_7              (w_final_sum_7             ),
    .i_final_sum_8              (w_final_sum_8             ),
    .i_final_sum_9              (w_final_sum_9             ),
    .i_final_sum_10             (w_final_sum_10            ),
    .i_final_sum_11             (w_final_sum_11            ),
    .i_final_sum_12             (w_final_sum_12            ),
    .i_final_sum_13             (w_final_sum_13            ),
    .i_final_sum_14             (w_final_sum_14            ),
    .i_final_sum_15             (w_final_sum_15            ),
    .i_final_sum_16             (w_final_sum_16            ),
    .i_final_sum_17             (w_final_sum_17            ),
    .i_final_sum_18             (w_final_sum_18            ),
    .i_final_sum_19             (w_final_sum_19            ),
    .i_final_sum_20             (w_final_sum_20            ),
    .i_final_sum_21             (w_final_sum_21            ),
    .i_final_sum_22             (w_final_sum_22            ),
    .i_final_sum_23             (w_final_sum_23            ),
    .i_final_sum_24             (w_final_sum_24            ),
    .i_final_sum_25             (w_final_sum_25            ),
    .i_final_sum_26             (w_final_sum_26            ),
    .i_final_sum_27             (w_final_sum_27            ),
    .i_final_sum_28             (w_final_sum_28            ),
    .i_final_sum_29             (w_final_sum_29            ),
    .i_final_sum_30             (w_final_sum_30            ),
    .i_final_sum_31             (w_final_sum_31            ),
    .o_pkt_entropy              (w_pkt_entropy             ),
    .o_pkt_entropy_valid        (w_pkt_entropy_valid       )  

);

flow_arbitrate flow_arbitrate_U0(

    .i_clk                      (w_sys_clk                 ),
    .i_rst                      (w_sys_rst                 ),

    .i_pkt_entropy              (w_pkt_entropy             ),
    .i_pkt_entropy_valid        (w_pkt_entropy_valid       ),
    .i_flow_num                 (w_flow_num_calc2arbitrate ),  
    .o_calc_complete            (w_calc_complete           ),
    .o_flow_arbitrate_result    (w_flow_arbitrate_result   )           

);

endmodule
