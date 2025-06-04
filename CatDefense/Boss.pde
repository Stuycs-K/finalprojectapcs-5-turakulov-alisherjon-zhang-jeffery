class Boss extends Enemy{
  
  public Boss(int damage, int xpos, int ypos, String name){
    super(damage, xpos, ypos, name);
  }
  
  void attack(Entity other){
  
  }
  
  void display(){
  if(name.equals("Bob")){ //like a construction uniform
      fill(50, 20, 10);
      PImage bob = loadImage("bob.png"); //may need to change if drawing is conspiciously subpar
      noStroke();
      image(bob, position.x-bob.width/2, position.y-bob.height/2);
    }else if(name.equals("Tar")){
    
    }else if(name.equals("Drunk")){
    
    }
  }
  
  void move(){
  
  }
  
  void attractTo(Entity other){}
  
 
}
