/**
 *
 * PAC1
 * Integració digital de continguts
 * @file PAC.pde
 * @author David Vinagre Cerezo
 * @date Abril 2017
 * @version 1
 */



 // IMPORTACIÓ DE LLIBRERIES
 import controlP5.*; // llibreria per interficie
 import ddf.minim.*; // llibreria de so basica


 // declare d'objecte minim per utilitzar so
 Minim minim;
 AudioPlayer audio; // reproductor de so


Snow[] nieve;

BackgroundScroll fondo1;

void setup(){
  size(960,480); // mides document

  // create our Minim object for loading audio
  // inicialitzem l'objecte Minim per poder treballar amb audios
  minim = new Minim(this);
  // inicialitzem el reproductor d'audio i l'associem un arxiu de so
  audio = minim.loadFile("Akashic_Records_-_Jingle_Bells_Bluegrass__instrumental_.mp3");
  //
  audio.play();


  // fondos
  fondo1 = new BackgroundScroll("fondo1.png");

}

void draw(){
  background(0);

  fondo1.display();
  fondo1.update();

}


class BackgroundScroll{
  PImage img;
  float velocity = -2;
  float posX = 0;
//  float posY = 0;
  float currentPosX;
//  float currentPosY;
  ArrayList<PImage> images;

  BackgroundScroll(String i){
    img = loadImage(i);
    currentPosX = posX;
  //  currentPoxY = posY;
  }

  void update(){
    currentPosX = currentPosX + velocity;
  }

  void display(){
    image(img, currentPosX, 0);
    fill(255);
    text(currentPosX, 20, 40);
  }

}
