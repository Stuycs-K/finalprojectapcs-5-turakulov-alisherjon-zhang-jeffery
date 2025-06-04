
    class Cat extends Entity{
      PImage catto;
        public Cat(int x, int y){
        super(90, 100, 100, x, y, 0, 0, "Cat");
        catto=loadImage("cat.png");
        }
        
        void display(){
        fill(0);
        noStroke();
         image(catto,position.x-catto.width/2,position.y-catto.height/2);
        }
        void move(){
        position.add(velocity);
        
        }
        
        void attractTo(Entity other){
          PVector direction = PVector.sub(position, other.position);
          direction.setMag(2);
          velocity = direction;
        }
        
        
        
    }
