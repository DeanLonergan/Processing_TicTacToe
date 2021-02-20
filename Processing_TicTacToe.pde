import javax.swing.JOptionPane;  

Square sq;
Symbol ox;

//Array used to draw the visual board.//
Square[] squares;

//2D Array used to store the state and location of each square.//
Boolean[][] grid = new Boolean[3][3];

//boonlean value which changes depending on the players turn. Player 1 = false, Player 2 = true.//
boolean turn = false;

//boonlean values which change when a win or draw condition is met.//
boolean xWin = false;
boolean oWin = false;
boolean tie = false;


void setup() {
  //Setting the display size and drawing the toolbar//
  size(600, 700);
  background(255);
  noStroke();
  fill(150);
  rect(0, 600, width, 100);


  //The Board//
  /*Creating an array of 9 squares and using a for loop, combined with modular division, to draw a 3x3 grid.*/
  squares = new Square[9];
  for (int i=0; i<squares.length; i++) {
    squares[i] = new Square(200*(i%3), 200*(i/3), 200, 200);
  }

  //Player Names//
  /*A string array is created to store user inputs. Using a for loop to display dialog input windows to the user,
   the user is asked to enter the name of both players. If either player's name exceeds eight characters after
   the removal of unnecessary whitespaces, then only the first eight characters are displayed. If the user enters
   nothing or only whitespaces, then the name is defaulted to "Player 1/2"*/
  String[] player = new String[2];
  {
    for (int i=0; i<2; i++) {
      player[i] = JOptionPane.showInputDialog("Player Name (Max 8 characters)", ("Player ") + (i+1));
      if (player[0] == null || player[0].trim().isEmpty()) {
        player[0] = "Player 1";
      }
      if (player[1] == null || player[1].trim().isEmpty()) {
        player[1] = "Player 2";
      }
    }
    JOptionPane.showMessageDialog(null, "X goes first, O will start next game.");
  }
  fill(255);
  textSize(20);
  if (player[0].trim().length() <= 8) {
    text(player[0].trim(), 80, 630);
  } else text(player[0].trim().substring(0, 8), 100, 630);
  if (player[1].trim().length() <= 8) {
    text(player[1].trim(), 420, 630);
  } else text(player[1].trim().substring(0, 8), 440, 630);
  ox = new Symbol(100, 680, 50);
  ox.displayX();
  ox = new Symbol(440, 680, 50);
  ox.displayO();
}

