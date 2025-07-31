Fork of Adam Walker's [starty](https://github.com/adamwalker/starty)

# Arty starter project template

A project template for the [Arty FPGA development board](https://store.digilentinc.com/arty-a7-artix-7-fpga-development-board-for-makers-and-hobbyists/).

Uses Vivado "non-project" mode. This means it is built entirely from the command line. There is no need to open the Vivado GUI. 

Building is as easy as:
```
$ ./build.sh
```
Once that completes, the bitstream and DCPs can be found in the "outputs" directory.

# Programming

```
$ cd program
$ ./program.sh
```

## Functionality
* System clock + buffer
* GPIO (switches, buttons, LEDs)
* 100M Ethernet
* VIOs (Virtual IOs)
* Chipscope
* Xilinx XPM modules
* DDR3 memory

The design flashes the LEDs in a pattern determined by the switches and buttons. It also loops back Ethernet packets via a FIFO in DDR memory. 

The signals from the Ethernet phy RX side are captured by chipscope and the packet rx count is available from the VIO.

See the `basic-ethernet` branch for a cut down version. 

## Software
The "software" directory contains an application to test the Ethernet loopback.

Edit the `software/build.sh` file to reflect your network interface, then run:
```
$ cd software
$ ./build.sh
```