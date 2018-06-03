/*
  MSDS 6390 Assignment 3: Dynamic Composition 1
  Re-creation of Anthony Howe's Di-Octo kinetic sculpture
  Team: Brian Yu, Jostein Barry-Straume 
  Date: 06/02/18
  Sources:
    https://www.howeart.net/shindahiku-fern-pull
    https://processing.org/discourse/beta/num_1221179611.html
    https://www.openprocessing.org/sketch/346369
    https://youtu.be/1CNU3DQclGs?t=2m40s
*/
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
  
  //// Code for head
  //// Can't get it to rotate properly
  //pushMatrix();
  //translate(width/2, height/2);
  //translate(-200 + r, 0);
  //shape(octoHead);
  //popMatrix();
  
  //pushMatrix();
  //translate(width/2, height/2);
  //translate(r, 0);
  //shape(octoHead);
  //popMatrix();
  
  // Move object across the 
  // middle of the screen
  translate(r % width, height/2, 0);

  // Spin the subsequently drawn spheres
  rotateX(cos(millis()/10000.0));
  rotateY(sin(millis()/10000.0));
  
  // Reduce sphere detail to improve rendering
  // Draw body of the octopus
  sphereDetail(15);
  shape(octoBody);
  
  // For loop iteratively draws limbs
  // equal to the value set by the global
  // variable int numLimbs
  // Default is 8
  for (int t = 0; t < numLimbs; t++) {
    pushMatrix();
    rotate(t * TWO_PI / numLimbs);
    translate(160, 0);
    rotateY(-map(millis()%5000, 0, 5000, 0, TWO_PI));

    // Length of each limb is
    // determined by the value of
    // numLimbSection
    // Default is 16
    // This means that each limb is drawn
    // using 16 spheres of decreasing size
    pushMatrix();
    drawLimb(numLimbSections);    
    popMatrix();
    // For mirroring set of limbs
    //rotateY(PI);
    //arm(numLimbs);
    popMatrix();
  }
  theta += 0.01;
  r += 1;
  //if (r > 200) {
  //  r = 0;
  //} else {
  //  r += 1;
  //}
}
