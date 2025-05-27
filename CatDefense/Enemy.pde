 class Enemy extends Entity{
  int damage;
  
  public Enemy(int damage, int xpos, int ypos){
    super(5, 100, 500.0, xpos, ypos, 0, 0, "Enemy");
    this.damage = damage;
  }
  
  void attack(Entity other){
    boolean closeX = abs(position.x - other.position.x) <= 6;
    boolean closeY = abs(position.y - other.position.y) <= 6;
    if( closeX && closeY /* && (other.name.equals("Player") || other.name.equals("Cat"))*/){
      other.hp -= damage;
    }
    
  }
  void move(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.setMag(0.0);
    
  }
  void display(){
    fill(150, 50, 50);
    circle(position.x, position.y, 24);
    fill(0);
  }
 
 /// Precondition: other is Cat
  PVector attractTo(Entity other){ // use constant distance (of 400)
    
    float magForce = (20*mass*other.mass) / 160000; // distance of 400
    PVector  force = PVector.sub(position, other.position);
    if(mass < other.mass){
      force.setMag(force.mag()*-1);
    }
     force.normalize();
     force.setMag(magForce);
    return force;
  }
  
  
  void applyForce(PVector f){
    //Using forula F=ma ; a = F/m
     acceleration = f.div(mass).setMag(acceleration.mag() + f.mag());
  }

}
