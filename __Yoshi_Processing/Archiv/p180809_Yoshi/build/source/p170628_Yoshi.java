import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 
import spacebrew.*; 
import guru.ttslib.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class p170628_Yoshi extends PApplet {








TTS tts;
Serial OrionPort;
Serial ArduinoPort;

int val;
boolean Auto;
String mode = "Standby"; // Die Variable f\u00fcr Message Received

//_______Spacebrew_Stuff_________________
String server="sandbox.spacebrew.cc";
String name="String_Subscriber";
String description ="Client that reads";

String local_string = "";
String remote_string = "";
String last_string = "";

Spacebrew sb;



public void setup() {
  
  



  //instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  //declare your subscribers
  sb.addSubscribe( "Receive", "string" );

  //connect to server!
  sb.connect(server, name, description );

  printArray(Serial.list());


  // Zuordnung eines Ports aus der Liste zum Serial class Objekt

  String OrionPortName = Serial.list()[1];
  String ArduinoPortName = Serial.list()[0];

  // Initiieren der Ports

  OrionPort = new Serial(this, OrionPortName, 9600);
  ArduinoPort = new Serial(this, ArduinoPortName, 9600);


  tts = new TTS();

  Auto = false;
}

public void draw() {




    background(200, 0, 0);
    fill(255);
    stroke(250);

    line(30, 35, width - 60, 35);
    line(30, 115, width-60, 115);


    // draw message being typed
    text("Type Message: ", 30, 60);
    text(local_string, 150, 60);

    // draw message that was just sent
    text("Message Sent: ", 30, 80);
    text(last_string, 150, 80);

    // show pressed key if keyboard input
    text("Key Pressed: ", 30, 100);
    text(key, 150, 100);

    // mode wird abh\u00e4ngig von Autopilot ON/OFF im Tab Incoming
    // Strings ge\u00e4ndert
    // draw latest received message
    text("Message Received: ", 30, 140);
    text(mode, 150, 140);


}
public void onStringMessage( String name, String value ) {

  println("got string message " + name + " : " + value);
  remote_string = value;

  if(remote_string.length() > 2) {
    tts.speak(remote_string);}


  // trim(value) k\u00fcrzt \u00fcberfl\u00fcssige Zeichen weg (z.B Leerzeichen);
  value = trim(value);


  // value.charAt(0) bestimmt, dass vom String 'value' der char an Position 0 ( also der 1. Buchstabe)
  // \u00fcbernommen wird
  char remote = value.charAt(0);



  //_____Autopilot_ON/OFF______________________

  //Autopilot OFF
  if (remote == '+') {

    OrionPort.write('+');
    Auto = false;
    
  }

  //Autopilot ON
  if (remote == '#') {

    OrionPort.write('#');
    Auto = true;
    
  }



  //_____Chars_for_Orion_DC_Motors_____________

  if (Auto == false) {
    
    // falls nicht im Autopilot, \u00fcbernimm f\u00fcr den String mode die vom Terminal
    // kommenden Strings aus remote_string;
    mode = remote_string;

    // Forward_run()
    if ( remote == 'w')
    {
      OrionPort.write('w');
      println(remote);
    }

    //Backward_run()
    if (remote == 's')
    {
      OrionPort.write('s'); 
      println(remote);
    }

    //TurnLeft_run()  
    if (remote == 'a')
    {
      OrionPort.write('a'); 
      println(remote);
    }

    //TurnRight_run()
    if (remote == 'd')
    {
      OrionPort.write('d'); 
      println(remote);
    }

    //
    if (remote == 'r')
    {
      OrionPort.write('r'); 
      println(remote);
    }

    //
    if (remote == 'f')
    {
      OrionPort.write('f'); 
      println(remote);
    }


    //Stop_Run und Stop_DC
    if (remote == 'q')
    {
      OrionPort.write('q');
      println(remote);

      ArduinoPort.write('q');
    }


    //_____Chars_for_Arduino_DC_Motor_(Head)_______________

    //Turn_Left
    if (remote == 'k')
    {
      ArduinoPort.write('k');
      println(remote);
    }

    //Turn_Right
    if (remote == 'l')
    {
      ArduinoPort.write('l');
      println(remote + " Arduino");
    }
  }

  if (Auto == true) {

    OrionPort.write('#');
    println( "Autopilot");
    mode = "AUTOPILOT";
  }
}
public void keyPressed() {



  //_____Autopilot_ON/OFF______________________

  //Autopilot OFF
  if (key == '+') {

    OrionPort.write('+');
    Auto = false;
  }

  //Autopilot ON
  if (key == '#') {

    OrionPort.write('#');
    Auto = true;
  }

  if (Auto == false) {
    //Forward_run();
    if ( key == 'w')
    {
      OrionPort.write('w');
      println(key);
    }

    //Backward_run()
    if (key == 's')
    {
      OrionPort.write('s');
      println(key);
    }

    //TurnLeft_run()
    if (key == 'a')
    {
      OrionPort.write('a');
      println(key);
    }

    //TurnRight_run()
    if (key == 'd')
    {
      OrionPort.write('d');
      println(key);
    }

    //
    if (key == 'r')
    {
      OrionPort.write('r');
      println(key);
    }

    //
    if (key == 'f')
    {
      OrionPort.write('f');
      println(key);
    }





    //_____Chars_for_Arduino________________

    //Turn_Left
    if (key == 'k')
    {
      //ArduinoPort.write('k');
      //println(key);
    }
    // Turn_Right
    if (key == 'l')
    {
      //ArduinoPort.write('l');
      //println(key + " Arduino");
    }
  }

  if (Auto == true) {

    key = '#';
  }
}

public void keyReleased() {

  if (Auto == false) {
    key = 'q';
    OrionPort.write('q');
    println(key);
  }

  if (Auto == true) {
    key = '#';
  }
}
  public void settings() {  size(750, 300);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "p170628_Yoshi" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
