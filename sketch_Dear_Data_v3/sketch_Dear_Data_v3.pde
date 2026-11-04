int campusScale = 528;
int streetScale = 864;
int gymScale = 1200;

int hoverStartC = -10000;
int hoverStartS = -10000;
int hoverStartG = -10000;

Table table;
ArrayList<String> teams = new ArrayList<String>();

void setup(){
  size(1200,600);
  
  table = loadTable("Dear Data 25 data part 1.csv", "header");
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
  rect(campusScale,0,streetScale - campusScale,600);
  }
  
  
  //if statements for the brightness of the background to last 5 seconds when moved away (GYM)
  if (mouseX > streetScale && mouseX < gymScale) {
  //Brightness of Gym background
  hoverStartG = millis();
  }
  if (millis() - hoverStartG < 5000) {
  fill(70);
  rect(streetScale,0,gymScale - streetScale,600);
  }
  
  
  //the lines sepearting the three sections
  line(campusScale,0,campusScale,600);
  line(streetScale,0,streetScale,600);
  
  
  //the text/heading
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("Campus", campusScale/2, 40);
  text("Street", ((streetScale - campusScale)/2) + (campusScale), 40);
  text("Gym", ((gymScale - streetScale)/2) + (streetScale), 40);
  
  //circles
  stroke(128);
  strokeWeight(1.5);
  fill(255,0,0);
  
  int[][] counts = new int[3][3];
  
  for (TableRow row : table.rows()) {
    String where = row.getString("Where").trim();
    String result = row.getString("Latest Game").trim();
    
    int place = 0;
    float left = 0;
    float right = campusScale;
    if (where.equals("Street")) {
      place = 1;
      left = campusScale;
      right = streetScale;
    }
    if (where.equals("Gym")) {
      place = 2;
      left = streetScale;
      right = gymScale;
    }
    
    int r = 1;
    if (result.equals("Won")) r = 0;
    if (result.equals("Lost")) r = 2;
    
    float margin = 20;
    float spacing = 60;
    int perRow = floor((right - left - 2 * margin)/spacing);
    float cellW = (right - left - 2 * margin)/perRow;
    int n = counts[place][r];
    counts[place][r]++;
    
    float x = left + margin + ((n % perRow) + 0.5) * cellW;
    int rowNum = n/perRow;
    
    float y;
    if (r == 0) {
      y = 100 + rowNum * spacing;
    } else if (r == 1) {
      y = height/2 + rowNum * spacing;
    } else {
      y = height - 60 - rowNum * spacing;
    }
    
    ellipse(x,y,36,36);
  }
  
}
