/*
size(640,360);
line(100,50,600,250);

rect(100,50,20,200);
*/

/*

size(640,360);
stroke(_______);
line(100,50,600,250);

stroke(_________);
fill(_______);
rect(100,50,20,200);
*/

PImage img;
float x;
float y;
float speedX = 0.5;

void setup() {
  size(600,400);
  img = loadImage("city.JPG");
  x = width/2;
  y = height/2;
  imageMode(CENTER);
}

/*
void draw() {
  image(img, 0, 0);
  image(img, 0, 0, width/2, height/2);
}
*/

void draw() {
  image(img, x, y, img.width * (height / img.height), height);
  x += speedX;
  if (x > width) {
    x -= speedX;
  }
}
