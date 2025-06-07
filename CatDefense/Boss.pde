class Boss extends Enemy{
//           wave:   0       20      30      40      49     99     ~49    ~99
//String[] types = {"Enemy", "Jump", "Fast", "Tank", "Bob", "Tar", "Tesla", };// randomization starts inlcuding more types 20..30..40 (unil bosses index 4)  
//Bob -the builder, first boss; Tar -the murkiness of real life, of responsbiltiy 
//Wave 100 is where the player comes to terms with their past; and their journey continues. (Accompanied by their feline friend).
  public Boss(int damage, int xpos, int ypos, String name){
    super(damage, xpos, ypos, name);
    hp = 200;
    maxHP = 200;
    if(name.equals("Bob")){
      damage = 50;
    }else{ //Tar
      damage = 100;
      hp = 600;
      maxHP = 600;
    }
  }
  
  void attack(Entity other){
    if(closeEnough(other)){
      other.hp -= damage;
    }
  }
  
  void UI(){ //health bar
      fill(200);
    rect(position.x-48, position.y-55, 70, 30);
    textSize(30);
    text(hp+"/"+maxHP, position.x-45, position.y-52);
  }
  
  void display(){
    noStroke();
  if(name.equals("Bob")){ //like a construction uniform
      //fill(50, 20, 10);
      PImage bob = loadImage("bob.png"); //may need to change if drawing is conspiciously subpar
      image(bob, position.x-bob.width/2, position.y-bob.height/2);
    }else if(name.equals("Tar")){
     fill(10);
     circle(position.x, position.y, 48);
    }
  }
  
  void move(){
    position.add(velocity);
  
  }
  
  void spawnEnemies(int typeIndex, int count){ // spawn different types based on hp levels
    if(hp == 140 || hp == 80 || hp == 30){
      for(int i = 0; i < 10; i++){
        Enemies.add(new Enemy(damage/10, (int)position.x, (int)position.y, "Enemy")); //will change to bosses respective Enemy types later
      }
    }
  }
  
    
  void bossMove(Entity target){//will initially appear at top center of the screen at max hp
  PVector pos = new PVector(730, 60);
 
      if(hp != 200 && hp > 170){ //move at first damage
        pos = new PVector(730, 60);
      }else if(hp < 170 && hp > 160){
        pos = target.position;
      }else if(hp > 120){
        pos = new PVector(730, 730);
      }else if(hp < 120 && hp > 100){
        pos = target.position;
      }else if(hp > 60 ){
        pos = new PVector(60, 400);
      }else if(hp < 60 && hp > 30){
        pos = new PVector(400, 60);
      }else if( hp < 30){
        pos = target.position;
      }
      
      if(!closeEnough(pos, 48)){
          velocity = PVector.sub(pos, position);
          velocity.setMag(1.5);
        }
  }
}
