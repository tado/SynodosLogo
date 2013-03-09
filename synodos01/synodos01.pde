int ROW = 4;
int COL = 4;
int NUM = ROW * COL;
GenLogo gen[] = new GenLogo[NUM];
PImage frameImg;

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

