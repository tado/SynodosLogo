int ROW = 8;
int COL = 8;
int NUM = ROW * COL;
GenLogo gen[] = new GenLogo[NUM];

void setup() {
  size(600, 600);
  frameRate(15);
  colorMode(HSB, 360, 100, 100, 100);
  for (int j = 0; j < ROW; j++) {
    for (int i = 0; i < COL; i++) {
      gen[j * ROW + i] = new GenLogo(i * width/float(COL), j * height/float(ROW), width/float(COL), height/float(ROW));
    }
  }
}

void draw() {
  background(0, 0, 100, 100);
  for (int i = 0; i < NUM; i++) {
    gen[i].draw();
  }
  for (int i = 0; i < NUM; i++) {
    gen[i].drawFrame();
  }
}

void mouseReleased() {
  for (int i = 0; i < NUM; i++) {
    gen[i].mouseReleased();
  }
}

PImage frameImg;

class GenLogo {
  int NUM = 4;
  float x[] = new float[NUM];
  float y[] = new float[NUM];
  float radius[] = new float[NUM];
  float left, top;
  float width, height;

  // Constants
  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1;
  color c2;

  GenLogo(float _left, float _top, float _width, float _height) {
    left = _left;
    top = _top;
    width = _width;
    height = _height;

    float h = random(360);
    c1 = color(h, 100, 50, 100);
    c2 = color(h, 20, 100, 100);

    frameImg = loadImage("frame_s.png");
    for (int i = 0; i < NUM; i++) {
      x[i] = random(width/2-width/4, width/2+width/4);
      y[i] = random(width/2-width/4, width/2+width/4);
      radius[i] = random(width/4, width);
    }
  }

  void draw() {
    noStroke();
    pushMatrix();

    translate(left, top);

    /*
    fill(63, 127, 255);
     rect(0, 0, width, height);
     */

    setGradient(10, 10, width-20, height-20, c1, c2, Y_AXIS);

    fill(0, 0, 100, 25);
    noStroke();
    for (int i = 0; i < NUM; i++) {
      ellipse(x[i], y[i], radius[i], radius[i]);
    }

    popMatrix();
  }

  void drawFrame() {
    image(frameImg, left, top, width, height);
  }

  int getSeed() {
    return millis()*1000;
  }

  void mouseReleased() {
    float h = random(360);
    c1 = color(h, 100, 50, 100);
    c2 = color(h, 50, 100, 100);
    for (int i = 0; i < NUM; i++) {
      x[i] = random(width/2-width/4, width/2+width/4);
      y[i] = random(width/2-width/4, width/2+width/4);
      radius[i] = random(width/4, width);
    }
  }

  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
    noFill();
    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    }  
    else if (axis == X_AXIS) {  // Left to right gradient
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
  }
};


