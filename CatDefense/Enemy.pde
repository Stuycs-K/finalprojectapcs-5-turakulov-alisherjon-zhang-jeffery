
 class Enemy extends Entity{
  int damage;
  ArrayList<Wall> Walls = new ArrayList<Wall>();


  
  public Enemy(int damage, int xpos, int ypos, String name){
    super(5, 50, 10.0, xpos, ypos, 0, 0, name);
    this.damage = damage;
    
    if(name.equals("Fast")){
     this.damage = 5;
    }else if(name.equals("Tank")){
      super.hp = 20;
    }
  }
  
  void attack(Entity other){
    if(closeEnough(other) && !other.name.equals("Enemy")){
      other.hp -= damage;
    }
  }
  
  void move(){
    if(m.map[(int)(position.y/20)][(int)(position.x/20)] == 0 || name.equals("Jump")){ //jumpers dont stop at walls
        position.add(velocity);
    }
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
      
    }else if(name.equals("Fast")){
      fill(10, 30, 200);
      noStroke();
      circle(position.x, position.y, 24);
    
    }else if(name.equals("Jump")){
      fill(10, 200, 50);
      noStroke();
      circle(position.x, position.y, 24);
    
    }else if(name.equals("Tank")){
      fill(50, 20, 10);
      noStroke();
      circle(position.x, position.y, 24);
      
    }
  }
 
 /// Precondition other is Cat
  PVector attractTo(Entity other){ // use constant distance 
      PVector direction = PVector.sub(other.position, position);
      direction.setMag(1.5);
      if(name.equals("Fast")){
        direction.setMag(4);
      }else if(name.equals("Tank")){
        direction.setMag(.75);
      }
      return direction;
  }
  
  
  void applyForce(PVector f){
    velocity = f;
  }

}
