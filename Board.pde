class Board{
  
  int rows;
  int cellSize;
  int screen;
  
  Board(int rows, int cellSize, int screen){
    this.rows = rows;
    this.cellSize = cellSize;
    this.screen = screen;
  }
  
  void show (){
    
    stroke(200); //lon el line
    for (int x = 0; x <= screen; x += cellSize){ //hyrsem el rows lhad ma ywsal le el ymax of screen
     line (x, 0, x, screen); 
    }
    for (int y = 0; y <= screen; y += cellSize){  //hyrsem el columns lhad ma ywsal le el xmax of screen
     line (0, y, screen, y); 
    }
       
  }  
   
  
  
}
