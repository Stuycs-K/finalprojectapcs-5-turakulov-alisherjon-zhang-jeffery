class Bullets{
  PVector position, velocity;
  
  public Bullets(PVector start,PVector dir,float speed){
    position=start;
    velocity=dir.normalize().mult(speed);
  }
  
  void display(){
    fill(175,155,96);
    circle(position.x,position.y,5);
  }
}
