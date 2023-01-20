class Body{
  
  int size;
  ArrayList <PVector> snake;
  ArrayList<PVector> lastSnake;
  
  
  Body(int size){
    this.size = size;
    snake = new ArrayList <PVector> ();
    
    int x = 0;
    int y = 0;
    
    switch (direction) {
      case 0 : x = -1; y = 0;
      break;
      case 1 : x = 1; y = 0;
      break;
      case 2: x = 0; y = -1;
      break;
      case 3: x = 0; y = 1;
      break;
      default: System.out.println ("BUG NEEDS TO BE FIXED");
    }
    

    
    for (int i = 1; i <= size; i++){ //btrsem el body of snake awel ma ybdaa
      PVector newSnake = new PVector();
      newSnake.x = h.hPos.x +  i * x; //i=1, say h=5, 5+ 1*-1=4
      newSnake.y = h.hPos.y +  i * y;
      snake.add (newSnake);
    }
    
  }
  
  
  
  
  void show(){ //fe snake bystore el coordinates bta3et kul makan ll apple 
    int item = 0;
    lastSnake = new ArrayList<PVector>(); 

        for (PVector b : snake){
          lastSnake.add(b.copy());  //copy array elements (PVectors) to other array. one by one using copy() method to avoid rpointers
        item++;
            if (item==1){ //lw size el snake 1 cell  3'er el head
              b.x = h.lastPos.x;
              b.y = h.lastPos.y;
            }else{                 //lw el snake feh aktar mn 1 cell 3'er el head
              b.x = lastSnake.get(item-2).x; 
              b.y = lastSnake.get(item-2).y;
            }
        pushMatrix();
        PVector gucciColor = getColor(item);
        fill(gucciColor.x , gucciColor.y , gucciColor.z);
        translate(b.x*cellSize, b.y*cellSize);
        rect(0 ,0,cellSize  ,cellSize );
        popMatrix();
        }
        
        //setSpeed(item);
        this.size = item;

  }
  
  
  
  void show (ArrayList<PVector> last){   //btgeb el last position 
    int item = 0;
        for (PVector b : last){
        item++;
        pushMatrix();
        PVector gucciColor = getColor(item);
        fill(gucciColor.x , gucciColor.y , gucciColor.z);
        translate(b.x*cellSize, b.y*cellSize);
        rect(0 ,0,cellSize  ,cellSize );
        popMatrix();
        }
 
  }
  
  void grow(){
    PVector newBody = new PVector(); 
    snake.add(newBody.copy()); // this newBody <PVector> is located automatically by show() method in the next step
  }
  
  
  boolean touched (){  
    for (PVector s : lastSnake){
    if (h.hPos.x == s.x && h.hPos.y == s.y){
      return true;
    } 
    }
    return false;
  }
  
  private void setSpeed(){
        if (size == 5){
          gameSpeed += 1;
          ttl-=200;
        } else if (size == 10){
          gameSpeed += 1;
          ttl-=200;
        } else if (size == 15){
          gameSpeed += 1;
          ttl-=200;
        } else if (size == 20){
          gameSpeed += 1;
          ttl-=200;
        } else if (size == 25){
          gameSpeed += 1;
          ttl-=200;
        } else if (size == 30){
          gameSpeed += 1;
          ttl-=200;
        } else if (size == 35){
          gameSpeed += 1;
          ttl-=200;
        }
        
  }
  
  PVector getColor (int item){
    int patternSize = 10;
    int position = item % patternSize; // 1%10 = 1     2%10=2...
    PVector myColor = new PVector ();
    if (position>0 && position <=2){
      myColor.x = 143;
      myColor.y = 16;
      myColor.z = 16;
    }else if (position < patternSize && position != 5 ){
      myColor.x = 32;
      myColor.y = 64;
      myColor.z =45;
    }else {
      myColor.x = 0;
      myColor.y = 0;
      myColor.z = 0;
    }

    return myColor;
  }
    
    
    
  
}
