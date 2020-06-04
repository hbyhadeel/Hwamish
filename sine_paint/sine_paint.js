let cols = ["#D96C75", "#A63C63", "#346C73", "#F2F0C9", "#F29985", "F2F2FC"];
// let cols = ["#07668C", "#F2F2F0", "#F2B705", "#F29F05", "#D90404"];

let margin = 100;
let scale = 30;

let agentsCount = 1000;
let agents = [];

function setup() {
  createCanvas(500, 500);
  background("#F2F0EE");

  noStroke();
  fill(random(255));

  for (let i = 0; i < agentsCount; i++) {
    agents.push(new Agent());
  }


}

function draw() {

  for (let i = 0; i < agents.length; i++) {
    agents[i].update();

  }

}


function keyTyped() {
  if (key === 's') {
    saveCanvas(c, timestamp(), 'png');
  }
}

function timestamp() {
  return str(year() + month() + day() + "_" + hour() + minute() + second());
}
