
 class Enemy extends Entity{
  int damage;
  ArrayList<Wall> Walls = new ArrayList<Wall>();
 //static ArrayList<Entity> Enemies = new ArrayList<Entity>(30);
  
  public Enemy(int damage, int xpos, int ypos){
    super(5, 5, 10.0, xpos, ypos, 0, 0, "Enemy");
    this.damage = damage;
   
  }
  
  void attack(Entity other){
    if(closeEnough(other) && !other.name.equals("Enemy")){
      other.hp -= damage;
    }
  }
  void move(){
    /*boolean blocked=false;
    for(int i=0;i<Walls.size();i++){
      if(Walls.get(i).closeEnoughW(this)){
        blocked=true;
      }
    } nvm */
    
    if(m.map[(int)(position.y/20)][(int)(position.x/20)] == 0){
      
    
      //velocity.add(acceleration);
      position.add(velocity);
     // acceleration.setMag(0.0);
    }
    //println(m.map[(int)(position.x/40)][(int)(position.y/40)]);
    
    
    
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
      PVector direction = PVector.sub(other.position, position);
      direction.setMag(1.5);
      return direction;
/*    float distance = PVector.sub(position, other.position).mag();
    if(distance >= 400){
      distance = 50;
    }else if(distance >=300){
      distance = 10000;
    }else{
      distance = 50;
    }
    
    float magForce = (20*mass*other.mass) / (distance*distance); // Universal law of gravity
    PVector  force = PVector.sub(other.position, position);
    if(mass > other.mass){
      force.setMag(force.mag()*-1);
    }
     force.normalize();
     force.setMag(magForce);
    return force;*/
    
  }
  
  
  void applyForce(PVector f){
    //Using forula F=ma ; a = F/m
     //acceleration = f.div(mass).setMag(acceleration.mag() + f.mag());
     
      velocity = f;
  }

}
