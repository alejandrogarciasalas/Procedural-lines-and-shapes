/*
shapes_and_lines_1
 by Alejandro García Salas
 
a procedural web
*/

int cols, rows;
int cellsize;
float lineThreshold;
Point[][] pts;
float c;

void setup() {
  c = 0;
  size(1920, 1080, P2D);
  frameRate(30);
  smooth();
  cellsize = 30;
  cols = 1920/cellsize+1;
  rows = 1080/cellsize+1;
  pts = new Point[cols][rows];
  lineThreshold = 45;
  for (int i=0;i<rows;i++) {
    for (int j=0;j<cols;j++) {
      pts[j][i] = new Point(j*cellsize, i*cellsize);
    }
  }
  background(255);
}
void draw() {
  for (int i=0;i<rows;i++) {
    for (int j=0;j<cols;j++) {
      pts[j][i].move();
    }
  }
  for (int i=0;i<rows;i++) {
    for (int j=0;j<cols;j++) {
      for (int k=i;k<rows;k++) {
        for (int l=j;l<cols;l++) {
          float distance = dist(pts[j][i].x, pts[j][i].y, pts[l][k].x, pts[l][k].y);
          if (distance<lineThreshold) {
            strokeWeight(3-distance*3/40);
            stroke(c, 100-distance*100/40);
            line(pts[j][i].x, pts[j][i].y, pts[l][k].x, pts[l][k].y);
          }
        }
      }
    }
  }
  if (c < 200) {
    c += 0.05;
  }else{
    c= 200;
  }
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    c = 0;
  }
}
