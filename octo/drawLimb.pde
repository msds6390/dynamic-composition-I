void drawLimb(int s) {
  rotateY(.3);
  translate(-3*s, 0);
  //sphereDetail(30, 5);
  //noStroke();
  sphereDetail(15);
  octoArm = createShape(SPHERE, 4*s);
  octoArm.setTexture(octoTexture);
  shape(octoArm);
  if ( s > 0 ) drawLimb(s-1);
}
