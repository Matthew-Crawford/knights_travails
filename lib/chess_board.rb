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
    if (row > 7 || row < 0) || (col > 7 || col < 0)
      return false
    end
    true
  end

  def build_board
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        @board[row_index][col_index] = '.'
      end
    end
  end

  def build_finished_board(moves, piece)
    moves.each_with_index do |move, index|
      s = "#{piece}#{index.to_s}"
      @board[move.row][move.col] = s
    end
  end

  def initialize_piece(row, col, piece)
    @board[row][col] = piece
  end

  def move(old_board, row, col, piece)
    new_board = ChessBoard.new(old_board)
    new_board.board[row][col] = piece
    new_board
  end
end