class Bullets{
  PVector position, velocity;
  Player p;
  float ang;
  PImage bull=loadImage("bullet.png");
  
  public Bullets(PVector start,PVector dir,float speed){
    position=start;
    velocity=dir.normalize().mult(speed);
    ang=atan2(dir.y,dir.x);
  }
  
  void move(){
    position.add(velocity);
  }
  
  boolean destroy(){
    return (position.x<0||position.x>width||position.y<0||position.y>height);
  }
  void display(){
    fill(175,155,96);
    pushMatrix();
    translate(position.x-2.5,position.y);
    rotate(ang+HALF_PI);
    rectMode(CENTER);
    bull.resize(100,100);
    image(bull,0,0);
    popMatrix();
    rectMode(CORNER);
  }
  
   boolean closeEnough(Entity other, int radius){
   return (abs(position.x - other.position.x) <= radius) && (abs(position.y - other.position.y) <= radius); 
  }
}
