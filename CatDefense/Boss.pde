class Boss extends Enemy{
//           wave:   0       20      30      40      49     99     ~49    ~99
//String[] types = {"Enemy", "Jump", "Fast", "Tank", "Bob", "Tar", "Tesla", };// randomization starts inlcuding more types 20..30..40 (unil bosses index 4)  
//Bob -the builder, first boss; Tar -the murkiness of real life, of responsbiltiy 
//Wave 100 is where the player comes to terms with their past; and their journey continues. (Accompanied by their feline friend).
  public Boss(int damage, int xpos, int ypos, String name){
    super(damage, xpos, ypos, name);
    if(name.equals("Bob")){
      hp = 1500; //since spawnEnemies subtracts
      maxHP = 1500;
    }/*else{ //Tar
      hp = 601;
      maxHP = 600;
    }*/
  
  }
  
  void attack(Entity other){
    if(closeEnough(other, 45)){
      other.hp -= damage;
    }
  }
  
  void UI(){ //health bar
      fill(255,0,0);
      stroke(0);
    rect(width/2-250,100,300*(float)hp/maxHP,20);
    textSize(21);
    fill(0);
    text(hp+"/"+maxHP, width/2-245.8,115);
  }
  
  void display(){
     noStroke();
    if(name.equals("Bob")){ //like a construction uniform
        fill(250, 160, 10);
        PImage bob = loadImage("bob.png"); //may need to change if drawing is conspiciously subpar
        //circle(position.x, position.y, 50);
        image(bob, position.x-bob.width/2, position.y-bob.height/2);
      }/*else if(name.equals("Tar")){
       fill(10);
       circle(position.x, position.y, 48);
      }*/
  }
  
  void move(){
    position.add(velocity);
  
  }
  
  void spawnEnemies(String type){ // spawn different types based on hp levels
     
      if(Enemies.size() == 0){
        
          Enemies.add(new Enemy(damage/10, (int)position.x, (int)position.y, type)); //type based on boss
          
      
     
    }
    
      
    }

  
 void speak(){
    if(name.equals("Bob") && hp > 1497){
      fill(200);
      textSize(24);
      rect(125, 540, 520, 75);
      fill(245, 180, 0);
      text("Bob The Builder: Hey! where did all the walls I built go?", 135, 570);
    }
  }
    
  void moveTo(Entity target){//will initially appear at top center of the screen at max hp
    PVector pos =  new PVector(position.x, position.y);
      if(hp > 0.95*maxHP){
        position.x = 400;
        position.y = 60;
      }else if(hp>0.9*maxHP){
        pos = new PVector(720, 60);
      }else if(hp < 0.9*maxHP && hp > 0.85*maxHP){
        pos = target.position;
      }else if(hp > 0.7*maxHP){
        pos = new PVector(730, 730);
      }else if(hp < 0.7*maxHP && hp > 0.55*maxHP){
        pos = target.position;
      }else if(hp > 0.35*maxHP ){
        pos = new PVector(60, 500);
      }else if(hp < 0.35*maxHP && hp > 0.25*maxHP){
        pos = new PVector(60, 200);
      }else if(hp < 0.25*maxHP && hp > 0.15*maxHP){
        pos = new PVector(400, 60);
      }else if( hp < 0.15*maxHP){
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
