
class Target {

public int maxHealth = 150; 
public int health = 150; //Health points of the target in game
private float x; //the x location in the axis
private float y; //the y location in the axis
private int speed = 4; //the speed of the target in game
private int targetSize = 60; //the size of the target in game
PImage targetImage;



//-----CONSTRUCTOR-----//
public Target(float x, float y){
  this.x = x*0.11; //setting the x location in the axis relative to the screen size
  this.y = y*0.15; //setting the y location in the axis relative to the screen size
}



//-----SETUP-----//
void setup(){
  targetImage = loadImage ("target1.png");
}



//-----DRAW-----//
void drawTarget() { 
  ellipse(getX()+29, getY()+29, targetSize, targetSize);
  image(targetImage, getX(), getY());
  if(health<=100){
    a.drawAnimation();
  }
  setX(getX()+speed);
  check(getX());
  checkHp();
}



//the function recives the x location in the axis and flips the direction if target is out of the screen
public void check(float x){
  if((x>width-targetSize/2-30)||(x<targetSize/2-30)) {
    speed *= -1;
  }
}



//check traget health points
public void checkHp(){
  if(this.health <=0){
    explosion.play();
    speed = (int) (speed*1.5);
    resetHp();
    a.draw = true;
    a.timeI =0;
    c.bullets += 4;
  }
}



//the function receives the amount of damage and deals it to the target
public void damage(int Damage){
   this.health = this.health - Damage;
}



//reset target health to max health
public void resetHp(){
  this.health = maxHealth;
}



//-------------------SETTERS AND GETTERS-----------------------------//


public float getX(){
  float x1 = this.x;
  return x1;
}


public float getY(){
  float y1 = this.y;
  return y1;
}


public void setX(float num){
  this.x = num;
}

    
public float getFixedX(){
  float x1 = this.x+29;
  return x1;
}


public float getFixedY(){
  float y1 = this.y+29;
  return y1;
}      


public float getHealth(){
  int x1 = this.health;
  return x1;
}


}