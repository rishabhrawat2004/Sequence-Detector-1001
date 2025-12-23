# Sequence-Detector-1001

🔁 Mealy FSM – Overlapping Sequence Detector (Verilog)
📌 Project Description

This project implements a Mealy finite state machine (FSM) in Verilog HDL that detects a specific binary input sequence with overlapping allowed.

The output y is asserted during the same clock cycle in which the final bit of the sequence is detected, which is a key characteristic of Mealy machines.

⚙️ Key Features

Mealy state machine implementation

Overlapping sequence detection

Asynchronous reset

Fully synchronous state transitions

Includes testbench for functional verification

🧠 FSM Overview

FSM Type: Mealy

States: 4 (a, b, c, d)

State Encoding: 2-bit parameterized encoding

Output Dependency: Current state and input

🧩 State Description
State	Description
a	Initial / Idle state
b	Partial sequence detected
c	Further sequence progress
d	Final state before detection

Output y = 1 is generated only in state d when x = 1

FSM supports overlapping, meaning detection can restart without reset

🔄 Overlapping Detection

After detecting the sequence, the FSM:

Transitions back to an intermediate state instead of the initial state

Allows detection of back-to-back overlapping sequences

🏗️ Module Overview
mealy_overlapping

Inputs

clk – Clock signal

rst – Asynchronous reset

x – Serial input

Output

y – Sequence detected output

🧪 Testbench (tb_mealy_overlapping)

The testbench:

Generates a clock signal (10 time-unit period)

Applies reset at start

Applies a predefined binary input pattern

Monitors output using $monitor

Demonstrates overlapping detection behavior

🖥️ Simulation Tools

Compatible with:

ModelSim

Vivado Simulator



🚀 Future Improvements

Clearly specify detected sequence in comments

Add waveform screenshots

Convert to Moore FSM for comparison

Parameterize state encoding

Add assertions for verification

📚 Learning Outcomes

Difference between Mealy and Moore FSMs

Overlapping vs non-overlapping sequence detection

FSM design using Verilog

Testbench-driven verification

👤 Author

Rishabh Rawat
B.Tech – Electronics & Communication Engineering
