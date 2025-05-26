class Enemy extends Entity{
  int damage;
  
  public Enemy(int damage){
    super(5, 100, 500, 100, 100, 0, 0, "Enemy");
    this.damage = damage;
  }
  
  void attack(Entity other){
    if(this.position.x == other.position.x && this.positon.y == other.position.y){
      other.hp = other.hp-1;
    }
  }
  void move(){
    
  }
  void display(){}
 // void applyForce(PVector f){}  otherwise enemies will get flung
  //PVector attractTo(Entity other){}

}
