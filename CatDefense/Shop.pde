class Shop extends Entity{
  int costDefence;
  int costWeapon;
  int costBox; boolean boxBought;
  int costMed; boolean medBought;
  int trackUI;
  Player p;
  boolean isOpen;
  PImage shop;
  int expDef; int expWep;
  PImage shopGuy=loadImage("shopdude.png");
  PImage bgUI=loadImage("shopBase.png");
  PImage[] souls;
  int curFrame,countFrame,delayFrame,totalFrame;
  
  public Shop(int costD,int costW, int costBox, Player player,int x,int y){
    super(10000000,10000000,10.0,x,y,0,0,"Shop");
    costDefence=costD;
    costWeapon=costW;
    this.costBox=costBox;
    p=player;
    shop=loadImage("shop.png");
    curFrame=0;
    countFrame=0;
    delayFrame=2;
    totalFrame=27;
    souls=new PImage[totalFrame];
        for(int i=0;i<totalFrame;i++){
          String get="soulSprites/souls_0";
          if(i<10){
            get+="0"+i+".png";
          }else{
            get+=i+".png";
          }
          souls[i]=loadImage(get);
          souls[i].resize(150,150);
        }
  }
  void upgradeDefense(){
    if(p.getSouls()>=costDefence){
      p.soulsDec(costDefence);
      p.defInc(5);
      costDefence*=Math.pow(1.085,expDef);
      expDef++;
  }
  }
  void upgradeWeapon(){
    if(p.getSouls()>=costWeapon){
      p.soulsDec(costWeapon);
      p.wepInc(1);
      costWeapon*=Math.pow(1.107,expWep);
      expWep++;
  }
  }
  void ammoBox(){//more ammoboxes more times can reload. reloading with remaining ammo subtracts from ammoBox remaining ammo
    if(p.getSouls()>=costBox&&!boxBought){
      if(!p.boxCheck){
        p.addBox();
      }
      p.soulsDec(costBox);
      p.remBox++;
      boxBought=true; //reset in display after intermission also have UI for it being already bought
  }
  }
  void Medkit(){
    if(p.getSouls()>=costMed&&!medBought){
      if(!p.medkit){
        p.addMedkit();
      }
      p.soulsDec(costMed);
      p.medpacks++;
      medBought=true;
  }
  }
  void changePos(int x, int y){
    position.x=x;
    position.y=y;
  }
  void textStroke(float size,int col){
    textSize(size);
      fill(col);
  }
  
  void keyPressed(){
    if(keyCode==UP){
      trackUI--;
      if(trackUI<0) trackUI=1;
      System.out.println(trackUI+" THIS IS TRACKUI");
    }
    if(keyCode==DOWN){
      trackUI++;
      if(trackUI>1) trackUI=0;
      System.out.println(trackUI+" THIS IS TRACKUI");
    }
  }
  
  void UI(){
    if(dist(position.x,position.y,p.position.x,p.position.y)<30){
      isOpen=true;
      shopGuy.resize(800,800);
      image(shopGuy,0,30);
      image(bgUI,5,0);
      textSize(40);
      fill(255);
      text(" > Why did the man fall through\n    the glass?",width/2-370,height/2+200);
      text(" > Because he weighed a\n    SKELEton!",width/2-370,height/2+280);
      text("Items",width/2+175,height/2+200);
      text("Upgrades",width/2+175,height/2+250);
      text(p.getSouls()+" SOULS",width/2+155,height/2+350);
      float soulX=width/2+85;
      float[] soulY={height/2+115,height/2+265};
      image(souls[curFrame],soulX,soulY[trackUI]);
         countFrame++;
         if(countFrame>=delayFrame){
           curFrame++;
         if(curFrame>=totalFrame){
           curFrame=0;
         }
         countFrame=0;
        }
      
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
