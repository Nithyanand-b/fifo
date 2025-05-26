`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2025 19:00:33
// Design Name: 
// Module Name: fifo
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


module fifo #(parameter FIFO_WIDTH = 32, FIFO_DEPTH = 8)
           (data_in,
            data_out,
            clk,
            reset,
            cs,
            read_en,
            write_en,
            full,
            empty);
            
            input [FIFO_WIDTH-1:0] data_in;
            input clk;
            input reset;
            input cs;
            input read_en;
            input write_en;
            
            output reg [FIFO_WIDTH-1:0] data_out;
            output full;
            output empty;
            
            reg [FIFO_WIDTH-1:0] fifo [FIFO_DEPTH-1:0];
            
            localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH);
            
            reg [FIFO_DEPTH_LOG:0] read_pointer;
            reg [FIFO_DEPTH_LOG:0] write_pointer;
            
            // write
            always@(posedge clk or negedge reset)
            begin
                 if(!reset) begin
                 write_pointer <= 0;
                 end else if(cs && !full && write_en) begin
                 fifo[write_pointer[FIFO_DEPTH_LOG-1:0]] <= data_in;
                 write_pointer = write_pointer + 1'b1;
                 end 
            end  
            
            //read
              always@(posedge clk or negedge reset)
            begin
                 if(!reset) begin
                 read_pointer <= 0;
                 end else if(cs && !empty && read_en) begin
                 data_out = fifo[read_pointer[FIFO_DEPTH_LOG-1:0]];
                 read_pointer = read_pointer + 1'b1;
                 end 
            end     
         
            assign full = (read_pointer == {~write_pointer[FIFO_DEPTH_LOG],write_pointer[FIFO_DEPTH_LOG-1:0]});
            assign empty = (read_pointer == write_pointer);
            
endmodule
