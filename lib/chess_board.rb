class ChessBoard

  attr_accessor :board, :row_size, :col_size

  def initialize(board = nil, row_size = 8, col_size = 8)
    unless board.nil?
      @board = Array.new(board)
    end
    @board = Array.new(row_size) { Array.new(col_size) }
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
    if (row > 8 || row < 0) || (col > 8 || col < 0)
      return false
    end
    true
  end

  def build_board
    @board.each do |row|
      row.each do |col|
        @board[row][col] = '.'
      end
    end
  end

  def initialize_piece(row, col, piece)
    @board[row][col] = piece
  end

  def move(old_board, row, col, piece)
    new_board = ChessBoard.new(old_board)
    new_board[row][col] = piece
  end

end