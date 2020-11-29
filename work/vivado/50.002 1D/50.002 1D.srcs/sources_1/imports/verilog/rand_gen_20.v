/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module rand_gen_20 (
    input clk,
    input rst,
    input [8:0] reg_array,
    output reg [4:0] rand1,
    output reg [4:0] rand2
  );
  
  
  
  wire [16-1:0] M_alu_out;
  wire [3-1:0] M_alu_zvn;
  wire [20-1:0] M_alu_seg;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_11 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out),
    .zvn(M_alu_zvn),
    .seg(M_alu_seg)
  );
  
  wire [32-1:0] M_randseed_value;
  counter_25 randseed (
    .clk(clk),
    .rst(rst),
    .value(M_randseed_value)
  );
  reg [3:0] M_empty_slots_d, M_empty_slots_q = 4'h9;
  localparam START_game_step = 2'd0;
  localparam RAND1_game_step = 2'd1;
  localparam RAND2_game_step = 2'd2;
  localparam DONE_game_step = 2'd3;
  
  reg [1:0] M_game_step_d, M_game_step_q = START_game_step;
  localparam BITMASK_rand_step = 2'd0;
  localparam MULTIPLY_rand_step = 2'd1;
  localparam EXTRACT_rand_step = 2'd2;
  
  reg [1:0] M_rand_step_d, M_rand_step_q = BITMASK_rand_step;
  reg [2:0] M_randint1_d, M_randint1_q = 1'h0;
  reg [3:0] M_randint2_d, M_randint2_q = 1'h0;
  reg [15:0] M_randint_temp_d, M_randint_temp_q = 1'h0;
  reg [3:0] M_index_count_d, M_index_count_q = 1'h0;
  wire [32-1:0] M_rand_gen_num;
  reg [1-1:0] M_rand_gen_next;
  reg [32-1:0] M_rand_gen_seed;
  pn_gen_26 rand_gen (
    .clk(clk),
    .rst(rst),
    .next(M_rand_gen_next),
    .seed(M_rand_gen_seed),
    .num(M_rand_gen_num)
  );
  
  always @* begin
    M_game_step_d = M_game_step_q;
    M_rand_step_d = M_rand_step_q;
    M_randint_temp_d = M_randint_temp_q;
    M_randint2_d = M_randint2_q;
    M_randint1_d = M_randint1_q;
    M_empty_slots_d = M_empty_slots_q;
    M_index_count_d = M_index_count_q;
    
    M_rand_gen_next = 1'h1;
    M_rand_gen_seed = M_randseed_value;
    M_alu_alufn = 6'h00;
    M_alu_a = 16'h0000;
    M_alu_b = 16'h0000;
    rand1 = 1'h0;
    rand2 = 1'h0;
    
    case (M_game_step_q)
      START_game_step: begin
        M_randint1_d = 1'h0;
        M_randint2_d = 1'h0;
        M_rand_gen_next = 1'h1;
        M_alu_a = 1'h0;
        M_alu_b = 1'h0;
        M_alu_alufn = 1'h0;
        M_index_count_d = M_index_count_q + 1'h1;
        M_empty_slots_d = M_empty_slots_q - reg_array[(M_index_count_q)*1+0-:1];
        if (M_index_count_q >= 4'h8) begin
          M_game_step_d = RAND1_game_step;
        end
      end
      RAND1_game_step: begin
        M_rand_gen_next = 1'h1;
        M_alu_a = M_rand_gen_num[0+15-:16];
        M_alu_b = 16'h0007;
        M_alu_alufn = 6'h18;
        M_randint1_d = M_alu_out[0+2-:3];
        M_game_step_d = RAND2_game_step;
        M_rand_step_d = BITMASK_rand_step;
      end
      RAND2_game_step: begin
        
        case (M_rand_step_q)
          BITMASK_rand_step: begin
            M_rand_gen_next = 1'h1;
            M_alu_a = M_rand_gen_num[0+15-:16];
            M_alu_b = 16'h0fff;
            M_alu_alufn = 6'h18;
            M_randint_temp_d = M_alu_out[0+15-:16];
            M_rand_step_d = MULTIPLY_rand_step;
          end
          MULTIPLY_rand_step: begin
            M_alu_a = M_randint_temp_q;
            M_alu_b = M_empty_slots_q;
            M_alu_alufn = 6'h02;
            M_randint_temp_d = M_alu_out[0+15-:16];
            M_rand_step_d = EXTRACT_rand_step;
          end
          EXTRACT_rand_step: begin
            M_randint2_d = M_randint_temp_q[12+3-:4];
            M_game_step_d = DONE_game_step;
          end
        endcase
      end
      DONE_game_step: begin
        rand1 = M_randint1_q + 5'h10;
        rand2 = M_randint2_q + 5'h10;
        if (rst) begin
          M_game_step_d = START_game_step;
          M_index_count_d = 1'h0;
          M_empty_slots_d = 4'h9;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_empty_slots_q <= 4'h9;
      M_randint1_q <= 1'h0;
      M_randint2_q <= 1'h0;
      M_randint_temp_q <= 1'h0;
      M_index_count_q <= 1'h0;
      M_game_step_q <= 1'h0;
      M_rand_step_q <= 1'h0;
    end else begin
      M_empty_slots_q <= M_empty_slots_d;
      M_randint1_q <= M_randint1_d;
      M_randint2_q <= M_randint2_d;
      M_randint_temp_q <= M_randint_temp_d;
      M_index_count_q <= M_index_count_d;
      M_game_step_q <= M_game_step_d;
      M_rand_step_q <= M_rand_step_d;
    end
  end
  
endmodule
