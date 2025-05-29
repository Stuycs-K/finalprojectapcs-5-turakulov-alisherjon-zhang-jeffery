class Shop extends Entity{
  int costDefence;
  int costWeapon;
  Player p;
  public Shop(int costD,int costW,Player player){
    super(10000000,10000000,10.0,200,600,0,0,"Shop");
    costDefence=costD;
    costWeapon=costW;
    p=player;
  }
  void upgradeDefense(){
    if(p.getSouls()>=costDefence){
      p.soulsDec(costDefence);
      p.defInc(5);
      costDefence*=Math.pow(1.085,2);
  }
  }
  void upgradeWeapon(){
    if(p.getSouls()>=costWeapon){
      p.soulsDec(costWeapon);
      p.wepInc(1);
      costWeapon*=Math.pow(1.207,2);
      //maybe add a bulletspeed thing too
  }
  }
  void UI(){
    if(dist(position.x,position.y,p.position.x,p.position.y)<30){
      fill(100);
      rect((width/4)+50,height/4,300,400,28);
    }
  }
  void display(){
    fill(0,255,255);
    circle(position.x,position.y,30);
}
}
