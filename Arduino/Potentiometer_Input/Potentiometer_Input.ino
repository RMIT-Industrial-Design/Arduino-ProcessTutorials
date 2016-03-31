#define POT_PIN_1 0
#define POT_PIN_2 1
#define BUTTON_PIN 2

#define LED_PIN_1 10
#define LED_PIN_2 9
#define LED_PIN_3 8

void setup() {
  Serial.begin(9600);
  pinMode(LED_PIN_1, OUTPUT);
  pinMode(LED_PIN_2, OUTPUT);
  pinMode(LED_PIN_3, OUTPUT);
  pinMode(BUTTON_PIN, INPUT);
  digitalWrite(BUTTON_PIN, HIGH); // connect internal pull-up
}

void loop() {
  int pot1value = analogRead(POT_PIN_1);
  int pot2value = analogRead(POT_PIN_2);
  int buttonValue = digitalRead(BUTTON_PIN);

//  Serial.print(F("Pot Value 1 = "));
//  Serial.println(pot1value);
//  Serial.print(F("Pot Value 2 = "));
//  Serial.println(pot2value);
  Serial.print(F("Button Value = "));
  Serial.println(buttonValue);

  if (buttonValue == 0) {
    digitalWrite(LED_PIN_1, HIGH);
    digitalWrite(LED_PIN_2, HIGH);
    digitalWrite(LED_PIN_3, HIGH);
  } else {
    digitalWrite(LED_PIN_1, LOW);
    digitalWrite(LED_PIN_2, LOW);
    digitalWrite(LED_PIN_3, LOW);
  }

  delay(20);
}
