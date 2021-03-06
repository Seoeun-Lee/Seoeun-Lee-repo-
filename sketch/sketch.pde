PImage img;
PImage snoww;
float a;
float b;
float speedX = 2;

void setup() {
  size(800, 600, P2D);
  img = loadImage("green.jpg");
  img.resize(img.width/10, img.height/10);
  snoww = loadImage("snoww.jpg");
  a = width/2;
  b= height/2;
  imageMode(CENTER);
  
  
}

void draw() {
  background(255, 255, 255);
  
  for (int i=0; i<50; i++) {
    float x = random(width);
    float y = random(height);
    
    for (int j=0; j<50; j++) {
      float x2 = x + j;
      float y2 = y + j * 150;
      float alphaVal = abs(255 - ((y2 / height) * 255));
      tint(255, alphaVal);
      image(img, x2, y2);
    }
  }
  
  a += speedX;
  if (a > width || a < 0 ) {
    speedX += -1;
  }
  image(snoww, a, b, snoww.width * (height / snoww.height), height);
  
}
