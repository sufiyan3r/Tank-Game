class Racecar extends Vehicle
{
   PImage image1,image2,image3;
   
   //constructor
   Racecar(int x, int y, int speedY)
   {
     super(x,y,speedY);
     //this.x = x;
     //this.y = y;
     //this.speedY = speedY;
     image1 = loadImage("rc1.png");
     image2 = loadImage("rc2.png");
     image3 = loadImage("rc3.png");
   }

void move()
{
  this.y = this.y - speedY; //move upwards

  if(this.y < 0 - image1.height)
  this.y = height + image1.height;
  
  if(this.y > height + image1.height +30)
  this.y = -image1.height;
}

void render()
{
  if (animationCounter >=0  &  animationCounter <=8) 
{ image(image1,this.x,this.y); }
  else if (animationCounter >8  &  animationCounter <=16) 
{ image(image2,this.x,this.y); }
  else
{ image(image3,this.x,this.y); }

  animationCounter = animationCounter + 1;
  if(animationCounter>20)
  animationCounter = 0; 
  }

}
