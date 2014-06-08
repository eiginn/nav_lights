#include <Adafruit_NeoPixel.h>

#define PIN 6
#define NUM_PIXELS 40

Adafruit_NeoPixel strip = Adafruit_NeoPixel(NUM_PIXELS, PIN, NEO_GRB + NEO_KHZ800);

void setup() {
  strip.begin();
  strip.show(); // Initialize all pixels to 'off'
}

void loop() {
  strobe();
}

void strobe() {
  // initial color
  for(uint16_t i=0; i<NUM_PIXELS; i++) {
    strip.setPixelColor(i, 28, 0, 0);
  }
  strip.show();
  
  // fade in
  for(uint16_t b=28; b<128; b+=4) {
    for(uint16_t i=0; i<NUM_PIXELS; i++) {
      strip.setPixelColor(i, b, 0, 0);
    }
    strip.show();
    delay(30);
  }
  delay(70);
  
  // blink white
  for(uint16_t i=0; i<NUM_PIXELS; i++) {
    strip.setPixelColor(i, 255, 255, 255);
  }
  strip.show();
  delay(90);
  for(uint16_t i=0; i<NUM_PIXELS; i++) {
    strip.setPixelColor(i, 128, 0, 0);
  }
  strip.show();
  // time between white flashes
  delay(40);
  for(uint16_t i=0; i<NUM_PIXELS; i++) {
    strip.setPixelColor(i, 255, 255, 255);
  }
  strip.show();
  delay(90);
  // fade out
  for(uint16_t b=128; b>28; b-=4) {
    for(uint16_t i=0; i<NUM_PIXELS; i++) {
      strip.setPixelColor(i, b, 0, 0);
    }
    strip.show();
    delay(30);
  }
}
