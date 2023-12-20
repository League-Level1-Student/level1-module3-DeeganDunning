static final int WIDTH = 600;
static final int HEIGHT = 600;
int x  = 300;
int y = 350;
int speed = 10;
Car c1;
Car c2;
Car c3;
Car c4;
@Override
  public void settings() {
  size(WIDTH, HEIGHT);
}

@Override
  public void setup() {
  c1 = new Car( 260, 125, 80, 5);
  c2 = new Car( 260, 225, 80, 5);
  c3 = new Car( 260, 325, 80, 5);
  c4 = new Car( 260, 425, 80, 5);
}

@Override
  public void draw() {
  background(34, 80, 255);
  fill(0, 255, 0);
  ellipse(x, y, 50, 50);
  c1.moveLeft();
  c2.moveRight();
  c3.moveLeft();
  c4.moveRight();
  
if( intersects(c1) || intersects(c2) || intersects(c3) || intersects (c4)){
  y = 300;
  x = HEIGHT - 50;
}
  
  c1.display();
  c2.display();
  c3.display();
  c4.display();
}

boolean intersects(Car car) {
 if ((y > car.getY() && y < car.getY()+50) &&
                (x > car.getX() && x < car.getX()+car.getSize())) {
   return true;
  }
 else  {
  return false;
 }
}

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP)
    {
      if ( y > speed) {
        y -= speed;
      }
    } else if (keyCode == DOWN)
    {
      if (y < HEIGHT - speed) {
        y+=speed;
      }
    } else if (keyCode == RIGHT)
    {
      if (x < WIDTH - speed) {
        x+=speed;
      }
    } else if (keyCode == LEFT)
    {
      if ( x> + speed) {
        x-=speed;
      }
    }
  }
}








class Car {
  int x;
  int y;
  int carSize;
  int carSpeed;
  Car( int x, int y, int carSize, int carSpeed) {
    this.x = x;
    this.y = y;
    this.carSize = carSize;
    this.carSpeed = carSpeed;
  }

  void display(){
    fill(0, 255, 0);
    rect(x, y, carSize, 50);
  }
  void moveLeft(){
    x-=carSpeed;
    if( x < - carSize){
      x = WIDTH;
    }
  }
  
  void moveRight(){
    x+=carSpeed;
    if (x > WIDTH){
      x = -carSize;
    }
  }
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
   
  int getSize(){
    return carSize;
  }
  
}
