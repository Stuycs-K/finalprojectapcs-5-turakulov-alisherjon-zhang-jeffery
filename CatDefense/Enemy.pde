 class Enemy extends Entity{
  int damage;
  
  public Enemy(int damage, int xpos, int ypos){
    super(5, 100, 10.0, xpos, ypos, (int)random(-2,2), 0, "Enemy");
    this.damage = damage;
  }
  
  void attack(Entity other){
    boolean closeX = abs(position.x - other.position.x) <= 12;
    boolean closeY = abs(position.y - other.position.y) <= 12;
    if( closeX && closeY /* && (other.name.equals("Player") || other.name.equals("Cat"))*/){
      other.hp -= damage;
    }
    
  }
  void move(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.setMag(0.0);
    
  }
  void UI(){
    if(hp!=maxHP){
      fill(0);
    text(hp+"/"+maxHP, position.x-30, position.y-20); //healthbar percentage later
    }
  }
  
  void display(){
    fill(150, 50, 50);
    noStroke();
    circle(position.x, position.y, 24);
    fill(0);
  }
 
 /// Precondition: other is Cat
  PVector attractTo(Entity other){ // use constant distance 
  
    float distance = PVector.sub(position, other.position).mag();
    if(distance >= 500){
      distance = 300;
    }else if(distance >=300){
      distance = 700;
    }else{
      distance = 500;
    }
    float magForce = (20*mass*other.mass) / (distance*distance); // Universal law of gravity
    PVector  force = PVector.sub(other.position, position);
    if(mass > other.mass){
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
