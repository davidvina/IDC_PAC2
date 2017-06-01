/**
 * @file Text.pde
 *
 * @CLASE Text
 * classe que permet colocar un text
 * he decidit crear aquesta classe per tal de alleugerir el codi de l'arxiu princal
 *
 */
class Text{
  // propietats
  String textContent;
  int posX = 10;
  int posY = 10;
  color tColor = color(0, 0.8);
  PFont tipografia;
  String textAlign = "LEFT";

  boolean shadow = false;
  int sX = 3;
  int sY = 3;
  color sColor = color(#000000, 100);


  // constructor
  Text(String t, String pathFont, int sizeFont){
      textContent = t;
      tipografia= createFont(pathFont, sizeFont);
  }

  void setPosition(int x, int y){
      posX = x;
      posY = y;
  }

  void setColor(color c){
    tColor = c;
  }

  void setShadow(boolean s){
    shadow = s;
  }

  void setJustify(String ta){
    textAlign = ta;
  }

  // Setter
  void update(String t){
    textContent = t;
  }

  // Getter
  void display(){

    textFont(tipografia);
    textLeading(30);


    switch (textAlign){
      case "LEFT":
        textAlign(LEFT);
        break;
      case "RIGHT":
        textAlign(RIGHT);
        break;
      case "CENTER":
        textAlign(CENTER);
        break;
    }


    if(shadow){
      fill(sColor);
      text(textContent, posX+sX, posY+sY);
      //filter(BLUR);
    }


    fill(tColor);
    text(textContent, posX, posY);


  }
}
