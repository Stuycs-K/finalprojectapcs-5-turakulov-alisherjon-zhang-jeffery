
ArrayList<Entity> Enemies, Projectiles, Walls;
Entity p;
Enemy e;
Cat c;
Map m;

void setup(){
size(800, 800);
m = new Map(50);
m.display();
p = new Enemy(1, 100, 100);
e = new Enemy(1, 100, 100);
c = new Cat(400, 400);
}

void draw(){
  //c.position = new PVector(mouseX, mouseY);
  background(255);
  m.display();
  e.display();
  p.display();
  c.display();
  e.applyForce(e.attractTo(c));
  e.move();
  if(frameCount % 20 == 0){
    e.attack(p);
System.out.println("player: "+ p.hp+ "  ;   en: " + e.hp);
  }
}
