////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   This code is used for GUI-wide spacing. It defines the GUI layout as a grid
//   with the following design:
//
//   The #s shown below fall at the center of their corresponding container.
//
//   ------------------------------------------------
//   |                       9                      |
//   ------------------------------------------------
//   |                       |                      |
//   |          2            5           1          |
//   |                       |                      |
//   |----------6------------0-----------8----------|
//   |                       |                      |
//   |          3            7           4          |
//   |                       |                      |
//   ------------------------------------------------
//   |                       10                     |
//   ------------------------------------------------
//
//   Created by: Conor Russomanno (May 2016)
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

boolean drawContainers = true;

Container container0;
Container container1;
Container container2;
Container container3;
Container container4;
Container container5;
Container container6;
Container container7;
Container container8;
Container container9;
Container container10;

//Viz extends container (example below)
//Viz viz1;
//Viz viz2;

int widthOfLastScreen = 0;
int heightOfLastScreen = 0;

void setupContainers() { 
  //size(1024, 768, P2D);
  //frameRate(30);
  //smooth();
  //surface.setResizable(true);
  
  widthOfLastScreen = width;
  heightOfLastScreen = height;
  
  container0 = new Container(0, 50, width, height - 100, 10);  //x0, y0, w0, h0, margin 
  container1 = new Container(container0, "UPPER_RIGHT");
  container2 = new Container(container0, "UPPER_LEFT");
  container3 = new Container(container0, "LOWER_LEFT");
  container4 = new Container(container0, "LOWER_RIGHT");
  container5 = new Container(container0, "TOP");
  container6 = new Container(container0, "LEFT");
  container7 = new Container(container0, "BOTTOM");
  container8 = new Container(container0, "RIGHT");
  container9 = new Container(0, 0, width, 50, 0);
  container10 = new Container(0, height - 50, width, 50, 0);
  
  //setup viz objects... example of container extension (more below)
  //setupVizs();
}

void drawContainers() {
  //background(255);
  container0.draw();
  container1.draw();
  container2.draw();
  container3.draw();
  container4.draw();
  container5.draw();
  container6.draw();
  container7.draw();
  container8.draw();
  container9.draw();
  container10.draw();
  //container11.draw();
  //container12.draw();
  
  //Draw viz objects.. exampl extension of container class (more below)
  //viz1.draw();
  //viz2.draw();

  //alternative component listener function (line 177 - 187 frame.addComponentListener) for processing 3,
  if (widthOfLastScreen != width || heightOfLastScreen != height) {
    println("OpenBCI_GUI: setup: RESIZED");
    //screenHasBeenResized = true;
    //timeOfLastScreenResize = millis();
    setupContainers();
    //setupVizs(); //container extension example (more below)
    widthOfLastScreen = width;
    heightOfLastScreen = height;
  }
}

public class Container {

  //key Container Variables
  public float x0, y0, w0, h0; //true dimensions.. without margins
  public float x, y, w, h; //dimensions with margins
  public float margin; //margin

  //constructor 1 -- comprehensive
  public Container(float _x0, float _y0, float _w0, float _h0, float _margin) {
    
    margin = _margin;
    
    x0 = _x0;
    y0 = _y0;
    w0 = _w0;
    h0 = _h0;

    x = x0 + margin;
    y = y0 + margin;
    w = w0 - margin*2;
    h = h0 - margin*2;
  }

  //constructor 2 -- recursive constructor -- for quickly building sub-containers based on a super container (aka master)
  public Container(Container master, String _type) {

    margin = master.margin;

    if(_type == "WHOLE"){
      x0 = master.x0;
      y0 = master.y0;
      w0 = master.w0;
      h0 = master.h0;
      w = master.w;
      h = master.h;
      x = master.x;
      y = master.y;
    } else if (_type == "LEFT") {
      x0 = master.x0;
      y0 = master.y0;
      w0 = master.w0/2;
      h0 = master.h0;
      w = (master.w - margin)/2;
      h = master.h;
      x = master.x;
      y = master.y;
    } else if (_type == "RIGHT") {
      x0 = master.x0 + master.w0/2;
      y0 = master.y0;
      w0 = master.w0/2;
      h0 = master.h0;
      w = (master.w - margin)/2;
      h = master.h;
      x = master.x + w + margin;
      y = master.y;
    } else if (_type == "TOP") {
      x0 = master.x0;
      y0 = master.y0;
      w0 = master.w0;
      h0 = master.h0/2;
      w = master.w;
      h = (master.h - margin)/2;
      x = master.x;
      y = master.y;
    } else if (_type == "BOTTOM") {
      x0 = master.x0;
      y0 = master.y0 + master.h0/2;
      w0 = master.w0;
      h0 = master.h0/2;
      w = master.w;
      h = (master.h - margin)/2;
      x = master.x;
      y = master.y + h + margin;
    } else if (_type == "UPPER_LEFT") {
      x0 = master.x0;
      y0 = master.y0;
      w0 = master.w0/2;
      h0 = master.h0/2;
      w = (master.w - margin)/2;
      h = (master.h - margin)/2;
      x = master.x;
      y = master.y;
    } else if (_type == "UPPER_RIGHT") {
      x0 = master.x0 + master.w0/2;
      y0 = master.y0;
      w0 = master.w0/2;
      h0 = master.h0/2;
      w = (master.w - margin)/2;
      h = (master.h - margin)/2;
      x = master.x + w + margin;
      y = master.y;
    } else if (_type == "LOWER_LEFT") {
      x0 = master.x0;
      y0 = master.y0 + master.h0/2;
      w0 = master.w0/2;
      h0 = master.h0/2;
      w = (master.w - margin)/2;
      h = (master.h - margin)/2;
      x = master.x;
      y = master.y + h + margin;
    } else if (_type == "LOWER_RIGHT") {
      x0 = master.x0 + master.w0/2;
      y0 = master.y0 + master.h0/2;
      w0 = master.w0/2;
      h0 = master.h0/2;
      w = (master.w - margin)/2;
      h = (master.h - margin)/2;
      x = master.x + w + margin;
      y = master.y + h + margin;
    }
  }

  public void draw() {
    
    if(drawContainers){
      pushStyle();
  
      //draw margin area 
      fill(102, 255, 71, 100);
      noStroke();
      rect(x0, y0, w0, h0);
  
      //noFill();
      //stroke(255, 0, 0);
      //rect(x0, y0, w0, h0);
  
      fill(31, 69, 110, 100);
      noStroke();
      rect(x, y, w, h);
  
      popStyle();
    }
  }
};

// --- EXAMPLE OF EXTENDING THE CONTAINER --- //

//public class Viz extends Container {
//  public float abc;

//  public Viz(float _abc, Container master) {  
//    super(master, "WHOLE");
//    abc = _abc;
//  }

//  void draw() {
//    pushStyle();
//    noStroke();
//    fill(255, 0, 0, 50);
//    rect(x, y, w, h);
//    popStyle();
//  }
//};

//void setupVizs() {
//  viz1 = new Viz (10f, container2);
//  viz2 = new Viz (10f, container4);
//}

// --- END OF EXAMPLE OF EXTENDING THE CONTAINER --- //