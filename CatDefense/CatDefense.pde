ArrayList<Wall> Walls;
ArrayList<Bullets> bullets;
ArrayList<Enemy> Enemies;
//           wave:   0       20      30      40      60     80     100
String[] types = {"Enemy", "Jump", "Fast", "Tank", "Bob"/*, *"Tar", "Drunk"*/};// randomization starts inlcuding more types 20..30..40 (unil bosses index 4)
//Bob -the builder, first boss; Tar -the murkiness of real life, of responsbiltiy; Drunk -the players childhood trauma. 
//Wave 100 is where the player comes to terms with their past; and their journey continues. (Accompanied by their feline friend).
Player p;
Cat c;
Map m;
Enemy e;
int spawnNum,spawned = 0, enemiesFolded = 0, wave = 1,tick=0;
boolean inter;
Entity en;
Shop s;
boolean invincible, bossBattle;
Enemy Bob/*, Tar*/;

void setup(){
size(1000, 800);
PFont pixel=createFont("MedodicaRegular.otf",128);
  textFont(pixel);
c = new Cat(400, 400);
p=new Player(c,1,1,0,50,false,470,400);
m = new Map(35);
m.display();
Walls = m.Walls;
//en= new Enemy(1, 100, 100);
Enemies = new ArrayList<Enemy>(30); 
s=new Shop(7,12,7,p,c,-100,-100);
bossBattle=false;
}

void keyPressed(){
  if(s.isOpen){
  s.keyPressed();
  if(key=='w'||key=='W'||key=='a'||key=='A'||  key=='s'||key=='S'|| key=='d'||key=='D'){
    p.keyPressed();
  }
  }else{
  p.keyPressed();
  if(key == 'q'||key=='Q'){
    wave--;
    spawnNum=0;
  }else if(key == 'e'||key=='E'){
    wave++;
    spawnNum=0;
  }else if(key == 'i'||key=='I'){
    if(invincible){
      invincible = false;
    }else{
      invincible = true;
    }
  }
  }
  if(key=='u'||key=='U'){
    p.souls+=10000;
  }
  if(inter&&key=='x'||key=='X'){
    tick+=35;
  }
}

void keyReleased(){
  p.keyReleased();
}

void mousePressed(){
  p.mousePressed();
}

void mouseReleased(){
  p.mouseReleased();
}
      
