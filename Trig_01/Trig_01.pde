import processing.pdf.*;
import java.util.Calendar;

int gridCount = 100;
float w, h;

void setup() {
  size(1000, 1000);
  background(bg);
  
  w = width/gridCount;
  h = height/gridCount;
  
  noStroke();
  noLoop();
}

void draw() {
  for (int i = 0; i < gridCount; i++) {
    for (int j = 0; j < gridCount; j++) {
      float x = i * w + w/2;
      float y = j * h + h/2;
      
      float angle = map(x*y, 0, width, 0, TWO_PI*4+360);
      float size = sin(angle) * w + 0.5;
      
      // shadow
      fill(0, 100);
      ellipse(x + 1.5, y + 1.5, size, size);
      
      float angle2 = map(x*y, 0, width, 0, PI);
      color col1 = lerpColor(cols[0], cols[1], sin(angle2));
      color col2 = lerpColor(cols[1], cols[2], sin(angle2));
      color col = lerpColor(col1, col2, sin(angle));
      fill(col);
      ellipse(x, y, size, size);
      
    }
  }
}

void keyPressed() {
  if (key == 's') {
    beginRecord(PDF, "Output/" + timestamp() + ".pdf");
    setup();
    draw();
    endRecord();
  }
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
