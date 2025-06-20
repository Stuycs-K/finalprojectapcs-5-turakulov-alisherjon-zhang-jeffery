class Map{
int[][] map;
ArrayList<Wall> Walls = new ArrayList<Wall>(26);
PImage wallace=loadImage("wall.png");
PImage mappa=loadImage("map.png");
PImage winS=loadImage("win.png");
Player p;

public Map(int num){
  num = max(num, 35);
  map = new int[40][40];
  int x, y;
  for(int i = 0; i < num; i++){
    x = (int) random(0, 40);
    y = (int) random(0, 40);
    if(map[y][x] == 0){ // initialize walls at spots with value 0
      map[y][x] = 1; //return back to 1 so it becomes map color?
      Walls.add(new Wall(x*20, y*20));
    }
  }
}

public Map(){
  this(20);
}

//display map
void display(){
  imageMode(CENTER);
  image(mappa,(width/2)-100,height/2,800,800);
  imageMode(CORNER);
  for(int i = 0; i < map.length; i++){
    for(int j = 0; j < map[0].length; j++){
      int y = i*20;
      int x = j *20;
      if(map[i][j] == 1){
        fill(0, 250, 50);
        image(wallace,x-wallace.width/2,y-wallace.height/2);
        //textSize(12);
        //text(""+map[i][j], x, y);
      }
      if(map[i][j] == 2){
        fill(90,40,5);
        rect(x-35, y, 70, 15);
        
      }
    }
  }
  
  /*for(int k = 0; k < Walls.size(); k++){ walls displayed as static rectangles with rest of map
    Walls.get(k).display();
  }*/
}

 void displayEnd(){
  fill(100, 40, 20);
  rect(300, 200, 400, 200);
  fill(0);
  textSize(50);
  text("Game Over", 375, 310);
  textSize(25);
  text("Wave: " +wave, 455, 350);
  }
  
  void displayWin(){
    
    image(winS,0,0);//add animated cat sprite below
}
}
