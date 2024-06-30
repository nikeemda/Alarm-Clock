# FPGA-Clock

## Overview
The goal of this project was accomplished by designing and implementing a digital clock using ModelSim, Quartus Prime, and the DE1-SoC kit. The key features of the clock include:
- Maintains time using a 1Hz clock line, displayed in a 24-hour format.
- Includes a switch to manually set the time, with separate buttons for setting the hour and minute.
- Utilizes a clock divider to generate the 1Hz clock from the original 50MHz clock.
- Includes a binary-to-decimal converter to display the time on the seven-segment display.

## Software and Hardware
- Quartus Prime
- ModelSim
- DE1-SoC board

## Description
The project consists of the following main components:
1. Seven-Segment Display: The seven-segment display was modified to only display numbers 0-9, removing the hexadecimal functionality.
2. Clock Divider: A clock divider was implemented to take the original 50MHz clock and output a 1Hz clock, which is used to maintain the time.
3. Main Clock Component: This is the core of the design, responsible for the following:
      - Maintaining the time (seconds, minutes, hours) based on the 1Hz clock.
      - Handling the set time functionality, where the user can manually set the hour and minute.
      - Interfacing with the binary-to-decimal converter to display the time on the seven-segment display.
