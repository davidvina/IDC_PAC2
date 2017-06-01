/**
 *
 * PAC2
 * Integració digital de continguts
 * @file PAC.pde
 * @author David Vinagre Cerezo
 * @date Maig 2017
 * @version 1
 */

/* IMPORTACIÓ DE LLIBRERIES */
import ddf.minim.*; // llibreria de so basica

// DECLARACIO OBJECTES I VARIABLES
int estatAplicacio; // 0, 1, 2

Minim minim;
AudioPlayer musica; // reproductor de so
AudioSample throwRegal, success; // efectes de so

// objectes per al fons de sketch
BackgroundScroll fondo1;
BackgroundScroll fondo2;
BackgroundScroll fondo3;

// objecte santaclaus
Santa santa;

// array list de regals
ArrayList<Regal> regals = new ArrayList<Regal>();

//Array de cases
Casa[] casas;

// velocitat del scroll
float velocitatTrineu;

// imatge de les cases
PImage[] casaImg;
float[][] posicioChemeneia;
// imatges regals
PImage[] regal;


// textos
Text felizNavidad;
Text descripcion;
Text instruccions;


void setup(){
  size(960, 480, P2D); // mides document
  frameRate(30);

  // estat joc 0 = parada, 1 = iniciada
  estatAplicacio = 0;

  // create our Minim object for loading audio
  // inicialitzem l'objecte Minim per poder treballar amb audios
  minim = new Minim(this);

  // // inicialitzem el reproductor d'audio i l'associem un arxiu de so
  musica = minim.loadFile("Akashic_Records_-_Jingle_Bells_Bluegrass__instrumental_.mp3");
  throwRegal = minim.loadSample("throwing16.wav");
  success = minim.loadSample("success.wav");

  // inicialitzem textos
  felizNavidad = new Text("Bon Nadal", "rokkitt/Rokkitt-Black.otf", 80);
  felizNavidad.setPosition(width/2, height/2 - 60);
  felizNavidad.setJustify("CENTER");
  felizNavidad.setColor(color(#D30F0F));
  felizNavidad.setShadow(true);

  descripcion = new Text("Ajuda a Santa a repartir els regals", "rokkitt/Rokkitt-Regular.otf", 30);
  descripcion.setPosition(width/2, height/2 -10);
  descripcion.setJustify("CENTER");
  descripcion.setColor(color(#D30F0F));

  instruccions = new Text("ESPAI: inicia joc\n q: surt del joc\n", "rokkitt/Rokkitt-Regular.otf", 20);
  instruccions.setPosition(width/2, height/2 + 50);
  instruccions.setJustify("CENTER");
  instruccions.setColor(color(#614646));


  // velocitat eneral del scroll px per frame
  velocitatTrineu = -4;

  // inicialitzem els fondos i associem image i velocitat
  fondo1 = new BackgroundScroll("fondo1.png", velocitatTrineu);
  fondo2 = new BackgroundScroll("fondo2.png", -0.4);
  fondo3 = new BackgroundScroll("fondo3.png", -1);

  // santa
  santa = new Santa();

  // cases
  casaImg = new PImage[3];
  casaImg[0] = loadImage("casa1.png");
  casaImg[1] = loadImage("casa2.png");
  casaImg[2] = loadImage("casa3.png");

  // posicio de les arees de colisio
  posicioChemeneia = new float[3][2];
  posicioChemeneia[0][0] = 20;
  posicioChemeneia[0][1] = 5;
  posicioChemeneia[1][0] = 125;
  posicioChemeneia[1][1] = 5;
  posicioChemeneia[2][0] = 95;
  posicioChemeneia[2][1] = 8;

  // array de 8 cases
  casas = new Casa[8];

  // regals, hi ha 6 tipus diferents
  regal = new PImage[6];
  regal[0] = loadImage("regal1.png");
  regal[1] = loadImage("regal2.png");
  regal[2] = loadImage("regal3.png");
  regal[3] = loadImage("regal4.png");
  regal[4] = loadImage("regal5.png");
  regal[5] = loadImage("regal6.png");

  //crearCasas();

} // void setup

void draw(){

  switch(estatAplicacio){
    case 0:
      // joc aturat
      showBackground(false);
      musica.pause();
      musica.rewind();
      crearCasas();
      showText();
      break;

    case 1:
      // joc iniciat
      showBackground(true);
      // reanudem música
      musica.play();
      showGame();
      break;
  } // endSwitch

}


/* EVENTS ******************************/
// events de ratoli
void mouseClicked(){

    if(estatAplicacio == 1){
        throwRegal.trigger();
        regals.add(new Regal(mouseX, mouseY, velocitatTrineu));
    }
}

// events de teclat
void keyPressed(){
  // inicia el joc
  if (key == ' '){
    estatAplicacio = 1;
  }
  // surt del joc
  if (key == 'q'){
    estatAplicacio = 0;
  }
}

/* FUNCIONS ******************************/
void crearCasas(){
  float initialPosx = 600;
  float valorAlternarY = -1;
  for(int i = 0; i < casas.length; i++){

    valorAlternarY = valorAlternarY * -1;
    casas[i] = new Casa(initialPosx+(random(-50,50)), 350 + 20*valorAlternarY, velocitatTrineu);
    //casas[i].posY = ;
    initialPosx += 300;
  }
}


void showBackground(boolean play){
  // mostrem fons sketch
  background(#6CA6BA);

  fondo2.display(play);
  fondo3.display(play);
  fondo1.display(play);
}

// Funcio lógica del joc
void showGame(){
  noCursor();
  // recorreguem casas
  // para actualizar posicion
  // para ver si hay colision
  if( casas.length > 0 ){
    float valorAlternarY = -1;

    for(int i = 0; i < casas.length; ++i){

      // comprovamos si la casa ha salido de la pantalla
      if (casas[i].posX < -250){
        casas[i].posX += 1400 + random(0, 20);

        // alternamos alturas para que no se superpongan areas de colision
        casas[i].posY = 350 + 20 * valorAlternarY;
        valorAlternarY = valorAlternarY * -1;
        casas[i].setNoRegalat();
      }
      casas[i].display();
    }
  }

  // si l'ArrayList te elements recorreguem aquest
  if(regals.size()>0){
    for(int i = 0; i < regals.size(); ++i){

        // actualitzem posicio regals
        Regal currentBomb = regals.get(i);
        currentBomb.display();

        // comprovamos si la bomba ha colisionado
        for(int e = 0; e < casas.length; e++){
          // IndexOutOfBoundsException: Index: 0, Size: 0
          if(!casas[e].regalat){
            if(casas[e].checkColision(currentBomb.posX, currentBomb.posY, currentBomb.radi)){
              success.trigger();
              regals.remove(i);
              casas[e].setRegalat();
            }
          }
        }

        // comprovem si la bomba a sortit de la pantalla
        // si es així eliminem l'element del ArrayList
        if(currentBomb.get_position()){
          regals.remove(i);
        };

    } // endfor
  }

  // mostrem para noel
  santa.display();
}

// mostra el text
void showText(){
  cursor(ARROW);
  felizNavidad.display();
  descripcion.display();
  instruccions.display();
}
