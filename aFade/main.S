;main.S - avr-gcc assembly language

#include "config.inc"

        .extern Timer0Setup
        .extern Timer1Setup

        .section    .text
        .global     main

        .org    0x00
main:   jmp     Reset

Reset:
        eor     r1, r1                  ; cheap zero
        out     _SREG, r1                ; clear flag register

        ; set stack to top of available ram
        ldi     r28, (RAMEND & 0x00ff)
        ldi     r29, (RAMEND >> 8)
        out     _SPH, r29
        out     _SPL, r28

        ; set up the system clock
        ldi     r24, 0x80               ; set up prescaler
        sts     CLKPR, r24
        sts     CLKPR, r1               ; set to full speed

        ; set up LED port 
        sbi     LED_DIR, LED_PIN        ; set up the output port (OC1A) 
        cbi     LED_PORT, LED_PIN       ; start off with the LED off

        call    Timer0Setup             ; initialze the timer
        call    Timer1Setup
        sei                             ; turn on interrupts
1:      rjmp    1b                      ; hang the processor

