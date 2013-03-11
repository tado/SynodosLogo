int ROW = 3;
int COL = 3;
int NUM = ROW * COL;
GenLogo gen[] = new GenLogo[NUM];
PImage frameImg;

void setup() {
  size(600, 600);
  frameRate(15);
  smooth();
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

