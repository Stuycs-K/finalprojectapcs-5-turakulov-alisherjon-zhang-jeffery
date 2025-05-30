class Shop extends Entity{
  int costDefence;
  int costWeapon;
  Player p;
  boolean isOpen;
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
      System.out.println("bought HP!");
  }
  }
  void upgradeWeapon(){
    if(p.getSouls()>=costWeapon){
      p.soulsDec(costWeapon);
      p.wepInc(1);
      costWeapon*=Math.pow(1.207,2);
      //maybe add a bulletspeed thing too
       System.out.println("bought ATK!");
  }
  }
  void UI(){
    if(dist(position.x,position.y,p.position.x,p.position.y)<30){
      isOpen=true;
      fill(40);
      rect((width/4)+50,height/4,300,400,28);
      textSize(35);
      fill(225);
      text("Upgrade Damage",(width/4)+50,(height/4)+100);
      text(""+p.weapon,(width/4)+50,(height/4)+150);
      text("Upgrade Max Health",(width/4)+50,(height/4)+300);
      text(p.defense+p.maxHP+"",(width/4)+50,(height/4)+350);
      /*fill(225);
      rect((width/4)+322.5,height/4,10,400,28);
      rect((width/4)+70,height/4,10,400,28);
      rect((width/4)+150,(height/4)+115,10,10,28);
      rect((width/4)+170,(height/4)+315,10,10,28);
      fill(155);
      rect((width/4)+150,(height/4)+215,10,10,28);
      rect((width/4)+170,(height/4)+355,10,10,28);boundariestest*/
      }else{
        isOpen=false;
      }
    }
  void mouseClicked(){
    float xLeft=(width/4+70); float xRight=(width/4+322.5);
    float yUp=(width/4+115); float yDown=(width/4+155);
    if(mouseX>=xLeft && mouseX<=xRight && mouseY>=yUp && mouseY<=yDown){
    upgradeWeapon();
    }
    if(mouseX>=(width/4+70) && mouseX<=yUp+206.5 && mouseY>=(height/4+315) && mouseY<=yDown+200){
    upgradeDefense();
    }
  }
  void display(){
    fill(0,255,255);
    circle(position.x,position.y,30);
}
}
