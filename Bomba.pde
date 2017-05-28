class Bomba{
  float time = 0; // temps
  float incrementoTiempo;
  float velocitat_Inicial = 60; // velocitat incial
  float velocitat_trineu;
  float angle = radians(90); // angle
  float a = 10; // acceleració o gravetat


  float bomba_y; // posició actual rodona, eix x
  float bomba_x; // posició actual rodona, eix y

  float bomba_x0; // posició inicial rodona, eix x
  float bomba_y0; // posició incial rodona, eix y

  Bomba(float x, float y, float v){
    bomba_x0 = x;
    bomba_y0 = y;
    bomba_x = bomba_x0;
    bomba_y = bomba_y0;
    incrementoTiempo = frameRate/100;
    velocitat_trineu = v;
  }

    // update, calcul nova posició
  void update(){
    //bomba_x = (bomba_x0 + velocitat_Inicial*cos(angle)*time);
    //velocitat_trineu = velocitat_trineu + velocitat_trineu;
    bomba_x = bomba_x + velocitat_trineu;
    bomba_y = bomba_y0 - velocitat_Inicial*sin(angle)*time +a/2*sq(time) ;
    time = time + incrementoTiempo;
  }

  // draw, visualització bomba
  void display(){
    this.update();
    fill (#ffffff);
    ellipse (bomba_x, bomba_y, 10, 10);
    fill(#000000);
    //text(bomba_x, 20, 20);
    //text(bomba_y, 20, 60);
  }


}
