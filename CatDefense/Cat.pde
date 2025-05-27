    class Cat extends Entity{
      
        public Cat(int x, int y){
        super(90, 100, 100, x, y, 0, 0, "Cat");
        }
        
        void display(){
        fill(0);
        noStroke();
         circle(position.x, position.y, 24);
        }
    
    }
