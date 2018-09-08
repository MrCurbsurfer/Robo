
void mouseReleased() {
  // animate the variables x and y in 1.5 sec to mouse click position



  Ani.to(this, 1.5, "ANIx", mouseX-200);
  Ani.to(this, 1.5, "ANIy", mouseY);

  Ani.to(this, 1.5, "ANIx2", mouseX+200);
  Ani.to(this, 1.5, "ANIy2", mouseY);


  if ( mouseY >= 310 && mouseY <= 740 && mouseX >= 600 && mouseX <= 1070 ) {







    int[] eyesXY = new int[2]; 
    eyesXY[0] = mouseX; 
    eyesXY[1] = mouseY; 


    // Die Integer-Werte werden im String "EyeString" zusammengefasst
    String EyeString = join(nf(eyesXY, 0), ","); 
    println(EyeString);   

    last_string = local_string;
    local_string = EyeString;
    sb.send("Eyes_Send", local_string);
  }
}