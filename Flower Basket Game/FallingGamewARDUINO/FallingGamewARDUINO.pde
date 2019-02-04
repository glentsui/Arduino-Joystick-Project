import processing.serial.*;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port

PImage img;//define a reference to an image object
PFont f; //define a font 'object' to store the font reference
PImage flower;//define a reference to an image object
PImage basket;//define a reference to an image object
PImage game;//define a reference to an image object
PImage black;//define a reference to an image object
int x = 400;//x of basket
int y = 320;//y of basket

int a1 = int(random(0, 760)+1);//a of flower 1
int b1 = int(random(-200, 0)+1);//b of flower 1
int a2 = int(random(0, 760)+1);//a of flower 2
int b2 = int(random(-200, 0)+1);//b of flower 2
int a3 = int(random(0, 760)+1);//a of flower 3
int b3 = int(random(-200, 0)+1);//b of flower 3
int a4 = int(random(0, 760)+1);//a of flower 4
int b4 = int(random(-200, 0)+1);//b of flower 4
int a5 = int(random(0, 760)+1);//a of flower 5
int b5 = int(random(-200, 0)+1);//b of flower 5

int s1 = int(random(2, 5))+1;//speed 1
int s2 = int(random(2, 5))+1;//speed 2
int s3 = int(random(2, 5))+1;//speed 3
int s4 = int(random(2, 5))+1;//speed 4
int s5 = int(random(2, 5))+1;//speed 5


int c = 0;//number caught
int maxMisses = 0;//number missed
boolean r = false;//swiches from game and ending game
//import ddf.minim.*;// need to load the MINIM library
//Minim minim;// create a MINIM object
//AudioPlayer caught;
//AudioPlayer missed;

void setup() {
  //minim = new Minim(this);//loads minum
  size (800, 500);// set the width and height

  String portName = Serial.list()[2]; 
  printArray(Serial.list());
  println(portName);
  myPort = new Serial(this, portName, 9600);
  println(portName);
  
  //load the image into memory
  img = loadImage("mmr34.jpg");
  img.resize(800, 500);
  flower = loadImage("flower.gif");
  flower.resize(40, 40);
  basket = loadImage("basket.gif");
  basket.resize(150, 100);
  game = loadImage("Game Over1.jpg");
  game.resize(800, 500);

  //load the sound into memory
  //caught = minim.loadFile("caught.mp3");
  //missed = minim.loadFile("missed.mp3");

  //sets font, colours, and line type
  f = createFont("Tekton Pro Ext", 25); //assign the desired font
  textFont(f); //set the current font
  fill(0);
  stroke(0); // set pen colour
  strokeCap(ROUND);//round the line endings
  strokeJoin(ROUND);//round the stroke joints
  strokeWeight(3);
}

