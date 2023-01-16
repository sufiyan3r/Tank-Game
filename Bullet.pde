class Bullet
{
  //members
  int x = 0;
  int y = 0;
  int speedY = 0;

  //constructor
  Bullet(int x, int y, int speedY)
  {
    this.x = x;
    this.y = y;
    this.speedY = speedY;
  }
  
void update() {
  for(int i=0; i<10; i++) 
  {
    render();
    move();
  }
}

void render() {
  //draw bullet
  fill(255,0,0);
  stroke(255,0,0);
  rect(x+30, y+140, 8, 20);
}
  
void move() {
  y += speedY;
}

//bullet crash method 
boolean crash(Vehicle other)
{
  //collision on top left corner of vehicle is successful
  return (abs(this.x-other.x) <10 && abs(this.y-other.y) <10);
  
  //collision on all 4 corners of vehicles is not successful
  //return (abs(this.x-other.x) <5 && abs(this.y-other.y) <5 || abs(this.x-other.x+30) <5 && abs(this.y-other.y) <5 || abs(this.x-other.x+30) <5 && abs(this.y-other.y+60) <5 || abs(this.x-other.x) <5 && abs(this.y-other.y+60) <5);
}
}
