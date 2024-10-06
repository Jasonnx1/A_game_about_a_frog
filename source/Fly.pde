public class Fly extends GraphicObject {
  
  float speed;
  
  float flashMaxTimer = 5000;
  float flashRandomOffset = 1000;
  float flashTimer = flashMaxTimer + random(-flashRandomOffset,flashRandomOffset);
  float flashDuration = 500;
  float size = 10;
  
  PVector caughtOffset = new PVector(0,0);
  
  boolean caught = false;
  boolean dead = false;
  
  boolean flashing = false;
  
  
  Fly(float x, float y) {
    pos = new PVector(x, y);
    speed = random(5,7);
  }
  
  void update(float delta) {
    
    flashTimer -= delta;
    
    if(flashTimer <= 0) {
        
      flashTimer = flashMaxTimer + random(-flashRandomOffset,flashRandomOffset);
      flashing = true;
      
    }
    
    if(flashing) {
     
      flashDuration -= delta;
      
      if(flashDuration <= 0) {
         flashDuration = 255;
         flashing = false;    
      }
      
    }
    if(!caught) {
      vel.x = randomGaussian();
      vel.y = randomGaussian();
      
      vel.normalize();
      vel.mult(moveDelta*speed);
      
      pos.add(vel);
      vel.mult(0);
    } else {
      
      
      pos = PVector.sub(player.tonguePosition1, caughtOffset);  
       
      if(player.tongueLength <= 10) {
         
        dead = true;
        
      }
      
    }
    
    
    
    
    

    
  }
  
  void display() {
    
    noStroke();
    if(flashing) {
      fill(255,142,21,20);
      ellipse(pos.x, pos.y, size*2, size*2);
    }
    
    fill(0);
    ellipse(pos.x, pos.y, size,size);
    if(flashing){
      fill(255,142,21, 500-flashDuration);
      ellipse(pos.x, pos.y, size,size);
    }
    
  }
  
}
