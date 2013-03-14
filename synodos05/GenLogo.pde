class GenLogo {
  int NUM = 32;
  float left, top;
  float w, h;
  color[] col = new color[NUM];
  int[] lineNum = new int[NUM];
  int baseR, baseG, baseB;

  GenLogo(float _left, float _top, float _width, float _height) {
    left = _left;
    top = _top;
    w = _width;
    h = _height;

    setParams();
  }

  void draw() {
    lights();
    pushMatrix();
    translate(left + w/2.0, top + h/2.0);
    rotateY(radians(random(360)));  
    for (int j = 0; j < NUM; j++) {
      //stroke(col[j]);
      fill(col[j]);
      noStroke();  
      rotate(j * 30);
      for (int i = 0; i < lineNum[j]; i++) {
        //noFill();

        //line(0, 0, w/2.25 * pow(0.99, j), 0);
        pushMatrix();
        translate(w/2.25 * pow(0.95, j), 0, 0);
        box(w/60);
        popMatrix();

        rotate(radians(1));
      }
      rotateX(radians(20));
      rotateY(radians(30));
    }
    popMatrix();
  }

  void mouseReleased() {
    setParams();
    draw();
  }

  void setParams() {
    baseR = random(63, 255);
    baseG = random(63, 255);
    baseB = random(63, 255);
    for (int i = 0; i < NUM; i++) {
      col[i] = color(baseR+random(-60, 60), baseG+random(-60, 60), baseB+random(-60, 60), 190);
      lineNum[i] = int(random(30, 360));
    }
  }
};

void gradientLine(float x1, float y1, float x2, float y2, color c1, color c2) {
  int div = 24;
  for (int i = 0; i < div; i++) {
    float inter = map(i, 0, div, 0, 1);
    color c = lerpColor(c1, c2, inter);
    float x = map(i, 0, div, x1, x2);
    float y = map(i, 0, div, y1, y2);
    stroke(c);
    //line(px, py, x, y);
    point(x, y);
  }
}

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

