/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module lut_13 (
    input [4:0] value,
    output reg [7:0] segs
  );
  
  
  
  always @* begin
    
    case (value)
      1'h0: begin
        segs = 8'h77;
      end
      1'h1: begin
        segs = 8'h7c;
      end
      2'h2: begin
        segs = 8'h5c;
      end
      2'h3: begin
        segs = 8'hf7;
      end
      3'h4: begin
        segs = 8'h6d;
      end
      3'h5: begin
        segs = 8'h76;
      end
      3'h6: begin
        segs = 8'h5e;
      end
      3'h7: begin
        segs = 8'hfc;
      end
      4'h8: begin
        segs = 8'h54;
      end
      4'h9: begin
        segs = 8'h38;
      end
      4'ha: begin
        segs = 8'hed;
      end
      4'hb: begin
        segs = 8'h50;
      end
      4'hc: begin
        segs = 8'hd0;
      end
      4'hd: begin
        segs = 8'hb9;
      end
      4'he: begin
        segs = 8'h79;
      end
      4'hf: begin
        segs = 8'hb8;
      end
      5'h10: begin
        segs = 8'h00;
      end
      default: begin
        segs = 8'h00;
      end
    endcase
  end
endmodule