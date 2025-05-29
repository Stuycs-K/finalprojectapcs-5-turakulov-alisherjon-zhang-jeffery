ArrayList<Entity> Projectiles, Walls;
ArrayList<Enemy> Enemies;
Player p;
Enemy e;
Cat c;
Map m;
int wave = 1;
Entity en;
Shop s;


void setup(){
size(800, 800);
m = new Map(50);
m.display();
Walls = m.Walls;
p = new Player(0, 0, 0, 10, false, 100, 100);
//e = new Enemy(1, 100, 100);
Enemies = new ArrayList<Enemy>(30); 
c = new Cat(400, 400);
println(debugToString(m.map));
en= new Enemy(1, 100, 100);
p=new Player(1,1,0,10,false,100,100);
e = new Enemy(1, 100, 100);
c = new Cat(400, 400);
s = new Shop(5,3,p);
}

void keyPressed(){
  p.keyPressed();
}

void keyReleased(){
  p.keyReleased();
}

void mouseClicked(){
  p.mouseClicked();
}
  

void draw(){
  //c.position = new PVector(mouseX, mouseY);
  background(255);
  m.display();
  p.display();
  c.display();
  e.display();
  s.display();
  e.applyForce(e.attractTo(c));
  e.move();
  p.move();
  for(int i=p.bullets.size()-1;i>0;i--){
    Bullets b=p.bullets.get(i);
    float d=dist(b.position.x,b.position.y,e.position.x,e.position.y);
    if(d<20){
      e.hp-=p.weapon;
      p.bullets.remove(i);
      System.out.println(e.hp);
    }
    b.move();
    b.display();
    if(b.destroy()){
      p.bullets.remove(i);
    }
  }
  if(e.hp<=0){//placeholder for on death
    fill(255,0,0);
    circle(e.position.x, e.position.y, 24);
    if(p.souls<1000){
    p.souls++; //placeholder
    }
    System.out.println(p.souls);
  }
    

  if(frameCount % 20 == 0){
    if(Enemies.size() < wave*3){
      int x = (int) random(0, 800);
      int y = (int) random(0, 800);
      if(!(x > 250 && x < 550 && y > 250 && y < 550)){
        Enemies.add(new Enemy(wave, x, y));
      }
      
    }
    
  }
  for(Enemy en: Enemies){
      en.display();
      en.attack(c);
      en.attack(p);
      en.applyForce(en.attractTo(c));
      en.move();
    }
    for(Wall wa: Walls){
      wa.takeDamage();
      //if(wa.hp <= 0){
        //map[position.y/40][position.x/4] ==
        //Walls.remove(wa);
    //  }
    }
    //System.out.println("player: "+ p.hp+ "  ;   cat: " + c.hp);
 
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
