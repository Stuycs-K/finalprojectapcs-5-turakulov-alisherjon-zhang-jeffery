
class Map{
int[][] map;
ArrayList<Wall> Walls = new ArrayList<Wall>(25);
PImage wallace=loadImage("wall.png");
PImage mappa=loadImage("map.png");

public Map(int num){
  num = max(num, 50);
  map = new int[50][50];
  int x, y;
  for(int i = 0; i < num; i++){
    x = (int) random(0, 50);
    y = (int) random(0, 50);
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
  image(mappa,width/2,height/2,800,800);
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
    }
  }
  
  /*for(int k = 0; k < Walls.size(); k++){ walls displayed as static rectangles with rest of map
    Walls.get(k).display();
  }*/
}

 void displayEnd(){
  fill(100, 40, 20);
  rect(200, 200, 400, 200);
  fill(0);
  textSize(50);
  text("Game Over", 275, 310);
  }

}
