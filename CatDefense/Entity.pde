abstract class Entity{
  int hp, maxHP;
  float mass;
  PVector position, velocity, acceleration;
  String name;
  
  public Entity(int hp, int maxHP, float mass, int x, int y, int xvel, int yvel, String name){
    this.hp = hp;
    this.maxHP = maxHP;
    this.mass = mass;
    position = new PVector(x, y);
    velocity = new PVector(xvel, yvel);
   acceleration = new PVector(0,0);
    this.name = name;
  }
  
   void move(){}
   void display(){}
   void applyForce(PVector f) {} // constant distance for calculating.
void moveTowards(Entity other){}
    PVector attractTo(Entity other){}
   void attack(Entity other){}
   
  boolean closeEnough(Entity other){
   boolean closeX = abs(position.x - other.position.x) <= 24;
    boolean closeY = abs(position.y - other.position.y) <= 24;
    return closeX && closeY; 
  
  }
  
  void heal(int amt){
    if(hp+amt <= maxHP){
      hp += amt;
    }
  }
  
}