void draw() {
  //The Board//
  /*Using a for loop to draw the required number of squares of the correct parameters.*/
  for (int i=0; i<squares.length; i++) {
    squares[i].display();
    squares[i].setSquareFill(255);
    squares[i].setSquareStroke(150);
    squares[i].setSquareStrokeWeight(2);
  }

  /*When a square is clicked, if the 2D array grid value for it is not null and the grid value for the square 
   is false, then an X is drawn on the square. If the grid value is true, then an O is drawn.*/
  //Square One//
  if (grid[0][0] != null) {
    if (grid[0][0] == false) {
      ox = new Symbol(55, 150, 150);
      ox.displayX();
      fill(255);
    } else if (grid[0][0] == true) {
      ox = new Symbol(45, 150, 150);
      ox.displayO();
      fill(255);
    }
  }
  //Square Two//
  if (grid[0][1] != null) {
    if (grid[0][1] == false) {
      ox = new Symbol(55, 350, 150);
      ox.displayX();
      fill(255);
    } else if (grid[0][1] == true) {
      ox = new Symbol(45, 350, 150);
      ox.displayO();
      fill(255);
    }
  }
  //Square Three//
  if (grid[0][2] != null) {
    if (grid[0][2] == false) {
      ox = new Symbol(55, 550, 150);
      ox.displayX();
      fill(255);
    } else if (grid[0][2] == true) {
      ox = new Symbol(45, 550, 150);
      ox.displayO();
      fill(255);
    }
  }
  //Square Four//
  if (grid[1][0] != null) {
    if (grid[1][0] == false) {
      ox = new Symbol(255, 150, 150);
      ox.displayX();
      fill(255);
    } else if (grid[1][0] == true) {
      ox = new Symbol(245, 150, 150);
      ox.displayO();
      fill(255);
    }
  }
  //Square Five//
  if (grid[1][1] != null) {
    if (grid[1][1] == false) {
      ox = new Symbol(255, 350, 150);
      ox.displayX();
      fill(255);
    } else if (grid[1][1] == true) {
      ox = new Symbol(245, 350, 150);
      ox.displayO();
      fill(255);
    }
  }
  //Square Six//
  if (grid[1][2] != null) {
    if (grid[1][2] == false) {
      ox = new Symbol(255, 550, 150);
      ox.displayX();
      fill(255);
    } else if (grid[1][2] == true) {
      ox = new Symbol(245, 550, 150);
      ox.displayO();
      fill(255);
    }
  }
  //Square Seven//
  if (grid[2][0] != null) {
    if (grid[2][0] == false) {
      ox = new Symbol(455, 150, 150);
      ox.displayX();
      fill(255);
    } else if (grid[2][0] == true) {
      ox = new Symbol(445, 150, 150);
      ox.displayO();
      fill(255);
    }
  }
  //Square Eight//
  if (grid[2][1] != null) {
    if (grid[2][1] == false) {
      ox = new Symbol(455, 350, 150);
      ox.displayX();
      fill(255);
    } else if (grid[2][1] == true) {
      ox = new Symbol(445, 350, 150);
      ox.displayO();
      fill(255);
    }
  }
  //Square Nine//
  if (grid[2][2] != null) {
    if (grid[2][2] == false) {
      ox = new Symbol(455, 550, 150);
      ox.displayX();
      fill(255);
    } else if (grid[2][2] == true) {
      ox = new Symbol(445, 550, 150);
      ox.displayO();
      fill(255);
    }
  }

  /*Using a for loop to determine win conditions across the vertical and horizontal squares.
   If a win condition is met, meaning three squares in a winning format in the grid are equal, 
   then a check is performed to determine if the squares contain X's or O's. 
   The winner is displayed accordingly.*/
  for (int i = 0; i < 3; i++) {
    if (grid[i][0] != null && grid[i][1] != null && grid[i][2] != null) {
      if (grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2]) {
        if (grid[i][0] == false) {
          xWin = true;
        } else { 
          oWin = true;
        }
      }
    }
    if (grid[0][i] != null && grid[1][i] != null && grid[2][i] != null) {
      if (grid[0][i] == grid[1][i] && grid[i][i] == grid[2][i]) {
        if (grid[0][i] == false) {
          xWin = true;
        } else { 
          oWin = true;
        }
      }
    }
  }

  /*Checking the win conditions across the two diagonal win cases and displaying the winner accordingly.*/
  if (grid[0][0] != null && grid[1][1] != null && grid[2][2] != null) {
    if (grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2]) {
      if (grid[0][0] == false) {
        xWin = true;
      } else { 
        oWin = true;
      }
    }
  }
  if (grid[0][2] != null && grid[1][1] != null && grid[2][0] != null) {
    if (grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0]) {
      if (grid[0][2] == false) {
        xWin = true;
      } else { 
        oWin = true;
      }
    }
  }

  /*If all squares are occupied but there isn't a winner the game is ended as a tie.*/
  if (grid[0][0] != null && grid[0][1] != null && grid[0][2] != null && grid[1][0] != null && grid[1][1] != null 
    && grid[1][2] != null && grid[2][0] != null && grid[2][1] != null && grid[2][2] != null) {
    if (xWin == false && oWin == false) {
      tie = true;
    }
  }


  /*When a win condition is met, a display appears declaring the winner, the game is then reset.*/
  if (xWin == true) {
    JOptionPane.showMessageDialog(null, "X WINS!");
  } else if (oWin == true) {
    JOptionPane.showMessageDialog(null, "O WINS!");
  } else if (tie == true) {
    JOptionPane.showMessageDialog(null, "DRAW!");
  }
  if (xWin == true || oWin == true || tie == true) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) { 
        grid[i][j] = null;
        xWin = false;
        oWin = false;
        tie = false;
      }
    }
  }
}

/*The mouse coordinates are divided by 200 (the width/height of each square) which produces a single digit value
 that corresponds to the positions of each grid on the board ([0][0] = Square One, [0][1] = Square 2, etc.)
 While the mouse is over the game board, should a square on the grid be unoccupied (null) when the left
 mouse button is clicked, either an X or an O will be drawn, depending on the truth value of 'turn'.*/
void mousePressed() {
  int x = mouseX/200; 
  int y = mouseY/200; 
  if (mouseX>0 && mouseX<600 && mouseY>0 && mouseY<600) {
    if (grid[x][y] == null) {
      if (mouseButton == LEFT) {
        if (turn == false) {
          grid[x][y] = false;
          turn = true;
        } else { 
          grid[x][y] = true;
          turn = false;
        }
      }
    }
  }
}
