import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="PressureSensor_Visualization";
String description ="Subscriber that receives sensor messages.";

Spacebrew spacebrew;

int sensor1r, sensor2r, sensor3r, sensor4r;
//int ellipse, ellipse1, ellipse2, ellipse3; 

void setup() {

  size(500, 500);
  //  rectMode(RADIUS);
  ellipseMode(RADIUS);


//  colorMode(HSB, 100);

  spacebrew = new Spacebrew( this );
 
 // declare your subscribers
  spacebrew.addSubscribe( "rect4", "range");
//  spacebrew.addSubscribe( "ellipse1", "range");
//  spacebrew.addSubscribe( "ellipse2", "range");
//  spacebrew.addSubscribe( "ellipse3", "range");

 spacebrew.connect(server, name, description);
}

void draw() {

  background(0, 0, 100, 100);

  noStroke();

  fill(sensor4r);
  rect(0, 0, width, height); 

//  fill(sensor3r, 100, 100, 100 );  
//  ellipse(width/4, height/4, ellipse2, ellipse2);
//
//  fill(sensor1r, 100, 100, 100);
//  ellipse(3*width/4, height/4, ellipse, ellipse);
//
//  fill(sensor4r, 100, 100, 100);
//  ellipse(width/4, 3*height/4, ellipse3, ellipse3);
//
//  fill(sensor2r, 100, 100, 100);
//  ellipse(3*width/4, 3*height/4, ellipse1, ellipse1);

//  fill(0);
//  text("s3 " + sensor3r, 25, 25);
//  text("s1 " + sensor1r, 25, 50);
//  text("s4 " + sensor4r, 25, 75);
//  text("s2 " + sensor2r, 25, 100);
}

void onRangeMessage( String name, int value ){
println("got range message " + name + " : " + value);
sensor4r = value;
}

//implement a switch statement
