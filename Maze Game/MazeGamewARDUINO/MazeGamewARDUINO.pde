PImage maze;
import processing.serial.*;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port

int x = 162;
int y = 162;

void setup(){
  
  String portName = Serial.list()[2]; 
  printArray(Serial.list());
  println(portName);
  myPort = new Serial(this, portName, 9600);
  println(portName);
  
  size (324, 324);
  maze = loadImage("Images/maze.png");
}

void draw(){
    image(maze, 0, 0);
    if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n'); 
  
    if(val!=null && val.contains("left")){
      x--;
      println("left");
    }else if (val!=null && val.contains("right")){
      println("right");
      x++;
    }else if (val!=null && val.contains("up")){
      println("up");
      y--;
    }else if (val!=null && val.contains("down")){
      println("down");
      y++;
    }else{
      println("stop");
    }
}
    if((x > 165) && (x < 180) && (y <10)){
      textSize(48);
      textAlign(CENTER);
        fill(255,0,0);
        text("YOU WIN!", width/2, height/2);
    }
    
    fill(255, 0, 0);        
  noStroke();
  float touch = red(get(x, y));
  ellipse(x, y, 10, 10);
  
  if(touch < 255){
    x =162;
    y = 162;
  }
  println(mouseX + "," + mouseY);
}