void draw(){
  //c.position = new PVector(mouseX, mouseY);
  if(wave==50){
    background(200);
    m.displayWin();
  }else if(p.hp <= 0 || c.hp <= 0){
    background(200);
    m.displayEnd();
  }else if(wave == 49){
      background(255);
      m.display();
      c.display();
      noStroke();
      fill(#637081);
      rect(800,0, 200, 800);
      fill(0);
      textSize(30);
      text("wave: "+ wave, 805, 140);
    text("FPS: "+int(frameRate), 805,20);
    text("Cat: " + c.hp, 805, 80);
      p.display();
      p.move();
      textSize(50);
      p.UI();
      if(wave == 49){//Bob boss event
        if(!bossBattle){
          Enemies = new ArrayList<Enemy>(11);
          inter = false;
          Bob = new Boss(50, 400, 50, "Bob");
          bossBattle = true;
       }
       if(Bob.hp <= 0){
        println(Bob.hp+"bob");
        bossBattle = false;
        wave++;
      }
       Bob.display();
       Bob.UI();
        Bob.speak();
       if(frameCount % 100 == 0 && !invincible){
         Bob.attack(c);
         Bob.attack(p);
        }
      
       
       
       Bob.moveTo(c);
       Bob.move();
       Bob.spawnEnemies("Tesla");
    }
       
  if(inter){
    if(tick==0){
      int randX=(int)random(width-250);
      int randY=(int)random(height-100);
      s.changePos(randX,randY);
    }
    tick++;
    fill(0);
    rect(width/2-250,100,300,20);
    fill(255,223,0);
    rect(width/2-250,100,300*(float)tick/1500,20);
    fill(0);
    textSize(20.5);
    text("Intermission [Hold X to skip]",width/2-211.8,114);
    fill(255);
    textSize(20);
    text("Intermission [Hold X to skip]",width/2-212,115);
  if(tick>1500){
    inter=false;
    wave++;
    spawned=0;
    enemiesFolded=0;
    s.changePos(-100,-100);
  }
  return;
  }
      
       if(!inter&&p.shootHold&&!s.isOpen&&frameCount%10==0){
      p.shoot();
  }
  
  if(Enemies.size()==0&&!inter&&wave%5==0){
    inter=true;
    tick=0;
  }
  for(int i = Enemies.size()-1; i >= 0; i--){
     Enemy en = Enemies.get(i);
    
     
     if(en.hp <= 0){
       Enemies.remove(i);
       p.souls++;
     }
       
    if(frameCount % 40 == 0 && invincible == false){
        en.henchmanAttack(p);
        en.henchmanAttack(c);
    }
    
    en.henchmanDisplay();
    en.henchmanMoveTo(p);
    
    for(int j=p.bullets.size()-1;j>=0;j--){
      Bullets b=p.bullets.get(j);
      if(b.closeEnough(en, 20)){
        en.hp-=p.weapon;
        p.bullets.remove(j);
      }else if(b.closeEnough(Bob, 54)){
        Bob.hp-=p.weapon;
        p.bullets.remove(j);
      }else{
       b.move();
      b.display();
      if(b.destroy()){
        p.bullets.remove(j);
      }
    }
    }
   }
   
   for(int i = 0; i< Walls.size(); i++){
        Wall wa = Walls.get(i);
        wa.takeDamage();
        
        if(wa.hp <= 0 && wa.damage>0){
            Walls.remove(i);
            m.map[(int) wa.position.y/20][(int) wa.position.x/20] = 0;
            i--;
        }else if(wa.hp <= 0){
            wa.name="Debris";
            wa.damage=2;
            wa.hp = 5;
            m.map[(int) wa.position.y/20][(int) wa.position.x/20] = 2;
          }
      }
}else{
  background(255);
  m.display();
  s.display();
  c.display();
  noStroke();
  fill(#637081);
  rect(800,0, 200, 800);
  fill(0);
  textSize(30);
  text("wave: "+ wave, 805, 140);
    text("FPS: "+int(frameRate), 805,20);
    text("Cat: " + c.hp, 805, 80);
  
  //game funcs
  for(int h = Enemies.size()-1; h>=0; h--){
    Enemy en = Enemies.get(h);
    en.display();
    if(frameCount % 40 == 0 && invincible == false){
        en.attack(c);
        en.attack(p);
      }
    en.moveTo(c);
    en.move();
    for(int i=p.bullets.size()-1;i>=0;i--){
      Bullets b=p.bullets.get(i);
      float d=dist(b.position.x,b.position.y,en.position.x,en.position.y);
      if(d<20){
        en.hp-=p.weapon;
        p.bullets.remove(i);
       // System.out.println(en.hp);
      }else{
      b.move();
      b.display();
      if(b.destroy()){
        p.bullets.remove(i);
      }
      }
    }
    if(en.hp <= 0){
      p.souls++;
      //System.out.println(p.souls);
      Enemies.remove(h);
      enemiesFolded++;
    }
  }
  
  p.display();
  p.move();
  textSize(50);
  p.UI();
  s.display();
  s.UI();
  //e.UI(); maybe for bosses instead keep though

  if(!inter&&p.shootHold&&!s.isOpen&&frameCount%10==0){
      p.shoot();
  }
  
  if(Enemies.size()==0&&!inter&&wave%5==0){
    inter=true;
    tick=0;
  }
  
  if(inter){
    if(tick==0){
      int randX=(int)random(width-100);
      int randY=(int)random(height-100);
      s.changePos(randX,randY);
    }
    tick++;
    fill(0);
    rect(width/2-250,100,300,20);
    fill(255,223,0);
    rect(width/2-250,100,300*(float)tick/1500,20);
    fill(0);
    textSize(20.5);
    text("Intermission [Hold X to skip]",width/2-211.8,114);
    fill(255);
    textSize(20);
    text("Intermission [Hold X to skip]",width/2-212,115);
  if(tick>1500){
    inter=false;
    wave++;
    spawned=0;
    enemiesFolded=0;
    s.changePos(-100,-100);
  }
  return;
  }
  
    
       spawnNum = (int) (3*Math.pow(1.005, wave));
     if(frameCount % 100 == 0){   //spawn rate remains same; otherwise at upper waves computer fan will increase with spawn rate too.
    
        if(Enemies.size() < spawnNum && spawned < spawnNum){
          
            int x = (int) random(0, 800);
            int y = (int) random(0, 800);
            String type = types[min(3, (int) random(0, (int)wave/10))];
            if(!(x > 250 && x < 550 && y > 250 && y < 550)){
              Enemies.add(new Enemy(wave, x, y, type));//enemy damage increases with waves
              spawned++;
            }else{
              y=20;
              Enemies.add(new Enemy(wave, x, y, type));//enemy damage increases with waves
              spawned++;
            }
          
        }
        for(int i = 0; i< Walls.size(); i++){
          Wall wa = Walls.get(i);
          wa.takeDamage();
          if(wa.hp <= 0 && wa.damage>0){
              Walls.remove(i);
              m.map[(int) wa.position.y/20][(int) wa.position.x/20] = 0;
              i--;
          }else if(wa.hp <= 0){
              wa.name="Debris";
              wa.damage=2;
              wa.hp = 5;
              m.map[(int) wa.position.y/20][(int) wa.position.x/20] = 2;
            }
        }
      }
      if(enemiesFolded == spawnNum){
        println(spawnNum);
        wave++;
      //  c.heal((int) .25*wave + 1); //(int) (2*Math.pow(1.005, wave))
        p.heal(2);
        spawned=0;
        enemiesFolded=0;
      }
      }
    //System.out.println("player: "+ p.hp+ "  ;   cat: " + c.hp);
    }
