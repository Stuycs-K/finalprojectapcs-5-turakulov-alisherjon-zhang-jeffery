class Map{
int[][] map;
ArrayList<Wall> Walls = new ArrayList<Wall>(25);



public Map(int num){
  num = max(num, 50);
  map = new int[40][40];
  int x, y;
  for(int i = 0; i < num; i++){
    x = (int) random(0, 40);
    y = (int) random(0, 40);
    if(map[y][x] == 0){
      map[y][x] = 1;
      Walls.add(new Wall(x*40, y*40));
    }
  }
}

public Map(){
  this(20);
}


void display(){
  for(int i = 0; i < map.length; i++){
    for(int j = 0; j < map[0].length; j++){
      int y = i*20;
      int x = j *20;
      if(map[i][j] == 0){
        noStroke();
         fill(20, 200, 100);
         
         rect(x, y, x+20, y+20);
         text(""+map[i][j], x, y);
      }else if(map[i][j] == 1){
        noStroke();
        fill(150, 100, 0);
        rect(x, y, x+20, y+20);
        fill(0, 250, 50);
        circle(x+10, y+10, 15);
        text(""+map[i][j], x, y);
      }
    }
  }
  for(int k = 0; k < Walls.size(); k++){
    Walls.get(k).display();
  }
}

}
