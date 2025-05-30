# Verilog FIFO (First-In-First-Out) Buffer

## Description

This project implements a synchronous FIFO buffer with parameterizable width and depth, along with a testbench for simulation.

- `FIFO_WIDTH` (default: 32 bits)
- `FIFO_DEPTH` (default: 8 entries)
> **🔽 RTL Diagram:**  
> ![RTL](rtl.png)
## Files

- `fifo.v` – FIFO design module
- `fifo_tb.v` – Testbench for simulation

## How It Works

### FIFO Design

The FIFO uses:
- Internal memory array
- `write_pointer` and `read_pointer`
- Status signals: `full` and `empty`

**Control Signals:**
- `clk`, `reset` (active low), `cs` (chip select)
- `write_en`, `read_en`

### Testbench Behavior

1. Applies reset
2. Writes random data until FIFO is full
3. Reads data back until FIFO is empty
