import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class synodos02 extends PApplet {

int ROW = 2;
int COL = 2;
int NUM = ROW * COL;
GenLogo gen[] = new GenLogo[NUM];
PImage frameImg;

public void setup() {
  size(600, 600);
  frameRate(15);
  colorMode(HSB, 360, 100, 100, 100);
  for (int j = 0; j < ROW; j++) {
    for (int i = 0; i < COL; i++) {
      gen[j * ROW + i] = new GenLogo(i * width/PApplet.parseFloat(COL), j * height/PApplet.parseFloat(ROW), width/PApplet.parseFloat(COL), height/PApplet.parseFloat(ROW));
    }
  }
}

public void draw() {
  background(0, 0, 100, 100);
  for (int i = 0; i < NUM; i++) {
    gen[i].draw();
  }
}

public void mouseReleased() {
  for (int i = 0; i < NUM; i++) {
    gen[i].mouseReleased();
  }
}

class GenLogo {
  int NUM = 4;
  float left, top;
  float w, h;

  float centerX[] = new float[2];
  float centerY[] = new float[2];
  float quadX[] = new float[4];
  float quadY[] = new float[4];
  int quadCol;

  int triangleColor[] = new int[8];

  GenLogo(float _left, float _top, float _width, float _height) {
    left = _left;
    top = _top;
    w = _width;
    h = _height;

    setParams();
  }

  public void draw() {
    pushMatrix();
    translate(left + w/2.0f, top + h/2.0f);
    fill(quadCol);
    noStroke();
    
    beginShape();
    for(int i = 0; i < 4; i++){
      vertex(quadX[i], quadY[i]);
    }
    endShape(CLOSE);
    
    for(int j = 0; j < 2; j++){
      for(int i = 0; i < 4; i++){
       fill(triangleColor[i * (j+1)]);
       triangle(centerX[j], centerY[j], quadX[i], quadY[i], quadX[(i + 1) % 4], quadY[(i + 1) % 4]);
     }
   }

   fill(0,0,100,50);
   stroke(0,0,50,100);
   strokeWeight(2);
   for(int i = 0; i < 2; i++){
     ellipse(centerX[i], centerY[i], w/40.0f, w/40.0f);
   }
   for(int i = 0; i < 4; i++){
     ellipse(quadX[i], quadY[i], w/40.0f, w/40.0f);
   }

    popMatrix();
  }

  public void mouseReleased() {
    setParams();
  }

  public void setParams(){
    for(int i = 0; i < 2; i++){
      centerX[i] = random(-w/3, w/3);
      centerY[i] = random(-h/3, h/3);
    }
    
    for(int i = 0; i < 4; i++){
      float angle = radians(i * random(60,120));
      float dist = random(w/3, w/2.5f);
      quadX[i] = cos(angle) * dist;
      quadY[i] = sin(angle) * dist;
    }
    for(int i = 0; i < 8; i++){
      triangleColor[i] = color(random(360), 80, 80, 10);
    }
    quadCol = color(random(360), 50, 100, 100);
  }
};

// Constants
int Y_AXIS = 1;
int X_AXIS = 2;

public void setGradient(int x, int y, float w, float h, int c1, int c2, int axis ) {
    noFill();
    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        int c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    } 
    else if (axis == X_AXIS) {  // Left to right gradient
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        int c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
  }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "synodos02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
