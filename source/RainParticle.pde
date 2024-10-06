public class RainParticle {
 
  float h = 40;
  boolean deadDrop = false;
  boolean splashedRain = false;
  PVector pos;
  float splashTimer = 300;
  float l = 10;
        color c = color(189, 189, 189,150);
  float splashIntensity = random(1,3);


  RainParticle(float x, float y) {
    
    pos = new PVector(x, y);
    
  }
  
  public void update(float delta) {
    
    if(!splashedRain) {
    
      h--; 
      if(h <= 0) {
        
        if(dist(pos.x, pos.y, player.pos.x, player.pos.y) <= 100) {
          
          deadDrop = true;
          
        } else {
          
          splashedRain = true;
               
        }   
      }  
    } else {
      
     splashTimer -= delta; 
      
      if(splashTimer <= 0) {
       deadDrop = true; 
      }
      
      if(dist(pos.x, pos.y, player.pos.x, player.pos.y) <= 100) {        
          deadDrop = true;   
     }
    }
  }
  
  public void display() {
    
    if(!splashedRain) {
      stroke(c);
      strokeWeight(2);
      
      PVector vector = new PVector(0,0);
      
      
      vector.x = (pos.x-(player.pos.x))/(width/2+(pos.x));
      vector.y = (pos.y-(player.pos.y))/(height/2+(pos.y));
      
      
      
      
      line(pos.x+vector.x*sq(h), pos.y+vector.y*sq(h),
           pos.x+vector.x*sq(h+l), pos.y+vector.y*sq(h+l));
   
    } else {
      
      if(splashTimer >= 150) {       
        noStroke();
        fill(c);
        ellipse(pos.x, pos.y, 3,3);  
      } else {
       noStroke();
       fill(c);
       pushMatrix();
         translate(pos.x, pos.y);
         ellipse(-splashIntensity,-splashIntensity, splashIntensity,splashIntensity);
         ellipse(splashIntensity,-splashIntensity, splashIntensity,splashIntensity);
         ellipse(0,splashIntensity, splashIntensity,splashIntensity);
       popMatrix();
        
      }

    }
  }
  
}
