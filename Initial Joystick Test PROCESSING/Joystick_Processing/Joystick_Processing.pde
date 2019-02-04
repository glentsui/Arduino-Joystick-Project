import processing.serial.*;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port



void setup(){
  //Change here the number of the port
  String portName = Serial.list()[2]; 
  
  printArray(Serial.list());
  size(500,500);
  println(portName);
  myPort = new Serial(this, portName, 9600);
  println(portName);
}
 
void draw()
{
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n'); 
  
    if(val!=null && val.contains("left")){
      PImage img;
      img = loadImage("images/left.png");
      background(img);
      println("left");
    }else if (val!=null && val.contains("right")){
      println("right");
      PImage img;
      img = loadImage("images/right.png");
      background(img);
    }else if (val!=null && val.contains("up")){
      println("up");
      PImage img;
      img = loadImage("images/up.png");
      background(img);
    }else if (val!=null && val.contains("down")){
      println("down");
      PImage img;
      img = loadImage("images/down.png");
      background(img);
    }else{
      println("stop");
      PImage img;
      img = loadImage("images/stop.png");
      background(img); 
    }

  }
}