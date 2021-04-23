#include <Arduino.h>

#include "SSD1306Brzo.h"
#include <Bounce2.h>
#include <Rotary.h>
#include <TimeLib.h>
#include <analog_rgb.h>
#include <brzo_i2c.h>
#include <math.h>

// Initialize the OLED display using brzo_i2c
// D2 -> SDA
// D1 -> SCL
SSD1306Brzo display(0x3C, D2, D1, GEOMETRY_128_64);

// init rotary on PINS D4, D3
Rotary rotary = Rotary(D3, D4);

// init button on pin GPIO3
#define BUTTON_PIN 3
Bounce2::Button button = Bounce2::Button();

// pwm pins for driving leds
#define RED_PIN D6
#define GREEN_PIN D5
#define BLUE_PIN D7

analog_rgb rgb_led{RED_PIN, GREEN_PIN, BLUE_PIN};

struct HSV_values {
  uint16_t h = 0;
  uint16_t s = 100;
  uint16_t v = 100;
} hsv;

#define VALID_STATES 3
enum state_HSV { Hue, Saturation, Value };

void setup() {
  // display setup
  display.init();
  display.displayOn();
  display.flipScreenVertically();
  display.setTextAlignment(TEXT_ALIGN_LEFT);
  display.setFont(ArialMT_Plain_16);
  display.clear();
  display.drawProgressBar(2, 30, 120, 4, 0);
  display.display();

  // Serial.begin(115200);
  // Serial.println();
  // Serial.println();

  display.clear();
  display.drawProgressBar(2, 30, 120, 4, 25);
  display.display();

  // buton setup
  button.attach(BUTTON_PIN, INPUT);
  button.interval(25);
  button.setPressedState(HIGH);

  display.clear();
  display.drawProgressBar(2, 30, 120, 4, 50);
  display.display();

  // rotary setup
  rotary.begin(true);
  display.clear();
  display.drawProgressBar(2, 30, 120, 4, 75);
  display.display();

  // setup for led
  // pwm 0-1023 .>> scale = 4
  rgb_led.set_pwm_scale(4);
}

void change_value(unsigned char rotation, unsigned short int *X, int m);

void loop() {
  static unsigned short int state = Hue;

  constexpr char h_prefix[] = "H: ";
  constexpr char s_prefix[] = "S: ";
  constexpr char v_prefix[] = "B: ";
  constexpr char prefix[] = "> ";

  constexpr unsigned short int x = 16;
  constexpr unsigned short int y = 0;

  static unsigned char rot_direction;

  rot_direction = rotary.process();
  button.update();

  if (button.pressed()) {
    // Serial.println("pushed");
    state = (state + 1) % VALID_STATES;
  }
  if (rot_direction) {
    switch (state) {
    case Hue:
      change_value(rot_direction, &hsv.h, 360);
      break;
    case Saturation:
      change_value(rot_direction, &hsv.s, 101);
      break;
    case Value:
      change_value(rot_direction, &hsv.v, 101);
      break;
    default:
      break;
    }
    rgb_led.HSVtoRGB(hsv.h, hsv.v, hsv.s);
    rgb_led.RGB_show();

    // Serial.printf("%d, %d, %d\n", R, G, B);
  }
  display.clear();
  display.drawString(0, y + 16 * state, prefix);
  display.drawString(state == Hue ? x : 0, y + 0,
                     h_prefix + String(hsv.h, DEC));
  display.drawString(state == Saturation ? x : 0, y + 16,
                     s_prefix + String(hsv.s, DEC));
  display.drawString(state == Value ? x : 0, y + 32,
                     v_prefix + String(hsv.v, DEC));
  display.display();
}

#define MOD(a, b) ((((a) % (b)) + (b)) % (b)) // true modulo oprator

/**
 * Changes value of X based on rotation
 *
 * @param rotation Defines rotation of rotary swich
 * @param X Value to change
 * @param m mod value for circular implementation
 */
void change_value(unsigned char rotation, unsigned short int *X, int m) {

  // Serial.println(result == DIR_CW ? "Right" : "Left");
  if (rotation == DIR_CW) {
    *X = MOD((*X + 1), m);
  } else {
    *X = MOD((*X - 1), m);
  }
}