# Recommended README.md file structure

### Team members

* Loan Bresson(diagrams, top.level, melody composition)
* Emile Cailly(synth, top level)
* Aitana del Carmen (diagrams)
* Oier Dorado (up and down counter, top.level, GitHub readme file)

## Theoretical description and explanation

Description: Develop and implement a sound synthesizer utilizing relays on the Nexys A7 FPGA board. Rather than generating audio signals directly, the system employs relays connected to Pmod connectors to produce audible sounds by managing the activation and deactivation of relay switches. Users can compose and play basic melodies by programming the relay sequences. Push buttons will serve as controls for play, stop, and song navigation, while LEDs and a 7-segment display will provide visualization of the melody and information about the songs.

## Hardware description of demo application

Insert descriptive text and schematic(s) of your implementation.
We used Nexys A7 50T board to solve the problem:
From the board, we used the seven segment display, and the buttons BTNL, BTNR, BTN
![nexys-a7-artix-50t-xilinx-fpga](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/52f406b8-4785-469b-90a5-d3e47c6999ed)

We used two relays:
- TIANBO HJR-4102-L-5V
![rel-01-029-1-hjr-4102-l-12v-relay](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/44817505-fdca-4f97-b3d0-d868bf6c868e)
-

## Software description

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders.
![image_123650291](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/5e0d5323-8bac-4776-8969-6f3ba867e6d7)

![IMG_0176](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/338f5181-b60b-4586-b079-5e6e60472b47)

List of design sources:

1. [`top.level.vhd`](): This is the main program to run. This program includes all the blocks in it and coordinates them to get the wanted result.

2. [`clock_enable.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/design%20source/clock_enable.vhd): This file initializes the clock signal.

4. [`bin2seg.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/design%20source/bin2seg.vhd): This file is the responsible of controlling the seven segment display of the board.

5. [`encoder_A`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/design%20source/encoder_A.vhd): This block is the 

6. [`melody_selector`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/design%20source/melody_selector.vhd): This is basically an up and down counter, that apart from using it in the top_level as an up and down counter we also used it to create a melody selector.

7. [`ROM.vhd`](): This is the memory. Here the melodies are stored in form of binary code.

List of testbenches:

1. [`tb_melody_selector.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/testbenches/tb_melody_selector.vhd): This is the testbench for the melody_selector.

2. [`tb_ROM.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/testbenches/tb_ROM.vhd): This is the testbench for the ROM.
  
3. [`top.level.vhd`](): This is the main program to run. This program includes all the blocks in it and coordinates them to get the wanted result.

4. [`top.level.vhd`](): This is the main program to run. This program includes all the blocks in it and coordinates them to get the wanted result.

### Component(s) simulation

Write descriptive text and put simulation screenshots of your components.

## Instructions

Write an instruction manual for your application, including photos and a link to a short app video.

## References

1. Put here all references to sources and tools you used.
