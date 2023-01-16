abstract class Vehicle 
{
  int x, y;
  int speedY = 2;
  int animationCounter = 0;
  PImage image1, image2, image3;
  
  Vehicle(int x, int y, int speedY) 
  {
    this.x = x;
    this.y = y;
    this.speedY = speedY;
  }
  
  void update() 
  {
    render();
    move();
  }
  
  abstract void render();
  {
    
  }

  abstract void move();
  {

  }
  
  void end()
  {
    speedY =  0;
  }
}
