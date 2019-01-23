#include "FastLED.h"
FASTLED_USING_NAMESPACE
#if defined(FASTLED_VERSION) && (FASTLED_VERSION < 3001000)
#warning "Requires FastLED 3.1 or later; check github for latest code."
#endif

#define DATA_PIN    10
#define LED_TYPE    WS2812B
#define COLOR_ORDER GRB
#define NUM_LEDS    144
CRGB leds[NUM_LEDS];

#define BRIGHTNESS 255
#define FRAMES_PER_SECOND  120

int colors[] = {0,0,0};
int currentValue = 0;
int incomingValue;

void setup() {
  Serial.begin(1000000);
  FastLED.addLeds<LED_TYPE,DATA_PIN,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.setBrightness(BRIGHTNESS);
}

void loop(){
  
  if (Serial.available()) { 
    int incomingValue = Serial.read();  
    colors[currentValue] = incomingValue;
    currentValue++;
    if(currentValue > 2){
      currentValue = 0;
    }
  }

  if(colors[0] > 255)
    colors[0] = 255;
  if(colors[1] > 255)
    colors[1] = 255;
  if(colors[2] > 255)
    colors[2] = 255;

  for( int i = 0; i < NUM_LEDS; i++) {
    leds[i] = CRGB (colors[0], colors[1], colors[2]);
  }
  FastLED.show();
}
  
  




