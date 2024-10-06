public class FlyFactory {
  
  ArrayList<Fly> flies = new ArrayList<Fly>();
  float offSet = 1000;
  float spawnMaxtimer = 5000;
  float spawnTimerOffset = 100;
  float spawnTimer = spawnMaxtimer + random(-spawnTimerOffset, spawnTimerOffset);
  
  FlyFactory() {
 
  }
  
  void update(float delta) {
    
    spawnTimer -= delta;
    
    if(spawnTimer <= 0 && !gameOver) {
      spawnTimer = spawnMaxtimer + random(-spawnTimerOffset, spawnTimerOffset);
      flies.add(new Fly(player.pos.x-offSet+random(width/2+(offSet*2)), player.pos.y-offSet+random(height/2+(offSet*2))));
      flies.add(new Fly(player.pos.x-offSet+random(width/2+(offSet*2)), player.pos.y-offSet+random(height/2+(offSet*2))));
    }
    
    for (int i = flies.size() - 1; i >= 0; i--) {
      Fly f = flies.get(i);
        if (f.dead) {
          flies.remove(i);
        }
      }
    
    
    for(Fly f : flies) {
       
      f.update(delta);
      
    }
    
  }
  
  void display() {
   
    for(Fly f : flies) {
     
      f.display();
      
    }
    
  }
  
}
