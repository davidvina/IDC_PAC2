class Bomba{
  float time = 0; // temps
  float incrementoTiempo;
  float velocitat_Inicial = 60; // velocitat incial
  float velocitat_trineu;
  float angle = radians(90); // angle
  float a = 10; // acceleració o gravetat
  float radi = 10;


  float posY; // posició actual rodona, eix x
  float posX; // posició actual rodona, eix y

  float posX0; // posició inicial rodona, eix x
  float posY0; // posició incial rodona, eix y

  Bomba(float x, float y, float v){
    posX0 = x;
    posY0 = y;
    posX = posX0;
    posY = posY0;
    incrementoTiempo = frameRate/100;
    velocitat_trineu = v;
  }

  // comproba si l'element esta fora de pantalla
  boolean get_position(){
    if (posX < -20 || posX > width+20 || posY > height+10) {
      return true;
    } else {
      return false;
    }
  }

    // update, calcul nova posició
  void update(){
    //posX = (posX0 + velocitat_Inicial*cos(angle)*time);
    //velocitat_trineu = velocitat_trineu + velocitat_trineu;
    posX = posX + velocitat_trineu;
    posY = posY0 - velocitat_Inicial*sin(angle)*time +a/2*sq(time) ;
    time = time + incrementoTiempo;
  }

  // draw, visualització bomba
  void display(){
    this.update();
    fill (#ffffff);
    ellipse (posX, posY, radi, radi);
    fill(#000000);
    //text(posX, 20, 20);
    //text(posY, 20, 60);
    text(str(posX)+" "+str(posY), posX+20, posY);
  }


}
