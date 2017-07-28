import processing.serial.*;
import processing.sound.*;


SoundFile shoot, explosion, end; // sound effects
int height = 720; //height of the screen
int width = 1080; //width of the screen
Target t = new Target (width, height); //define a target
Cannon c = new Cannon (width, height); //define a cannon
private char left = 'a'; 
PImage bg , boxTank; 
boolean playEndSound = true;
Animation a; //explosion animation;
Serial port;  
int data;
int startTime;
int last =0;


void setup(){
  size(1080, 720); //define the screen size
  frameRate(60); //define the fps
  port = new Serial(this, Serial.list()[0], 9600);
  bg = loadImage ("background1.png");
  boxTank= loadImage ("tank box.png");
  
  t.setup(); //setting up target's setup
  c.setup(); //setting up cannon's setup
  
  //sound effects
  shoot = new SoundFile(this, "shoot.mp3");
  explosion = new SoundFile(this, "explosion.mp3");
  end = new SoundFile(this, "end.mp3");
  
  //animations
   a = new Animation();
   
}

  
  
void draw(){ 
  
   if(c.checkAmmo()==true){
   background(100); //define the background color
   image (bg ,0,0); //background picture
   image (boxTank ,(width/2)-43, height-120);
   c.drawCannon();
   textSize(28); //define text size
   text("bullets left:" + c.getB(), width*0.01 , height*0.05);
   text("SCORE:"+ c.score, width*0.2 , height*0.05);
   t.drawTarget();
   checkKey();
   }
   
   else{
     background(0);
     textSize(32);
     text("GAME OVER", width/2.35 , height/2);
     text("SCORE:"+ c.score, width/2.35 , height/2.5);
     
     if (playEndSound == true) {
       end.play();
       playEndSound = false;
     }
   }
   
}



//checks key and adds rotation
public void checkKey(){
   if((c.rot>-0.4)&&inputCheck()==1){
  //   println(1);
    c.rot-=0.003;
 }
  if((c.rot<0.4)&&inputCheck()==2){
    c.rot+=0.003;
  } 
}

public int inputCheck(){
    if (port.available() >0){
    data = port.read();
  }
  int temp = data;
  
  if(data == 1){
   println("LEFT");
   data = 0;

  }
  
   if(data == 2){ 
 println("RIGHT");
  data = 0;
  }
  
     if(data == 3){ 
 println("LEFT&&RIGHT");
  data = 0;
  }
  return temp;
}

void keyPressed(){
}