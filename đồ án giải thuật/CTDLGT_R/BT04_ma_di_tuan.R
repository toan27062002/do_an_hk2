theKnightsTour <- function(startKnight = "a1", M=8,N=8){
  # Đặt vị trí xuất phát 
  col <- as.numeric(charToRaw(tolower(substr(startKnight,1,1)))) - 96
  row <- as.numeric(substr(startKnight,2,nchar(startKnight)))
  if(row > M | col > N){stop("Your knight is not on the chess board =/")}
  startKnight <- c(row,col)
  
  # Tạo bàn cờ trống
  chess <- matrix(0, nrow = M, ncol = N)
  # Giá trị ô hiện tại
  getValue <- function(position){chess[position[1], position[2]]}
  # Đặt giá trị
  setValue <- function(position, x){chess[position[1], position[2]] <<- x}
  
  # Các bước quân mã có thể di chuyển
  knightMoves <- cbind(c(-2,-1), c(-1,-2), c(1,-2), c(2,-1),c(2,1), c(1,2), c(-1,2), c(-2,1))
  # 1: The board has to be empty - (getboard(move) == 0)
  # 2: The move has to stay on the board
  # 1 <= move: is x and y greater than 1
  # move <= c(M,N): does the move stay within the board
  valid <- function (move) {all(1 <= move & move <= c(M, N)) && (getValue(move) == 0)}
  # Bước hợp lệ
  possibleMoves <- function (position) {
    moves <- position + knightMoves
    cbind(moves[, apply(moves, 2, valid)])
  }
  # Possible moves sorted according to their Wornsdorff cost.
  candidates <- function (position) {
    moves <- possibleMoves(position)
    # No candidate moves available; #if (ncol(moves) == 0) {}
    # Which moves has minimum number of next possible moves?
    wcosts <- apply(moves, 2, function (position) { ncol(possibleMoves(position)) })
    moves <- cbind(moves[, order(wcosts)])
    moves 
  }
  
  # Dùng đệ quy để đi hết toàn bộ bàn cờ
  knightTour = function (position, moveN) {
    # Tour Complete.
    if (moveN > (M * N)) {
      # Take the board and make it look like an actual chess board
      board <- chess
      board <- as.data.frame(board)
      sortBoard <- rev(order(as.numeric(rownames(board))))
      board <- board[sortBoard,]
      colnames(board) <- letters[1:ncol(board)]
      board <<- board; 
      print(board)
      opt <- options(show.error.messages=FALSE) 
      on.exit(options(opt))
      stop() 
    }
    # Available moves.
    moves = candidates(position) 
    # None possible. Backtrack.
    if (ncol(moves) == 0) {return()}
    # Make a move, and continue the tour.
    apply(moves, 2, function (position) {
      setValue(position, moveN)
      knightTour(position, moveN + 1)
      setValue(position, 0)
    })
  }
  setValue(startKnight, 1); knightTour(startKnight, 2)
  print("Your board has no solution using this technique.")
}

theKnightsTour("a1", 8,4)