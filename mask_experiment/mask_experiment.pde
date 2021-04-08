PGraphics maskImage;

ArrayList<PImage> images = new ArrayList<PImage>();

float w; // width of the shape
float h ; // height of the shape (y-position of second sine wave - y-position of first sine wave)
float freq; // number of full sines in the shape
float amp; // the amplitude (positive and negative height of the shape)

void setup() {
  size(512, 512);

  w = width;
  h = 50;
  freq = 2;
  amp = 50;

  images.add(loadImage("print-square.png"));
  images.add(loadImage("https://dummyimage.com/512/00ffff/000000", "png"));
  images.add(loadImage("https://dummyimage.com/512/0000ff/000000", "png"));
  images.add(loadImage("https://dummyimage.com/512/000000/000000", "png"));
  images.add(loadImage("https://dummyimage.com/512/ff00ff/000000", "png"));
  images.add(loadImage("https://dummyimage.com/512/ff0000/000000", "png"));
  images.add(loadImage("https://dummyimage.com/512/ffff00/000000", "png"));
  images.add(loadImage("https://dummyimage.com/512/00ff00/000000", "png"));
}

void draw() {
  background(200);




  for (int i = 0; i < images.size(); i++) {
    PImage img = images.get(i);
    img.mask(createMask(10+i*10, i*50));
    image(img, 0, 0);
  }
}

PGraphics createMask(float h, float yOffset) {
  maskImage = createGraphics(512, 512);
  maskImage.beginDraw();
  maskImage.translate(0, yOffset+mouseY);
  maskImage.beginShape();

  for (float i = 0; i <= w; i += 1) {
    maskImage.vertex(i, sin(i*TWO_PI*freq/w)*amp);
  }
  // go top to bottom in this second loop to connect the most right point 
  // from the first sine wave to the most right point from the second
  for (float i = w; i >= 0; i -= 1) {
    maskImage.vertex(i, h+sin(i*TWO_PI*freq/w)*amp);
  }
  maskImage.endShape(CLOSE);
  maskImage.endDraw();
  return maskImage;
}
