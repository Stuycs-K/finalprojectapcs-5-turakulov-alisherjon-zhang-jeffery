
ArrayList<Wall> Walls;
ArrayList<Bullets> bullets;
ArrayList<Enemy> Enemies;
String[] types = {"Enemy", "Jump", "Fast", "Tank", "Bob", "Tar", "Drunk"};// randomization starts inlcuding more types 20..30..40 (unil bosses index 4)
//Bob -the builder, first boss; Tar -the murkiness of real life, of responsbiltiy; Drunk -the players childhood trauma. 
//Wave 100 is where the player comes to terms with everything in their past; their journey continues. (Accompanied by their good friend Mr Bartelby the feline).
Player p;
Cat c;
Map m;
Enemy e;
int spawnNum, spawned=0, enemiesFolded = 0, wave = 1;
Entity en;
Shop s;
boolean invincible;


void setup(){
size(800, 800);
m = new Map(50);
m.display();
Walls = m.Walls;
//en= new Enemy(1, 100, 100);
Enemies = new ArrayList<Enemy>(30); 
p=new Player(1,1,0,10,false,470,400);
//e = new Enemy(1, 100, 100);
c = new Cat(400, 400);
s = new Shop(5,3,p);
}


void keyPressed(){
  p.keyPressed();
  if(key == 'q'){
    wave--;
  }else if(key == 'e'){
    wave++;
  }else if(key == 'i'){
    invincible = true;
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

void mouseClicked(){
  if(s.isOpen){
  s.mouseClicked();
  }
}

void draw(){
  
  //c.position = new PVector(mouseX, mouseY);
  if(p.hp <= 0 || c.hp <= 0){
    background(200);
    m.displayEnd();
  }else{ 
    
    background(255);
    m.display();
    p.display();
    c.display();
    s.display();
    p.move();
    fill(0);
    textSize(20);
    //text("wave: "+ wave, width-80, 40);
    text("FPS: "+int(frameRate),width-70,20);
    //fill(140);
    //rect(730, 10, 75, 60);
    fill(0);
    
    text("Wave: "+ wave, width-70, 50);
    text("Cat: " + c.hp, width-70, 80);
    
    for(int h = 0; h < Enemies.size(); h++){
      Enemy en = Enemies.get(h);
      en.display();
      if(frameCount % 40 == 0 && invincible == false){
        en.attack(c);
        en.attack(p);
      }
      en.applyForce(en.attractTo(c));
      en.move();
      for(int i=p.bullets.size()-1;i>0;i--){
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
        h--;
        enemiesFolded++;
      }
       
    }
    s.UI();
    textSize(30);
    p.UI();
    //e.UI(); maybe for bosses instead keep though
    if(p.shootHold&&!s.isOpen&&frameCount%10==0){
        p.shoot();
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
        c.heal((int) .25*wave + 1); //(int) (2*Math.pow(1.005, wave))
        p.heal(2);
        spawned=0;
        enemiesFolded=0;
      }
     
     /*if(p.isCatnip){
       c.applyForce(c.attractTo(p));
       c.move();
     }*/
   
   
      
    //System.out.println("player: "+ p.hp+ "  ;   cat: " + c.hp);
  }
}

public static String debugToString(int[][] arr){
  String ret = "[";
  for(int i = 0; i < arr.length; i++){
    for(int j = 0; j < arr[0].length; j++){
      if(j == 0){
      ret += "[";
      }else if(j != arr[0].length-1){
        ret += ""+arr[i][j] + ", ";
      }else{
        ret += arr[i][j] + "]";
      }
    }
    if(i != arr.length-1){
      ret += "\n";
    }
  }
  
  return ret += "]";
  }
