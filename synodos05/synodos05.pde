int ROW = 1;
int COL = 1;
int NUM = ROW * COL;
GenLogo gen[] = new GenLogo[NUM];
PImage frameImg;

void setup() {
  size(600, 600, OPENGL);
  frameRate(15);
  //smooth();
  //lights();
  //colorMode(HSB, 360, 100, 100, 100);
  for (int j = 0; j < ROW; j++) {
    for (int i = 0; i < COL; i++) {
      gen[j * ROW + i] = new GenLogo(i * width/float(COL), j * height/float(ROW), width/float(COL), height/float(ROW));
    }
  }
  background(255);  
  for (int i = 0; i < NUM; i++) {
    gen[i].draw();
  }
}

void draw() {
}

void mouseReleased() {
  background(255);
  for (int i = 0; i < NUM; i++) {
    gen[i].mouseReleased();
  }
}

