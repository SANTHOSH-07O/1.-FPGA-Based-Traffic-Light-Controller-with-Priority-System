Traffic Light Controller using Verilog
Overview
This project implements a Traffic Light Controller using Verilog HDL. The controller manages traffic signals for a two-road intersection using a Finite State Machine (FSM). It also includes an emergency mode that overrides the normal traffic sequence and immediately gives priority to Road A.

The design was developed, simulated, and synthesized using Xilinx Vivado.

Features
Finite State Machine (FSM) based traffic control
Two-road intersection management
Emergency vehicle priority mode
Synchronous state transitions using a clock
Asynchronous reset
Functional simulation using a Verilog testbench
RTL analysis and synthesis in Xilinx Vivado
Tools Used
Verilog HDL
Xilinx Vivado
Xilinx Simulator (XSIM)
Project Structure
Traffic-Light-Controller/
│
├── Traffic_Light_Controller.v      # Main controller module
├── traffic_tb.v                    # Testbench
├── README.md
├── Simulation_Waveform.png
├── RTL_Schematic.png
└── Synthesis_Result.png
Module Interface
Inputs
Signal	Description
clk	System clock
reset	Asynchronous active-high reset
emergency	Enables emergency mode
Outputs
Signal	Description
RA_R	Road A Red
RA_Y	Road A Yellow
RA_G	Road A Green
RB_R	Road B Red
RB_Y	Road B Yellow
RB_G	Road B Green
Finite State Machine
The controller operates using four states.

State	Road A	Road B
S0	Green	Red
S1	Yellow	Red
S2	Red	Green
S3	Red	Yellow
State sequence:

S0 → S1 → S2 → S3 → S0
Each state remains active for 5 clock cycles before transitioning to the next state.

Emergency Mode
When the emergency input becomes HIGH:

The normal state transition is paused.
Road A is immediately given a Green signal.
Road B is forced to Red.
The controller resumes the normal traffic sequence once the emergency signal is deasserted.
Working Principle
After reset, the controller starts in State S0.
A counter increments on every rising edge of the clock.
After five clock cycles, the controller advances to the next state.
The output logic generates the corresponding traffic light signals based on the current state.
If the emergency input is asserted, the controller overrides the normal outputs and prioritizes Road A.
Testbench
The provided testbench verifies:

Reset operation
Normal traffic light sequence
Emergency mode activation
Return to normal operation after emergency
Clock period:

10 ns
Simulation sequence:

Apply reset.
Release reset.
Observe normal traffic light operation.
Assert emergency signal.
Observe emergency priority.
Deassert emergency signal.
Continue normal operation.
Simulation Results
Simulation confirms:

Correct FSM state transitions
Proper traffic light sequencing
Correct emergency override behaviour
Successful reset functionality
(Add your waveform screenshot here.)

RTL Analysis
RTL analysis confirms the implementation of:

Finite State Machine
Counter
Combinational output logic
State transition logic
(Add your RTL schematic screenshot here.)

Synthesis
The design was successfully synthesized in Xilinx Vivado.

(Add your synthesis screenshot or utilisation report here.)

Applications
Traffic signal control systems
FPGA learning projects
Digital system design
Finite State Machine (FSM) implementation
Verilog HDL practice
Future Improvements
Emergency priority for multiple roads
Pedestrian crossing support
Traffic density-based signal timing
Countdown timer display
Sensor-based adaptive traffic control
FPGA hardware implementation on a development board
Author
Puthalapattu-75

B.Tech – Electronics and Communication Engineering (ECE)

License
This project is released for educational and learning purposes.
