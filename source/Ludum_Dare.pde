import processing.sound.*;

SoundFile music;
String musicPath = ("music/forest-lullaby.mp3");
SoundFile musicRain;
String rainPath = ("music/light-rain-ambient.mp3");

float startTimer = 7000;
float moveDelta = 0;
float deltaTime;
float currTime;
float prevTime = 0;

int score = 0;

float fps = 0;
float fpsTimer = 0;

PFont font;
Player player;
Rain rain;
PVector grid;
float timer = 90000;
boolean gameOver = false;
float gameOverTimer = 3000;
boolean endScreen = false;
float endScreenTimer = 3000;

float musicFadeOut = 0.0001;
float musicAmp = 1;

int finalScore = 0;

boolean gameInit = false;

PImage icon; 



FlyFactory flyGen;

void settings() {
  
  size(900,900,P2D);
  PJOGL.setIcon("texture/icon.png");
  
}

void setup() 
{
  
 
  
  font = createFont("font/FrogToad.otf", 72);
  textFont(font);
  windowTitle("A game about a frog");
  rectMode(CENTER);
  player = new Player();
  grid = new PVector(10,10);
  rain = new Rain();
  flyGen = new FlyFactory();
}


void draw() {
  
  currTime = millis(); 
  deltaTime = currTime - prevTime;
  prevTime = currTime;

  if(startTimer <= 0) {
 
  
  update(deltaTime);
  display();
  
  
  } else {
   
    startTimer -= deltaTime;
    
    background(0);
    fill(74,103,65);
    textSize(72);
    textAlign(CENTER);
    text("A Game about a Frog", width/2, height/2);
    
    if(startTimer <= 4000 && !gameInit) {
      gameInit = true;
      initMusic();
    }
    
  }
  
}


void update(float delta) {
  
  moveDelta = delta/60;
  
  timer -= delta;
  
  if(gameOver) {
   
      gameOverTimer -= delta;
      
      musicAmp -= musicFadeOut*delta;  
      if(musicAmp <= 0) musicAmp = 0;
      music.amp(musicAmp);
      
      if(endScreen) {
         
        endScreenTimer -= delta;
        
        if(endScreenTimer <= 0) {
           endScreenTimer = 0;          
        }
        
      }
      
      if(gameOverTimer <= 0) {
         
        endScreen = true;
        finalScore = score;
        
      }
    
  }
  
  if(timer <= 0) {
    timer = 0;
    gameOver = true;
    
  }
  
  player.update(delta);
  rain.update(delta);
  flyGen.update(delta);
  
}


void display() {
  
  background(20, 51, 20);
  textSize(50);
  
  stroke(255);
  fill(255);
  strokeWeight(1);
  
  
  //Display player first
  player.display();
  fill(220);
  textAlign(LEFT);
  int score2 = score/10;
  int digits = 1;
  while(score2 >= 10) {
    score2/=10;
    digits++;
  }
  
  text("Score: " + score, width-160 - (digits*22), 50);
  
  float timer2 = timer/1000;
  timer2 = round(timer2);
  
  text("Time: " + (int)timer2, 20, 50);
  

  
   pushMatrix();
  // Then display the rest
  translate(width/2-player.pos.x, height/2-player.pos.y);
  
  
  stroke(203,25,25,50);
  line(3000,3000,3000,7000);
  line(3000,3000,7000,3000);
  line(7000,7000,3000,7000);
  line(7000,7000,7000,3000);
  
  rain.display();
  flyGen.display();
  
  popMatrix();

  if(gameOver) {   
    
    float g = map(gameOverTimer,3000,0, 0,255);    
    fill(0,0,0,g);    
    stroke(0);
    rect(width/2, height/2,width,height); 
    
    if(endScreen) {
      g = map(endScreenTimer,3000,0, 0,255);    
      fill(74,103,65,g); 
      
      textAlign(CENTER);
      textSize(72);
      text("Final Score: " + finalScore, width/2, height/2);
          
    } 
  }
}

void initMusic() {
  
  Sound.volume(0.1);
  musicRain = new SoundFile(this,rainPath);
  music = new SoundFile(this, musicPath);
  musicRain.play();  
  music.play();


}


void keyPressed() {
  
 

 player.keyPressed(key); 
  
}

void keyReleased() {
  
 player.keyReleased(key); 
  
}
