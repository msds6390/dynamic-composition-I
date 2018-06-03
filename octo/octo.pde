PImage octo;
PImage oceanFloor;
PShape octoBody;
PShape octoArm;
PShape octoHead;
float theta = 0;
float r = 0;


void setup() {
 size(1000, 1000, P3D);
 noStroke();

 
 // Source:
 // https://upload.wikimedia.org/wikipedia/commons/3/3d/Octopus_macropus.jpg
 octo = loadImage("octo.jpg");
 
 // Improve rendering by reducing detail
 sphereDetail(15);
 octoBody = createShape(SPHERE, 180);
 octoHead = createShape(SPHERE, 90);
 octoBody.setTexture(octo);
 octoHead.setTexture(octo);
 
 // Source:
 // http://il3.picdn.net/shutterstock/videos/3460097/thumb/1.jpg
 oceanFloor = loadImage("ocean_floor.jpg");
 oceanFloor.resize(width, height);
 background(oceanFloor);
}

void draw() {
  background(oceanFloor);
  
  lights();
   
  // Draw the body of the octopus
  pushMatrix();
  translate(width/2, height/2);
  sphereDetail(15);
  shape(octoBody);
  popMatrix();
  
  // Center the subsequent drawings
  // of the arms and head
  translate(width/2, height/2, 0);

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
  //rotate(PI);
  ////rotateX(cos(millis()/10000.0));
  ////rotateY(sin(millis()/10000.0));
  ////rotateY(-map(millis()%5000, 0, 5000, 0, TWO_PI));
  ////rotateX(-map(millis()%5000, 0, 5000, 0, TWO_PI));
  //translate(-200 + r, 0);
  //shape(octoHead);
  //popMatrix();


 rotateX(cos(millis()/10000.0));
 rotateY(sin(millis()/10000.0));
 
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
 
 
 for (int t = 0; t<8; t++) {
   pushMatrix();
   rotate(t*TWO_PI/8.0);
   translate(160, 0);
   rotateY(-map(millis()%5000, 0, 5000, 0, TWO_PI));
   //ellipse(0, 0, 40, 40);

  //if (t == 0) {
  //  pushMatrix();
  //  translate(100, 100);
  //  shape(octoHead);
  //  popMatrix();
  //}

   pushMatrix();
   arm(16);    
   popMatrix();

   //rotateY(PI);
   //arm(12);
   ////translate(-100, 0);
   ////shape(octoHead);
   popMatrix();
 }
 
 theta += 0.01;
 if (r > 200) {
   r = 0;
 } else {
   r += 1;
 }
}

void arm(int s) {
  rotateY(.3);
  translate(-3*s, 0);
  //sphereDetail(30, 5);
  //noStroke();
  sphereDetail(15);
  octoArm = createShape(SPHERE, 4*s);
  octoArm.setTexture(octo);
  shape(octoArm);
  if ( s > 0 ) arm(s-1);
}
