#include "analog_rgb.h"


/**
 * Convert hue value sturatuon to rgb values
 */
void analog_rgb::HSVtoRGB(const uint16_t hue, const uint16_t value, const uint16_t saturation)
{

  double s = double(saturation) / 100;
  double v = double(value) / 100;
  double C = s * v;
  double X = C * (1 - fabs(fmod(double(hue) / 60.0, 2.0) - 1));
  double m = v - C;
  double r, g, b;

  if (hue >= 0 && hue < 60)
  {
    r = C, g = X, b = 0;
  }
  else if (hue >= 60 && hue < 120)
  {
    r = X, g = C, b = 0;
  }
  else if (hue >= 120 && hue < 180)
  {
    r = 0, g = C, b = X;
  }
  else if (hue >= 180 && hue < 240)
  {
    r = 0, g = X, b = C;
  }
  else if (hue >= 240 && hue < 300)
  {
    r = X, g = 0, b = C;
  }
  else
  {
    r = C, g = 0, b = X;
  }

  red = (r + m) * 255;
  green = (g + m) * 255 ;
  blue = (b + m) * 255;
}