/**
 * @file Regal.pde
 *
 * @CLASE Regal
 * projectil
 *
 */
class Regal{
  float time = 0; // temps
  float incrementoTiempo;
  float velocitat_Inicial = 50; // velocitat incial
  float velocitat_trineu;
  float angle = radians(90); // angle
  float a = 10; // acceleració o gravetat
  float radi = 20;

  // permet mostrar un regal diferent
  int numRegal;

  float posY; // posició actual rodona, eix x
  float posX; // posició actual rodona, eix y

  float posX0; // posició inicial rodona, eix x
  float posY0; // posició incial rodona, eix y

  Regal(float x, float y, float v){
    posX0 = x;
    posY0 = y;
    posX = posX0;
    posY = posY0;
    incrementoTiempo = frameRate/100;
    velocitat_trineu = v;
    numRegal = int(random(5))+1;
  }

  // comproba si l'element esta fora de pantalla
  boolean get_position(){
    if (posX < -50 || posX > width+50 || posY > height+50) {
      return true;
    } else {
      return false;
    }
  }

    // update, calcul nova posició
  void update(){
    posX = posX + velocitat_trineu;
    posY = posY0 - velocitat_Inicial*sin(angle)*time +a/2*sq(time) ;
    time = time + incrementoTiempo;
  }

  // draw, visualització bomba
  void display(){
    this.update();
    imageMode(CENTER);
    image(regal[numRegal], posX-15, posY);
  }
}
