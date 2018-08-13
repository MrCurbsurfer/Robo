void keyPressed() {


  if (key == 'ß') {
    link("http://spacebrew.github.io/spacebrew/admin/admin.html?server=sandbox.spacebrew.cc");
  }


  // Textswitch

  //Original Switch Code______________________________________
  /*  if (key == CODED) {
   if (textswitch ^= keyCode == SHIFT)   println("yo");
   else                           println("no");
   }*/
  //____________________________________________________________


  if (key == CODED) {
    if (textswitch ^= keyCode == SHIFT) ;
    else ;
  }



  if (key == '#') {
    Autopilot = true;
    println("Autopilot_ON");
    last_string = local_string;
    local_string = "#";
    sb.send("DriveSend", local_string);
  }

  if (key == '+' ) {
    Autopilot = false;
    println("Autopilot_OFF");
    last_string = local_string;
    local_string = "q";
    sb.send("DriveSend", local_string);
  }



  if (textswitch == false) {

    println("Send Control");

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

    println("Type Messages");

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


void keyReleased() {

 /* if ( textswitch == false) {
    if (Autopilot == false) {
      last_string = local_string;
      local_string = "#";
      println("sent: #");
      sb.send("DriveSend", local_string);
    }

    if (Autopilot == false && textswitch == false) {
      last_string = local_string;
      local_string = "q";
      println("sent: q");
      sb.send("DriveSend", local_string);
    }
  }*/
}