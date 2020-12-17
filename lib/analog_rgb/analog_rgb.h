#ifndef analog_rgb_h
#define anlog_rgb_h
#endif

#include <stdint.h>

#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "WProgram.h"
#endif


class analog_rgb
{

    // rgb color values
    private:
        char red = 0;
        char green = 0;
        char blue = 0;

    //hardware pins of rgb LED
    private:
        const uint8_t red_pin;
        const uint8_t green_pin;
        const uint8_t blue_pin;

    // scales range of pwm to match hardware 
    private: 
        int8_t pwm_scale;

    //constructor
    public:
        analog_rgb(const uint8_t red_pin,const uint8_t green_pin, const uint8_t blue_pin, int8_t scale=1)
            :red{0},green{0},blue{0}, red_pin{red_pin}, green_pin{green_pin}, blue_pin{blue_pin}, pwm_scale{scale}{
                pinMode(red_pin, OUTPUT);
                pinMode(green_pin, OUTPUT);
                pinMode(blue_pin, OUTPUT);
        }
    // sets pwm pins 
        void RGB_show(){
            analogWrite(red_pin, red * pwm_scale);
            analogWrite(green_pin, green * pwm_scale);
            analogWrite(blue_pin, blue * pwm_scale);
            return;
        }

        void set_pwm_scale(const int8_t s){
            pwm_scale=s;
            return;
        }

        void HSVtoRGB(const uint16_t hue, const uint16_t value, const uint16_t saturation);


};