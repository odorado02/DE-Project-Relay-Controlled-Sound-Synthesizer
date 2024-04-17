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

### Component(s) simulation

Write descriptive text and put simulation screenshots of your components.

## Instructions

Write an instruction manual for your application, including photos and a link to a short app video.

## References

1. Put here all references to sources and tools you used.
