/**
 *
 * PAC1
 * Integració digital de continguts
 * @file PAC.pde
 * @author David Vinagre Cerezo
 * @date Abril 2017
 * @version 1
 */


 //
 // // IMPORTACIÓ DE LLIBRERIES
 // import controlP5.*; // llibreria per interficie
 // import ddf.minim.*; // llibreria de so basica
 //
 //
 // // declare d'objecte minim per utilitzar so
 // Minim minim;
 // AudioPlayer audio; // reproductor de so


//Snow[] nieve;

BackgroundScroll fondo1;
BackgroundScroll fondo2;

Santa santa;


ArrayList<Bomba> bombas = new ArrayList<Bomba>();

//ArrayList<Casa> casas;
Casa[] casas;


float velocitatTrineu;


PImage casaImg;


void setup(){
  size(960,480, P2D); // mides document
  noSmooth();
  frameRate(30);

  // create our Minim object for loading audio
  // inicialitzem l'objecte Minim per poder treballar amb audios
  // minim = new Minim(this);
  // // inicialitzem el reproductor d'audio i l'associem un arxiu de so
  // audio = minim.loadFile("Akashic_Records_-_Jingle_Bells_Bluegrass__instrumental_.mp3");
  // //
  // audio.play();

  velocitatTrineu = -4;

  // fondos
  fondo1 = new BackgroundScroll("fondo1.png", velocitatTrineu);
  fondo2 = new BackgroundScroll("fondo2.png", -0.4);

  // santa
  santa = new Santa();

  // casas
  casaImg = loadImage("home.png");
  casas = new Casa[10];

  float initialPosx = 600;

  for(int i = 0; i < casas.length; i++){
    casas[i] = new Casa(initialPosx+(random(-50,50)), random(250,300), velocitatTrineu);
    initialPosx += 150;
  }

} // void setup

void draw(){
  background(#6CA6BA);

  fondo2.display();
  fondo1.display();


  // recorreguem casas
  // para actualizar posicion
  // para ver si hay colision
  if( casas.length > 0 ){
    for(int i = 0; i < casas.length; ++i){
      // comprovamos si la casa ha salido de la pantalla
      if (casas[i].posX < -150){
        casas[i].posX += 1100 + random(0, 250);
      }
      casas[i].display();
    }
  }


  // si l'ArrayList te elements recorreguem aquest
  if(bombas.size()>0){
    for(int i = 0; i < bombas.size(); ++i){

        // actualitzem posicio bombas
        Bomba currentBomb = bombas.get(i);
        currentBomb.display();

        // comprovamos si la bomba ha colisionado
        for(int e = 0; e < casas.length; e++){
          if(casas[e].checkColision(currentBomb.posX, currentBomb.posY, currentBomb.radi)){
            text("colision", 20, 40);
            bombas.remove(i);
          } else {
            text("No colision", 20, 40);
          }
        }


        // comprovem si la bomba a sortit de la pantalla
        // si es així eliminem l'element del ArrayList
        if(currentBomb.get_position()){
          bombas.remove(i);
        };


    } // endfor
  }




  santa.display();

  fill(#000000);
  text(frameRate, 20, 30);
  text("Numero bombas: "+str(bombas.size()), 20, 50);

}

// void mouseClicked() {
//   fondo1.playStop();
// }
void mouseClicked(){
    // crear una bomba
    bombas.add(new Bomba(mouseX, mouseY, velocitatTrineu));
}





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


class Casa{
  //PImage img;
  float posX;
  float posY;
  float velocitat_trineu;
  int sizeCasa;

  // posicion de la chimenea
  float chimX = 10;
  float chimY = 10;
  // medidas chimenea

  float chimW = 30;
  float chimH = 10;

  Casa(float x, float y, float v){
    //img = loadImage("home.png");
    velocitat_trineu = v;
    posX = x;
    posY = y;
    sizeCasa = int(random(100,150));
  }

  void chimenea(){
      fill(255,0,0);
      rect(posX+chimX, posY+chimY, chimW, chimH);
  }


  // https://github.com/jeffThompson/CollisionDetectionFunctionsForProcessing
  // chequea si hay colision
  boolean checkColision(float x, float y, float r){

    if( ((x >= posX+chimX) && (x <= posX+chimX+chimW))
        &&
        ((y => posY+chimY) && (y <= posY+chimY+chimH))
      ) {
        return true;
      } else {
        return false;
      }
  }




  void updatePos(){
    posX = posX + velocitat_trineu;
  }

  void display(){
    this.updatePos();
    imageMode(CORNER);
    casaImg.resize(100, 0);
    image(casaImg, posX, posY);
    this.chimenea();
    fill(#000000);
    //text (str(this.chimeneaX1())+" "+str(this.chimeneaX2()), posX, posY);
  }


}
