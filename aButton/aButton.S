; aButton.S simple button test
; Author: Roie R. Black
; Date: Dec 10, 2015

#include "config.inc"

; wire button to Arduino pin 2, through button to ground.

        .section .text
        .global     main
        .extern     delay          
        .org        0x0000

main:
        eor         r1, r1          ; keep r1 set to zero
        out         _SREG, r1       ; clar status registers 
        
        ; set up the stack
        ldi         r28, (RAMEND & 0x00ff)
        ldi         r29, (RAMEND >> 8)
        out         _SPH, r29
        out         _SPL, r28


        ; configure ports
        ldi         r24, 0xff       ; all ones
        out         _DDRB, r24      ; all PORTB pins set to output
        cbi         _DDRD, 2        ; set PORTD pin 2 to input
        sbi         _PORTD, 2       ; enable pull-up
        
        ; enter the blink loop
1:      sbis        _PIND, 2        ; read input pin
        rjmp        2f
        cbi         _PORTB, 5       ; set LED off
        rjmp        1b
2:      sbi         _PORTB, 5       ; turn LED on
        rjmp        1b
