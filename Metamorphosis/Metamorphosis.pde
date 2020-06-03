Agent[] agents = new Agent[1000];
int[] pix = new int[1000];
PImage img;
PImage leftHalf, topHalf;

int margin = 50;
int x, y;

void setup() {
  size(800, 800, P2D);
  noStroke();

  img = loadImage("pixel.png");
  img.resize(width, height);
  for (int i = 0; i < agents.length; i++) {
    x = int(random(margin, width-margin));
    y = int(random(margin, height-margin));
    pix[i] = img.get(x, y);
    agents[i] = new Agent();
  }
  
  // pink
  //background(#FBE7E6);
  
  // dark blue
  background(30, 0, 30);
}

void draw() {
  
  for (int i = 0; i < agents.length; i++) {
    agents[i].updateLines(pix[i]);
  }
  
  leftMirror();
  topMirror();
}

void leftMirror() {
  leftHalf = get(0, 0, width/2, height);
  translate(width, 0);
  scale(-1, 1);
  image(leftHalf, 0, 0);
}

void topMirror() {
  topHalf = get(0, 0, width, height/2);
  translate(0, height);
  scale(1, -1);
  image(topHalf, 0, 0);
}

void keyPressed() {
  if (key == 's') {
    String date = "" + year() + month() + day() + hour() + minute() + second();
    save("Output/" + date + ".png");
  }
}
