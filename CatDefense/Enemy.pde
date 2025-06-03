
 class Enemy extends Entity{
  int damage;
  ArrayList<Wall> Walls = new ArrayList<Wall>();

 //static ArrayList<Entity> Enemies = new ArrayList<Entity>(30);
  
  public Enemy(int damage, int xpos, int ypos, String name){
    super(5, 5, 10.0, xpos, ypos, 0, 0, name);
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
    if(name.equals("Enemy")){
      fill(150, 50, 50);
      noStroke();
      circle(position.x, position.y, 24);
      //fill(0);
    }else if(name.equals("Fast")){
      fill(10, 30, 200);
      noStroke();
      circle(position.x, position.y, 24);
      fill(0);
    }else if(name.equals("Jump")){
      fill(10, 200, 50);
      noStroke();
      circle(position.x, position.y, 24);
      fill(0);
    }else if(name.equals("Tank")){
      fill(50, 20, 10);
      noStroke();
      circle(position.x, position.y, 24);
      fill(0);
    }
    
  }
 
 /// Precondition other is Cat
  PVector attractTo(Entity other){ // use constant distance 
      PVector direction = PVector.sub(other.position, position);
      direction.setMag(1.5);
      return direction;

    
  }
  
  
  void applyForce(PVector f){
    velocity = f;
  }

}
