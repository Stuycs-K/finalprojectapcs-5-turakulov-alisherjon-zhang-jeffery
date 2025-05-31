ArrayList<Entity> Enemies, Projectiles, Walls;
Entity en;
Player p;
Enemy e;
Cat c;
Shop s;

void setup(){
size(800, 800);
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
  background(255);
  e.display();
  p.display();
  c.display();
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
  s.UI();
  textSize(30);
  p.UI();
  e.UI();
  if(p.shootHold&&frameCount%10==0){
      p.shoot();
  }
  if(frameCount % 20 == 0){
    e.attack(p);
System.out.println("player: "+ p.hp+ "  ;   en: " + e.hp);
  }
}
