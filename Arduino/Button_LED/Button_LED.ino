// setup variables to remember which pins are in use
int LEDpin = 10;
int buttonPin = 8;

// the setup routine runs once when you press reset:
void setup() {    
  // initialize the button pin as an input.
  pinMode(buttonPin, INPUT);
  digitalWrite(buttonPin, HIGH);   // turn on the internal pull-up resistor   
  // initialize the LED pin as an output.
  pinMode(LEDpin, OUTPUT);     
}

// the loop routine runs over and over again forever:
void loop() {
  // read the button pin
  int butonState = digitalRead(buttonPin);

  if(butonState == false){
    digitalWrite(LEDpin, HIGH);   // turn the LED on
} else {
    digitalWrite(LEDpin, LOW);   // turn the LED off
  }
}
