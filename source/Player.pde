public class Player extends GraphicObject {
  color frogColor = color(76, 120, 29);
  //---
  float angle = 0;
  float angleIncrement = PI/128;
  float speed = 10;
  //---
  float size = 80; // don't touch, code isn't generic :$
  //---
  float distRightLeg = 0;
  float distLeftLeg = 0;
  float distRightArm = 0;
  float distLeftArm = 0;
  //---
  float randomOffsetX = 0;
  float randomOffsetY = 9;
  //---
  float legLimit = 60;
  float armLimit = 60;
  //---
  boolean jumping = false;
  float jumpingMaxTimer = 200;
  float jumpingTimer = jumpingMaxTimer;
  float jumpingSpeed = 30;
  float jumpingCooldown = 0;
  float jumpingMaxCooldown = 200;
  boolean jumpingUp = true;
  //---
  float blinkTimer = 3000;
  float blinkLidTimer = 25;
  float jumpScale = 1;
  float jumpScaleMaxTimer = jumpingMaxTimer/10;
  float jumpScaleTimer = jumpScaleMaxTimer;
  float jumpScaleIncrement = 0.02;
  //---
  float rightBlinkTimer = -2; // -2 to 10
  float leftBlinkTimer = -2; // -2 to 10
  boolean blinking = false;
  boolean blinkRight = false;
  boolean blinkRightDown = true;
  boolean blinkLeft = false;
  boolean blinkLeftDown = true;
  float blinkIncrement = HALF_PI/10;
  //---
  PVector leftAnkleOffset = new PVector(-50,-40);
  PVector leftFootOffset = new PVector(-20,-50);
  PVector rightAnkleOffset = new PVector(-50,40);
  PVector rightFootOffset = new PVector(-20,50); 
  PVector leftElbowOffset = new PVector(25,-70);
  PVector leftHandOffset = new PVector(50,-50);
  PVector rightElbowOffset = new PVector(25,70); 
  PVector rightHandOffset = new PVector(50,50); 
  //---
  PVector rightToe1Offset = new PVector(25,7);
  PVector rightToe2Offset = new PVector(30, 0);
  PVector rightToe3Offset = new PVector(25, -7);
  //---
  PVector leftToe1Offset = new PVector(22, 7);
  PVector leftToe2Offset = new PVector(30, 0);
  PVector leftToe3Offset = new PVector(22, -7);
  //---
  PVector rightFinger1Offset = new PVector(14, 7);
  PVector rightFinger2Offset = new PVector(20, 0);
  PVector rightFinger3Offset = new PVector(14, -7);
  //---
  PVector leftFinger1Offset = new PVector(14, 7);
  PVector leftFinger2Offset = new PVector(20, 0);
  PVector leftFinger3Offset = new PVector(14, -7);
  //Back Feet
  PVector leftAnkle = new PVector(0,0);
  PVector leftFoot = new PVector(0,0); 
  PVector leftToe1 = new PVector(0,0);
  PVector leftToe2 = new PVector(0,0);
  PVector leftToe3 = new PVector(0,0);
  //---
  PVector rightAnkle = new PVector(0,0); 
  PVector rightFoot = new PVector(0,0);
  PVector rightToe1 = new PVector(0,0);
  PVector rightToe2 = new PVector(0,0);
  PVector rightToe3 = new PVector(0,0);
  // ------
  //Front Feet
  PVector leftElbow = new PVector(0,0);
  PVector leftHand = new PVector(0,0);
  PVector leftFinger1 = new PVector(0,0);
  PVector leftFinger2 = new PVector(0,0);
  PVector leftFinger3 = new PVector(0,0);
  //---
  PVector rightElbow = new PVector(0,0); 
  PVector rightHand = new PVector(0,0);
  PVector rightFinger1 = new PVector(0,0);
  PVector rightFinger2 = new PVector(0,0);
  PVector rightFinger3 = new PVector(0,0);
  // ------
  boolean keyRightPressed = false;
  boolean keyLeftPressed = false;
  boolean keyDownPressed = false;
  boolean keyUpPressed = false;
  boolean keySpacePressed = false;
  //-------
  boolean tongue = false;
  boolean tongueGoing = true;
  float tongueLength = 0;
  float tongueSpeed = 0;
  float tongueMaxTimer = 300;
  float tongueTimer = tongueMaxTimer;
  boolean tongueHold;
  boolean tongueHoldUp;
  float tongueMaxSpeed = 70;
  float tongueBaseSpeed = 5;
  float tongueAbsoluteMaxSpeed = tongueMaxSpeed + tongueBaseSpeed;
  float backLength = 114;
  float caughtScore = 0;
  //-------
  boolean caught = false;
  PVector tonguePosition1 = new PVector(0,0);

  
  protected Player() {
    
  pos = new PVector(5000,5000);
    
  //Back Feet
  leftAnkle = PVector.add(leftAnkleOffset, pos);
  leftFoot = PVector.add(leftFootOffset, pos);
  //---
  rightAnkle = PVector.add(rightAnkleOffset, pos);
  rightFoot = PVector.add(rightFootOffset, pos);
  //---
  //Front Feet
  leftElbow = PVector.add(leftElbowOffset, pos);
  leftHand = PVector.add(leftHandOffset, pos);
  //---
  rightElbow = PVector.add(rightElbowOffset, pos);
  rightHand = PVector.add(rightHandOffset, pos);
  //---
  //Toes/Fingers
  rightToe1 = PVector.add(rightToe1Offset, rightFoot);
  rightToe2 = PVector.add(rightToe2Offset, rightFoot);
  rightToe3 = PVector.add(rightToe3Offset, rightFoot);
  //---
  leftToe1 = PVector.add(leftToe1Offset, leftFoot);
  leftToe2 = PVector.add(leftToe2Offset, leftFoot);
  leftToe3 = PVector.add(leftToe3Offset, leftFoot);
  //---
  rightFinger1 = PVector.add(rightFinger1Offset, rightHand);
  rightFinger2 = PVector.add(rightFinger2Offset, rightHand);
  rightFinger3 = PVector.add(rightFinger3Offset, rightHand);
  //---
  leftFinger1 = PVector.add(leftFinger1Offset, leftHand);
  leftFinger2 = PVector.add(leftFinger2Offset, leftHand);
  leftFinger3 = PVector.add(leftFinger3Offset, leftHand);
  //--- 
  }
  
  void update(float delta) {
    
    if(pos.x - vel.x <= 3000) {
      
       pos.x = 3200;        
       vel.x *= 0; 

    }
    
    if(pos.x + vel.x >= 7000) {
      
      pos.x = 6800;        
      vel.x *= 0; 
      
    }
    
    if(pos.y - vel.y <= 3000) {
      pos.y = 3200; 
      vel.y *= 0; 
      
    }
    
    if(pos.y + vel.y >= 7000) {
     
       pos.y = 6800;
       vel.y *= 0; 
    }
    
    if(!jumping) {
      
      if(!blinking) {
        blinkTimer -= delta;
      }
      
      if(blinkTimer <= 0) {
        blinkTimer = random(8000, 15000);
        blinking = true;   
        blinkRight = true;
      } 
      
      
      if(blinking) {
        blinkLidTimer -= delta; 
      }
      
      if(blinkLidTimer <= 0 && blinking) {
         blinkLidTimer = 25; 
         
         if(blinkRight) {
            
            if(blinkRightDown) {
                rightBlinkTimer++; 
                
                if(!blinkLeft && rightBlinkTimer >= 8){
                   blinkLeft = true; 
                }
                
                if(rightBlinkTimer >= 10) {
                   rightBlinkTimer = 10;
                   blinkRightDown = false;
                }
                
            } else {
               rightBlinkTimer--;  
               
               if(rightBlinkTimer <= -2) {
                   blinkRightDown = true;
                   blinkRight = false;
               }
            }       
         }
         
         
         if(blinkLeft) {
           
           if(blinkLeftDown) {
             leftBlinkTimer++;
             
             if(leftBlinkTimer >= 10) {
               leftBlinkTimer = 10;
               blinkLeftDown = false;
             }
             
           } else {
             leftBlinkTimer--;
             if(leftBlinkTimer <= -2) {
                   blinkLeftDown = true;
                   blinkLeft = false;
               }
             
           }         
         }    
         
         if(!blinkLeft && !blinkRight) {
             blinking = false;
         }
         
      }
    }
    
    float distLeftFootBody = dist(pos.x, pos.y, leftFoot.x, leftFoot.y);
    float distRightFootBody = dist(pos.x, pos.y, rightFoot.x, rightFoot.y);
    float distLeftHandBody = dist(pos.x, pos.y, leftHand.x, leftHand.y);
    float distRightHandBody = dist(pos.x, pos.y, rightHand.x, rightHand.y);
    
      
    if(!jumping) {
      //Update Leg
      

      if(distLeftLeg > legLimit || distLeftFootBody < size/2) {      
     
        PVector leftLegFootPrime = new PVector(0,0);
          
        leftLegFootPrime.x = leftFootOffset.x * cos(angle) - leftFootOffset.y * sin(angle);          
        leftLegFootPrime.y = leftFootOffset.y * cos(angle) + leftFootOffset.x * sin(angle);
        
        leftLegFootPrime.x += random(-0,randomOffsetX);
        leftLegFootPrime.y += random(-randomOffsetY,randomOffsetY);

        leftFoot = PVector.add(leftLegFootPrime, pos);

      }
      
      if(distRightLeg > legLimit || distRightFootBody< size/2) {
        
        PVector rightLegFootPrime = new PVector(0,0);
          
        rightLegFootPrime.x = rightFootOffset.x * cos(angle) - rightFootOffset.y * sin(angle);          
        rightLegFootPrime.y = rightFootOffset.y * cos(angle) + rightFootOffset.x * sin(angle);
        
        rightLegFootPrime.x += random(-0,randomOffsetX);
        rightLegFootPrime.y += random(-randomOffsetY,randomOffsetY);

        rightFoot = PVector.add(rightLegFootPrime, pos);

      }
      
      if(distLeftLeg > legLimit || distLeftFootBody< size/2) {
        
        PVector leftLegAnklePrime = new PVector(0,0);
          
        leftLegAnklePrime.x = leftAnkleOffset.x * cos(angle) - leftAnkleOffset.y * sin(angle);          
        leftLegAnklePrime.y = leftAnkleOffset.y * cos(angle) + leftAnkleOffset.x * sin(angle);
        
        leftLegAnklePrime.x += random(-0,randomOffsetX);
        leftLegAnklePrime.y += random(-randomOffsetY,randomOffsetY);

        leftAnkle = PVector.add(leftLegAnklePrime, pos);

        
      }
      
      if(distRightLeg > legLimit || distRightFootBody < size/2) {
        
        PVector rightLegAnklePrime = new PVector(0,0);
          
        rightLegAnklePrime.x = rightAnkleOffset.x * cos(angle) - rightAnkleOffset.y * sin(angle);          
        rightLegAnklePrime.y = rightAnkleOffset.y * cos(angle) + rightAnkleOffset.x * sin(angle);
        
        rightLegAnklePrime.x += random(-0,randomOffsetX);
        rightLegAnklePrime.y += random(-randomOffsetY,randomOffsetY);

        rightAnkle = PVector.add(rightLegAnklePrime, pos);
   
      }
      
    }
      
      if(distLeftArm > armLimit || distLeftHandBody < size/2) {      
     
        PVector leftArmHandPrime = new PVector(0,0);
          
        leftArmHandPrime.x = leftHandOffset.x * cos(angle) - leftHandOffset.y * sin(angle);          
        leftArmHandPrime.y = leftHandOffset.y * cos(angle) + leftHandOffset.x * sin(angle);
        
        leftArmHandPrime.x += random(-0,randomOffsetX);
        leftArmHandPrime.y += random(-randomOffsetY,randomOffsetY);

        leftHand = PVector.add(leftArmHandPrime, pos);

      }
      
      if(distRightArm > armLimit || distRightHandBody < size/2) {
        
        PVector rightArmHandPrime = new PVector(0,0);
          
        rightArmHandPrime.x = rightHandOffset.x * cos(angle) - rightHandOffset.y * sin(angle);          
        rightArmHandPrime.y = rightHandOffset.y * cos(angle) + rightHandOffset.x * sin(angle);
        
        rightArmHandPrime.x += random(-0,randomOffsetX);
        rightArmHandPrime.y += random(-randomOffsetY,randomOffsetY);

        rightHand = PVector.add(rightArmHandPrime, pos);

      }
      
      if(distLeftArm > armLimit || distLeftHandBody < size/2) {
        
        PVector leftArmElbowPrime = new PVector(0,0);
          
        leftArmElbowPrime.x = leftElbowOffset.x * cos(angle) - leftElbowOffset.y * sin(angle);          
        leftArmElbowPrime.y = leftElbowOffset.y * cos(angle) + leftElbowOffset.x * sin(angle);

        leftArmElbowPrime.x += random(-0,randomOffsetX);
        leftArmElbowPrime.y += random(-randomOffsetY,randomOffsetY);
          
        leftElbow = PVector.add(leftArmElbowPrime, pos);
      
      }
      
      if(distRightArm > armLimit || distRightHandBody < size/2) {
        
        PVector rightArmElbowPrime = new PVector(0,0);
          
        rightArmElbowPrime.x = rightElbowOffset.x * cos(angle) - rightElbowOffset.y * sin(angle);          
        rightArmElbowPrime.y = rightElbowOffset.y * cos(angle) + rightElbowOffset.x * sin(angle);
        
        rightArmElbowPrime.x += random(-0,randomOffsetX);
        rightArmElbowPrime.y += random(-randomOffsetY,randomOffsetY);

        rightElbow = PVector.add(rightArmElbowPrime, pos);
   
      }
      

//Update them TOES :)  
     
//-------------------------------------------------------   
    if(distRightLeg > legLimit || distRightFootBody < size/2) { 
      
      PVector rightToe1Prime = new PVector(0,0);
      PVector rightToe2Prime = new PVector(0,0);
      PVector rightToe3Prime = new PVector(0,0);    
     
      rightToe1Prime.x = rightToe1Offset.x * cos(angle) - rightToe1Offset.y * sin(angle); 
      rightToe1Prime.y = rightToe1Offset.y * cos(angle) + rightToe1Offset.x * sin(angle); 
      
      rightToe2Prime.x = rightToe2Offset.x * cos(angle) - rightToe2Offset.y * sin(angle); 
      rightToe2Prime.y = rightToe2Offset.y * cos(angle) + rightToe2Offset.x * sin(angle); 
      
      rightToe3Prime.x = rightToe3Offset.x * cos(angle) - rightToe3Offset.y * sin(angle); 
      rightToe3Prime.y = rightToe3Offset.y * cos(angle) + rightToe3Offset.x * sin(angle); 
      
      rightToe1 = PVector.add(rightToe1Prime, rightFoot);
      rightToe2 = PVector.add(rightToe2Prime, rightFoot);
      rightToe3 = PVector.add(rightToe3Prime, rightFoot);
      
    }
//-------------------------------------------------------   
      
//------------
    if(distLeftLeg > legLimit || distLeftFootBody < size/2) { 
      
      PVector leftToe1Prime = new PVector(0,0);
      PVector leftToe2Prime = new PVector(0,0);
      PVector leftToe3Prime = new PVector(0,0);    
     
      leftToe1Prime.x = leftToe1Offset.x * cos(angle) - leftToe1Offset.y * sin(angle); 
      leftToe1Prime.y = leftToe1Offset.y * cos(angle) + leftToe1Offset.x * sin(angle); 
      
      leftToe2Prime.x = leftToe2Offset.x * cos(angle) - leftToe2Offset.y * sin(angle); 
      leftToe2Prime.y = leftToe2Offset.y * cos(angle) + leftToe2Offset.x * sin(angle); 
      
      leftToe3Prime.x = leftToe3Offset.x * cos(angle) - leftToe3Offset.y * sin(angle); 
      leftToe3Prime.y = leftToe3Offset.y * cos(angle) + leftToe3Offset.x * sin(angle); 
      
      leftToe1 = PVector.add(leftToe1Prime, leftFoot);
      leftToe2 = PVector.add(leftToe2Prime, leftFoot);
      leftToe3 = PVector.add(leftToe3Prime, leftFoot);
      
    }
//------------         
    if(distRightArm > armLimit || distRightHandBody < size/2) { 
      
      PVector rightFinger1Prime = new PVector(0,0);
      PVector rightFinger2Prime = new PVector(0,0);
      PVector rightFinger3Prime = new PVector(0,0);    
     
      rightFinger1Prime.x = rightFinger1Offset.x * cos(angle) - rightFinger1Offset.y * sin(angle); 
      rightFinger1Prime.y = rightFinger1Offset.y * cos(angle) + rightFinger1Offset.x * sin(angle); 
      
      rightFinger2Prime.x = rightFinger2Offset.x * cos(angle) - rightFinger2Offset.y * sin(angle); 
      rightFinger2Prime.y = rightFinger2Offset.y * cos(angle) + rightFinger2Offset.x * sin(angle); 
      
      rightFinger3Prime.x = rightFinger3Offset.x * cos(angle) - rightFinger3Offset.y * sin(angle); 
      rightFinger3Prime.y = rightFinger3Offset.y * cos(angle) + rightFinger3Offset.x * sin(angle); 
      
      rightFinger1 = PVector.add(rightFinger1Prime, rightHand);
      rightFinger2 = PVector.add(rightFinger2Prime, rightHand);
      rightFinger3 = PVector.add(rightFinger3Prime, rightHand);    
    }
//------------    
    if(distLeftArm > armLimit || distLeftHandBody < size/2) { 
      
      PVector leftFinger1Prime = new PVector(0,0);
      PVector leftFinger2Prime = new PVector(0,0);
      PVector leftFinger3Prime = new PVector(0,0);    
     
      leftFinger1Prime.x = leftFinger1Offset.x * cos(angle) - leftFinger1Offset.y * sin(angle); 
      leftFinger1Prime.y = leftFinger1Offset.y * cos(angle) + leftFinger1Offset.x * sin(angle); 
      
      leftFinger2Prime.x = leftFinger2Offset.x * cos(angle) - leftFinger2Offset.y * sin(angle); 
      leftFinger2Prime.y = leftFinger2Offset.y * cos(angle) + leftFinger2Offset.x * sin(angle); 
      
      leftFinger3Prime.x = leftFinger3Offset.x * cos(angle) - leftFinger3Offset.y * sin(angle); 
      leftFinger3Prime.y = leftFinger3Offset.y * cos(angle) + leftFinger3Offset.x * sin(angle); 
      
      leftFinger1 = PVector.add(leftFinger1Prime, leftHand);
      leftFinger2 = PVector.add(leftFinger2Prime, leftHand);
      leftFinger3 = PVector.add(leftFinger3Prime, leftHand);   
    }
//------------    
  if(!jumping) {
    if(keyRightPressed) {
      if(!tongueHold && !tongue) {
        angle += angleIncrement;
      }
    }
    
    if(keyLeftPressed) {
      if(!tongueHold && !tongue) {
        angle -= angleIncrement;
      }
    }
    
    
    if(keyUpPressed) {
      if(jumpingCooldown == 0 && !tongue && !tongueHold) {
        jumping = true;
      }
    }
    
    if(keySpacePressed) {
       if(tongueHold) {
         
         
         if(tongueHoldUp) {
           tongueSpeed += moveDelta*4; 
         } else {
          tongueSpeed -= moveDelta*4; 
         }
         
         if(tongueSpeed >= tongueMaxSpeed) {
           tongueHoldUp = false;
         }    
         
         if(tongueSpeed <= 1 && !tongueHoldUp) {
           tongueSpeed = 1;
           tongueHoldUp = true;
         }
         
       }
    }   
}
    
    if(jumping) {
       vel.x += jumpingSpeed*moveDelta; 
       rightBlinkTimer = 10;
       leftBlinkTimer = 10;
       
       jumpScaleTimer -= delta;
       
       if(jumpScaleTimer <= 0) {
           
         if(jumpingUp) {
           
          jumpScale+=jumpScaleIncrement; 
          
          
          jumpScale *= 100;
          jumpScale = round(jumpScale);
          jumpScale /= 100;
          if(jumpScale == (1 + (jumpScaleIncrement*5))) {
            jumpingUp = false;        
          }
          
         } else {
           if(jumpScale > 1) {             
             jumpScale-=jumpScaleIncrement; 
           }  
         }
         
         jumpScaleTimer = jumpScaleMaxTimer;
         
       }
       
       jumpingTimer -= delta;
       
       if(jumpingTimer <= 0) {
         jumpingTimer = jumpingMaxTimer;
         jumping = false;
         jumpingCooldown = jumpingMaxCooldown;
         rightBlinkTimer = -2;
         leftBlinkTimer = -2;
         blinking = false;
         blinkRight = false;
         blinkRightDown = true;
         blinkLeft = false;
         blinkLeftDown = true;
         jumpScale = 1;
         jumpingUp = true;
         jumpScaleTimer = jumpScaleMaxTimer;
         
       }
       
    }
    
    
    if(!jumping && jumpingCooldown != 0) {
       jumpingCooldown -= delta; 
       
       if(jumpingCooldown < 0) {
          jumpingCooldown = 0; 
       }
    
    }

    if(tongue) {
      
      if(tongueGoing) {
        tongueTimer -= delta;
        tongueLength += tongueSpeed*moveDelta;
      }
      
   
      if(tongueTimer <= 0) {
        tongueGoing = false;   
        tongueTimer = tongueMaxTimer;
      }
      
      if(!tongueGoing) {
       tongueLength -= tongueSpeed*moveDelta;
       
       if(tongueLength <= 0) {
          tongue = false;
          tongueGoing = true;
          tongueSpeed = 0;
          tongueTimer = tongueMaxTimer;
          
          if(caught) {          
            caught = false; 
            score += caughtScore;
            caughtScore = 0;
            
            print(caught);
          }
       }
      }
      

        
        tonguePosition1.x = (80+tongueLength-10) * cos(angle) - 0 * sin(angle);          
        tonguePosition1.y = 0 * cos(angle) + (80+tongueLength - 10) * sin(angle);
        
        tonguePosition1.add(pos);

        for(Fly f : flyGen.flies) {
      
            float dist1 = dist(f.pos.x, f.pos.y, tonguePosition1.x, tonguePosition1.y);

            if( dist1 <= 21 ) {
              
              if(!caught && !f.dead && !f.caught) {
                f.caught = true;
                f.caughtOffset.x = tonguePosition1.x - f.pos.x;
                f.caughtOffset.y = tonguePosition1.y - f.pos.y;
                tongueGoing = false;
                caught = true;
                caughtScore = tongueLength;
              }             
            }         
        }            
    }
    
    vel.rotate(angle);
   
    
    pos.add(vel);
    vel.mult(0);    
  }
  
  void display() {
    
    strokeWeight(3);
    stroke(0);
    
    
    fill(frogColor);
       
    ///Begin FROG
  
    pushMatrix();
    translate(width/2-player.pos.x, height/2-player.pos.y);
      

    ///LEGS///
    stroke(0);
    
    //Back legs
       // ANKLES
        strokeWeight(2);
        ellipse(leftAnkle.x,leftAnkle.y,17,17);
        ellipse(rightAnkle.x,rightAnkle.y,17,17);
       //
       
       
       // LEG VERTEX -35 30
        strokeWeight(10);
             
        
        PVector ankleJointRight = new PVector(-32 ,30);
        PVector ankleJointLeft = new PVector(-32 ,-30);        
        PVector ankleJointRightPrime = new PVector(0,0);
        PVector ankleJointLeftPrime = new PVector(0,0);
          
        ankleJointRightPrime.x = ankleJointRight.x * cos(angle) - ankleJointRight.y * sin(angle);          
        ankleJointRightPrime.y = ankleJointRight.y * cos(angle) + ankleJointRight.x * sin(angle);
        
        ankleJointLeftPrime.x = ankleJointLeft.x * cos(angle) - ankleJointLeft.y * sin(angle);          
        ankleJointLeftPrime.y = ankleJointLeft.y * cos(angle) + ankleJointLeft.x * sin(angle);
        
        distLeftLeg=dist(player.pos.x + ankleJointLeftPrime.x,player.pos.y + ankleJointLeftPrime.y , leftAnkle.x, leftAnkle.y);
        distRightLeg=dist(player.pos.x + ankleJointRightPrime.x,player.pos.y +ankleJointRightPrime.y, rightAnkle.x, rightAnkle.y);      
        
        stroke(frogColor);
        line(leftAnkle.x,leftAnkle.y,player.pos.x+ankleJointLeftPrime.x,player.pos.y+ankleJointLeftPrime.y);
        line(rightAnkle.x,rightAnkle.y,player.pos.x+ankleJointRightPrime.x,player.pos.y+ankleJointRightPrime.y);

        strokeWeight(6);        
        line(leftAnkle.x,leftAnkle.y,leftFoot.x,leftFoot.y);
        line(rightAnkle.x,rightAnkle.y,rightFoot.x,rightFoot.y);

        strokeWeight(2);
        line(leftFoot.x, leftFoot.y, leftToe1.x, leftToe1.y);
        line(leftFoot.x, leftFoot.y, leftToe2.x, leftToe2.y);
        line(leftFoot.x, leftFoot.y, leftToe3.x, leftToe3.y);
        
        line(rightFoot.x, rightFoot.y, rightToe1.x, rightToe1.y);
        line(rightFoot.x, rightFoot.y, rightToe2.x, rightToe2.y);
        line(rightFoot.x, rightFoot.y, rightToe3.x, rightToe3.y);       
       //
       stroke(0);
       // FEET
       ellipse(leftFoot.x,leftFoot.y,12,12);
       ellipse(rightFoot.x,rightFoot.y,12,12);
       //
       
       // TOES
        fill(#FFA40F);
        ellipse(leftToe1.x, leftToe1.y, 5,5);
        ellipse(leftToe2.x, leftToe2.y, 6,6);
        ellipse(leftToe3.x, leftToe3.y, 5,5);
        
        ellipse(rightToe1.x, rightToe1.y, 5,5);
        ellipse(rightToe2.x, rightToe2.y, 6,6);
        ellipse(rightToe3.x, rightToe3.y, 5,5);   
       //
   
    //Front legs
        // ELBOWS
        fill(frogColor);
        stroke(0);
        ellipse(leftElbow.x,leftElbow.y,12,12);
        ellipse(rightElbow.x,rightElbow.y,12,12);
        //
        
        // ARM VERTEX   
        strokeWeight(4);
        stroke(frogColor);
        line(leftElbow.x,leftElbow.y,leftHand.x,leftHand.y);    
        line(rightElbow.x,rightElbow.y,rightHand.x,rightHand.y);
                  
        PVector elbowJointRight = new PVector(15 ,39);
        PVector elbowJointLeft = new PVector(15 ,-39);        
        PVector elbowJointRightPrime = new PVector(0,0);
        PVector elbowJointLeftPrime = new PVector(0,0);
        
       
        elbowJointRightPrime.x = elbowJointRight.x * cos(angle) - elbowJointRight.y * sin(angle);          
        elbowJointRightPrime.y = elbowJointRight.y * cos(angle) + elbowJointRight.x * sin(angle);
        
        elbowJointLeftPrime.x = elbowJointLeft.x * cos(angle) - elbowJointLeft.y * sin(angle);          
        elbowJointLeftPrime.y = elbowJointLeft.y * cos(angle) + elbowJointLeft.x * sin(angle);
        
        
        distLeftArm=dist(player.pos.x + elbowJointLeftPrime.x,player.pos.y + elbowJointLeftPrime.y , leftElbow.x, leftElbow.y);
        distRightArm=dist(player.pos.x + elbowJointRightPrime.x,player.pos.y +elbowJointRightPrime.y, rightElbow.x, rightElbow.y);
        
        strokeWeight(7);
        
        line(leftElbow.x, leftElbow.y,player.pos.x + elbowJointLeftPrime.x,player.pos.y + elbowJointLeftPrime.y);
        line(rightElbow.x, rightElbow.y,player.pos.x + elbowJointRightPrime.x,player.pos.y +elbowJointRightPrime.y);
        
  
        strokeWeight(2);
        
        line(leftHand.x, leftHand.y, leftFinger1.x, leftFinger1.y);
        line(leftHand.x, leftHand.y, leftFinger2.x, leftFinger2.y);
        line(leftHand.x, leftHand.y, leftFinger3.x, leftFinger3.y);
        
        line(rightHand.x, rightHand.y, rightFinger1.x, rightFinger1.y);
        line(rightHand.x, rightHand.y, rightFinger2.x, rightFinger2.y);
        line(rightHand.x, rightHand.y, rightFinger3.x, rightFinger3.y);

        //
        
        // HANDS
        stroke(0);
        ellipse(leftHand.x,leftHand.y,10,10);
        ellipse(rightHand.x,rightHand.y,10,10);
        //
        
        // FINGERS
        strokeWeight(2);
        fill(#FFA40F);
        ellipse(leftFinger1.x, leftFinger1.y, 5,5);
        ellipse(leftFinger2.x, leftFinger2.y, 6,6);
        ellipse(leftFinger3.x, leftFinger3.y, 5,5);
        
        ellipse(rightFinger1.x, rightFinger1.y, 5,5);
        ellipse(rightFinger2.x, rightFinger2.y, 6,6);
        ellipse(rightFinger3.x, rightFinger3.y, 5,5);      
        //
     

    popMatrix();
    
    if(tongue) {
      pushMatrix();
        stroke(#FFB2E5);
        strokeWeight(11);
        
        translate(width/2, height/2);
        rotate(angle);
        
        line(80,0, 80+tongueLength,0);
        noStroke();
        fill(#FFB2E5);
        ellipse(80+tongueLength,0, 40,20);    
      popMatrix();
    }

    pushMatrix();
   
    translate(width/2, height/2);
    rotate(angle);
    fill(frogColor);
    scale(jumpScale);
     
    //Jump Scale
    scale(1);
    
    //---------------------------
    ///CHONKY BODY///
    strokeWeight(3);
    stroke(0);
    ellipse(0,0, 80, 80);

    fill(160, 184, 40);
    stroke(0);
    ellipse(20,20,20,20);
    ellipse(-20,-20,25,25);
    
    //---------------------------
    ///HEAD///
    fill(frogColor);
    noStroke();
    ellipse(60,0,50,35);
    
    //Eyes
    fill(#E0BB26);
    ellipse(75,15,15,15);
    ellipse(75,-15,15,15);
    
    fill(0);
    ellipse(75,15,12,6);
    ellipse(75,-15,12,6);
    
    strokeWeight(3);
    stroke(0);
    
    // Eyelid
    fill(frogColor);
    arc(75,15,15,15,HALF_PI - (leftBlinkTimer * blinkIncrement) ,PI+HALF_PI + (leftBlinkTimer * blinkIncrement),CHORD);
    arc(75,-15,15,15,HALF_PI - (rightBlinkTimer * blinkIncrement) ,PI+HALF_PI + (rightBlinkTimer * blinkIncrement),CHORD);   
    //------------------------------
    
    stroke(112, 128, 32);
    strokeWeight(10);
    line(80,0,-34,0);
    
    popMatrix();
    
    
    if(tongueHold){
      pushMatrix();
        translate(width/2, height/2);
        rotate(angle);
        
        stroke(#E0D342);
        float m = map(tongueSpeed, 0,tongueMaxSpeed, 80, -33);
        line(80,0,m,0);
      popMatrix();
    }
  }
  
  void keyPressed(char k) {
    
   k = Character.toUpperCase(k);
    
    switch(k) {

      case 'D': keyRightPressed = true;
      break;
      
      case 'A': keyLeftPressed = true;
      break;
      
      case 'S': keyDownPressed = true;
      break;
      
      case 'W': keyUpPressed = true;
      break;
      
      case ' ': keySpacePressed = true;
                if(!jumping && !tongue) {
                  tongueHold = true;
                }
                
      break;
 
    }   
  }
  
  
  void keyReleased(char k) {
    
    k = Character.toUpperCase(k);

    switch(k) {
     
      case 'D': keyRightPressed = false;
      break;
      
      case 'A': keyLeftPressed = false;
      break;
      
      case 'S': keyDownPressed = false;
      break;
      
      case 'W': keyUpPressed = false;
      break;
      
      case ' ': keySpacePressed = false;
                if(tongueHold) {
                   tongueHold = false;
                   tongue = true;
                   tongueSpeed = tongueSpeed + tongueBaseSpeed;
                }
      break;
          
    }
  }
}
