; Timer.S - Timer0 and Timer 1 code for blink

#include "config.inc"

        .global Timer0Setup
        .global TIMER0_OVF_vect
        .global Timer1Setup

        .section    .text

;----------------------------------------------------------------------
; Initialize Timer 1 for PWM
;
Timer1Setup:
        ldi     r16, (1<<WGM10)|(1<<COM1A1)|(1<<COM1A0)     ; 8 bit fast PWM
        sts     TCCR1A, r16
        ldi     r16, (1<<CS10)                              ; no prescale
        sts     TCCR1B, r16
        ldi     r16, 0xff                                   ; flag used by timer0 logic
        mov     r2, r16
        ret

;----------------------------------------------------------------------
; Initialize Timer 0 for interrupts
;
Timer0Setup:
        in      r16, _TCCR0B
        ori     r16, (1 << CS02)                    ; divide by 256
        out     _TCCR0B, r16                        ; set timer clock
        sbi     _TIFR0, (1<< TOV0)                  ; set interrupt flag
;
        lds     r16, TIMSK0                         ; get interrupt mask reg
        ori     r16, (1 << TOIE0)                   ; enable interrupts
        sts     TIMSK0, r16
        out     _TCNT0, r1                          ; zero the timer counter
        ;
        ret
;----------------------------------------------------------------------
; Timer0 overflow ISR
;
TIMER0_OVF_vect:
        ; save callers registers
        push    r1                  ;
        push    r0
        in      r0, _SREG           ; get users flag
        push    r0                  ; save on stack
        eor     r1, r1              ; clear r1
        push    r24                 ; save users regs
        push    r25                 ;
        ;
        tst     r2                  ; use r2 to control fade direction (0 = down)
        breq    fade_down

; We are making the LED brighter over time
fade_up:     
        lds     r17, OCR1AL         ; get PWN value
        inc     r17                 ; increase the count, on longer
        sts     OCR1AL, r17         ; write it back
        cpi     r17, 0xff           ; max value
        brne    reset_cnt           ; no, skip
switch_down:
        clr     r2                  ; set direction to down
        rjmp    reset_cnt           ; and reset the counter


; we are making the LED dimmer over time
fade_down:
        lds     r17, OCR1AL         ; get PWN value
        dec     r17                 ; decrease the count (off longer)
        sts     OCR1AL, r17         ; write it back
        tst     r17                 ; hit zero yet?
        brne    reset_cnt           ; if so, switch direction
;
switch_up:
        ldi     r16, 0xff           ; set flag register
        mov     r2, r16             ; set direction to up
;
reset_cnt:
        ldi     r16, 143
        sts     TCNT0, r16

        ; recover user's registers
        pop     r25
        pop     r24
        pop     r0
        out     _SREG, r0           ; restore status reg
        pop     r0
        pop     r1
        reti