void draw() {
  if (r == false) {//begins game   
    background(img);//draws background
    
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n'); 
  
    if(val!=null && val.contains("left")){
      println("left");
      x = x - 10;
    }else if (val!=null && val.contains("right")){
      println("right");
      x = x + 10;
    }
  }
    
    image(basket, x, y);//draws basket

    //makes basket go to other side of screen if it reaches the edge
    if (x > 650) {
      x = 0;
    }
    if (x < 0) {
      x = 650;
    }


    b1 = b1 + s1;//sets the speed 1
    image(flower, a1, b1);//draws flower 1

    if ((b1>320)&&(b1<350)&&(a1>x-10)&&(a1<x+160)) {//catch statement
      b1 = int(random(-100, 0)+1);//b of flower 1
      a1 = int(random(0, 760)+1);//a of flower 1
      c = c + 1;//adds one to caught
      //caught.loop(0);//plays sound of caught
    } else if (b1>500) {//miss statement
      b1=0;//resets b of flower 1
      a1 = int(random(0, 760)+1);//a of flower 1
      maxMisses = maxMisses + 1;//adds one to misses
      //missed.loop(0);//plays sound of missed
    }

    b2 = b2 + s2;//sets the speed 2
    image(flower, a2, b2);//draws flower 2

    if ((b2>320)&&(b2<350)&&(a2>x-10)&&(a2<x+160)) {//catch statement
      b2 = int(random(-100, 0)+1);//b of flower 2
      a2 = int(random(0, 760)+1);//a of flower 2
      c = c + 1;//adds one to caught
      //caught.loop(0);//plays sound of caught
    } else if (b2>500) {//miss statement
      b2=0;//resets b of flower 2
      a2 = int(random(0, 760)+1);//a of flower 2
      maxMisses = maxMisses + 1;//adds one to misses
      //missed.loop(0);//plays sound of missed
    }

    b3 = b3 + s3;//sets the speed 3
    image(flower, a3, b3);//draws flower 3
    if ((b3>320)&&(b3<350)&&(a3>x-10)&&(a3<x+160)) {//catch statement
      b3 = int(random(-100, 0)+1);//b of flower 3
      a3 = int(random(0, 760)+1);//a of flower 3
      c = c + 1;//adds one to caught
      //caught.loop(0);//plays sound of caught
    } else if (b3>500) {//miss statement
      b3=0;//resets b of flower 3
      a3 = int(random(0, 760)+1);//a of flower 3
      maxMisses = maxMisses + 1;//adds one to misses
      //missed.loop(0);//plays sound of missed
    }

    b4 = b4 + s4;//sets the speed 4 
    image(flower, a4, b4);//draws flower 4

    if ((b4>320)&&(b4<350)&&(a4>x-10)&&(a4<x+160)) {//catch statement
      b4 = int(random(-100, 0)+1);//b of flower 4
      a4 = int(random(0, 760)+1);//a of flower 4
      c = c + 1;//adds one to caught
      //caught.loop(0);//plays sound of caught
    } else if (b4>500) {//miss statement
      b4=0;//resets b of flower 4
      a4 = int(random(0, 760)+1);//a of flower 4
      maxMisses = maxMisses + 1;//adds one to misses
      //missed.loop(0);//plays sound of missed
    }

    b5 = b5 + s5;//sets the speed 5
    image(flower, a5, b5);//draws flower 5

    if ((b5>320)&&(b5<350)&&(a5>x-10)&&(a5<x+160)) {//catch statement
      b5 = int(random(-100, 0)+1);//b of flower 5
      a5 = int(random(0, 760)+1);//a of flower 5
      c = c + 1;//adds one to caught
      //caught.loop(0);//plays sound of caught
    } else if (b5>500) {//miss statement
      b5=0;//resets b of flower 5
      a5 = int(random(0, 760)+1);//a of flower 5
      maxMisses = maxMisses + 1;//adds one to misses
      //missed.loop(0);//plays sound of missed
    }

    text("Caught: " +c, 10, 30);//displays caught score
    text("Missed: " + maxMisses, 190, 30);//displays missed score
    line(158, 5, 158, 35);//seperates caught and missed
  }
  if (maxMisses > 15) {//if 15 missed reach
    background(game);//draw game over background
    r = true;//swiches from game and ending game
    //minim.stop();//stops minim
  }  

  if (r == true) {//end game selection
    fill(255);//sets colour
    rect(160, 300, 150, 50);//draws box
    rect(500, 300, 150, 50);//draws box
    fill(0);//sets colour
    text("Play Again", 177, 335);//displays Play Again
    text("Exit", 552, 335);//displays Exit

    if (mouseX > 160 && mouseX < 310 && mouseY > 300 && mouseY < 350 && mousePressed) {//Play Again Button 
      //minim = new Minim(this);//loads minum
      //caught = minim.loadFile("caught.mp3");//load the sound back into the memory
      //missed = minim.loadFile("missed.mp3");//load the sound back into the memory
      r = false;//swiches from game and ending game
      c = 0;//resets caught value
      maxMisses = 0;//resets missed value
      b1 = 0;//b of flower 1
      b2 = 0;//b of flower 2
      b3 = 0;//b of flower 3
      b4 = 0;//b of flower 4
      b5 = 0;//b of flower 5
    } else if (mouseX > 500 && mouseX < 650 && mouseY > 300 && mouseY < 350 && mousePressed) {//Exit Button
      exit();//closes the game
    }
  }
}