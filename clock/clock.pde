float rotSeconds = 0;
float rotMinutes = 0;
float rotHours = 0;
int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;

float faceSize = 500;
float lengthSecondHand = 220;
float lengthMinuteHand = 200;
float lengthHourHand = 120;

color outlineCol = color(100);
color secondCol = color(201, 91, 157);
color faceCol = color(255, 145, 211);

int cx, cy;
float secondsRadius;

PImage clock_face;

void setup() {
  size(800, 600, P2D); 
  strokeWeight(2);
  clock_face = loadImage("clock_face.png");
  imageMode(CENTER);
  
  int radius = min(width, height) / 2;
  cx = width / 2;
  cy = height / 2;
  secondsRadius = radius * 0.72;
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();

//현제 초침 시간 업데이트  
  if (s != lastSecond) {
    rotSeconds = ((float) s / 60) * TWO_PI;
    lastSecond = s;
  }
 // 분침 업데이트
  if (m != lastMinute) {
    rotMinutes = ((float) m / 60) * TWO_PI; 
    lastMinute = m;
  }
  // 시침 업데이트
  if (h != lastHour) {
    rotHours = ((float) h / 12) * TWO_PI;  
    println(h);
    lastHour = h;
  }
  
  fill(faceCol);
  stroke(outlineCol);
  ellipse(width/2, height/2, faceSize, faceSize);
  image(clock_face, 400, 300, 500, 500);
  
  stroke(0, 69, 28, 34);
  for(int i=0; i<12; i++) {
    float rot = ((float) i/12) * TWO_PI;
    pushMatrix();
    translate(width/2, height/2);
    rotate(rot);
    line(0, faceSize/3, 0, faceSize/2);
    popMatrix();
  }
  
//초 그리기
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotSeconds);
  fill(secondCol);
  stroke(secondCol);
  line(0, 0, 0, -lengthSecondHand);
  ellipse(0, -lengthSecondHand, 10,10);
  popMatrix();
  
  // 분 그리기
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotMinutes);
  fill(0);
  stroke(outlineCol);
  line(0, 0, 0, -lengthMinuteHand);
  ellipse(0, -lengthMinuteHand, 10,10);
  popMatrix();
  
//시간 그리기
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotHours);
  line(0, 0, 0, -lengthHourHand);
  ellipse(0, -lengthHourHand, 10,10);
  popMatrix();
  
  fill(faceCol);
  ellipse(width/2, height/2, 10, 10);
  
   // Draw the minute ticks
  strokeWeight(4);
  beginShape(LINES);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
}
