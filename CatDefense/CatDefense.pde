
ArrayList<Entity> Enemies, Projectiles, Walls;
Entity p;
Enemy e;
Cat c;

void setup(){
size(800, 800);
p = new Enemy(1, 100, 100);
e = new Enemy(1, 100, 100);
c = new Cat(400, 400);
}

void draw(){
  background(255);
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
