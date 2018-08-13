void keyPressed() {


  if (key == 'ß') {
    link("http://spacebrew.github.io/spacebrew/admin/admin.html?server=sandbox.spacebrew.cc");
  }


  // Textswitch

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

  if (textswitch == false && Auto == false) {




    ///// Strings for Orion /////////////////////////  

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
    
 
    // Kann das Weg?
    /*    if (key != CODED) {
     if (key == DELETE || key == BACKSPACE) {
     if (local_string.length() - 1 >= 0) {
     local_string = local_string.substring(0, (local_string.length() - 1));
     sb.send("DriveSend", local_string);
     last_string = local_string;
     local_string = "";
     }
     }
     }*/
     
  }


  if (textswitch == true) {

    if (key != CODED) {
      if (key == DELETE || key == BACKSPACE) {
        if (local_string.length() - 1 >= 0) {
          local_string = local_string.substring(0, (local_string.length() - 1));
        }
      } else if (key == ENTER || key == RETURN) {
        sb.send("TextSend", local_string);
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