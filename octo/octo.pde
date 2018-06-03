PImage octoTexture;
PImage oceanFloor;
PShape octoBody;
PShape octoArm;
PShape octoHead;
int numLimbs = 8;
int numLimbSections = 16;
float theta = 0;
float r = 0;


void setup() {
  size(1000, 1000, P3D);
  noStroke();

  // Source:
  // https://upload.wikimedia.org/wikipedia/commons/3/3d/Octopus_macropus.jpg
  octoTexture = loadImage("octo.jpg");
   
  // Improve rendering by reducing detail
  sphereDetail(15);
  octoBody = createShape(SPHERE, 180);
  octoHead = createShape(SPHERE, 90);
  octoBody.setTexture(octoTexture);
  octoHead.setTexture(octoTexture);
   
  // Source:
  // http://il3.picdn.net/shutterstock/videos/3460097/thumb/1.jpg
  oceanFloor = loadImage("ocean_floor.jpg");
  oceanFloor.resize(width, height);
  background(oceanFloor);
}

void draw() {
  background(oceanFloor);
  //filter(BLUR, 3);
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


  rotateX(cos(millis()/10000.0));
  rotateY(sin(millis()/10000.0));
  for (int t = 0; t < numLimbs; t++) {
    pushMatrix();
    rotate(t * TWO_PI / numLimbs);
    translate(160, 0);
    rotateY(-map(millis()%5000, 0, 5000, 0, TWO_PI));

    pushMatrix();
    arm(numLimbSections);    
    popMatrix();
    // For mirroring set of limbs
    //rotateY(PI);
    //arm(numLimbs);
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
  octoArm.setTexture(octoTexture);
  shape(octoArm);
  if ( s > 0 ) arm(s-1);
}
