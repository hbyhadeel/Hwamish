class Agent {
  float x, y;
  int r;

  Agent() {
    x = random(margin, width-margin);
    y = random(margin, height-margin);
  }

  void updateLines(color strokeCol) {
    stroke(strokeCol);
    point(x, y);

    r = int(random(4));

    if (r == 0) {
      x++; y++;
    } else if (r == 1) {
      x--; y--;
    } else if (r == 2) {
      x++; y--;
    } else {
      x--; y++;
    }
  }
}
