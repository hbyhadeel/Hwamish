class Agent {
  constructor() {
    this.size = random(1, 5);
    this.x = random(margin - scale, width - margin - scale);
    this.y = margin;
    this.col = color(cols[int(this.x % cols.length)]);
    this.col.setAlpha(random(50, 100));
  }

  update() {

    let r = int(random(3));
    switch (r) {
    case 0:
      this.y += 0.001;
      break;
    case 1:
      this.y += 0.02;
      break;
    case 2:
      this.y += 0.5;
    }

    if (this.y > height - margin) {
      this.y *= -1;
    }


    let angle = frameCount / 30;
    this.x += sin(angle);

    fill(this.col);
    ellipse(this.x, this.y, this.size, this.size);
  }
}
