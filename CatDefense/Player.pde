class Player extends Entity{
  int catnip;
  int weapon; //damage
  int defense; //hp increase
  int ammo; int maxAmmo;
  int souls; //currency
  boolean isCatnip;
  float speed = 10; //test around
  float bulletSpeed=10; //upgrades later
  boolean up,down,left,right;
  ArrayList<Bullets> bullets;
  
  public Player(int catnip, int wep, int def, int amm, boolean isCatnip, int xpos, int ypos){
    super(100,100+def,10.0,xpos,ypos,0,0,"Player");
    this.catnip=catnip;
    weapon=wep;
    defense=def;
    ammo=amm;
    maxAmmo=amm;
    this.isCatnip=isCatnip;
    bullets=new ArrayList<Bullets>();
  }
  
  void shoot(){
    if(ammo>0){
      PVector dir2=new PVector(mouseX,mouseY);
      PVector dir=new PVector(position.x,position.y).sub(dir2).mult(-1);
      PVector shoot=position.copy();
      bullets.add(new Bullets(shoot,dir,bulletSpeed));
    ammo--;
    System.out.println("ammo: "+ammo+"/"+maxAmmo);
    }
  }
  
  void reload(){
    if(ammo<maxAmmo){
    ammo+=maxAmmo-ammo; //placeholder include amt of max bullets
    }
  }
  
  void keyPressed(){
    if(key=='w'||key=='W'||keyCode==UP){
      up=true;
    }
    if(key=='a'||key=='A'||keyCode==LEFT){
      left=true;
    }
    if(key=='s'||key=='S'||keyCode==DOWN){
      down=true;
    }
    if(key=='d'||key=='D'||keyCode==RIGHT){
      right=true;
    }
    if(key=='r'||key=='R'){
      reload();
    }
  }
  
  void mouseClicked(){
    shoot();
  }
  
  void keyReleased(){
    if(key=='w'||key=='W'||keyCode==UP){
      up=false;
    }
    if(key=='a'||key=='A'||keyCode==LEFT){
      left=false;
    }
    if(key=='s'||key=='S'||keyCode==DOWN){
      down=false;
    }
    if(key=='d'||key=='D'||keyCode==RIGHT){
      right=false;
    }
  }
  
  void move(){
    if(up)position.y-=speed;
    if(left)position.x-=speed;
    if(down)position.y+=speed;
    if(right)position.x+=speed;
    position.add(velocity);
    velocity.add(acceleration);
    acceleration.setMag(0.0);
  }
  
  void applyForce(PVector f){
  acceleration=f.div(mass).setMag(acceleration.mag()+f.mag());
  }
  void UI(){
    //reload
    fill(0);
    text("Bullets: " + ammo+"/"+maxAmmo, 25, 50);
    textSize(30); // bullet icon next to it or smth
    text(hp+"  /  "+maxHP,25,100);
  }
  void display(){
    fill(255,255,0);
    stroke(0);
    circle(position.x,position.y,24);
  }
  
  void soulsDec(int amt){
    souls-=amt;
  }
  int getSouls(){
    return souls;
  }
  void defInc(int amt){
    defense+=amt;
  }
  void wepInc(int amt){
    weapon+=amt;
  }
  
  void useCatnip(){
    if(isCatnip){
      catnip--;
      //code here relating to cat class need to discuss
    }
  }
}
