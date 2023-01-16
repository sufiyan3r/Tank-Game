PImage bg;    //loads bakground 
PFont f;      //loads font

//Array of vehicles
Vehicle[] vehicles = new Vehicle[4];

//variables
int x = 0;
int y = 0; 
int game = 0; 
int running = 0;
int over = 1;
int score = 0;
int move = 20;

Tank tank;
Bullet bullet;

void setup()
{
  size(500,1000);
  textSize(40);
  bg = loadImage("bg.jpeg");              //loads background
  bg.resize(width,height);                //the background will fill the height and width of the screen size
  tank = new Tank(215, 60, 3, 2);         //X pos, Y pos, speedX, speedY  
  for (int i=0; i<vehicles.length; i++)
  {
    int x = (int)random(width-100);       //car xpos (randomly generated)
    int y = (int)random(900);             //car ypos (randomly generated)
    int speedY = 3;                       //car speedY
    //int speedY = (int) random(1,5);     //if desired to generate random speed for vehicles
    vehicles[i] = new Car(x, y, speedY);
  }
      
  vehicles[0] = new Car((int)random(5, width-100), (int)random(5, height), 2);      //X pos, Y pos, speedY
  vehicles[1] = new Racecar((int)random(5, width-100), (int)random(5, height), 2);  //X pos, Y pos, speedY
  f = createFont("Arial", 36, true);
}

void draw()
{
  if (game == running)
  {
    drawBackground();       //background
    tank.draw();            //tank
    drawScore();            //draw score
    //lets vehicles appear and move on screen
    for (Vehicle v : vehicles) {
      v.render();
      v.move();
    }
       
    for (Vehicle v : vehicles) {
      if(bullet!=null)
      {
        bullet.update();
      //if bullet hits vehicles
      if(bullet.crash(v) == true)
        {       
          score++;
          v.speedY = 0;
          //v = null; //vehicle fails to be removed from screen when hit from bullet
        } 
      }
    }
 
    for(Vehicle v : vehicles) {
    //if tank crashes into vehicles
    if(tank.crash(v))
    {
      v.end();
      game = over;
      gameOver();
    }
  }

  }
    //if game is not running
    else if (game == over)
    {
      gameOver();
      tank.speedY = 0;
      vehicles[0].speedY = 0;
      vehicles[1].speedY = 0;

      for(Vehicle v : vehicles) 
      {
        v.end();
      }
      move=0; 
    }
}


void keyPressed() //controls for the tank using the arrow keys
{
  if(keyCode == LEFT) { 
    tank.x = tank.x - move;  //moves tank left
  }
  if(keyCode == RIGHT) {
    tank.x = tank.x + move;  //moves tank right
  }
  if(keyCode == DOWN) { 
    tank.y = tank.y + move;  //moves tank down
  }
  if(keyCode == UP) { 
    tank.y = tank.y - move;  //moves tank up
  }
  if(keyCode == ' ') {
    //creates new bullet which is shot from tank when key ' ' is pressed
    bullet = new Bullet(tank.x, tank.y, 1);      //X pos, Y pos, speedY
  }
}

void drawBackground()
{
  image(bg, y, 0);
}

//displays score
void drawScore() {
  fill(255);
  textFont(f);
  text("Score: " + String.valueOf(score), 200, 50);
}

//displays game over screen
void gameOver() {
  clear();
  textFont(f);
  text("Game Over! ", 150, 400);
}
