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

void setup(){
  size(960,480); // mides document

  // create our Minim object for loading audio
  // inicialitzem l'objecte Minim per poder treballar amb audios
  // minim = new Minim(this);
  // // inicialitzem el reproductor d'audio i l'associem un arxiu de so
  // audio = minim.loadFile("Akashic_Records_-_Jingle_Bells_Bluegrass__instrumental_.mp3");
  // //
  // audio.play();


  // fondos
  fondo1 = new BackgroundScroll("fondo1.png", -3);

}

void draw(){
  background(0);

  fondo1.display();
  fondo1.update();

}

void mouseClicked() {
  fondo1.playStop();
}
