class Shop extends Entity{
  int costDefence;
  int costWeapon;
  Player p;
  public Shop(int costD,int costW,Player player){
    super(10000000,10000000,10.0,0,0,0,0,"Shop");
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
}
