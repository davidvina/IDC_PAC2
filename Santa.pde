/**
 * @file Santa.pde
 *
 * @CLASE Santa
 * mostra santa claus i el posiciona en el mouse
 *
 */
class Santa{
    PImage img;

    Santa(){
      img = loadImage("santa.png");
    }

    void display(){
      imageMode(CENTER);
      image(img, mouseX, mouseY);
    }

}
