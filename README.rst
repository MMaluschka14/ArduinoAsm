Arduino Project Code
####################

This repository has all the example code from course notes needed to run AVR
lab projects using an Arduino UNO board for cosc2325.

Prerequisites
*************

To run these projects, you need to install the following tools:

    * Arduino IDE

    * GNU make

Set the System path
===================

The build system for these projects depends on the compiler being accessible
from the command line. Locate the directory within the Arduino IDE as installed
on your system and find the directory with the avr-gcc program. Then edit the
system PATH so this folder is included in the list. If you install the IDE in a
location other than the default, you may need to edit the Makefile.xxx file in
the `includes` directory as well, so the compiler and loader can find the
required include files. Note that you will also need to edit the project level
Makefile to identify the exact port you Arduino is attached to when you try to
load these projects on the board.

You must be able to run the following commands to run these projects::

..  code-block:: shell

    $ git --version
    git version 2.6.2

    $ make --version
    GNU Make 3.81
    Copyright (C) 2006  Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.
    There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
    PARTICULAR PURPOSE.
    
    $ avr-gcc --version
    avr-gcc (GCC) 4.8.1
    Copyright (C) 2013 Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A 

You will need to install a suitable version of GNU make on a PC, and add the
directory where you place that program file to your system path. You also need
to look into the Arduino IDE to find the ``avr-gcc`` executable, and add that
directory to your system path as well. Clues to the location of these files are
in the Makefile.xxx files included in the ``makeincs`` directory in this
repository.

I have tested this code on the following systems:

    * Mac - OS-X 10.10

    * PC - Windows 7 and 10

    * Linux - Ubuntu 14.04

Please let me know if your system has any problems running these examples.

Installation 
************

Start off by cloning this project:

..  code-block:: shell

    $ git clone https://github.com/rblack42/ArduinoAsm.git
    $ cd ArduinoAsm

Build the Projects
******************

Before you try to build these projects, you should connect your Arduino board
to your system, and confirm the communications port being used. You can use the
Arduino IDE to find this information. Example port settings are in the project
``Makefile``. Just edit the ``PORT`` line for your particular system.

You should also verify the processor for your board. I use Arduino UNI boards in
my classes, which have the atmega328p chip. 

There are several example projects included here. You should be able to compile
and run each one by changing into the project directory and doing this:

..  code-block:: shell

    $ make 
    $ make load


This will build the project code and attempt to load it on your Arduino. You
will need a piezo buzzer for the aBuzz and aTask projects, and a push-button
for the button projects. See the included configuration files for the pin
assignments used for each project.

The top level ``Makefile`` can build all of the projects by running this
command:

..  code-block:: shell

    $ make build

You can run ``make clean`` at the top level, or in any project directory to
clean up all files except the needed source files and the ``Makefile`` for the
projects.

..  vim:filetype=rst spell:
