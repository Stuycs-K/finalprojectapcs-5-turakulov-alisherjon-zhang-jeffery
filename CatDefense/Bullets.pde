class Bullets{
  PVector position, velocity;
  Player p;
  float ang;
  
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
    translate(position.x,position.y);
    rotate(ang);
    rectMode(CENTER);
    rect(0,0,20,5);
    popMatrix();
  }
}
