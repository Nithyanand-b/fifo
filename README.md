# Verilog FIFO (First-In-First-Out) Buffer

## Description

This project implements a synchronous FIFO buffer with parameterizable width and depth, along with a testbench for simulation.

- `FIFO_WIDTH` (default: 32 bits)
- `FIFO_DEPTH` (default: 8 entries)
> **🔽 RTL Diagram:**  
> ![RTL]([Screenshot 2025-05-30 210853.png](https://github.com/Nithyanand-b/fifo/blob/c7effc400dd6e62b09c8cc8cb1335bd9310311d3/Screenshot%202025-05-30%20210853.png))
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
