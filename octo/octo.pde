PImage octo;
PImage oceanFloor;
PShape octoBody;
PShape octoArm;
PShape octoHead;
float theta = 0;


void setup() {
 size(1000, 1000, P3D);
 //directionalLight(51, 102, 126, 1, 1, 0);
 noStroke();
 octo = loadImage("octo.jpg");
 sphereDetail(15);
 octoBody = createShape(SPHERE, 180);
 octoHead = createShape(SPHERE, 90);
 octoBody.setTexture(octo);
 octoHead.setTexture(octo);
 
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
 sphereDetail(15);
 shape(octoBody);
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
 //PShape octoBody = createShape(SPHERE, 180);
 //octoBody.setTexture(img);
 //popMatrix();

  //pushMatrix();
  ////rotate(theta);
  //rotateX(cos(millis()/10000.0));
  //rotateY(sin(millis()/10000.0));
  //rotateY(-map(millis()%5000, 0, 5000, 0, TWO_PI));
  //rotateX(-map(millis()%5000, 0, 5000, 0, TWO_PI));
  //translate(200, 0);
  //shape(octoHead);
  //popMatrix();


 rotateX(cos(millis()/10000.0));
 rotateY(sin(millis()/10000.0));
 //}
 
   //pushMatrix();
   //rotate(TWO_PI/2);
   ////translate(160, 0);
   //translate(200,0);
   //rotateY(-map(millis()%5000, 0, 5000, 0, TWO_PI));
   ////rotateY(PI);
   ////translate(-100, 0);
   //shape(octoHead);
   //popMatrix();

   //pushMatrix();
   //rotate(TWO_PI);
   ////translate(160, 0);
   //translate(0,200);
   //rotateY(-map(millis()%5000, 0, 5000, 0, TWO_PI));
   //rotateY(PI);
   ////rotateY(PI);
   ////translate(-100, 0);
   //shape(octoHead);
   //popMatrix();
 
 
 for (int t = 0; t<12; t++) {
   pushMatrix();
   rotate(t*TWO_PI/12.0);
   translate(160, 0);
   rotateY(-map(millis()%5000, 0, 5000, 0, TWO_PI));
   //ellipse(0, 0, 40, 40);

  if (t == 0) {
    pushMatrix();
    translate(100, 100);
    shape(octoHead);
    popMatrix();
  }

   pushMatrix();
   arm(12);    
   popMatrix();

   rotateY(PI);
   arm(12);
   //translate(-100, 0);
   //shape(octoHead);
   popMatrix();
 }
 
 theta += 0.01;
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
 
 sphereDetail(15);
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
