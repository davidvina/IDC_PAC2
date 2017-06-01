/**
 * @file Casa.pde
 *
 * @CLASE Casa
 * mostra les cases
 *
 */


class Casa{
  //PImage img;
  float posX;
  float posY;
  float velocitat_trineu;
  int sizeCasa;

  // posicion de la chimenea
  // area de colisio
  float chimX;
  float chimY;
  // medidas chimenea

  float chimW = 75;
  float chimH = 21;

  int numCasa;

  boolean regalat = false;

  Casa(float x, float y, float v){
    velocitat_trineu = v;
    posX = x;
    posY = y;
    numCasa = floor(random(3));
    chimX = posicioChemeneia[numCasa][0];
    chimY = posicioChemeneia[numCasa][1];
  }

  void setRegalat(){
    regalat = true;
  }

  void setNoRegalat(){
    regalat = false;
  }

  // https://github.com/jeffThompson/CollisionDetectionFunctionsForProcessing
  // xequeija si hi ha colisió
  boolean checkColision(float x, float y, float r){
    if( ((x >= posX+chimX) && (x <= posX+chimX+chimW))
        &&
        ((y >= posY+chimY) && (y <= posY+chimY+chimH))
      ) {
        return true;
      } else {
        return false;
      }
  }
  // actualitza posicio
  void updatePos(){
    posX = posX + velocitat_trineu;
  }

  // mostra casa
  void display(){
    this.updatePos();
    imageMode(CORNER);

    // si la casa no ha rebut regal la mostrem desaturada  
    if(!regalat){
      tint(100, 200);
    }

    image(casaImg[numCasa], posX, posY);
    noTint();
  }


}
