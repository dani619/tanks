
class Animation {
  
private float x; //the x location in the axis
private float y; //the y location in the axis 
PImage spriteSheet;
PImage temp;
PImage aniArray[][];
float timeI;
boolean draw = true;



public Animation(){
  setupSrpites();
}



void setupSrpites(){
  aniArray = new PImage[6][6];
  spriteSheet = loadImage("spritesheet.png");
  for(int j =0; j<6; j++){
    for(int i =0; i<6; i++){
      aniArray[j][i] = spriteSheet.get(i*100, i*100, 100, 100);
    }
  }
}



void drawAnimation(){
    this.x = t.getX()-16;
    this.y = t.getY();
    if(timeI<6&&draw==true){
    if(timeI>5) draw = false;
    image (aniArray[0][(int)timeI] ,x ,y);
    updateTime();
      }
}
  
  
  
void updateTime(){
  timeI = (timeI+0.18) % 6;
}



}