
//Paramètres de la forme de la tête

float posXO = 1/3.5; //Position X des yeux
float posYO = 1/2.5; // Position Y des yeux
float TailleO = 1/4.3; //Taille des Yeux

float posXB = 1/2.0; // Position X des la bouche
float posYB = 1/1.4; // Position Y de la bouche
float TailleB = 1/3.0; // Taille de la bouche


//Paramètre Globaux

int LimiteRecursivite = 8; // Nombre limite de tête imbriquée (+1)


void setup(){
  size(700,700);
  apparition();
}


void draw(){
}


void mouseClicked(){
  apparition();
}


void apparition(){
  background(20,85,180);
  placement(0,0,700,1);
}


//Construit une Tête

void face(float x,float y,float dimension){
  
  color c = color(random(0,255),random(0,255),random(0,255));
  noStroke();
  fill(c);
  
  
  pushMatrix();
  translate(x,y);
  
  
  //Fond
  rect(0,0,dimension,dimension);
  
  //Oeil
  fill(255);
  ellipse(dimension*posXO,dimension*posYO,dimension*TailleO,dimension*TailleO);
  ellipse(dimension-dimension*posXO,dimension*posYO,dimension*TailleO,dimension*TailleO);
  float r = random(0.1,0.8);
  float rp = r+0.1;
  c = color(random(0,255),random(0,255),random(0,255));
  fill(c);
  ellipse(dimension*posXO,dimension*posYO,dimension*TailleO*rp,dimension*TailleO*rp);
  ellipse(dimension-dimension*posXO,dimension*posYO,dimension*TailleO*rp,dimension*TailleO*rp);
  fill(0);
  ellipse(dimension*posXO,dimension*posYO,dimension*TailleO*r,dimension*TailleO*r);
  ellipse(dimension-dimension*posXO,dimension*posYO,dimension*TailleO*r,dimension*TailleO*r);
  
  //Bouche
  fill(255);
  stroke(0);
  int eps = int(random(0,2));
  float rx = random(0.6,1.4);
  float ry = random(0.6,1.3);
  arc(dimension*posXB,dimension*posYB,dimension*TailleB*rx,dimension*TailleB*ry,eps*PI,PI*(1+eps));//0,PI / PI,2*PI
  
  
  popMatrix();
  
}


void placement(float x,float y,float dim,int num){
  float p = random(0,1);
  if(p < 1-(num-1)/(float(LimiteRecursivite)-1) && num < LimiteRecursivite){
    placement(x,y,dim/2,num+1);
    placement(x+dim/2,y,dim/2,num+1);
    placement(x,y+dim/2,dim/2,num+1);
    placement(x+dim/2,y+dim/2,dim/2,num+1);
  }else{
    face(x,y,dim);
  }
}
