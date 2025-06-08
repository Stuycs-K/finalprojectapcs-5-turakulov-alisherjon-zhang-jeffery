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
   void moveTo(Entity other){}
   PVector attractTo(Entity other){ return null; }
   void attack(Entity other){}
   
  boolean closeEnough(Entity other){
    return (abs(position.x - other.position.x) <= 24) && (abs(position.y - other.position.y) <= 24); 
  }
  
  boolean closeEnough(PVector pos, int radius){
    return (abs(position.x - pos.x) <= radius) && ( abs(position.y - pos.y) <= radius); 
  }
  
  boolean closeEnough(Entity other, int radius){
   return (abs(position.x - other.position.x) <= radius) && (abs(position.y - other.position.y) <= radius); 
  }
  

  
  void heal(int amt){
    if(hp+amt <= maxHP){
      hp += amt;
    }
  }
  
}
