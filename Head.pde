class Head {
PVector hPos;
PVector lastPos;
 int lastPos_x;
 int lastPos_y;
 int direction;
  
 Head (int x, int y){
   hPos = new PVector (x,y);
 }
 
 void show (int direction){
   lastPos = new PVector ();   
   lastPos = hPos.copy();
   this.direction = direction;
   
   body.show();
   switch(direction){
     case 0: hPos.x++;
     break;
     case 1: hPos.x--;
     break;
     case 2: hPos.y++;
     break;
     case 3: hPos.y--;
     break;
     default: System.out.println ("BUG AT HEAD");
     break;
   }
    
    pushMatrix(); //byrsem el head lma bymove
    fill(180);
    translate(hPos.x*cellSize, hPos.y*cellSize);
    rect(0 ,0,cellSize  ,cellSize ); // rect(0 + hPos.x*cellSize, 0 + hPos.y*cellSize,cellSize,cellSize)
    popMatrix();

 }
 

 void show (int x, int y){
    pushMatrix(); 
    fill(#4318B9);
    translate(x*cellSize, y*cellSize);
    rect(0 ,0,cellSize  ,cellSize );
    popMatrix();
 }
  
  
  
  boolean gameOver(){
    if ((this.hPos.x< 0 || this.hPos.x >= rows) || (this.hPos.y < 0 || this.hPos.y >= rows)){
      if (this.hPos.x < 0){
       this.lastPos_y = (int)this.hPos.y;
       this.lastPos_x = (int)this.hPos.x +1;
      }else if (this.hPos.x >= rows){
        
        this.lastPos_y = (int) this.hPos.y;
        this.lastPos_x = (int) this.hPos.x -  1;
      }
      
      if (this.hPos.y < 0){
       this.lastPos_x = (int)this.hPos.x;
       this.lastPos_y = (int)this.hPos.y +1;
      }else if (this.hPos.y >= rows){
        this.lastPos_x = (int) this.hPos.x;
        this.lastPos_y = (int) this.hPos.y -  1;
      }
      
      return true;
    }else{
      return false;
    }
  }
  
  int chooseDir (){
    int xL;
    int xU;
    int yL;
    int yU;
    
    xL = (int)this.hPos.x;
    xU = rows - (int)this.hPos.x;
    yL = (int)this.hPos.y;
    yU = rows - (int)this.hPos.y;
    
    int lower;
    int dir;
    //awel ma ybdaa hy5leh ybdaa fe makan b3ed 3n el border 
    lower = xL;
    dir = 0;
    if (lower > xU){
      lower = xU;
      dir = 1;
    }
    if (lower > yL){
      lower = yL;
      dir = 2;
    }
    if (lower > yU){
      lower = yU;
      dir = 3;
    }
    
    return dir;
  } 
}
