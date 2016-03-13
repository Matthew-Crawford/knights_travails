class ChessBoard

  attr_accessor :board, :row_size, :col_size

  def initialize(board = nil, row_size = 8, col_size = 8)
    if !board.nil?
      @board = Array.new(board.board)
    else
      @board = Array.new(row_size) { Array.new(col_size) }
    end
    @row_size = row_size
    @col_size = col_size
  end

  # checks if the specified cell is occupied
  def occupied?(row, col)
    if @board[row][col] == nil
      return false
    end
    true
  end

  #checks if the specified cell is within the board
  def validate_cell(row, col)
    if row > row_size - 1 || row < 0 || col > col_size - 1 || col < 0
      return false
    end
    true
  end

  # builds board with empty cells, a "." repesents an empty cell
  def build_board
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        @board[row_index][col_index] = '. '
      end
    end
  end

  # builds the finished board with chess pieces
  def build_finished_board(moves, piece)
    moves.each_with_index do |move, index|
      chess_piece_move_number = "#{piece}#{index.to_s}"
      @board[move.row][move.col] = chess_piece_move_number
    end
  end

  # places a piece on the board
  def put_piece(row, col, piece)
    @board[row][col] = piece
  end

  # returns a new board with the configuration of the old board with the new piece placed
  def move(old_board, row, col, piece)
    new_board = ChessBoard.new(old_board, old_board.row_size, old_board.col_size)
    new_board.board[row][col] = piece
    new_board
  end
end