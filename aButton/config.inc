; config.inc - pin assignments for this project

#include <avr/io.h>
#include "../include/special_regs.inc"

#define     LED_PORT    _PORTB
#define     LED_DIR     _DDRB
#define     LED_PIN     5

#define     BUTTON_PORT _PORTD
#define     BUTTON_DIR  _DDRD
#define     BUTTON_PIN  2



