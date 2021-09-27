PImage img;

void setup() {
  size(600, 400, P2D);
  img = loadImage("bird.JPG");
  frameRate(10);
}

void draw() {
  background(127, 0, 127);
  
  for (int i=0; i<10; i++) {
    image(img, random(width), random(height), img.width/10, img.height/10);
  }
}
