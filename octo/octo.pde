PImage octo;
PImage oceanFloor;
PShape globe;
PShape octoArm;


void setup() {
 size(1000, 1000, P3D);
 //directionalLight(51, 102, 126, 1, 1, 0);
 noStroke();
 octo = loadImage("octo.jpg");
 globe = createShape(SPHERE, 180);
 globe.setTexture(octo);
 
 oceanFloor = loadImage("ocean_floor.jpg");
 oceanFloor.resize(width, height);
 background(oceanFloor);
}
//fill(192, 192, 192);
//stroke(0);
//}

void draw() {
 //directionalLight(192, 192, 192, 1, 1, 0);
  background(oceanFloor); 
 
 pushMatrix();
 translate(width/2, height/2);
 shape(globe);
 popMatrix();

 
 if (mousePressed) {
   lights();
 }
 translate(width/2, height/2, 0);
 pushMatrix();
 scale(400);
 popMatrix();

 //pushMatrix();
 //translate(0,0);
 //lights();
 //noStroke();
 //fill(188, 48, 31);
 //PImage img = loadImage("octo.png");
 //PShape globe = createShape(SPHERE, 180);
 //globe.setTexture(img);
 //popMatrix();


 rotateX(cos(millis()/10000.0));
 rotateY(sin(millis()/10000.0));
 //}
 

 
 
 for (int t = 0; t<12; t++) {
   pushMatrix();
   rotate(t*TWO_PI/12.0);
   translate(160, 0);
   rotateY(-map(millis()%5000, 0, 5000, 0, TWO_PI));
   //ellipse(0, 0, 40, 40);

   pushMatrix();
   arm(12);    
   popMatrix();

   rotateY(PI);
   arm(12);
   popMatrix();
 }
}

void arm(int s) {
 rotateY(.3);
 translate(-3*s, 0);
 //sphereDetail(30, 5);
 //noStroke();
 
 //lights();
 //noStroke();
 //fill(188, 48, 31);
 //sphere(4*s);
 
 octoArm = createShape(SPHERE, 4*s);
 octoArm.setTexture(octo);
 shape(octoArm);
 
 //ellipse(0, 0, 4*s, 4*s); // update to concaved ellipse
 //lens = new Sphere(4*s);
 //lens.drawPart();
 
 //strokeWeight(20);
 //arc(50, 55, 50, 50, 0, PI/2);
 if ( s > 0 ) arm(s-1);
}
