int campusScale = 400;
int streetScale = 800;
int gymScale = 1200;

int hoverStartC = -5000;
int hoverStartS = -5000;
int hoverStartG = -5000;

void setup(){
  size(1200,600);
}

void draw(){
  
  //Setting the background and the specifics in the outline of the shapes
  background(255);
  stroke(0);
  strokeWeight(2);
  
  
  //if statements for the brightness of the background to last 5 seconds when moved away from (CAMPUS)
  if (mouseX > 0 && mouseX < campusScale) {
  //Brightness of Campus background.
  hoverStartC = millis();
  }
  if (millis() - hoverStartC < 5000) {
    fill(146);
    rect(0,0,campusScale,600);
  }
  
  
  //if statements for the brightness of the background to last 5 seconds when moved away (STREET)
  if (mouseX > campusScale && mouseX < streetScale) {
  //Brightness of Street background.
  hoverStartS = millis();
  }
  if (millis() - hoverStartS < 5000) {
  fill(90);
  rect(campusScale,0,campusScale,600);
  }
  
  
  //if statements for the brightness of the background to last 5 seconds when moved away (GYM)
  if (mouseX > streetScale && mouseX < gymScale) {
  //Brightness of Gym background
  hoverStartG = millis();
  }
  if (millis() - hoverStartG < 5000) {
  fill(70);
  rect(streetScale,0,streetScale,600);
  }
  
  
  //the lines sepearting the three sections
  line(campusScale,0,campusScale,600);
  line(streetScale,0,streetScale,600);
  
  
  //the text/heading
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("Campus", 200, 40);
  text("Street", 600, 40);
  text("Gym", 1000, 40);
  
}
