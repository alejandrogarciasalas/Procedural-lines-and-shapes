class Particles {
  int nParticles = 2000;
  int nRuido = 110;
  float radio = 100;
  float noiseValue;
  
  Particle[] Particles = {
  };

  Particles() {
    noiseValue = random(-0.1, 0.1);

    Particles = new Particle[nParticles];
    for (int i = 0; i < Particles.length; i++)
      Particles[i] = new Particle(getColor());
  }

  void draw() {
    rotateX(frameCount*0.006);
    rotateY(frameCount*0.007);


    for (int i= 0; i < Particles.length; i++) {
      Particle a = Particles[i];
     
      for (int j= 1; j < Particles.length-1; j++) {
        Particle b = Particles[j];

        float d = dist(a.ox, a.oy, a.oz, b.ox, b.oy, b.oz);
          if (d < radio){
            stroke(a.c, 50);
            beginShape();
            vertex(a.ox, a.oy, a.oz);
            vertex( b.ox, b.oy, b.oz);
            endShape();
          }
      }
    }

    for (int i =0; i < Particles.length; i++) {
      Particle p = Particles[i];
      p.update();
    }

    noiseValue += 0.02;
    radio = int(noise(noiseValue)*50 + 25);  
  }
}

