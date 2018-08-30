import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import spacebrew.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class p170628_Terminal extends PApplet {

/*
 * String Example
 *
 * 	 Send messages up to 50 chars long. Receive string messages
 *   from other spacebrew clients as well.
 * 
 */


String server="sandbox.spacebrew.cc";
String name="String_Publisher";
String description ="Client that sends";


Spacebrew sb;

// Keep track of our current place in the range
String local_string = "";
String remote_string = "";
String last_string = "";




int mapX; // ServoVariable
boolean Auto = false;
boolean Remote = true;
boolean textswitch; // Variable, die zwischen der Eingabe von Steurungs-Strings und der Eingabe von Text-Strings umschaltet



public void setup() {
  



  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // declare your publishers
  sb.addPublish( "DriveSend", "string" ); 

  //sb.addPublish( "ServoSendX", "range");

  //sb.addPublish( "ServoSendY", "range");


  // connect!
  sb.connect(server, name, description );
}

public void draw() {




  background(255);

  pushMatrix();
  translate(0, 50);


  fill(0, 200, 0);
  noStroke();
  rect(0, 800, 1680, 30);


  fill(0, 200, 0, 99);
  rect(0, 830, 1680, 580);

  fill(255);
  rect(130, 830, 1680, 200);

  fill(0);
  text( "X " +mouseX, 100, 900 );
  text( "Y " +mouseY, 100, 920 );
  popMatrix();


  /*
// SERVO-STEUERUNG __________________________________
   
   // Mauspad
   rect(360,150,360,360);
   fill(0);
   
   // die Mauswerte auf das Mauspad begrenzen);
   int mx = constrain(mouseX, 360, 720);
   int my = constrain(mouseY, 150, 510);
   
   // Die Werte der Maus auf Wert zwischen 150 und 600 mappen
   // 150 - 600 sind SERVOMIN - SERVOMAX PWM im dazugeh\u00f6rigen Arduinoskript (ggf. anpassen!)
   float fmapX = map (mx, 360,720,150,600);
   float fmapY = map (my, 150,510,150,600);
   
   // Dezimalstellen von float wegk\u00fcrzen
   int mapX = round(fmapX);
   int mapY = round(fmapY);
   
   // Zeichnen des Cursors;
   fill(255,0,0);
   noStroke();
   rect(mx,my, 5,5);
   
          /*println(mouseX + " MouseX");
   println(mouseY + " MouseY");
   println(mx + " MX");
   println(mapX + " MapX");
   println(mapY + " MapY");
   
   //Sliderbox X
   
   fill(0,0,0,50);
   noStroke();
   rect(0, 510, width, 40);
   
   stroke(0);
   line(0,530,720,530);
   
   fill(255, 0, 0);
   stroke(200, 0, 0);
   ellipse (mapX, 530, 10,10);
   
   
   */






  // FAHWERK STEUERUNG __________________________________

  fill(0);
  // draw lines
  line(0, 35, width - 60, 35);
  line(30, 95, width, 95);

  if (textswitch == false) {

    // draw message being typed
    text("Type Message: ", 30, 60);  
    text(local_string, 150, 60);  

    // draw message that was just sent
    text("Message Sent: ", 30, 80);  
    text(last_string, 150, 80);  

    // draw latest received message
    text("Message Received: ", 30, 120);  
    text(remote_string, 150, 120);
  }
  //Laut Spacebrew sind nur 50 Zeichen m\u00f6glich!


  if (textswitch == true) {

    // draw message being typed
    text("Type Message: ", 30, 900);  
    text(local_string, 150, 900);  

    text("Message Sent: ", 30, 920);  
    text(last_string, 150, 920);  

    // draw latest received message
    text("Message Received: ", 30, 940);  
    text(remote_string, 150, 940);
  }
}
public void keyPressed() {

  if (key == '\u00df') {
    link("http://spacebrew.github.io/spacebrew/admin/admin.html?server=sandbox.spacebrew.cc");
  }


  // Toggle Switch

  if (key == CODED) {
    if (textswitch ^= keyCode == SHIFT)   println("yo");
    else                           println("no");
  }


  // toggle between Autopilot & RemoteControl
  if (key == '#') {

    Auto = true;
    Remote = false;
    println("sent: " + key + " Autopilot enabled");
    last_string = local_string;


    local_string = "#";
    sb.send("DriveSend", local_string);
  }


  if (key == '+') {

    Auto = false;
    Remote = true;


    println("sent: " + key + " Remote Control enabled");
    last_string = local_string;

    // local_string muss mit 'w' zuerst gesetzt werden bevor er mit sb.send abgeschickt wird!

    local_string = "+";
    sb.send("DriveSend", local_string);
  }

  if (textswitch == false) {


    // Strings for Orion-------------------------------------

    if (key == 'w') {


      println("sent: " + key);
      last_string = local_string;

      // local_string muss mit 'w' zuerst gesetzt werden bevor er mit sb.send abgeschickt wird!

      local_string = "w";
      sb.send("DriveSend", local_string);
    }

    if (key == 's') {

      last_string = local_string;
      local_string = "s";
      sb.send("DriveSend", local_string);
    }

    if (key == 'a') {

      last_string = local_string;
      local_string = "a";
      sb.send("DriveSend", local_string);
    }


    if (key == 'd') {

      last_string = local_string;
      local_string = "d";
      sb.send("DriveSend", local_string);
    }

    if (key == 'r') {

      last_string = local_string;
      local_string = "r";
      sb.send("DriveSend", local_string);
    }


    if (key == 'f') {

      last_string = local_string;
      local_string = "f";
      sb.send("DriveSend", local_string);
    }


    // Strings for Arduino

    if (key == 'k') {

      last_string = local_string;
      local_string = "k";
      sb.send("DriveSend", local_string);
    }

    if (key == 'l') {

      last_string = local_string;
      local_string = "l";
      sb.send("DriveSend", local_string);
    }
  }


  if (textswitch == true) {

    if (key != CODED) {
      if (key == DELETE || key == BACKSPACE) {
        if (local_string.length() - 1 >= 0) {
          local_string = local_string.substring(0, (local_string.length() - 1));
        }
      } else if (key == ENTER || key == RETURN) {
        sb.send("DriveSend", local_string);
        last_string = local_string;
        local_string = "";
      } else {
        if (local_string.length() <= 100) {
          local_string += key;
        }
      }
    }
  }
}


public void keyReleased() {

  if ( textswitch == false) {
    if (Auto == true && Remote == false) {
      last_string = local_string;
      local_string = "#";
      println("sent: #");
      sb.send("DriveSend", local_string);
    }

    if (Auto == false && Remote == true) {
      last_string = local_string;
      local_string = "q";
      println("sent: q");
      sb.send("DriveSend", local_string);
    }
  }
}
// Code f\u00fcr das Steuern der Servos \u00fcber Range-Publisher/Subscriber


/*void mouseDragged() {

  if (mouseX >= 0 && mouseX <= width - 20) {
    local_slider_val = mouseX;
    sb.send("ServoSend", local_slider_val);
  }


  // die Mauswerte auf das Mauspad begrenzen);
  int mx = constrain(mouseX, 360, 720);
  int my = constrain(mouseY, 150, 510);

  // Die Werte der Maus auf Wert zwischen 150 und 600 mappen
  // 150 - 600 sind SERVOMIN - SERVOMAX PWM im dazugeh\u00f6rigen Arduinoskript (ggf. anpassen!)
  float fmapX = map (mx, 360,720,150,600);
  float fmapY = map (my, 150,510,150,600);

  // Dezimalstellen von float wegk\u00fcrzen
  int mapX = round(fmapX);
  int mapY = round(fmapY);

  sb.send("ServoSendX",mapX);
  //sb.send("ServoSendY",mapY);
}*/
  public void settings() {  size(1680, 1050); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "p170628_Terminal" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
