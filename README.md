# Verilog FIFO (First-In-First-Out) Buffer

## Description

This project implements a synchronous FIFO buffer with parameterizable width and depth, along with a testbench for simulation.

- `FIFO_WIDTH`: Default 32 bits
- `FIFO_DEPTH`: Default 8 entries

## RTL Diagram

![RTL](https://github.com/Nithyanand-b/fifo/blob/c7effc400dd6e62b09c8cc8cb1335bd9310311d3/Screenshot%202025-05-30%20210853.png)

## Files

- `fifo.v` – FIFO design module
- `fifo_tb.v` – Testbench for simulation

## How It Works

### FIFO Design

The FIFO includes:
- Internal memory array
- `write_pointer` and `read_pointer`
- Status signals: `full`, `empty`

**Control Signals:**
- `clk`: Clock input  
- `reset`: Active-low reset  
- `cs`: Chip select  
- `write_en`, `read_en`: Write and read enable signals

### Testbench Behavior

1. Applies reset
2. Writes random data until FIFO is full
3. Reads data until FIFO is empty
