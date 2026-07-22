void iconePrise(float x,float y,color c){
  stroke(c);
  strokeWeight(4);
  noFill();

  rect(x,y,28,38,8);

  line(x+8,y+8,x+8,y+18);
  line(x+20,y+8,x+20,y+18);

  noFill();
  arc(x+14,y+38,28,22,0,PI);

  strokeWeight(3);
}

void iconeEclair(float x,float y,color c){
  fill(c);
  noStroke();

  beginShape();

  vertex(x+12,y);
  vertex(x+2,y+20);
  vertex(x+12,y+20);
  vertex(x+5,y+40);
  vertex(x+26,y+15);
  vertex(x+15,y+15);

  endShape(CLOSE);
}

void iconeGraph(float x,float y,color c){
  stroke(c);
  strokeWeight(4);
  line(x,y+35,x,y);
  line(x+12,y+35,x+12,y+18);
  line(x+24,y+35,x+24,y+10);
  line(x+36,y+35,x+36,y+24);
}

void iconeCloche(float x,float y,color c){
  stroke(c);
  strokeWeight(4);
  noFill();

  arc(x+15,y+18,30,28,PI,TWO_PI);

  line(x,y+18,x,y+28);
  line(x+30,y+18,x+30,y+28);

  arc(x+15,y+28,30,10,0,PI);

  fill(c);
  noStroke();
  ellipse(x+15,y+33,5,5);

  stroke(c);
  line(x+15,y+33,x+15,y+40);
  
  noStroke();
}

void iconePower(float x,float y,float r,color cercle,color symbole){
  stroke(cercle);
  strokeWeight(7);
  noFill();

  ellipse(x,y,r,r);

  stroke(symbole);
  strokeWeight(7);

  line(x,y-r*0.25,x,y-r*0.02);

  arc(x,y,r*0.55,r*0.55,-PI/4,5*PI/4);
}

void iconeAlerte(float x,float y){
  noStroke();

  fill(255,70,70);
  ellipse(x,y,18,18);

  fill(255);
  rect(x-2,y-5,4,8);

  ellipse(x,y+7,4,4);
}

void badgeON(float x,float y){
  fill(30,190,80);
  noStroke();

  rect(x,y,52,26,13);

  fill(255);
  textSize(14);
  text("ON",x+14,y+18);

}

void badgeOFF(float x,float y){

  fill(170,40,40);
  noStroke();

  rect(x,y,58,26,13);

  fill(255);
  textSize(14);
  text("OFF",x+12,y+18);

}

void modeSombreIcon(int couleur){
  float angle;
  angle=0;
  pushMatrix();
  translate(1690,20);
  strokeWeight(1);
  stroke(couleur);
  ellipse(0,0,10,10);
  while(angle<2*PI){
     pushMatrix();
     rotate(angle);
     strokeWeight(2);
     stroke(200,200,0);
     fill(couleur);
     text(".",7,7);
     popMatrix();
     angle+=PI/4;
  }
  popMatrix();
  noStroke();
  noFill();
}
