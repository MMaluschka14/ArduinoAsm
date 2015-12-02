; These registers need the mapping macro 
;    if you use them, add the leading underscore to the register name
;    This list is not complete, but is sufficient for cosc2325 projects

; I/O ports -------------------------------------
; DDRB: 0x04 (0x24)
#define _DDRB   _SFR_IO_ADDR(DDRB)

; PORTB: 0x05 (0x25)
#define _PORTB  _SFR_IO_ADDR(PORTB)

; DDRC: 0x07 (0x27)
#define _DDRC   _SFR_IO_ADDR(DDRC)

; PORTC: 0x08 (0x28)
#define _PORTC  _SFR_IO_ADDR(PORTC)

; DDRD: 0x0A (0x2A)
#define _DDRD   _SFR_IO_ADDR(DDRD)

; PORTD: 0x0B (0x2B)
#define _PORTD  _SFR_IO_ADDR(PORTD)

; Timer 0 ---------------------------------------
; TIFR0: 0x15 (0x25)
#define _TIFR0    _SFR_IO_ADDR(TIFR0)

; TCCR0A: 0x24 (0x44)
#define _TCCR0A    _SFR_IO_ADDR(TCCR0A)

; TCCR0B: 0x25 (0x45)
#define _TCCR0B    _SFR_IO_ADDR(TCCR0B)

; TCNT0: 0x26 (0x46)
#define _TCNT0    _SFR_IO_ADDR(TCNT0)

; OCR0A: 0x27 (ox47)
#define _OCR0A    _SFR_IO_ADDR(OCR0A)

; OCR0B: 0x28 (0x48)
#define _OCR0B    _SFR_IO_ADDR(OCR0B)

; Timer 1 ---------------------------------------
; TIFR1: 0x16 (0x26)
#define _TIRF1    _SFR_IO_ADDR(TIFR1)

; chip initialization ---------------------------
; SPL: 0x3D (0x5D)
#define _SPL    _SFR_IO_ADDR(SPL)

; SPH: 0x3E (0x5E)
#define _SPH    _SFR_IO_ADDR(SPH)

; SREG 0x3F (0x5F)
#define _SREG    _SFR_IO_ADDR(SREG)
