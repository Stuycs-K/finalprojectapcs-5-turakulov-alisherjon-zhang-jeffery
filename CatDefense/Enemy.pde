
 class Enemy extends Entity{
  int damage;
  //ArrayList<Wall> Walls = new ArrayList<Wall>();


  
  public Enemy(int damage, int xpos, int ypos, String name){
    super(5, 50, 10.0, xpos, ypos, 0, 0, name);
    this.damage = damage;
    
    if(name.equals("Fast")){
     this.damage = 5;
    }else if(name.equals("Tank")){
      super.hp = 20;
    }else if(name.equals("Tesla")){
      super.hp = 14;
      damage = 40;
    }
  }
  
  void attack(Entity other){
    if(closeEnough(other)){
      other.hp -= damage;
    }
  }
  
  void move(){
    if(m.map[(int)(position.y/20)][(int)(position.x/20)] == 0){ //jumpers dont stop at walls
      position.add(velocity);
    }//Note: could use hashMap to store walls by position to have faster runtime
  }
  
  void UI(){
    if(hp!=maxHP){
      fill(0);
    text(hp+"/"+maxHP, position.x-30, position.y-20); //healthbar percentage later
    }
  }
  
  void display(){
    noStroke();
    if(name.equals("Enemy")){
      fill(150, 50, 50);
      circle(position.x, position.y, 24);
      
    }else if(name.equals("Fast")){
      fill(10, 30, 200);
      circle(position.x, position.y, 24);
    
    }else if(name.equals("Jump")){
      fill(10, 200, 50);
      circle(position.x, position.y, 24);
    
    }else if(name.equals("Tank")){
      fill(50, 20, 10);
      circle(position.x, position.y, 24);
      
    }else if(name.equals("Bob")){ //like a construction uniform  note ot self: REMOVE ONCE BOSS CLASS READY
      fill(50, 20, 10);
      PImage bob = loadImage("bob.png"); //may need to change if drawing is conspiciously subpar
      image(bob, position.x-bob.width/2, position.y-bob.height/2);
    }else if(name.equals("Tesla")){
      fill(10, 0, 240);
      circle((int)position.x,(int) position.y, 20);
    }
  }
 
 /// Precondition other is Cat
  void moveTo(Entity other){ // use constant distance 
    
      PVector direction = PVector.sub(other.position, position);
      if(name.equals("Jump")){
        if(!closeEnough(other) && frameCount % 140 < 25){
          direction.setMag(1.5);
        }else{
          direction.setMag(0.0);
        }
      }else{
        direction.setMag(1.5);
      }
      
      if(name.equals("Fast")){
        direction.setMag(4);
      }else if(name.equals("Tank")){
        direction.setMag(.75);
      }
      
      velocity = direction;
  }
  
  
  
  
  
  
  
 /* void applyForce(PVector f){
    velocity = f;
  }
*/
}
