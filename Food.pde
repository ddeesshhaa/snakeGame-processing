class Food{
 PVector fPos;
 PVector lastPos;
    
  void setPos(PVector Pos){
    this.fPos = new PVector();
    this.fPos.x = Pos.x;
    this.fPos.y = Pos.y;
  }
  
    
    PVector getPos(){ 
      PVector getP = new PVector ((int) random (rows), (int) random (rows));
        return getP;
    }

boolean validPos(PVector newPos){ //3shan myhotesh el apple fe nafs el makan marten wara b3d

  if ((this.lastPos.x == newPos.x) && (this.lastPos.y == newPos.y)){
    System.out.println("false");
    return false;
  }else{
    System.out.println("true");
    return true;
  }
}


boolean eaten(){   //intersection of apple & snake head
  PVector head = h.hPos;

  if (this.fPos.x == head.x && this.fPos.y == head.y){
    this.lastPos = new PVector (this.fPos.x,this.fPos.y);
    return true;
  }else{
    return false;
  }
}

  
    
  
  void show(){
    pushMatrix();
    noStroke();
    translate(fPos.x*cellSize+cellSize/2, fPos.y*cellSize+cellSize/2); // say 5*40 + 40/2 , 
    Apple.resize(cellSize,cellSize);
        rotate(angle);
        imageMode(CENTER); //spin
        angle+=0.1;
        image(Apple,0,0);
    popMatrix();

    if(endTime-startTime>ttl){
      f.setPos(f.getPos());  
      startTime=millis();
    }
  }

}
