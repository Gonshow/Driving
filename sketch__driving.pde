void setup(){
  size( 400, 300, P3D );
  noStroke();
  frameRate( 100 );
}


void trunk(){
  fill( 128, 64, 0 );
  pushMatrix();
    beginShape(QUADS);
      scale( .1, .2, .1 ); translate( 0, 1, 0 );
      vertex( +1, -1, -1 ); vertex( +1, -1, +1 ); vertex( +1, +1, +1 ); vertex( +1, +1, -1 );
      vertex( +1, +1, +1 ); vertex( -1, +1, +1 ); vertex( -1, +1, -1 ); vertex( +1, +1, -1 );
      vertex( -1, +1, +1 ); vertex( +1, +1, +1 ); vertex( +1, -1, +1 ); vertex( -1, -1, +1 );
      vertex( -1, -1, -1 ); vertex( -1, -1, +1 ); vertex( +1, -1, +1 ); vertex( +1, -1, -1 );
      vertex( -1, +1, -1 ); vertex( -1, +1, +1 ); vertex( -1, -1, +1 ); vertex( -1, -1, -1 );
      vertex( +1, +1, -1 ); vertex( -1, +1, -1 ); vertex( -1, -1, -1 ); vertex( +1, -1, -1 );
    endShape();
  popMatrix();
}

void tire(){
  pushMatrix();
    rotateY( PI/2 );
    stroke(0);
    strokeWeight(0.02);
    fill(255);
    smooth();
    ellipse( 0, 0, .4, .4 );
    translate( 0, 0, .1 );
    ellipse( 0, 0, .4, .4 );
    noStroke();
  popMatrix();
}



void drawCar( float s ){
  pushMatrix();
    fill(255, 0, 0 );
    scale( s, s, s );
    translate( 0, .7, 0 );
    box( 1, 1, 2 );
    translate( .41, -.5, .4 );
    tire();
    translate( 0, 0, -.8 );
    tire();
    translate( -0.92, 0, 0 );
    tire();
    translate( 0, 0, .8 );
    tire();
  popMatrix();
}

void leaf( int r, int g, int b ){
  fill( r, g, b );
  beginShape( TRIANGLES );
    vertex( 0, .5, 0 ); vertex( -.5, 0, -.5 ); vertex( .5, 0, -.5 );
    vertex( 0, .5, 0 ); vertex( .5, 0, -.5 ); vertex( .5, 0, .5 );
    vertex( 0, .5, 0 ); vertex( .5, 0, .5 ); vertex( -.5, 0, .5 );
    vertex( 0, .5, 0 ); vertex( -.5, 0, .5 ); vertex( -.5, 0, -.5 );
    vertex( -.5, 0, -.5 ); vertex( .5, 0, .5 ); vertex( .5, 0, -.5 );
    vertex( -.5, 0, -.5 ); vertex( -.5, 0, .5 ); vertex( .5, 0, .5 );
  endShape();
}

void drawHouse( float s ){
  pushMatrix();
    fill( 200, 200, 200 );
    beginShape(QUADS);
      scale( s/2, s/2, s/2 ); translate( 0, 1, 0 );
      vertex( +1, -1, -1 ); vertex( +1, -1, +1 ); vertex( +1, +1, +1 ); vertex( +1, +1, -1 );
      vertex( +1, +1, +1 ); vertex( -1, +1, +1 ); vertex( -1, +1, -1 ); vertex( +1, +1, -1 );
      vertex( -1, +1, +1 ); vertex( +1, +1, +1 ); vertex( +1, -1, +1 ); vertex( -1, -1, +1 );
      vertex( -1, -1, -1 ); vertex( -1, -1, +1 ); vertex( +1, -1, +1 ); vertex( +1, -1, -1 );
      vertex( -1, +1, -1 ); vertex( -1, +1, +1 ); vertex( -1, -1, +1 ); vertex( -1, -1, -1 );
      vertex( +1, +1, -1 ); vertex( -1, +1, -1 ); vertex( -1, -1, -1 ); vertex( +1, -1, -1 );
    endShape();
    translate( 0, 1, 0 );
    scale( 2.8, 2.4, 2.8 );
    leaf( 255, 0, 255 );
  popMatrix();
}

void leaves(){
  pushMatrix();
    translate( 0, .5, 0 ); scale( .6, .6, .6 );
    leaf( 0, 224, 0 );
  popMatrix();
  pushMatrix();
    translate( 0, .25, 0 ); scale( .8, .8, .8 );
    leaf( 0, 192, 0 );
  popMatrix();
  leaf( 0, 128, 0 );
}

void drawTree( float s ){
  pushMatrix();
    scale( s, s, s );
    trunk();
    translate( 0, .4, 0 );
    leaves();
  popMatrix();
}

float x = 1;
float y = 0;
float z = 0;
float w = 0;
void draw(){
  noStroke();
  background(255);
  float v = random(10);
  if ((keyPressed == true) && (key == 'a')) {
    w += .01*v;
  }
  
  if ((keyPressed == true) && (key == 'b')) {
    w -= .01*v;
    if(w<=0){
      w=0;
    }
  }
  lights();
  fill(191,120,58);
  rotateX(PI/2);
  rect(-100,-12000,200,24000);
  float cameraY = map(mouseY, 0, height, 400, -200);
  float theta = map(mouseX, 0, width, 0, TWO_PI);
  camera(300*cos(theta), cameraY, 300*sin(theta), 0, 0, 0, 0, -1, 0);
  pushMatrix();
    translate(0,x*0.5*w,0);
    drawCar(60);
  popMatrix();
  x*=(-1);
  pushMatrix();
    translate(0,0,600+5*y);
    translate(-200,0,0);
    for(int i=1; i<=1000; i++){
      translate(0,0,-150);
      drawTree(120);
    }
  popMatrix();
  y += w;
  pushMatrix();
    translate(0,0,1200+5*z);
    translate(200,0,0);
    for(int j=1; j<=30; j++){
      translate(0,0,-3000);
      drawHouse(90);
    }
  popMatrix();
  z += w;
}
