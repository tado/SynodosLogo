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

