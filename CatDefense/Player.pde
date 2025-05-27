class Player extends Entity{
  int catnip;
  int weapon; //damage
  int defense; //hp increase?
  int ammo;
  boolean isCatnip;
  float speed = 1; //test around
  
  public Player(int catnip, int wep, int def, int amm, boolean isCatnip, int xpos, int ypos){
    super(5,100,10.0,xpos,ypos,(int)random(-2,2),0,"Player");
    this.catnip=catnip;
    weapon=wep;
    defense=def;
    ammo=amm;
    this.isCatnip=isCatnip;
  }
  
  void reload(){
    
  }
  
  void keyPressed(){
    if(key=='w'||key=='W'||keyCode==UP){
      position.y-=speed;
    }
    if(key=='a'||key=='A'||keyCode==LEFT){
      position.x-=speed;
    }
    if(key=='s'||key=='S'||keyCode==DOWN){
      position.y+=speed;
    }
    if(key=='d'||key=='D'||keyCode==RIGHT){
      position.x+=speed;
    }
  }
  
  void move(){
    position.add(velocity);
    velocity.add(acceleration);
    acceleration.setMag(0.0);
  }
  
  void applyForce(PVector f){
  acceleration=f.div(mass).setMag(acceleration.mag()+f.mag());
  }
  
  void useCatnip(){
    
  }
  
  void shoot(){
  
  }
}
