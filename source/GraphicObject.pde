public abstract class GraphicObject {
 
  PVector pos;
  PVector acc = new PVector(0,0);
  PVector vel = new PVector(0,0);
  
  
  abstract void update(float delta);
  abstract void display();
 
  
  
  
}
