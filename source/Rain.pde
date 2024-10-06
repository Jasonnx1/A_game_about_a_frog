public class Rain {
  
  float offSet = 1000;
  float timer = 1000;
  float currTimer = 0;
  float rainPerSecond = 10;

  
  ArrayList<RainParticle> rain = new ArrayList<RainParticle>();
  
  
  void update(float delta) {
    
    currTimer += delta;
    
    for(int i = 0; i < rainPerSecond; i++) {
      
      rain.add(new RainParticle(player.pos.x-offSet+random(width/2+(offSet*2)), player.pos.y-offSet+random(height/2+(offSet*2))));
                                  
    }
    
    for(RainParticle r : rain) {
          
           r.update(delta); 
          
    }
    
    for (int i = rain.size() - 1; i >= 0; i--) {
      RainParticle r = rain.get(i);
      if (r.deadDrop) {
        rain.remove(i);
      }
    }
  }
  
  
      
    
    void display() {
      
        for(RainParticle r : rain) {
          
           r.display(); 
          
        }
      
    }
  
  
}
