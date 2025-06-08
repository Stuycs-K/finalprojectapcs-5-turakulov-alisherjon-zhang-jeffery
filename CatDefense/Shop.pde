class Shop extends Entity{
  int costDefence;
  int costWeapon;
  int costBox;
  int costMed;
  int trackUI, trackUII, trackUIU;
  boolean base,items,upgrades;
  Player p;
  Cat c;
  boolean isOpen;
  PImage shop;
  int expDef; int expWep;
  PImage shopGuy=loadImage("shopdude.png");
  float sinAng, sinAmp;
  PImage bgUI=loadImage("shopBase.png");
  PImage[] souls;
  int curFrame,countFrame,delayFrame,totalFrame;
  boolean purchaseCD;
  float tick;
  
  public Shop(int costD,int costW, int costBox, Player player,Cat catsz,int x,int y){
    super(10000000,10000000,10.0,x,y,0,0,"Shop");
    costDefence=costD;
    costWeapon=costW;
    this.costBox=costBox;
    costMed=10; //TOO LAZYY
    p=player;
    c=catsz;
    shop=loadImage("shop.png");
    shopGuy.resize(800,800);
    base=true;
    purchaseCD=true;
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
      p.defInc(25);
      p.hp+=p.maxHP+p.defense-p.hp;
      c.maxHP+=25;
      c.hp+=c.maxHP-c.hp;
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
    if(p.getSouls()>=costBox){
      if(!p.boxCheck){
        p.addBox();
      }
      p.soulsDec(costBox);
      p.remBox++;
  }
  }
  void Medkit(){
    if(p.getSouls()>=costMed){
      if(!p.medkit){
        p.addMedkit();
      }
      p.soulsDec(costMed);
      p.medpacks++;
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
      if(base){
      trackUI--;
      if(trackUI<0) trackUI=1;
      }
      if(items){
        trackUII--;
        if(trackUII<0) trackUII=3;
      }
      if(upgrades){
        trackUIU--;
        if(trackUIU<0) trackUIU=2;
      }
    }
    if(keyCode==DOWN){
      if(base){
      trackUI++;
      if(trackUI>1) trackUI=0;
      }
      if(items){
        trackUII++;
        if(trackUII>3) trackUII=0;
      }
      if(upgrades){
        trackUIU++;
        if(trackUIU>2) trackUIU=0;
      }
    }
    if(keyCode==ENTER){
      if(base&&purchaseCD){
      if(trackUI==0){
        base=false;
        items=true;
        upgrades=false;
        purchaseCD=false;
      }
      if(trackUI==1){
        base=false;
        items=false;
        upgrades=true;
        purchaseCD=false;
      }
      }
      if(items&&purchaseCD){
        if(trackUII==0){
          ammoBox();
          purchaseCD=false;
        }
        if(trackUII==1){
          Medkit();
          purchaseCD=false;
        }
        if(trackUII==3){
          base=true;
          items=false;
          upgrades=false;
          trackUI=0;
          trackUII=0;
        }
      }
      if(upgrades&&purchaseCD){
        if(trackUIU==0){
          upgradeWeapon();
          purchaseCD=false;
        }
        if(trackUIU==1){
          upgradeDefense();
          purchaseCD=false;
        }
        if(trackUIU==2){
          base=true;
          items=false;
          upgrades=false;
          trackUI=0;
          trackUIU=0;
        }
    }
    }
  }
  
  void UI(){
    if(!purchaseCD){
      tick++;
    if(tick>=15){
      purchaseCD=true;
      tick=0;
    }
    }
    if(dist(position.x,position.y,p.position.x,p.position.y)<30){
      isOpen=true;
      int sinu=0;
      sinAmp=10;
      image(shopGuy,0,30+sin(sinAng)*sinAmp);
      sinAng+=0.075;
      if(sinAng>TWO_PI) sinAng=0;
      sinu+=0.1;
      if(sinu>(3.14*2)) sinu=0;
      image(bgUI,5,0);
      textSize(40);
      fill(255);
      text(p.getSouls()+" SOULS",width/2+155,height/2+350);
      if(base){
      text(" > Why did the man fall through\n    the glass?",width/2-370,height/2+200);
      text(" > Because he weighed a\n    SKELEton!",width/2-370,height/2+280);
      text("Items",width/2+175,height/2+200);
      text("Upgrades",width/2+175,height/2+250);
      float soulX=width/2+85;
      float[] soulY={height/2+115,height/2+165};
      image(souls[curFrame],soulX,soulY[trackUI]);
         countFrame++;
         if(countFrame>=delayFrame){
           curFrame++;
         if(curFrame>=totalFrame){
           curFrame=0;
         }
         countFrame=0;
        }
      }else if(items){
        text("Ammo Box"+"             "+costBox+" Souls",width/2-300,height/2+200);
        text("Health Kit"+"          "+costMed+" Souls",width/2-300,height/2+250);
        text("Catnip"+"           "+"99999 Souls",width/2-300,height/2+300);
        text("Exit",width/2-300,height/2+350);
        float soulX=width/2-400;
      float[] soulY={height/2+115,height/2+165,height/2+215,height/2+265};
        image(souls[curFrame],soulX,soulY[trackUII]);
         countFrame++;
         if(countFrame>=delayFrame){
           curFrame++;
         if(curFrame>=totalFrame){
           curFrame=0;
         }
         countFrame=0;
         }
         if(trackUII==0){
           imageMode(CENTER);
           image(p.box,width/2+250,height/2+100);
         }
         if(trackUII==1){
           imageMode(CENTER);
           image(p.kit,width/2+250,height/2+100);
           imageMode(CORNER);
         }
      }else if(upgrades){
        text("DMG Upgrade"+"        "+costWeapon+" Souls",width/2-300,height/2+200);
        text("Health Upgrade"+"    "+costDefence+" Souls",width/2-300,height/2+250);
        if(trackUIU==0){
          text("Upgrades the\ndamage you\ndeal by 1!",width/2+150,height/2+200);
        }
        if(trackUIU==1){
          text("Upgrades your\nand cat's\nmax health\nby 5!",width/2+150,height/2+200);
        }
        text("Exit",width/2-300,height/2+300);
        float soulX=width/2-400;
      float[] soulY={height/2+115,height/2+165,height/2+215};
        image(souls[curFrame],soulX,soulY[trackUIU]);
         countFrame++;
         if(countFrame>=delayFrame){
           curFrame++;
         if(curFrame>=totalFrame){
           curFrame=0;
         }
         countFrame=0;
         }
      }
      }else{
        isOpen=false;
      }
    }
    
  void display(){
    fill(0,255,255);
    image(shop,position.x-shop.width/2,position.y-shop.height/2);
}
}
