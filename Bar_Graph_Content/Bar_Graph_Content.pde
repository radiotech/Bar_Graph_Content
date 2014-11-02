int bars = 10;
int max = 100;
int[] bar;

void keyPressed(){
  if(key == 'R' || key == 'r'){
    setup();
  }
}

void setup(){
  size(800,450);
  bar = new int[bars];
  
  for(int i = 0; i < bars; i++){
    bar[i] = floor(random(max)+1);
  }
}

void draw(){
  background(0);
  
  rectMode(CORNER);
  
  noStroke();
  
  for(int i = 0; i < bars; i++){
    fill(87,59,12);
    rect(i*width/bars+1,height-bar[i]*height/max,width/bars-2,height);
    
    fill(0,255,0);
    rect(i*width/bars+1,height-bar[i]*height/max,width/bars-2,bar[i]*height/max/float(50)+15);
    
    
  }
}
