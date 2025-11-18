Low-Power RISC-V Processor (RV32I) – Verilog Implementation

This repository contains the design and implementation of a low-power, five-stage pipelined RISC-V processor developed using Verilog HDL. The architecture targets IoT devices, embedded systems, and edge-AI workloads, focusing on reduced power consumption, modularity, and clean RTL design.

The processor has been functionally verified in ModelSim and is ready for FPGA synthesis on a Xilinx Artix-7 device.

---

## FEATURES

* Fully modular Verilog RTL implementation
* Supports RV32I instruction set
* Classic 5-stage pipeline architecture:
  IF → ID → EX → MEM → WB
* Hazard detection and data forwarding
* Immediate Generator for I/S/B/U/J types
* Register File with dual-read and single-write
* Synthesizable for FPGA
* Low-power design (short datapaths, reduced switching, simple control)

---

## ARCHITECTURE OVERVIEW

Pipeline Stages:

1. Instruction Fetch (IF)
2. Instruction Decode (ID)
3. Execute (EX)
4. Memory Access (MEM)
5. Write Back (WB)

Major RTL Modules:

* ALU (arithmetic, logic, shift, compare)
* Control Unit (opcode decode, pipeline control, hazard logic)
* Immediate Generator (sign-extend and extract fields)
* Register File (32 registers, 2 read ports, 1 write port)
* Pipeline Registers (IF/ID, ID/EX, EX/MEM, MEM/WB)
* Multiplexers and datapath routing

---

## ADDITIONAL DETAILS

This processor design focuses heavily on modularity and clarity, making it suitable for academic research, FPGA prototyping, and early-stage embedded AI projects. Each module was written from scratch in Verilog to maintain full transparency of hardware behavior.

Design Intent:

* The processor prioritizes predictable timing behavior, essential for FPGA-based deployments.
* The ALU and Immediate Generator are built using clean combinational logic to ensure minimal propagation delay.
* Pipeline registers isolate stages clearly, simplifying debugging and hazard tracking.
* Control logic is intentionally kept simple to minimize power and routing complexity.

Verification Strategy:

* Every RTL module was individually simulated before integration.
* Pipeline-level simulations included sequences with hazards, branches, and memory operations.
* Waveform inspection ensured correct stall and forwarding paths.

Design Philosophy:

* Reduce unnecessary toggling to cut dynamic power.
* Keep combinational paths short for better timing.
* Use modular design so new instructions or accelerators can be attached easily.
* Follow RISC-V open principles throughout the architecture.

---

## SIMULATION

ModelSim was used for cycle-accurate simulation and verification:

* ALU output verification
* Register file correctness
* Branch instruction behavior
* Hazard and stall behavior
* Pipeline stage synchronization
* Execution of sample RISC-V programs

---

## FPGA IMPLEMENTATION

Target FPGA: Xilinx Artix-7

Synthesis Objectives:

* Low LUT and flip-flop usage
* Short critical path delay
* Low dynamic power consumption
* Reliable timing closure

Design is fully synthesizable and FPGA-ready.

---

## FULL PROJECT REPORT

Full documentation is available in the PDF:

docs/RISC-V report sub (final).pdf

---

## FUTURE ENHANCEMENTS

* RV32M extension (hardware multiply/divide)
* Improved hazard prediction
* TinyML accelerator module
* Multi-core version
* Faster pipeline stages
* Peripheral interface bus (UART, SPI, I2C)

---

## AUTHORS

Shakthivel. R

Vaishnavi A

Sanofer Nisha M S

Supervisor: Dr. T. Annamalai
