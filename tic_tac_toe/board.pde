char[][] board = new char[3][3];   //2D array
boolean gameEnded = false;            //tracks if game has ended

void keyPressed() {                 // whenever a key is pressed
  if (key >= '0' && key <= '8') {        //checks if key pressed is between 0 to 8 
    int square = key - '0';         // converts key to a square number
    if (SquareEmpty(square)) {         //checks if square is empty 
      userTurn(square);                 //if square is empty, user marks the square
      if (!checkWin()) {                // checks if user won after turn
        if (BoardFull()) {                //checks if board is full
          println("No one has won. It's a draw!");         
        } else {
          computerTurn();                      // computer take turn if game is still on
          if (!checkWin()) {                   // checks if computer won after turn
            println("Game is still in play.");         //if not game is still on
          }
        }
      }
    } else {                                             //if square taken 
      println("Square already taken. Try another.");     
    }
  } else {                                                //if right key was not pressed
    println("You did not press a number between 0-8. Game still in progress.");
  }
}

void computerTurn() {            //handles computer
  if (gameEnded) return;                  
  for (int i = 0; i < grid ; i++) {                 
    for (int j = 0; j < grid; j++) {
      if (board[i][j] == '\0') {                    //if the square is empty put "X"
        board[i][j] = 'X';                      //draw "x"
        drawX(i, j);
        return;
      }
    }
  }
}

void userTurn(int square) {             //handles user turn
  if (gameEnded) {                       //if game ends print statement
    println("The game has ended. Please restart to play again.");
    return;
  }
  int row = square / grid;                 
  int col = square % grid;
  board[row][col] = 'O';                //draw "O"
  drawO(row, col);
}

boolean  SquareEmpty(int square) {      //handles empty square
  int row = square / grid;
  int col = square % grid;
  return board[row][col] == '\0';
}

boolean BoardFull() {               //handles if board is full
  for (int i = 0; i < grid; i++) {
    for (int j = 0; j < grid; j++) {
      if (board[i][j] == '\0') {
        return false;
      }
    }
  }
  return true;
}

boolean checkWin() {
    char winner = '\0'; 
    for (int i = 0; i < grid + 2; i++) {
        switch (i) {
            case 0:
                if (board[0][0] != '\0' && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
                    winner = board[0][0]; // Main diagonal
                }
                break;
            case 1:
                if (board[0][2] != '\0' && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
                    winner = board[0][2]; // Anti-diagonal
                }
                break;
            default:
                int index = i - 2;
                if (board[index][0] != '\0' && board[index][0] == board[index][1] && board[index][1] == board[index][2]) {
                    winner = board[index][0]; // Rows
                } else if (board[0][index] != '\0' && board[0][index] == board[1][index] && board[1][index] == board[2][index]) {
                    winner = board[0][index]; // Columns
                }
                break;
        }
        if (winner != '\0') {
            println(winner + " wins!");
            gameEnded = true;
            return true;
        }
    }
    
    return false;
}
