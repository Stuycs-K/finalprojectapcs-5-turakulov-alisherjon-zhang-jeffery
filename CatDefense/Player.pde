class Player extends Entity{
  int catnip;
  int weapon; //damage
  int defense; //hp increase?
  int ammo;
  boolean isCatnip;
  
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
    
  }
  
  void useCatnip(){
    
  }
  
  void shoot(){
  
  }
}
