void keyPressed() {
  // toggle between Autopilot & RemoteControl
  if (key == '#') {

    Auto = true;
    Remote = false;
    println("sent: " + key + " Autopilot enabled");
    last_string = local_string;

    // local_string muss mit 'w' zuerst gesetzt werden bevor er mit sb.send abgeschickt wird!

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


void keyReleased() {
  
  if(Auto == true && Remote == false){
  last_string = local_string;
  local_string = "#";  
  println("sent: #");
  sb.send("DriveSend", local_string);

  
  }

  if(Auto == false && Remote == true){
  last_string = local_string;
  local_string = "q";  
  println("sent: q");
  sb.send("DriveSend", local_string);
  
  }
  
 
  
  
}