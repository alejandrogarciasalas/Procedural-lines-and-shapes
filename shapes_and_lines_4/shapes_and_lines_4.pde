/*
shapes_and_lines_4
 by Alejandro García Salas
 
procedural lines
*/

import processing.opengl.*;
Particles mesh;

color[] col = { #892E2E, #55271D, #B96049, #93693D, #714210, #9B5913, #CE802C, #896C3E, #6C5837,
                #A58919, #432F14, #E3D460, #A21F1F, #FCFCFC, #CBC5C5, #403E3E, #865A07, #C4821E,
                #5D1305, #552C23, #89420C, #CE9519, #956A0B, #BC984A, #F7EBA7, #B4A966, #A5A082,
                #624B1A, #89713D, #621805, #9B8014, #7E713C, #5D2E07, #C65C2A, #BF8D41, #836352,
                #FAF1EB, #E0D9D5, #939291, #FCFBFA, #C1B1A6, #F0EEED, #FFF2F2, #ADA4A4, #D3D3D3};

void setup() {
  size(1920, 1080, P3D);
  smooth();
  mesh = new Particles();
  background(0);
}

void draw() {
  
  noStroke();
  fill(0, 1);
  rect(0, 0, width, height);
 translate(width/2, height/2);
  noFill();
  hint(DISABLE_DEPTH_TEST);
  mesh.draw();
}


color getColor(){
  color c;
  int index = (int)random(0, col.length -1);
  c = col[index];
  return c;
}
