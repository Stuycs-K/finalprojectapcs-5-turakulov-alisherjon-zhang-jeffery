
    class Cat extends Entity{
      PImage[] catto;
      int curFrame,countFrame,delayFrame,totalFrame;
        public Cat(int x, int y){
        super(90, 100, 100, x, y, 0, 0, "Cat");
        curFrame=0;
        countFrame=0;
        delayFrame=2;
        totalFrame=47;
        catto=new PImage[totalFrame];
        for(int i=0;i<totalFrame;i++){
          String get="catSprites/catspritesheetFix_0";
          if(i<10){
            get+="0"+i+".png";
          }else{
            get+=i+".png";
          }
          catto[i]=loadImage(get);
        }
        }
        
        void display(){
          image(catto[curFrame],position.x-catto[curFrame].width/2,position.y-catto[curFrame].height/2);
         countFrame++;
         if(countFrame>=delayFrame){
           curFrame++;
         if(curFrame>=totalFrame){
           curFrame=0;
         }
         countFrame=0;
        }
        }
        
        void move(){
        position.add(velocity);
        
        }
        
        PVector attractTo(Entity other){
          PVector direction = PVector.sub(position, other.position);
          direction.setMag(2);
          return direction;
        }
        
        void applyForce(PVector f){
          velocity = f;
        }
        
        
    }
