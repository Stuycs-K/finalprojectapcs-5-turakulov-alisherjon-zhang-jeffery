class Bullets{
  PVector position, velocity;
  
  public Bullets(PVector start,PVector dir,float speed){
    position=start;
    velocity=dir.normalize().mult(speed);
  }
  void move(){
    position.add(velocity);
  }
  
  boolean destroy(){
    return (position.x<0||position.x>width||position.y<0||position.y>height);
  }
  void display(){
    fill(175,155,96);
    circle(position.x,position.y,20);
  }
}
