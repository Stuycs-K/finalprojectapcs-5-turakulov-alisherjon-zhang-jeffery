
ArrayList<Entity> Enemies, Projectiles, Walls;
Entity p;
Enemy e;
//Cat cat

void setup(){
size(400, 300);
p = new Enemy(1);
e = new Enemy(1);
}

void draw(){
  
  if(frameCount % 10 == 0){
    e.attack(p);
System.out.println("player: "+ p.hp+ "  ;   en: " + e.hp);
  }
}
