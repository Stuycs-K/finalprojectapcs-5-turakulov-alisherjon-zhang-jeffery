class Boss extends Enemy{
//           wave:   0       20      30      40      49     99     ~49    ~99
//String[] types = {"Enemy", "Jump", "Fast", "Tank", "Bob", "Tar", "Tesla", };// randomization starts inlcuding more types 20..30..40 (unil bosses index 4)  
//Bob -the builder, first boss; Tar -the murkiness of real life, of responsbiltiy 
//Wave 100 is where the player comes to terms with their past; and their journey continues. (Accompanied by their feline friend).

  public Boss(int damage, int xpos, int ypos, String name){
    super(damage, xpos, ypos, name);
    
    if(name.equals("Bob")){
      hp = 201; //since spawnEnemies subtracts
      maxHP = 200;
    }else{ //Tar
      hp = 601;
      maxHP = 600;
    }
  
  }
  
  void attack(Entity other){
    if(closeEnough(other, 50)){
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
        fill(250, 160, 10);
        //PImage bob = loadImage("bob.png"); //may need to change if drawing is conspiciously subpar
        circle(position.x, position.y, 50);
        //image(bob, position.x-bob.width/2, position.y-bob.height/2);
      }else if(name.equals("Tar")){
       fill(10);
       circle(position.x, position.y, 48);
      }
  }
  
  void move(){
    position.add(velocity);
  
  }
  
  void spawnEnemies(String type){ // spawn different types based on hp levels
      int i = 0;
       if(Bob.hp == 201|| Bob.hp == 140 || Bob.hp == 80 || Bob.hp == 30){
      while(i < 7 && frameCount % 20 == 0){
          Enemies.add(new Enemy(damage/10, (int)position.x, (int)position.y, type)); //type based on boss
          i++;
      }
      hp-=1; //To avoid repetition if boss doesnt get damaged
    }
    
      
    }

  
  void speak(){
    if(name.equals("Bob") && hp ==maxHP){
      fill(0);
      textSize(24);
      rect(240, 740, 200, 770);
      fill(245, 180, 0);
      text("Bob The Builder: Hey! where did all the walls I built go?", 250, 750);
    }
  }
    
  void moveTo(Entity target){//will initially appear at top center of the screen at max hp
    PVector pos =  new PVector(position.x, position.y);
      if(hp == 200){
        position.x = 400;
        position.y = 60;
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
      velocity = PVector.sub(pos, position);
      
      
      if(!closeEnough(pos, 48)){
          velocity.setMag(1.5);
        }else{
          velocity.setMag(0.0);
        }
        
        
  }
}
