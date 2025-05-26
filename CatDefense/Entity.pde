abstract class Entity{
  int hp, maxHP;
  float mass;
  PVector position, velocity;
  String name;
  
  public Entity(int hp, int maxHP, float mass, int x, int y, int xvel, int yvel, String name){
    this.hp = hp;
    this.maxHP = maxHP;
    this.mass = mass;
    position = new PVector(x, y);
    velocity = new PVector(xvel, yvel);
   // acceleration = new PVector(0,0);
    this.name = name;
  }
abstract  void move();
  abstract void display();
  //void applyForce(PVector f);    acceleration wont be necessary...unless we want extra difficulty?
  //PVector attractTo(Entity other); 
  PVector getposition(){
  return position;
  }
  
}
