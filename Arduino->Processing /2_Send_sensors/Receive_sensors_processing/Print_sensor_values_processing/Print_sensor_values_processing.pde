import processing.serial.*; //import the Serial library

int end = 10;   // the number 10 is ASCII for linefeed (end of serial.println), later we will look for this to break up individual messages
String serial;  // declare a new string called 'serial'. A string is a sequence of characters (data type known as "char")
Serial port;    // The serial port, this is a new instance of the Serial class (an Object)

//-----------------------------------------------------
void setup() {
  println(Serial.list());
  port = new Serial(this, Serial.list()[2], 9600); // initializing the object by assigning a port and baud rate (must match that of Arduino)
  port.clear(); // function from serial library that throws out the first reading, in case we started reading in the middle of a string from Arduino
  serial = port.readStringUntil(end); // function that reads the string from serial port until a println and then assigns string to our string variable (called 'serial')
  serial = null;  // initially, the string will be null (empty)  
}

//-----------------------------------------------------
void draw() {
  background(0);
  while (port.available () > 0) { //as long as there is data coming from serial port, read it and store it
    serial = port.readStringUntil(end);
    println("Port is available!!");
  }  

  if (serial != null) { // if the string is not empty, print the following
    /* Note: the split function used below is not necessary if sending only a single variable. However, it is useful for parsing (seperating) message when
     reading from multiple inputs in Arduino. Below is example code fro an Arduino sketch
     */

    String[] a = split(serial, ','); // a new array (called 'a') that stores values into seperate cells (seperated by commas specified in your Arduino program)
    println(a[0]); //print Value1 (in cell 1 of Array - remember that arrays are zero-indexed)
    println(a[1]); //print Value2 value    
    println(a[2]); //print Value3 value
    println("-------------");
  }
}