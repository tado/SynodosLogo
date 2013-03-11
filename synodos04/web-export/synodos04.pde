int ROW = 3;
int COL = 3;
int NUM = ROW * COL;
GenLogo gen[] = new GenLogo[NUM];
PImage frameImg;

void setup() {
  size(600, 600);
  frameRate(15);
  //smooth();
  colorMode(HSB, 360, 100, 100, 100);
  for (int j = 0; j < ROW; j++) {
    for (int i = 0; i < COL; i++) {
      gen[j * ROW + i] = new GenLogo(i * width/float(COL), j * height/float(ROW), width/float(COL), height/float(ROW));
    }
  }
  background(0, 0, 100, 100);  
  for (int i = 0; i < NUM; i++) {
    gen[i].draw();
  }
}

void draw() {
}

void mouseReleased() {
  background(0, 0, 100, 100);
  for (int i = 0; i < NUM; i++) {
    gen[i].mouseReleased();
  }
}

class GenLogo {
  int NUM = 40;
  float left, top;
  float w, h;
  color[] col = new color[NUM];
  int[] lineNum = new int[NUM];
  int baseHue;

  GenLogo(float _left, float _top, float _width, float _height) {
    left = _left;
    top = _top;
    w = _width;
    h = _height;

    setParams();
  }

  void draw() {
    pushMatrix();
    strokeWeight(2);
    translate(left + w/2.0, top + h/2.0);
    for (int j = 0; j < NUM; j++) {
      stroke(col[j]);
      rotate(j * 30);
      for (int i = 0; i < lineNum[j]; i++) {
        noFill();
        line(0, 0, w/2.5 * pow(0.9, j), 0);
        rotate(radians(1));
      }
    }
    popMatrix();
  }

  void mouseReleased() {
    setParams();
    draw();
  }

  void setParams() {
    baseHue = int(random(11)) * 30;
    for (int i = 0; i < NUM; i++) {
      col[i] = color(baseHue + random(60), random(20,60), 90, 40);
      lineNum[i] = int(random(30, 360));
    }
  }
};

// Constants
int Y_AXIS = 1;
int X_AXIS = 2;

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


