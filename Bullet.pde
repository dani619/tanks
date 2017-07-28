
class Bullet {

private float x; //the x location in the axis
private float y; //the y location in the axis
private float rotation;
private int speed = 5; //the speed of the bullet
PImage bulletImage;
boolean a = true;



//-----CONSTRUCTOR-----//
public Bullet(float x, float y, float rotation){
  this.x = x;
  this.y = y;
  this.rotation = rotation;
}



//-----SETUP-----//
void setup(){
}



//-----DRAW-----//
void drawBullet(){
  bulletImage = loadImage ("bullet1.png");
  drawRotation(this.rotation);
  shootBullet(this.rotation);
}
  
  
  
//the function receives the curve and rotates the bullet accordingly
  public void drawRotation(float rotation){
  pushMatrix();
  translate(x+ bulletImage.width/2+rotation*3, y + bulletImage.height/2);
  rotate(rotation);
  translate(rotation*5-bulletImage.width/2, -bulletImage.height/2);
  image(bulletImage, 0, 0);
  popMatrix();
}



//the function recives the curve and moves the bullet accordingly to speed
public void shootBullet(float rotation){
  
  if(rotation>0){
    setX(x+(rotation%1*10));
    setY(y-speed);
  }

  if(rotation<0){
    setX(x+(rotation%1*10));
    setY(y-speed);
  }

  if(rotation ==0){
    setY(y-speed);
  }

}
 
 
 
//the function receives a target and returns the calculation of the distance between them
public float distance(Target t){
  float x1 = getFixedX();
  float y1 = getFixedY();
  float x2 = t.getFixedX();
  float y2 = t.getFixedY();
  return (float) Math.sqrt(Math.pow((x2-x1), 2)+Math.pow((y2-y1), 2));
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


public float getFixedX(){
  float x1 = this.x+3;
  return x1;
}


public float getFixedY(){
  float y1 = this.y+10;
  return y1;
}


public void setX(float num){
  this.x = num;
}


public void setY(float num){
  this.y = num;
}


}