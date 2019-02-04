 //gnd to gnd
 //5v to 5v
 //VRx to A1
 //Vry to A0
 //SW to 2

int vertical = A1;      // select the input pin for the vert
int horizontal = A0;    // select the input pin for the hort
int x = 0;              // variable for store the value of the input of the vertical input
int y = 0;              // variable for store the value of the input of the horizontal input
int TOPMARGIN=700;      // margin to determine the zone of no movement
int BOTTOMMARGIN = 200; // margin to determine the zone of no movement

void setup() {
  Serial.begin(9600);
}

void loop() {
  // read the value from the vertical and horizontal inputs
  x = analogRead(vertical);
  y = analogRead(horizontal);
//delay 40-50 for basket and maze game
  delay(40);

  if(x > TOPMARGIN && y > TOPMARGIN){
    if(x>y){
      Serial.println("right");
    }else{
      Serial.println("down");
    }
  }else if(x > TOPMARGIN && y < TOPMARGIN){
    if(x>y && y>125){
      Serial.println("right");
    }else{
      Serial.println("up");
    }
  }else if(x < BOTTOMMARGIN && y < BOTTOMMARGIN){
    if(x<y && y>125){
      Serial.println("left");
    }else{
      Serial.println("up");
    }
  }else if(x < BOTTOMMARGIN && y < BOTTOMMARGIN){
    if(x>y && x>125){
      Serial.println("down");
    }else{
      Serial.println("left");
    }
  }else if(x>TOPMARGIN){
    Serial.println("right");
  }else if(x<BOTTOMMARGIN){
    Serial.println("left");
  }else if(y>TOPMARGIN){
    Serial.println("down");
  }else if(y<BOTTOMMARGIN){
    Serial.println("up");
  }else{
    Serial.println("stop");
  }
}
