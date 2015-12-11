#include <avr/io.h>
#include <util/delay.h>

int main(void) {

    DDRB = 0xff;    // make all pins ouputs
    DDRD &= 0xFB;   // pull bit 2 down (input)
    PORTD |= 0x04;  // enable pullups

    while(1){
        if (PIND & 0x04)
            PORTB &= ~0x20;
        else
            PORTB |= 0x20;
    }
}
