int LED_PIN_1 = 10;
int LED_PIN_2 = 9;
int LED_PIN_3 = 8;

int data[] = {0, 0, 0};

//----------------------------------------
void setup() {
  Serial.begin(9600); // Start serial communication at 9600 bps
  pinMode(LED_PIN_1, OUTPUT);
  pinMode(LED_PIN_2, OUTPUT);
  pinMode(LED_PIN_3, OUTPUT);
}

//----------------------------------------
void loop() {
  int bytes_read = 0;
  while (bytes_read < 3) {
    if (Serial.available() > 0) {
      data[bytes_read] = Serial.read();
      bytes_read++;
      // after this point values[]
      // has the most recent set of
      // all values sent in from Processing
    }
  }

  if (data[0] == 1) { digitalWrite(LED_PIN_1, HIGH); }
  else if (data[0] == 0) { digitalWrite(LED_PIN_1, LOW); }

  if (data[1] == 1) { digitalWrite(LED_PIN_2, HIGH); }
  else if (data[1] == 0) { digitalWrite(LED_PIN_2, LOW); }

  if (data[2] == 1) { digitalWrite(LED_PIN_3, HIGH); }
  else if (data[2] == 0) { digitalWrite(LED_PIN_3, LOW); }

  delay(10); // Wait 10 milliseconds for next reading
}


