class Player extends Entity{
  int catnip;
  int weapon; //damage
  int defense; //hp increase
  int ammo; int maxAmmo; int remBox; int remBoxL; int reloadT; boolean remainR;
  int medpacks, healT; boolean healR;
  int souls; //currency
  int slowedT;
  boolean medkit; //heal self or cat
  boolean boxCheck; //only can reload if ammobox with ammo left
  boolean isCatnip;
  float speed = 5; //test around
  float bulletSpeed=10; //upgrades later
  boolean up,down,left,right;
  ArrayList<Bullets> bullets;
  boolean shootHold;
  ArrayList<String> inventory=new ArrayList<String>();
  PImage box=loadImage("ammobox2.png");
  PImage kit=loadImage("kit.png");
  Cat c;
  
  public Player(Cat cattail,int catnip, int wep, int def, int amm, boolean isCatnip, int xpos, int ypos){
    super(100,100+def,10.0,xpos,ypos,0,0,"Player");
    this.catnip=catnip;
    weapon=wep;
    defense=def;
    ammo=amm;
    maxAmmo=amm;
    boxCheck=true;
    medkit=false;
    remBox=1; remBoxL=100;
    this.isCatnip=isCatnip;
    bullets=new ArrayList<Bullets>();
    box.resize(280,280);
    kit.resize(240,240);
    c=cattail;
    addItem("ammoBox");
  }
  
  void shoot(){
    if(ammo>0){
      PVector dir2=new PVector(mouseX,mouseY);
      PVector dir=new PVector(position.x,position.y).sub(dir2).mult(-1);
      PVector shoot=position.copy();
      bullets.add(new Bullets(shoot,dir,bulletSpeed));
    ammo--;
    //System.out.println("ammo: "+ammo+"/"+maxAmmo);
    }
  }
  
  void reload(){
    if(ammo<maxAmmo&&boxCheck){
      remBoxL-=maxAmmo-ammo;
      if(remBoxL<=0){
        if(remBox==1){
          boxCheck=false;
          inventory.remove("ammoBox");
        }else{
          boxCheck=true;
        }
        remBox--;
        remBoxL=100+remBoxL;
      }
    ammo+=maxAmmo-ammo;
    }
  }
  
  void heal(){
    if(medkit&&closeEnough(c)){
      c.hp+=c.maxHP-c.hp;
      medpacks--;
      if(medpacks<=0){
        inventory.remove("medkit");
        medkit=false;
      }
    }else if(medkit){
      hp+=maxHP-hp;
      medpacks--;
      if(medpacks<=0){
        inventory.remove("medkit");
        medkit=false;
      }
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
      remainR=true;
      reloadT=240;
    }
    if(key=='t'||key=='T'){
      heal();
      healR=true;
      healT=240;
    }
  }
  
  void mousePressed(){
    if(mouseButton==LEFT){
      shootHold=true;
    }
  }
  void mouseReleased(){
    if(mouseButton==LEFT){
      shootHold=false;
    }
  }
  
  /*void mouseClicked(){
    shoot();
  } deprecated */  
  
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
    if(position.x>800) position.x=0;
    if(position.x<0) position.x=800;
    if(position.y<0) position.y=height;
    if(position.y>height) position.y=0;
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
  
  void addItem(String item){
    boolean isDupe=false;
    if(inventory.size()!=0){
    for(int i=0;i<inventory.size();i++){
      if(inventory.get(i).equals(item)) isDupe=true;
    }
    }
    if(inventory.size()<2&&!isDupe){
      inventory.add(item);
      if(item.equals("ammoBox")) boxCheck=true;
      if(item.equals("medkit")) medkit=true;
    }
  }
  
  void addMedkit(){
    addItem("medkit");
  }
  void addBox(){
    addItem("ammoBox");
  }
  
  void UI(){
    //reload
    int toolSlot=95;
    int kerning=20;
    //stroke(0);
    imageMode(CENTER);
    fill(0);
    textSize(30);
    text("Bullets: " + ammo+"/"+maxAmmo, 805, 50);
    //textSize(30); // bullet icon next to it or smth
    text(hp+"  /  "+(maxHP+defense),805,110);
    text("Souls " +souls,805,170);
    for(int i=0;i<2;i++){
      fill(50,50,50,120);
      stroke(255);
      rect(width/2+355,580+i*(toolSlot+kerning),toolSlot,toolSlot,8);
      fill(50);
      if(i<inventory.size()){
      String item=inventory.get(i);
      imageMode(CENTER);
      if(i==0&&item.equals("ammoBox")){
    image(box,width/2+358+toolSlot/2,580+toolSlot/2);
    textSize(20);
    fill(0,0,0);
    }else if(i==1&&item.equals("ammoBox")){
    image(box,width/2+358+toolSlot/2,694+toolSlot/2);
    textSize(20);
    fill(0,0,0);
    text("Remaining uses: "+remBox,mouseX,mouseY);
    }
    if(i==0&&item.equals("medkit")){
     image(kit,width/2+354+toolSlot/2,586+toolSlot/2);
    }else if(i==1&&item.equals("medkit")){
    image(kit,width/2+355+toolSlot/2,699+toolSlot/2);
    }
    imageMode(CORNER);
    if(remainR&&boxCheck&&healT<120){
      text("Remaining bullets: "+remBoxL+"/"+"100",mouseX,mouseY);
      text("Ammoboxes left: "+remBox,mouseX,mouseY-15);
      }
      reloadT--;
      if(reloadT<=0) remainR=false;
     if(healR&&medkit&&reloadT<120){
      text("Remaining medkits: "+medpacks,mouseX,mouseY);
      }
      healT--;
      if(healT<=0) healR=false;
      }
    }
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
  void slowed(){
    if(slowedT>0){
      slowedT--;
    if(slowedT==0) speed=10;
    }
  }
  
  /*void useCatnip(){
    if(isCatnip){
      catnip--;
      //code here relating to cat class need to discuss
    }*/
}
