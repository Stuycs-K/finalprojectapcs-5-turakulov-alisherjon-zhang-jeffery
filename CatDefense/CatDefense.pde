
ArrayList<Entity> Enemies, Projectiles, Walls;
Entity en;
Player p;
Enemy e;
Cat c;

void setup(){
size(800, 800);
en= new Enemy(1, 100, 100);
p=new Player(1,1,1,1,false,100,100);
e = new Enemy(1, 100, 100);
c = new Cat(400, 400);
}

void keyPressed(){
  p.keyPressed();
}

void keyReleased(){
  p.keyReleased();
}

void draw(){
  //c.position = new PVector(mouseX, mouseY);
  background(255);
  e.display();
  p.display();
  c.display();
  e.applyForce(e.attractTo(c));
  e.move();
  p.move();
  if(frameCount % 20 == 0){
    e.attack(p);
//System.out.println("player: "+ p.hp+ "  ;   en: " + e.hp);
  }
}
