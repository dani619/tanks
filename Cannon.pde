
class Cannon {
  
public int score = 0;
private int bullets = 9; //the amount of bullets available to the player
private float x; //the x location in the axis
private float y; //the y location in the axis
public float rot =0; //the rotation curve, - is left, + is right
PImage CannonImage ;
private Bullet arr[] = new Bullet [bullets]; //setting an array of all the bullets
boolean launched = false;



//-----CONSTRUCTOR-----//
public Cannon(float x, float y){
  this.x = (x/2)-15;
  this.y = y-148;
}



//-----SETUP-----//
void setup(){
  CannonImage = loadImage ("cannon1.png");
}



//-----DRAW-----//
void drawCannon(){
  checkBullet();
  drawRotation(rot);
}



//function receives the curve and rotate the cannon accordingly
public void drawRotation(float rotation){
  pushMatrix();
  translate(x+rot*10+ CannonImage.width/2, y + CannonImage.height/2);
  rotate(rotation);
  translate((-CannonImage.width/2)+rot*15, -CannonImage.height/2);
  image(CannonImage, 0, 0);
  popMatrix();  
}



//the function checks: if a bullet should be launched, if the bullet hit the target, if the bullet out of the screen
private void checkBullet(){

    if(inputCheck()==3&&launched==false){
    arr[0] = new Bullet(x+rot*100+ CannonImage.width/2, y/1.2+CannonImage.height/2, rot);
    launched = true;
    shoot.play();
  }
 
  if(arr[0]!=null){
    arr[0].drawBullet();
  }

  if(arr[0]!=null&&(arr[0].distance(t)<50)){
    score++;
    t.damage(50);
    usedBullet();
    arr[0] = null;
    launched = false;
  }

  if(arr[0]!=null&&arr[0].distance(t)>700){
    usedBullet();
    arr[0]=null;
    launched = false;
  }
  
}



// decrease the amount of bullets by one
public void usedBullet(){
  this.bullets = this.bullets-1;  
}



// if out of ammo returns false, else returns true
public boolean checkAmmo(){
  if(this.bullets <=0){
   return false; 
  }
  return true;
}



//-------------------SETTERS AND GETTERS-----------------------------//


public int getB(){
  int BL = this.bullets;
  return BL; 
}


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


public void setY(float num){
  this.y = num;
}



}