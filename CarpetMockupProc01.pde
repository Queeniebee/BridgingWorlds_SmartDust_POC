import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="PressureSensor_Visualization";
String description ="Server that sends sensor messages.";


import processing.serial.*;
Serial myPort;
Spacebrew spacebrew;

int sensor1, sensor2, sensor3, sensor4;
int sensor1r, sensor2r, sensor3r, sensor4r;

void setup() {

  size(500, 500);
  println(Serial.list());
  //  rectMode(RADIUS);
  ellipseMode(RADIUS);

  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');

  colorMode(HSB, 100);

 spacebrew = new Spacebrew( this );

//  // declare your publishers
  spacebrew.addPublish( "sensorVal", "range", sensor1r); 
  spacebrew.addPublish( "sensorVal1", "range", sensor2r); 
  spacebrew.addPublish( "sensorVal2", "range", sensor3r); 
  spacebrew.addPublish( "sensorVal3h", "range", sensor4r); 
  // connect!
  spacebrew.connect(server, name, description);
}

void draw() {

  background(0, 0, 100, 100);

  //  println(sensor1);

  noStroke();

  fill(sensor3, 100, 100, 100 );
  ellipse(width/4, height/4, sensor3r, sensor3r);

  fill(sensor1, 100, 100, 100);
  ellipse(3*width/4, height/4, sensor1r, sensor1r);

  fill(sensor4, 100, 100, 100);
  ellipse(width/4, 3*height/4, sensor4r, sensor4r);

  fill(sensor2, 100, 100, 100);
  ellipse(3*width/4, 3*height/4, sensor2r, sensor2r);

  fill(0);
  text("s3 " + sensor3, 25, 25);
  text("s1 " + sensor1, 25, 50);
  text("s4 " + sensor4, 25, 75);
  text("s2 " + sensor2, 25, 100);
}

void serialEvent(Serial myPort) { 
  String sensorVals = myPort.readStringUntil('\n');

  println(sensorVals);

  sensorVals = trim(sensorVals);

  int sensors[] = int(split(sensorVals, ','));


  sensor1 = int(map(sensors[0], 65, 700, 33, 0));
  sensor2 = int(map(sensors[1], 25, 700, 33, 0));
  sensor3 = int(map(sensors[2], 25, 700, 33, 0));
  sensor4 = int(map(sensors[3], 40, 650, 33, 0));

  sensor1r = int(map(sensors[0], 65, 700, 10, width/4));
  sensor2r = int(map(sensors[1], 25, 700, 10, width/4));
  sensor3r = int(map(sensors[2], 25, 700, 10, width/4));
  sensor4r = int(map(sensors[3], 40, 650, 10, width/4));

  spacebrew.send("sensorVal1", sensor1r);
  spacebrew.send("sensorVal2", sensor2r);
  spacebrew.send("sensorVal3", sensor3r);
  spacebrew.send("sensorVal4", sensor4r);
}

