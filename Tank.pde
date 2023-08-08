PImage image1;

class Tank
{
  //members
  int x;
  int y;
  int speedX;
  int speedY;
  
  //constructor
  Tank (int x, int y, int speedX, int speedY)
  {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    image1 = loadImage("tank.png");
  }
  
  void draw() {
    image(image1,tank.x, tank.y);

}
//tank crash method
boolean crash(Vehicle other)
{
  return (abs(this.x-other.x)<20) && abs(this.y-other.y)<20;
}

}
