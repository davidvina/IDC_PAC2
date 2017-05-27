class Snow{
  float posX;
  float posY;
  float snowRadius;
  color snowColor = color(255,255,255,150);


  Snow(){
    posX = random(0, width);
    posY = random(0, height);
    snowRadius = random(1, 3);
  }


  void updatePosition(){

  }


  void display(){
    ellipse(posX, posY, snowRadius, snowRadius);
  }


}
