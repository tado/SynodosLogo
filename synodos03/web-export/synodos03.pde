int ROW = 3;
int COL = 3;
int NUM = ROW * COL;
GenLogo gen[] = new GenLogo[NUM];
PImage frameImg;

void setup() {
  size(600, 600, OPENGL);
  frameRate(15);
  //colorMode(HSB, 360, 100, 100, 100);
  for (int j = 0; j < ROW; j++) {
    for (int i = 0; i < COL; i++) {
      gen[j * ROW + i] = new GenLogo(i * width/float(COL), j * height/float(ROW), width/float(COL), height/float(ROW));
    }
  }
}

void draw() {
  background(255);
  lights();
  //ortho();
  for (int i = 0; i < NUM; i++) {
    gen[i].draw();
  }
}

void mouseReleased() {
  for (int i = 0; i < NUM; i++) {
    gen[i].mouseReleased();
  }
}

class GenLogo {
  int NUM = 20;
  float left, top;
  float w, h;
  float[] rotX = new float[NUM];
  float[] rotY = new float[NUM];
  float[] rotZ = new float[NUM];
  float[] centorX = new float[NUM];
  float[] centorY = new float[NUM];
  float[] centorZ = new float[NUM];
  color[] col = new color[NUM];
  int baseHue;
  int baseR, baseG, baseB;

  GenLogo(float _left, float _top, float _width, float _height) {
    left = _left;
    top = _top;
    w = _width;
    h = _height;
    setParams();
  }

  void draw() {
    pushMatrix();
    translate(left + w/2.0, top + w/2.0);
    for (int i = 0; i < NUM; i++) {
      pushMatrix();
      rotateX(rotX[i]);
      rotateY(rotY[i]);
      rotateZ(rotZ[i]);
      translate(centorX[i], centorY[i], centorZ[i]);
      fill(col[i]);
      //stroke(0,0,100,50);
      noStroke();
      sphere(w/5 * pow(0.95, i));
      //box(w/5 * pow(0.95, i));
      popMatrix();
    }
    popMatrix();
  }

  void mouseReleased() {
    setParams();
  }

  void setParams() {
    //baseHue = int(random(6)) * 60;
    baseR = random(127,255);
    baseG = random(127,255);
    baseB = random(127,255);
    for (int i = 0; i < NUM; i++) {
      rotX[i] = radians(random(360));
      rotY[i] = radians(random(360));
      rotZ[i] = radians(random(360));
      centorX[i] = random(-w/6.0, w/6.0);
      centorY[i] = random(-w/6.0, w/6.0);
      centorZ[i] = random(-w/6.0, w/6.0);
      //col[i] = color(baseHue + random(-40,40), 50, 100, 100);

      col[i] = color(baseR+random(-40, 40), baseG+random(-40, 40), baseB+random(-40, 40));
    }
  }
};


