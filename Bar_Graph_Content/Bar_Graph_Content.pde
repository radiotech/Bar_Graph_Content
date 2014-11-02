int bars = 10;
int max = 100;
int[] bar;
int[] realRain;
int[] rain;

void setup(){
  size(800,450);
  bar = new int[1000];
  realRain = new int[1000];
  rain = new int[1000];
  
  for(int i = 0; i < 1000; i++){
    bar[i] = floor(random(max)+1);
    realRain[i] = 0;
    rain[i] = floor(random(max/4)+1);
  }
}

void keyPressed(){
  if(key == 'R' || key == 'r'){
    setup();
  }
  
  if(key == '+'){
    if(bars < 999){
      bars++;
    }
  } else if(key == '-'){
    if(bars > 1){
      bars--;
    }
  }
}

void draw(){
  
  if(mousePressed){
    if(floor(mouseX/(width/float(bars))) >= 0 && floor(mouseX/(width/float(bars))) < 1000){
      bar[floor(mouseX/(width/float(bars)))] = min(floor((height-mouseY)/float(height)*max)+1,max);
    }
  }
  
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
      
    
      realRain[i] = min(highR,highL) - bar[i];
      if(realRain[i]<0){
        realRain[i] = 0;
      }
      
    }
  }
  
  
  
  
  background(200,200,255);
  
  rectMode(CORNER);
  
  noStroke();
  
  
  
  for(int i = 0; i < bars; i++){
    
    if(rain[i] == realRain[i]){
      fill(0,100,255);
      rect(i*width/float(bars),height-(bar[i]+realRain[i])*height/max,width/float(bars)+1,(realRain[i])*height/max+1);
    } else if(rain[i] < realRain[i]){
      fill(0,100,255);
      rect(i*width/float(bars),height-(bar[i]+rain[i])*height/max,width/float(bars)+1,(rain[i])*height/max+1);
      fill(255,100,255);
      rect(i*width/float(bars),height-(bar[i]+realRain[i])*height/max,width/float(bars)+1,(realRain[i]-rain[i])*height/max+1);
    } else if(rain[i] > realRain[i]){
      fill(0,255,200);
      rect(i*width/float(bars),height-(bar[i]+rain[i])*height/max,width/float(bars)+1,(rain[i]-realRain[i])*height/max+1);
      fill(0,100,255);
      rect(i*width/float(bars),height-(bar[i]+realRain[i])*height/max,width/float(bars)+1,(realRain[i])*height/max+1);
    }
    
    fill(87,59,12);
    rect(i*width/float(bars),height-bar[i]*height/max+(bar[i]*height/max/float(50)+5),width/float(bars)+1,height);
    
    
    fill(0,255,0);
    rect(i*width/float(bars),height-bar[i]*height/max,width/float(bars)+1,bar[i]*height/max/float(50)+5);
    
    
  }
  
  
}
