PGraphics maskImage;
PImage img;  

void setup() {
  size(512, 512);

  img = loadImage("print-square.png");
}

void draw() {
  background(0);

  maskImage = createGraphics(512, 512);
  maskImage.beginDraw();
  maskImage.translate(mouseX, mouseY);
  maskImage.beginShape();
  maskImage.curveVertex(112, -30); 
  maskImage.curveVertex(34, -75); 
  maskImage.curveVertex(-15, -40); 
  maskImage.curveVertex(-73, -42); 
  maskImage.curveVertex(-135, -102); 
  maskImage.curveVertex(-112, -120); 
  maskImage.curveVertex(-44, -62); 
  maskImage.curveVertex(34, -114); 
  maskImage.curveVertex(111, -66); 
  maskImage.curveVertex(176, -98); 
  maskImage.curveVertex(112, -30); 
  maskImage.curveVertex(34, -75); 
  maskImage.curveVertex(-15, -40);
  maskImage.endShape(CLOSE);
  maskImage.endDraw();

  // apply mask
  img.mask(maskImage);

  // draw image
  image(img, 0, 0);
}
