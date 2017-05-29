/**
 * @file Text.pde
 *
 * @CLASE Text
 * classe que permet colocar un text
 * he decidit crear aquesta classe per tal de alleugerir el codi de l'arxiu princal
 *
 * @PROPIETATS
 * textContent {string} text a mostrar
 * posX {entero}        posicion X del text
 * posY {entero}        posicion Y
 * tColor {color}       color del text
 * tipografia {PFont}   Característiques tipografiques
 *
 * @METODES
 * update(String t)   Actualitza la propietat textContent
 * display()          Mostra el text
 */


class BackgroundScroll{
  PImage img;
  float velocity;
  float posX = 0;
//  float posY = 0;
  float currentPosX;
  boolean play = true;


  BackgroundScroll(String i, float v){
    img = loadImage(i);
    velocity = v;
    currentPosX = posX;
  }


  void playStop(){
    play = !play;
  }

  void update(){

    if(play){
      if(currentPosX < (img.width*-1)){
        currentPosX = currentPosX+img.width;
      } else{
        currentPosX = currentPosX + velocity;
      }
    }
  }

  void display(){

    this.update();
    
    imageMode(CORNER);
    image(img, currentPosX, 0);
    image(img, currentPosX+img.width, 0);

  }

}
