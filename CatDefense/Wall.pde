class Wall extends Entity{
  int damage;
  
  public Wall(int x, int y){
    this(0, x, y);
  }
  //default hp = 10
  public Wall(int dmg, int x, int y){
    super(10, 10, 0, x, y, 0, 0, "Wall");
    damage = dmg;
  }
  
//displayed through map class, otherwise it breaks
  void display(){
    //float x =  position.x;
    //float y =  position.y;
    //fill(150, 100, 0);
    //rect(x, y, x+20, y+20);
    //fill(0, 250, 50);
    //circle(x+10, y+10, 10);
  }
  
 
  void takeDamage(){
      for(Enemy en: Enemies){
        if(closeEnough(en)){
          hp -= en.damage;
          en.hp -= damage;
        }
      }
  }
  
  
  
}
