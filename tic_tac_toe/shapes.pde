void drawBoard() {
  background(255, 182, 193);   //color (bubble gum)
  stroke(0);           //color of grid lines
  for (int i = 1; i < grid; i++) {        //loops though t
    line(i * cell, 0, i * cell, size);      // virtcle line
    line(0, i * cell, size, i * cell);      //horizontal line
  }
}

void drawX(int row, int col) {             //"X"
  int x1 = col * cell;            //top left corner
  int y1 = row * cell;
  int x2 = x1 + cell;             //bottom right corner
  int y2 = y1 + cell;
  line(x1, y1, x2, y2);                
  line(x1, y2, x2, y1);                
}

void drawO(int row, int col) {                 //"O"
  int x = col * cell + cell / 2;     //center sqaure
  int y = row * cell + cell / 2;
  ellipse(x, y, cell * 1.0, cell * 1.0);       //draws circle centerd in square
}
