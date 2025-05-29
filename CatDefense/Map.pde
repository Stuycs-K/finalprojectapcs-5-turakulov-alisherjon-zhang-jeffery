class Map{
int[][] map;
ArrayList<Entity> Walls = new ArrayList<Entity>(25);



public Map(int num){
  num = max(num, 50);
  map = new int[40][40];
  int x, y;
  for(int i = 0; i < num; i++){
    x = (int) random(0, 40);
    y = (int) random(0, 40);
    if(map[x][y] == 0){
      map[x][y] = 1;
      Walls.add(new Wall(x+20, y*20));
    }
  }
}

public Map(){
  this(20);
}


void display(){
  for(int i = 0; i < map.length; i++){
    for(int j = 0; j < map[0].length; j++){
      int x = i*20;
      int y = j *20;
      if(map[i][j] == 0){
         fill(20, 200, 100);
         rect(x, y, x+20, y+20);
      }else if(map[i][j] == 1){
        fill(150, 100, 0);
        rect(x, y, x+20, y+20);
        fill(0, 250, 50);
        circle(x+10, y+10, 15);
      }
    }
  }
  for(int k = 0; k < Walls.size(); k++){
    Walls.get(k).display();
  }
}

}
