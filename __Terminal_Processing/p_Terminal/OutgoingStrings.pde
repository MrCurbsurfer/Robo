void keyPressed() {


 // Mit SpacebrewServer verbinden 
  
  if (key == 'ß') {
    link("http://spacebrew.github.io/spacebrew/admin/admin.html?server=sandbox.spacebrew.cc");
  }



  // Textswitch

  if (key == CODED) {
    if (textswitch ^= keyCode == SHIFT)   
    textswitch = true; 
    
    else                           
    textswitch = false;
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

  if (textswitch == false && Auto == false) {




    ///// Strings for Orion ///////////////////////////////////////////////////////////////////////////  

    // Forward
    if (key == 'w') { 


      println("sent: " + key);
      last_string = local_string;

      // local_string muss mit 'w' zuerst gesetzt werden bevor er mit sb.send abgeschickt wird!

      local_string = "w";
      sb.send("DriveSend", local_string);
    }

    // Backward
    if (key == 's') {

      last_string = local_string;
      local_string = "s";
      sb.send("DriveSend", local_string);
    }


    // Turn Left
    if (key == 'a') {

      last_string = local_string;
      local_string = "a";
      sb.send("DriveSend", local_string);
    }



    // Turn Right
    if (key == 'd') {

      last_string = local_string;
      local_string = "d";
      sb.send("DriveSend", local_string);
    }

    // Speed Up
    if (key == 'r') {

      last_string = local_string;
      local_string = "r";
      sb.send("DriveSend", local_string);
    }

    //Speed Down
    if (key == 'f') {

      last_string = local_string;
      local_string = "f";
      sb.send("DriveSend", local_string);
    }


    ///// Strings for Arduino /////////////////////////  

    // Turn Head Left
    if (key == 'k') {

      last_string = local_string;
      local_string = "k";
      sb.send("DC_Send", local_string);
    }


    // Turn Head Right
 /*   if (key == 'l'|| mouseX <= 330  ) {

      last_string = local_string;
      local_string = "l";
      sb.send("DC_Send", local_string);
      
      println( "Turning Head Left");
      println( "Sending l");
      
    }*/
    
 

     
  }




// TEXT-Eingabe /////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (key != CODED) {
    if (key == DELETE || key == BACKSPACE) {
      if (local_text.length() - 1 >= 0) {
        local_text = local_text.substring(0, (local_text.length() - 1));  
      }
    }

    else if (key == ENTER || key == RETURN) {
      sb.send("TextSend", local_text);
      last_text = local_text;
      local_text = "";  
    } 

    else {
      if (local_text.length() <= 50) {
        local_text += key;
      }
    }
  } 
  
  
} // Void KeyPressed () Ende


void keyReleased() {

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