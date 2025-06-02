class Shop extends Entity{
  int costDefence;
  int costWeapon;
  Player p;
  boolean isOpen;
  PImage shop;
  int expDef; int expWep;
  PImage shopGuy=loadImage("shopdude.png");
  public Shop(int costD,int costW,Player player){
    super(10000000,10000000,10.0,200,600,0,0,"Shop");
    costDefence=costD;
    costWeapon=costW;
    p=player;
    shop=loadImage("shop.png");
  }
  void upgradeDefense(){
    if(p.getSouls()>=costDefence){
      p.soulsDec(costDefence);
      p.defInc(5);
      costDefence*=Math.pow(1.085,expDef);
      expDef++;
      System.out.println("bought HP!");
  }
  }
  void upgradeWeapon(){
    if(p.getSouls()>=costWeapon){
      p.soulsDec(costWeapon);
      p.wepInc(1);
      costWeapon*=Math.pow(1.107,expWep);
      expWep++;
      //maybe add a bulletspeed thing too
       System.out.println("bought ATK!");
  }
  }
  void textStroke(float size,int col){
    textSize(size);
      fill(col);
  }
  void UI(){
    if(dist(position.x,position.y,p.position.x,p.position.y)<30){
      isOpen=true;
      fill(123,225,184);
      rect((width/4)+50,height/4,300,400,28);
      fill(173,235,179);
      rect((width/4)+70,(height/4)+115,252.5,40,28);
      rect((width/4)+70,(height/4)+115+150.5,252.5,40,28);
      textStroke(35.5,0);
      text("Upgrade DMG",(width/4)+55-2.5,(height/4)+40+2);//-2.5 to x & +2 to y for effect
      textSize(35);
      fill(225);
      text("Upgrade DMG",(width/4)+55,(height/4)+40);
      textStroke(35.5,0);
      text("Current: "+p.weapon,(width/4)+55-2.5,(height/4)+105+2);
      textSize(35);
      fill(225);
      text("Current: "+p.weapon,(width/4)+55,(height/4)+105);
      textStroke(35.5,0);
      text("Upgrade MaxHP",(width/4)+55-2.5,(height/4)+190+2);
      textSize(35);
      fill(225);
      text("Upgrade MaxHP",(width/4)+55,(height/4)+190);
      textStroke(35.5,0);
      text("Current: "+(p.defense+p.maxHP),(width/4)+55-2.5,(height/4)+255+2);
      textSize(35);
      fill(225);
      text("Current: "+(p.defense+p.maxHP),(width/4)+55,(height/4)+255);
      textStroke(35.5,0);
      text("Cost: "+ costDefence,(width/4)+55-2.5,(height/4)+221.5+2);
      textSize(35);
      fill(225);
      text("Cost: "+ costDefence,(width/4)+55,(height/4)+221.5);
      textStroke(35.5,0);
      text("Cost: "+ costWeapon+"",(width/4)+55-2.5,(height/4)+72.5+2);
      textSize(35);
      fill(225);
      text("Cost: "+ costWeapon+"",(width/4)+55,(height/4)+72.5);
      image(shopGuy,430,470);
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
    if(mouseX>=xLeft && mouseX<=xRight && mouseY>=yUp+150.5 && mouseY<=yDown+150.5){
    upgradeDefense();
    }
  }
  void display(){
    fill(0,255,255);
    image(shop,position.x-shop.width/2,position.y-shop.height/2);
}
}
