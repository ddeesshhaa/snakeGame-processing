import processing.sound.*;
Board b;
Head h;
Food f;
Body body;
int rows;
int cellSize;
int direction;
int gameSpeed;
float angle=0.1;
PImage Apple;
PImage snake;
PImage bg;
int score=0;
int hscore;
int ttl=5000;
int endTime;
int startTime;
int mode;
SoundFile eat;


void setup(){
  mode = 0 ;
  startTime=millis(); //3shan abdaa el time awel el game
  Apple = loadImage("apple.png");
  snake= loadImage("snake.png");
  bg= loadImage("bg.jpg");
  eat = new SoundFile(this, "eat.wav");

  size (600,600);
  rows = 15;
  cellSize = width / rows;
  b = new Board(rows, cellSize, width); 
  restart();
}


void draw() {
 
  clear();
   
  if(mode==0){
    image(snake,0,0,600,600);
     fill(#F0F737);
    //background(200);
    textSize(30);
    text("Press ENTER to start",130,450);
    text("Press ALT to read rules ",130,500);
  }
  if(mode==2){ //if alt is pressed
    image(bg,0,0,600,600);
    //background(50);
    textSize(50);
    fill(#F0F737);
    text(" RULES ",200,50);
    textSize(25);
    text("The rules are so simple: ",10,100);
    text("1)Use arrow keys to play ",30,150);
    text("2)Eat the apple before it changes its place ",30,200);
    text("2)Avoid hitting the walls or you lose",30,250);
    text("4)Your score decreases by 2 everytime the",30,300);
    text("snake touches its body so avoid it",60,330);
     
    textSize(35);
    fill(0);
    text("Press ENTER to start playing",65,480);

  }
  if (mode==1){ //if enter is pressed
    endTime=millis();
  if (!h.gameOver()){ //lw m5sertsh
    frameRate(gameSpeed);
    background(#272622);
    //tol ma hwa msh 5sran y3ny byl3ab so hyshow dol
    h.show(direction); //modify pos and show 
    f.show();
    b.show();
  
    if(body.touched()){
      fill(255,0,0);
      rect( 300, 300, 130, 100);
      fill(0,0,0);
      textSize(20);
      text("You Got -2",320,350);
      score-=2;
      //h.show(h.lastPos_x, h.lastPos_y);  kda 3shan el snake myzharsh fo2 el message " you got -2"
      //body.show(body.lastSnake);
      
    } else if(f.eaten()){
      startTime=millis();
      eat.play();
      score++;
      f.setPos(f.getPos());
      body.grow();  //hyzawed el body 1 cell
      body.setSpeed(); //hyzawed el speed
    }
    
  }else{  //lw 5eser
      pushMatrix();
      textSize(25);
      fill(#4BF743);
   
      
      rect( 200, 200, 200, 180);
      fill(255,0,0);
      
      text("GAME OVER",230,250);
      fill(0);
      textSize(15);
      text("To restart, press Shift.",220, 280);
      if(hscore<score)hscore=score;
      text("total Score: "+(score),220, 310);
      text("highest score."+(hscore),220, 340);
      popMatrix();

    h.show(h.lastPos_x, h.lastPos_y); //hy3redy a5er position el head wesleltlo
    //body.show(body.lastSnake);  da hy3red el body kaman
    
       
  }
  }


}


void keyPressed(){
  switch(keyCode){
    case 39: if(h.direction != 1) {   // in case right arrow is pressed
      //System.out.println(keyCode);
      direction = 0;
    }
    break;
    case 37: if (h.direction != 0){  // in case left arrow is pressed
      direction = 1;
    }
    break;
    case 40: if (h.direction != 3){  // in case down arrow is pressed
      direction = 2;
    }
    break;
    case 38: if (h.direction != 2){  // in case up arrow is pressed
      direction = 3;
    }
    break;
    case SHIFT:
      restart();
      score=0;
     break;
    case ENTER:
      mode=1;
     break;
    case ALT:
      mode=2;
     break;
     
    default:{
      System.out.println(" USE ARROWS");
    break;
     
    }
    
  }
 
}
void restart(){
  gameSpeed = 8;
  int initSnakeSize = 0;
 
  h = new Head((int)random(initSnakeSize,rows-initSnakeSize),(int)random(initSnakeSize,rows-initSnakeSize)); //definition of the snake starting point
  f = new Food();
  f.fPos = new PVector ((int)random(rows),(int)random(rows));
  f.setPos(f.fPos);
  direction = h.chooseDir();//get the most favorable direction to avoid crash at beginning;
  body = new Body (initSnakeSize);  //snake list defined: depend on head starting point

}
