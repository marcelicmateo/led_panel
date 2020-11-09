#include <Arduino.h>

#include <TimeLib.h>
#include <brzo_i2c.h>
#include "SSD1306Brzo.h"
#include <Rotary.h>
#include <Bounce2.h>
#include <math.h>

#define MOD(a, b) ((((a) % (b)) + (b)) % (b))

void HSVtoRGB(short int *H, short int *S, short int *V, short unsigned int *R, short unsigned int *G, short unsigned int *B)
{

  double s = double(*S) / 100;
  double v = double(*V) / 100;
  double C = s * v;
  double X = C * (1 - fabs(fmod(double(*H) / 60.0, 2.0) - 1));
  double m = v - C;
  double r, g, b;
  if (*H >= 0 && *H < 60)
  {
    r = C, g = X, b = 0;
  }
  else if (*H >= 60 && *H < 120)
  {
    r = X, g = C, b = 0;
  }
  else if (*H >= 120 && *H < 180)
  {
    r = 0, g = C, b = X;
  }
  else if (*H >= 180 && *H < 240)
  {
    r = 0, g = X, b = C;
  }
  else if (*H >= 240 && *H < 300)
  {
    r = X, g = 0, b = C;
  }
  else
  {
    r = C, g = 0, b = X;
  }

  // multiply by 4for for 0 - 1024 range of pwm
  *R = (r + m) * 255 * 4;
  *G = (g + m) * 255 * 4;
  *B = (b + m) * 255 * 4;
}

// Initialize the OLED display using brzo_i2c
// D2 -> SDA
// D1 -> SCL
SSD1306Brzo display(0x3C, D2, D1);

//init rotary on PINS D4, D3
Rotary r = Rotary(D3, D4);

//init button on pin GPIO3
#define BUTTON_PIN 3
Button b = Button();

//pwm pins for driving leds
#define RED_PIN D6
#define GREEN_PIN D5
#define BLUE_PIN D7

void setup()
{
  //display setup
  display.init();
  display.displayOn();
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
  b.attach(BUTTON_PIN, INPUT);
  b.interval(25);
  b.setPressedState(HIGH);
  display.clear();
  display.drawProgressBar(2, 30, 120, 4, 50);
  display.display();

  //rotary setup
  r.begin(true);
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

enum state_HSV
{
  Hue,
  Saturation,
  Value
};
#define VALID_STATES 3

void change_value(unsigned char result, short int *X, int m)
{
  if (result)
  {
    // Serial.println(result == DIR_CW ? "Right" : "Left");
    if (result == DIR_CW)
    {
      *X = MOD((*X + 1), m);
    }
    else
    {
      *X = MOD((*X - 1), m);
    }
  }
}

void loop()
{
  static short int H = 0;
  static short int S = 100;
  static short int V = 100;
  static unsigned short int R, G, B;
  static unsigned short int state = Hue;

  static String h_prefix = "H: ";
  static String s_prefix = "S: ";
  static String v_prefix = "B: ";

  unsigned char result = r.process();
  b.update();

  if (b.pressed())
  {
    //Serial.println("pushed");
    state = (state + 1) % 3;
  }
  if (result)
  {
    switch (state)
    {
    case Hue:
      change_value(result, &H, 360);
      break;
    case Saturation:
      change_value(result, &S, 101);
      break;
    case Value:
      change_value(result, &V, 101);
      break;
    default:
      break;
    }
    HSVtoRGB(&H, &S, &V, &R, &G, &B);
    analogWrite(GREEN_PIN, G);
    analogWrite(RED_PIN, R);
    analogWrite(BLUE_PIN, B);
    // Serial.printf("%d, %d, %d\n", R, G, B);
  }
  display.clear();
  display.drawString(0, 0, h_prefix + String(H, DEC));
  display.drawString(0, 16, s_prefix + String(S, DEC));
  display.drawString(0, 32, v_prefix + String(V, DEC));
  display.display();
}