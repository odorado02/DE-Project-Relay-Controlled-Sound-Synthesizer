# Making Relays Plays Songs

### Team members

* Loan Bresson
* Emile Cailly
* Aitana del Carmen
* Oier Dorado

## Theoretical description and explanation

*Description: Develop and implement a sound synthesizer utilizing relays on the Nexys A7 FPGA board. Rather than generating audio signals directly, the system employs relays connected to Pmod connectors to produce audible sounds by managing the activation and deactivation of relay switches. Users can compose and play basic melodies by programming the relay sequences. Push buttons will serve as controls for play, stop, and song navigation, while LEDs and a 7-segment display will provide visualization of the melody and information about the songs.*

We developed our synthesizer using the Nexys A7 board. We used the buttons to control the music track which is playing and the seven segment display as an indicator for the track number. Also we included two LED colour to make clear if the music is playing or paused.

## Hardware description of demo application

We used Nexys A7 50T board to solve the problem:
From the board, we used the seven segment display, and the buttons BTNL, BTNR, BTNC, BTND
<img src="https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/52f406b8-4785-469b-90a5-d3e47c6999ed" width="600" height="550">

We used two relays:
- TIANBO HJR-4102-L-5V
<img src="https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/44817505-fdca-4f97-b3d0-d868bf6c868e" width="600" height="550">

- SONGLE SRD-05VDC-SL-C
<img src="https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/2c1cbcb6-75d4-42c6-aa97-54427649b16d" width="400" height="350">

As the relays used 5V power we used a nano Arduino to add this suply from the USB port of the Nexys Board. 
<img src="https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/f2cc7264-4fa0-43be-8f0f-e96e4a4349bd" width="500" height="450">

Since the Relay board use Octocoupler for control it is compatible with 3.3v signal. here is one relay control shematics. 
<img width="1056" alt="Capture d’écran 2024-04-23 à 14 45 36" src="https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/78265905/afdcec27-2068-46cc-b16b-76a9c7cefb24">



## Software description

**State machine:**
![IMG_0179](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/c8e977db-356b-4371-b940-84b205655f34)

**List of design sources:**

1. [`top.level.vhd`](): This is the main program to run. This program includes all the blocks in it and coordinates them to get the wanted result.
![IMG_0178](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/9572ea9e-f6bd-47eb-9fb5-0a7c7338b742)

3. [`clock_enable.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/design%20source/clock_enable.vhd): This file used the clock signal to create a 10Hz pulse. We used the one from the laboratory lessons.

4. [`bin2seg.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/design%20source/bin2seg.vhd): This file is the responsible of controlling the seven segment display of the board. We used the one from the laboratory lessons.

5. [`encoder_A.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/design%20source/encoder_A.vhd): This block is a unary encoder used in the synth design to convert the number of relays on to actual control signal for the relays. 

6. [`melody_selector.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/design%20source/melody_selector.vhd): This is basically an up and down counter, that apart from using it in the synth design as an up and down counter we also used it to create a melody selector.
![IMG_0180](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/9de00945-24e0-4c20-8b65-0e9814bff2e4)

8. [`ROM.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/e9bc19e9c124f2775d3dacc299e535a5b86264fd/source/design%20source/ROM.vhd): This is the memory. Here the melodies are stored in form of binary code.

9. [`debounce.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/27b937200ac9ea13c7b5a93717b4c95767f21f19/source/design%20source/debounce.vhd): This program avoides the button to bounce.

**List of testbenches and simulations:**

1. [`tb_melody_selector.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/testbenches/tb_melody_selector.vhd): This is the testbench for the melody_selector. As we can see, it counts from 0 to 3 when EN is 1 and it stands in its value when it is 0.
![image](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/f29c14b7-33df-40af-b27a-15c41b11f207)

3. [`tb_ROM.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/9a9f8162f6d7d15c2d32c0ccf66bdfa4364458fc/source/testbenches/tb_ROM.vhd): This is the testbench for the ROM.
  
4. [`tb_encoder_A.vhd`](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/blob/45a454364ca8d41ae2ffea6cb52cb3a33cf7d602/source/testbenches/tb_encoder_A.vhd): this test bench will go through every number showing the correct urinary output. 
![image](https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/2b795c82-ad09-4d81-81d2-875defd2a007)


**Synth Function**

As we know, relays do not make the same song when activated and when deactivated. We used this to make a design based on sequential activation and deactivation. 3 type of commands:

- do nothing          --> silence
- active a relay     --> first note
- desactivate a relay --> seconde note

The system uses up and down counter to count how many relays are up at the same time. Converted in 1bit we got the control of eatch of relay.

**limitation**

The intrasec limitation is the fact that we must first make an on note for each of the off notes we want to make. Also, since there are only 4 relays of each type, we can only make 4 activation notes before having to make a deactivation note.

One of the limitations of our system is that we cannot make an activation and deactivation note at the same time. This could be possible if we use a 1 bit rotary register to control the relay directly but this uses three times more flip-flops than our methode (Register, set pointer, clear pointer) other thing is we can desactivate all the relays at once with an overflow instead of other methods. 

The ultimate method is to control every relay directly from the ROM but this uses a lot more memory and less intresting achitecture. 


**Melody composition:**

To get real melodies on Bitstream format we had to be creative. we made a program simulating the behavior of the machine, so we can listen to the melody without having to compile source every time. We chose to use the Pure Data programing enviroment. 
<img width="601" alt="Capture d’écran 2024-04-23 à 14 56 51" src="https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/78265905/f9fce24d-96d6-40d0-969b-32830c7059cc">

Then, we added in this program some blocks to programe melodies address by address and converting them into the Array format of VHDL. ``` Array = ("b_02b_01b_00","b_12b_11b_10","b_22b_21b_20") ```
<img width="862" alt="Capture d’écran 2024-04-23 à 14 54 22" src="https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/78265905/1d3ced82-bc6e-4db9-9188-3d14e44a9a78">


## Instructions


On the one hand, we have a seven segment display which will be showing the track's number. Our application works with four tracks, so the display will show the numbers from 1 to 4. 
On the other hand, regarding the instructions on how to select the music, three buttons can be used.
- BTNC: play/pause
- BTNL: previous track
- BTNR: next track
- BTND: reset

Additionally, we have set some LEDs that tell us the state of the music player.
- Blue: Music player ON mode
- Green: Music player OFF mode

**Enjoy the music**

[`video`](https://drive.google.com/file/d/1LauIKRed9DG8DUmADmsxbbPodiBQCm3z/view?usp=drive_link)

https://github.com/odorado02/DE-Project-Relay-Controlled-Sound-Synthesizer/assets/147071596/dc503fac-3ee8-4729-a250-b5d439c56c98

## References

[1]
“Online VHDL Testbench Template Generator,” vhdl.lapinoo.net. https://vhdl.lapinoo.net/testbench/ (accessed Apr. 18, 2024).
