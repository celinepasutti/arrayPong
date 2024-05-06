Boolean paused = false;
Boolean onePlayer = false;
Boolean twoPlayer = false;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#898989;
ArrayList<Shape> shapes = new ArrayList<Shape>();

// ^^ SHAPES ELEMENT LIST ^^
/*
 0 = myTable,
 1 = quit
 2 = restart
 3 = rPaddle
 4 = lPaddle
 5 = myBall
 6 = rScore
 7 = lScore
 8 = fireworks
 9 = oneP 
 10 = twoP
 */

void setup() {
  //size(400, 600);
  fullScreen();
  noStroke();
  println("initiated");
  display();
  music();

  if (correctlyOriented == true) {
    PongTable myTable = new PongTable(gray, appWidth*0, appHeight*1/10, appWidth, appHeight*8/10);

    Button quit = new Button("x", int(appWidth*1/45), red, appWidth*17/20, appHeight*1/30, appWidth/10, appHeight/24);
    Button restart = new Button("NEW GAME", int(appWidth*1/60), Lgreen, appWidth*1/20, appHeight*1/30, appWidth/10, appHeight/24);
    //Button oneP = new Button("ONE PLAYER", int(appWidth*1/40), myTable.col, appWidth*1/5, appHeight*3/5, appWidth*1/5, appHeight*1/5);
    //Button twoP = new Button("TWO PLAYERS", int(appWidth*1/40), myTable.col, appWidth*3/5, appHeight*3/5, appWidth*1/5, appHeight*1/5);

    //ScoreBoard rScore = new ScoreBoard(black, appWidth*6/20, appHeight*1/30, appWidth/10, appHeight/24);
    //ScoreBoard lScore = new ScoreBoard(black, appWidth*12/20, appHeight*1/30, appWidth/10, appHeight/24);


    Ball myBall = new Ball(white, myTable.w*1/2, (myTable.y + myTable.h*1/2), myTable.w*1/35, myTable.w*1/35);
    //yourBall = new Ball(white, myTable.w*1/2, (myTable.y + myTable.h*1/2), myTable.w*1/35, myTable.w*1/35);
    myBall.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);

    Paddle rPaddle = new Paddle(white, myTable.w*1/30, (myTable.y + (myTable.h*1/3)), myBall.w*1/2, myTable.h*1/4);
    Paddle lPaddle = new Paddle(white, (myTable.w*29/30 - myBall.w*1/2), (myTable.y + (myTable.h*1/3)), myBall.w*1/2, myTable.h*1/4);

    
    //yourBall.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
    
    rPaddle.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
    lPaddle.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);


    //Fireworks fireworks = new Fireworks(0, appWidth*-1, appHeight*-1, appHeight*1/30, appWidth*1/30, 0.5);

    shapes.add(myTable); //0
    shapes.add(quit); //1
    shapes.add(restart); //2
    shapes.add(rPaddle); //3
    shapes.add(lPaddle); //4
    shapes.add(myBall); //5
    //shapes.add(rScore); //6
    //shapes.add(lScore); //7
    //shapes.add(fireworks); //8
    //shapes.add(oneP); //9
    //shapes.add(twoP); //10
  }
}

void draw() {
  background(black);
  if (correctlyOriented == false) {
    portrait();
  } else {
    /* for (int i = 0; i < shapes.size(); i++) {
     shapes.get(i).draw();
     }*/

    for ( Shape s : shapes) {
      s.draw();
    }
    
    //shapes.get(5).paddleUpdate(shapes.get(3).x, shapes.get(4).x, shapes.get(3).y, shapes.get(4).y, shapes.get(3).w, shapes.get(4).w, shapes.get(3).h, shapes.get(4).h);
  }
}

void mousePressed () {
}

void keyPressed() {
  if (key == ESC) {
    println("terminated");
  }
}