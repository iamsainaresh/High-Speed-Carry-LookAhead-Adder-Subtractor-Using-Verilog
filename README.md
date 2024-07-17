# High Speed Carry Look Ahead Adder and Subtractor

## Project Description

This project implements a 4-bit High Speed Carry Look Ahead Adder and Subtractor using Verilog. It consists of two Verilog files:

- **carry_look_ahead_adder_subtractor.v**: Design file for the carry lookahead adder and subtractor.
- **tb_carry_look_ahead_adder_subtractor.v**: Testbench file for simulating and verifying the design.

The project leverages propagation and generation bits where P = A⊕B and G = A.B. This approach ensures high-speed arithmetic operations by reducing the carry propagation delay.

## Why It Is Fast

The carry lookahead adder (CLA) is considered high-speed because it addresses the primary limitation of ripple carry adders—the time it takes for the carry to propagate through each bit. In a ripple carry adder, each bit addition must wait for the previous bit's carry to be calculated, leading to a delay proportional to the number of bits (O(n) delay).

The CLA, however, calculates the carry signals in advance based on the propagation and generation of carries:
- **Propagation (P)**: Indicates if a carry will propagate through this bit.
- **Generation (G)**: Indicates if a carry will be generated at this bit.

By using these signals, the CLA can determine the carry for each bit in parallel, reducing the overall addition time to O(log n) delay. This parallelism is the key reason why the CLA is significantly faster than other adder architectures like the ripple carry adder.

## Implementation Details

- **Design File**: The carry_look_ahead_adder_subtractor.v file contains the Verilog code for the carry lookahead adder and subtractor.
- **Testbench File**: The tb_carry_look_ahead_adder_subtractor.v file includes the testbench code to simulate and verify the functionality of the design.

## Research Paper

This project is based on the research paper titled "High Speed Carry Look Ahead Adder and Subtractor using Xilinx ISE" by K. Abdul Munaf, Kurumala Vishnu Chaithanya, and Athikari Harinath. Special thanks to the authors for their valuable insights and contributions to this topic.

## Usage

1. **Simulation**: Use a Verilog simulator (e.g., ModelSim, Xilinx Vivado) to run `tb_carry_look_ahead_adder_subtractor.v` and verify the design.
   
2. **Synthesis**: For hardware implementation on an FPGA, synthesize the `carry_look_ahead_adder_subtractor.v` file using appropriate synthesis tools, ensuring correct input/output configurations.

## Contact

Feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/sai-naresh-padakanti/) to discuss collaborations, projects, or simply to connect!

Thank you for checking out this project!
