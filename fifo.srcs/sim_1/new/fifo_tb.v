`timescale 1ns / 1ns

module fifo_tb;
  // Parameters
  parameter FIFO_WIDTH = 32;
  parameter FIFO_DEPTH = 8;

  // Signals
  reg [FIFO_WIDTH-1:0] data_in;
  reg clk;
  reg reset;
  reg write_en;
  reg read_en;
  reg cs;
  wire [FIFO_WIDTH-1:0] data_out;
  wire full;
  wire empty;

  // DUT Instantiation
  fifo #(FIFO_WIDTH, FIFO_DEPTH) dut (
    .data_in(data_in),
    .data_out(data_out),
    .clk(clk),
    .reset(reset),
    .cs(cs),
    .read_en(read_en),
    .write_en(write_en),
    .full(full),
    .empty(empty)
  );

  // Clock Generation (10ns period)
  always #5 clk = ~clk;

  initial begin
    // Initializations
    clk = 0;
    reset = 0;
    cs = 0;
    write_en = 0;
    read_en = 0;
    data_in = 0;

    // Reset the FIFO
    #10;
    reset = 1;
    cs = 1;

    #10;

    // Write to FIFO
    $display("=== Writing to FIFO ===");
    repeat (FIFO_DEPTH) begin
      @(posedge clk);
      if (!full) begin
        data_in = $random;
        write_en = 1;
        $display("Write: %0h", data_in);
      end
    end
    write_en = 0;

    // Wait for a few cycles
    #20;

    // Read from FIFO
    $display("=== Reading from FIFO ===");
    repeat (FIFO_DEPTH) begin
      @(posedge clk);
      if (!empty) begin
        read_en = 1;
        $display("Read: %0h", data_out);
      end
    end
    read_en = 0;

    #20;
    $finish;
  end

endmodule
