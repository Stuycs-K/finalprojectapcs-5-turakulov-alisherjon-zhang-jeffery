class Player extends Entity{
  int catnip;
  int weapon; //damage
  int defense; //hp increase?
  int ammo;
  boolean isCatnip;
  float speed = 3; //test around
  float bulletSpeed=10; //upgrades later
  boolean up,down,left,right;
  ArrayList<Bullets> bullets;
  
  public Player(int catnip, int wep, int def, int amm, boolean isCatnip, int xpos, int ypos){
    super(5,100,10.0,xpos,ypos,0,0,"Player");
    this.catnip=catnip;
    weapon=wep;
    defense=def;
    ammo=amm;
    this.isCatnip=isCatnip;
    bullets=new ArrayList<Bullets>();
  }
  //FOLLOWING SHOOT AND RELOAD WILL NEED A SEPARATE CLASS FOR BULLETS ETC
  void shoot(){
    if(ammo>0){
      PVector dir=new PVector(mouseX,mouseY);
      PVector shoot=position.copy();
      bullets.add(new Bullets(shoot,dir,bulletSpeed));
    ammo--;
    System.out.println("bullet shot!");
    }
  }
  
  void reload(){
    ammo+=1; //placeholder include amt of max bullets
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
  
  void display(){
    fill(255,255,0);
    stroke(0);
    circle(position.x,position.y,24);
  }
  
  void useCatnip(){
    if(isCatnip){
      catnip--;
      //code here relating to cat class need to discuss
    }
  }
}
