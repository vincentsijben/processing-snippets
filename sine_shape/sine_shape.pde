void setup()
{
  size(500, 500);
  smooth();
}

void draw()
{
  background(255);

  float w = width; // width of the shape
  float h = 50; // height of the shape (y-position of second sine wave - y-position of first sine wave)
  float freq = 2; // number of full sines in the shape
  float amp = 50; // the amplitude (positive and negative height of the shape)
  
  // this sine wave starts at y = 0 and goes up and down [amp] pixels.
  // if the height of the wave (h) is 50, the vertical center of the total shape
  // is y-(h/2).
  // if we use translate(0, height/2-(h/2)) it will be perfectly centered vertically
  pushMatrix();
  translate(0, height/2-25);
  
  fill(255, 0, 0);
  stroke(0);

  beginShape();
  for (float i = 0; i <= w; i += 1) {
    vertex(i, sin(i*TWO_PI*freq/w)*amp);
  }
  // go top to bottom in this second loop to connect the most right point 
  // from the first sine wave to the most right point from the second
  for (float i = w; i >= 0; i -= 1) {
    vertex(+i, h+sin(i*TWO_PI*freq/w)*amp);
  }
  endShape(CLOSE);
  popMatrix();
  
}
