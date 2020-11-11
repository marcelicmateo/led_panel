#include <Arduino.h>

#include <TimeLib.h>
#include <brzo_i2c.h>
#include "SSD1306Brzo.h"
#include <Rotary.h>
#include <Bounce2.h>
#include <math.h>

// Initialize the OLED display using brzo_i2c
// D2 -> SDA
// D1 -> SCL
SSD1306Brzo display(0x3C, D2, D1, GEOMETRY_128_64);

//init rotary on PINS D4, D3
Rotary rotary = Rotary(D3, D4);

//init button on pin GPIO3
#define BUTTON_PIN 3
Button button = Button();

//pwm pins for driving leds
#define RED_PIN D6
#define GREEN_PIN D5
#define BLUE_PIN D7

void setup()
{
  //display setup
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

  //rotary setup
  rotary.begin(true);
  display.clear();
  display.drawProgressBar(2, 30, 120, 4, 75);
  display.display();

  //pwm setup for led
  pinMode(BLUE_PIN, OUTPUT);
  pinMode(RED_PIN, OUTPUT);
  pinMode(BLUE_PIN, OUTPUT);
  analogWrite(GREEN_PIN, 0);
  analogWrite(RED_PIN, 1023);
  analogWrite(BLUE_PIN, 0);
}

struct RGB_values {
      char red = 0;
      char green = 0;
      char blue = 0;
    } RGB;
struct HSV_values{
  unsigned short int h =0;
  unsigned short int s =100;
  unsigned short int v=100;
} hsv;

enum state_HSV
{
  Hue,
  Saturation,
  Value
};
#define VALID_STATES 3

void HSVtoRGB(HSV_values hsv, RGB_values *rgb);
void change_value(unsigned char rotation, unsigned short int *X, int m);

void loop()
{
  static unsigned short int state = Hue;

  constexpr  char h_prefix[] = "H: ";
  constexpr  char s_prefix[] = "S: ";
  constexpr  char v_prefix[] = "B: ";
  constexpr  char prefix[] = "> ";

  constexpr unsigned short int x = 16;
  constexpr unsigned short int y = 0;



  static unsigned char rot_direction;
  
  rot_direction = rotary.process();
  button.update();

  if (button.pressed())
  {
    //Serial.println("pushed");
    state = (state + 1) % VALID_STATES;
  }
  if (rot_direction)
  {
    switch (state)
    {
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
    HSVtoRGB(hsv, &RGB);
    analogWrite(GREEN_PIN, RGB.green);
    analogWrite(RED_PIN, RGB.red);
    analogWrite(BLUE_PIN, RGB.blue);
    // Serial.printf("%d, %d, %d\n", R, G, B);
  }
  display.clear();
  display.drawString(0, y + 16*state, prefix);
  display.drawString(state == Hue ? x : 0, y+0, h_prefix + String(hsv.h, DEC));
  display.drawString(state == Saturation ? x : 0, y+16, s_prefix + String(hsv.s, DEC));
  display.drawString(state == Value ? x : 0, y+32, v_prefix + String(hsv.v, DEC));
  display.display();
}


#define MOD(a, b) ((((a) % (b)) + (b)) % (b))

/**
 * Changes value of X based on rotation 
 * 
 * @param rotation Defines rotation of rotary swich
 * @param X Value to change
 * @param m mod value for circular implementation
 */  
void change_value(unsigned char rotation, unsigned short int *X, int m)
{
  
    // Serial.println(result == DIR_CW ? "Right" : "Left");
    if (rotation == DIR_CW)
    {
      *X = MOD((*X + 1), m);
    }
    else
    {
      *X = MOD((*X - 1), m);
    }
  
}
/**
 * Convert hue value sturatuon to rgb values
 */
void HSVtoRGB(HSV_values hsv, RGB_values *rgb)
{

  double s = double(hsv.s) / 100;
  double v = double(hsv.v) / 100;
  double C = s * v;
  double X = C * (1 - fabs(fmod(double(hsv.h) / 60.0, 2.0) - 1));
  double m = v - C;
  double r, g, b;

  if (hsv.h >= 0 && hsv.h < 60)
  {
    r = C, g = X, b = 0;
  }
  else if (hsv.h >= 60 && hsv.h < 120)
  {
    r = X, g = C, b = 0;
  }
  else if (hsv.h >= 120 && hsv.h < 180)
  {
    r = 0, g = C, b = X;
  }
  else if (hsv.h >= 180 && hsv.h < 240)
  {
    r = 0, g = X, b = C;
  }
  else if (hsv.h >= 240 && hsv.h < 300)
  {
    r = X, g = 0, b = C;
  }
  else
  {
    r = C, g = 0, b = X;
  }

  // multiply by for for full range of 1024 PWM values
  rgb->red = (r + m) * 255 * 4;
  rgb->green = (g + m) * 255 * 4;
  rgb->blue = (b + m) * 255 * 4;
}