// Code für das Steuern der Servos über Range-Publisher/Subscriber


/*void mouseDragged() {
  
  if (mouseX >= 0 && mouseX <= width - 20) {
    local_slider_val = mouseX;
    sb.send("ServoSend", local_slider_val);
  }   
  
  
  // die Mauswerte auf das Mauspad begrenzen);
  int mx = constrain(mouseX, 360, 720);
  int my = constrain(mouseY, 150, 510);
  
  // Die Werte der Maus auf Wert zwischen 150 und 600 mappen
  // 150 - 600 sind SERVOMIN - SERVOMAX PWM im dazugehörigen Arduinoskript (ggf. anpassen!)
  float fmapX = map (mx, 360,720,150,600);
  float fmapY = map (my, 150,510,150,600);
  
  // Dezimalstellen von float wegkürzen
  int mapX = round(fmapX);
  int mapY = round(fmapY);
  
  sb.send("ServoSendX",mapX);
  //sb.send("ServoSendY",mapY);
}*/