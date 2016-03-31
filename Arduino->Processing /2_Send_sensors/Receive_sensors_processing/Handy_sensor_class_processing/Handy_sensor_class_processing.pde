ArduinoInput input; // Import our ArduinoInput Class 

//-----------------------------------------------------
void setup() {
  size(640,480);
  background(0,0,0);
  input = new ArduinoInput(this); // call the constructor of ArduinoInput
}
//-----------------------------------------------------
void draw() {
  //background(0,0,0);
  
  if(input.getSensor()[2] == 0){ background(random(255),random(255),random(255)); }
  
  float radius = input.getSensor()[0]; // Use the index to define which sensor you want
  ellipse(width/2,height/2, radius, radius);
}

