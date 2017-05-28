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


Snow[] nieve;

BackgroundScroll fondo1;
BackgroundScroll fondo2;

Santa santa;


ArrayList<Bomba> bombas = new ArrayList<Bomba>();

float velocitatTrineu;

void setup(){
  size(960,480); // mides document

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


}

void draw(){
  background(#6CA6BA);

  fondo2.display();
  fondo1.display();

  santa.display();

  // si l'ArrayList te elements recorreguem aquest
  if(bombas.size()>0){
    for(int i = 0; i < bombas.size(); ++i){
        Bomba currentBomb = bombas.get(i);
        currentBomb.display();
    }
  }

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
