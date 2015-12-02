Arduino Project Code
####################

This repository has all the example code from course notes needed to run AVR
lab projects using an Arduino UNO board for cosc2325.

Prerequisites
*************

To run these projects, you need to install the following tools:

    * Arduino IDE

    * GNU make

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

..  note::

    You will need to run some of the installation commands using the ``sudo`` command,
    which lets you write files into protected areas of your system. The ``sudo`` command
    is not available on a PC. Instead, you need to install things by opening a
    ``command prompt`` program as an administrator. To do this, click on ``Start
    -> All Programs -> Accessories``. Then, right-click on the
    ``Command Prompt`` entry and select ``Run as Administrator``. Then run the
    following commands without the ``sudo`` part.

Clone the Project
=================

Start off by cloning this project:

..  code-block:: shell

    $ git clone https://github.com/rblack42/ArduinoAsm.git
    $ cd ArduinoAsm

Install Include files
=====================

Several files will be included into either your project level ``Makefile``, or
in assembly language files you create. These files will be installed into
``/usr/local/include`` (or C:\usr\local\include`` on a PC). The top level
makefile will do this for you:

..  code-block:: shell

    $ sudo make install

This command will create the needed directory, if it is not already there, then
copy the needed include files into place.

Build the Projects
******************

Before you try to build these projects, you should connect your Arduino board
to your system, and confirm the communications port being used. You can use the
Arduino IDE to find this information Example port settings are in the project
``Makefile``. Just edit the ``PORT`` line for your particular system.

There are three example projects included here. You should be able to compile
and run each one by changing into the project directory and doing this:

..  code-block:: shell

    $ make 
    $ make load

This will build the project code and attempt to load it on your Arduino. You
will need a piezo buzzer for the aBuzz and aTask projects. See the included
configuration files for the pin assignments used for each project.

..  vim:filetype=rst spell:
