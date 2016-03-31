// We need to add the ControlP5 GUI library
// Click 'sketch' -> 'Import Library' -> 'ControlP5'
// Note: If ControlP5 is not in the list you may need to download it
// fist by clicking 'Add Library' and searching for ControlP5 in the 
// list. 
import controlP5.*;
import processing.serial.*;

Serial myPort;  // Create object from Serial class
ControlP5 cp5; // Create a ControlP5 Object

int[] values = {0,0,0};
byte out[] = new byte[3];

//----------------------------------------
void setup() {
  size(335, 130); //make our canvas 200 x 200 pixels big
  background(0,0,0);
  
  // Setup serial connection
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  
  // Setup GUI
  cp5 = new ControlP5(this);
  createButtons();
}

//----------------------------------------
void draw() {
  // Assign the values of the GUI toggles to our values[] array
  values[0] = (int)cp5.getController("LED 1").getValue();
  values[1] = (int)cp5.getController("LED 2").getValue();
  values[2] = (int)cp5.getController("LED 3").getValue();
  
  // load up all the values into a byte array
  // then send the full byte array out over serial
  // NOTE: This only works for values from 0-255  
  out[0] = byte(values[0]);
  out[1] = byte(values[1]);
  out[2] = byte(values[2]);
  myPort.write(out);
}

//-------------------------------------
void createButtons() {
  // Firstly, we create a group that out buttons will bind to. 
  Group buttons = cp5.addGroup("buttons")
    .setPosition(15, 20)
      .setBackgroundHeight(90)
        .setWidth(305)
          .setBackgroundColor(color(255,100,20, 40))
            ;

  // Secondly, we will write a label on screen to notify the user what 
  // the sliders control.
  Textlabel ButtonLabel;

  ButtonLabel = cp5.addTextlabel("buttonLabel")
    .setText("LED Array State")
      .setPosition(5, 5)
        .setColorValue(0xffffff00)
          .setFont(createFont("Georgia", 15))
            .setGroup(buttons);
  ;

  // Here we add a button
  cp5.addToggle("LED 1")
    .setPosition(10, 30)
      .setSize(80, 39)
        .setValue(values[0])
          .setGroup(buttons);
  ;
  
    // Here we add a button
  cp5.addToggle("LED 2")
    .setPosition(110, 30)
      .setSize(80, 39)
        .setValue(values[1])
          .setGroup(buttons);
  ;
  
      // Here we add a button
  cp5.addToggle("LED 3")
    .setPosition(210, 30)
      .setSize(80, 39)
        .setValue(values[2])
          .setGroup(buttons);
  ;
}
