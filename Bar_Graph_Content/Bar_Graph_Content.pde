int bars = 10;
int max = 100;
int[] bar;
int[] rain;

void keyPressed(){
  if(key == 'R' || key == 'r'){
    setup();
  }
}

void setup(){
  size(800,450);
  bar = new int[bars];
  rain = new int[bars];
  
  for(int i = 0; i < bars; i++){
    bar[i] = floor(random(max)+1);
    rain[i] = 0;
  }
}

void draw(){
  
  
  for(int i = 1; i < bars; i++){
    int highR = 0;
    int highL = 0;
    for(int j = 0; j < bars; j++){
      
      if(i-j>=0){
        if(bar[i-j]>highL){
          highL = bar[i-j];
        }
      }
      
      if(i+j<bars){
        if(bar[i+j]>highR){
          highR = bar[i+j];
        }
      }
      
      rain[i] = min(highR,highL) - bar[i];
      if(rain[i]<0){
        rain[i] = 0;
      }
      
    }
  }
  
  
  
  
  background(200,200,255);
  
  rectMode(CORNER);
  
  noStroke();
  
  
  
  for(int i = 0; i < bars; i++){
    
    fill(0,100,255);
    rect(i*width/bars,height-(bar[i]+rain[i])*height/max,width/bars,height);
    
    
    
    fill(87,59,12);
    rect(i*width/bars,height-bar[i]*height/max,width/bars,height);
    
    fill(0,255,0);
    rect(i*width/bars,height-bar[i]*height/max,width/bars,bar[i]*height/max/float(50)+15);
    
    
  }
  
  
}
