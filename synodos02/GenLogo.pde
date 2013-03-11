class GenLogo {
  int NUM = 4;
  float left, top;
  float w, h;

  float centerX[] = new float[2];
  float centerY[] = new float[2];
  float quadX[] = new float[4];
  float quadY[] = new float[4];
  color quadCol;

  color triangleColor[] = new color[8];

  GenLogo(float _left, float _top, float _width, float _height) {
    left = _left;
    top = _top;
    w = _width;
    h = _height;

    setParams();
  }

  void draw() {
    pushMatrix();
    translate(left + w/2.0, top + h/2.0);
    fill(quadCol);
    noStroke();

    beginShape();
    for (int i = 0; i < 4; i++) {
      vertex(quadX[i], quadY[i]);
    }
    endShape(CLOSE);

    strokeWeight(1);
    stroke(0,0,100,30);
    for (int j = 0; j < 2; j++) {
      for (int i = 0; i < 4; i++) {
        fill(triangleColor[i * (j+1)]);
        triangle(centerX[j], centerY[j], quadX[i], quadY[i], quadX[(i + 1) % 4], quadY[(i + 1) % 4]);
      }
    }

    fill(0, 0, 100, 50);
    stroke(0, 0, 50, 100);
    strokeWeight(2);
    for (int i = 0; i < 2; i++) {
      ellipse(centerX[i], centerY[i], w/40.0, w/40.0);
    }
    for (int i = 0; i < 4; i++) {
      ellipse(quadX[i], quadY[i], w/40.0, w/40.0);
    }

    popMatrix();
  }

  void mouseReleased() {
    setParams();
  }

  void setParams() {
    for (int i = 0; i < 2; i++) {
      centerX[i] = random(-w/3, w/3);
      centerY[i] = random(-h/3, h/3);
    }

    for (int i = 0; i < 4; i++) {
      float angle = radians(i * random(60, 120));
      float dist = random(w/3, w/2.5);
      quadX[i] = cos(angle) * dist;
      quadY[i] = sin(angle) * dist;
    }
    for (int i = 0; i < 8; i++) {
      triangleColor[i] = color(random(360), 80, 80, 15);
    }
    quadCol = color(random(360), 50, 100, 100);
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

