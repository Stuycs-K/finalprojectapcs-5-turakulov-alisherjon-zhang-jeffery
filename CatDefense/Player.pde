class Player extends Entity{
  int catnip;
  int weapon; //damage
  int defense; //hp increase
  int ammo; int maxAmmo; int remBox; int remBoxL;
  int medpacks;
  int souls; //currency
  int lives; //later
  boolean medkit; //heal self or cat
  boolean boxCheck; //only can reload if ammobox with ammo left
  boolean isCatnip;
  float speed = 10; //test around
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
    medpacks=1;
    medkit=false;
    remBox=2; remBoxL=100;
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
      System.out.println("current ammoBox remaining bullets: "+remBoxL);
      if(remBoxL<=0){
        if(remBox==1){
          boxCheck=false;
          inventory.remove("ammoBox");
        }else{
          boxCheck=true;
        }
        remBox--;
        remBoxL=100+remBoxL;
        System.out.println("remaining ammoBoxes: "+remBox);
      }
    ammo+=maxAmmo-ammo;
    }
  }
  
  void heal(){
    if(medkit&&closeEnough(c)){
      c.hp+=c.maxHP-c.hp;
      medpacks--;
      if(medpacks==1){
        inventory.remove("medkit");
        medkit=false;
      }
    }else if(medkit){
      hp+=maxHP-hp;
      medpacks--;
      if(medpacks==1){
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
    }
    if(key=='t'||key=='T'){
      heal();
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
    if(position.x>width) position.x=0;
    if(position.x<0) position.x=width;
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
    fill(0);
    text("Bullets: " + ammo+"/"+maxAmmo, 25, 50);
    textSize(50); // bullet icon next to it or smth
    text(hp+"  /  "+(maxHP+defense),25,100);
    text("Souls " +souls,25,150);
    for(int i=0;i<2;i++){
      fill(50,50,50,120);
      stroke(255);
      rect(15+i*(toolSlot+kerning),690,toolSlot,toolSlot,8);
      fill(50);
      if(i<inventory.size()){
      String item=inventory.get(i);
      imageMode(CENTER);
      if(i==0&&item.equals("ammoBox")){
    image(box,18+toolSlot/2,690+toolSlot/2);
    textSize(20);
    fill(0,0,0);
    text("Remaining uses: "+remBox,mouseX,mouseY);
    }else if(i==1&&item.equals("ammoBox")){
    image(box,134+toolSlot/2,690+toolSlot/2);
    textSize(20);
    fill(0,0,0);
    text("Remaining uses: "+remBox,mouseX,mouseY);
    }
    if(i==0&&item.equals("medkit")){
    image(kit,16+toolSlot/2,695+toolSlot/2);
    }else if(i==1&&item.equals("medkit")){
    image(kit,132+toolSlot/2,695+toolSlot/2);
    }
    imageMode(CORNER);
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
  
  void useCatnip(){
    if(isCatnip){
      catnip--;
      //code here relating to cat class need to discuss
    }
  }
}
