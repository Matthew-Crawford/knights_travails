require_relative 'chess_board'
class KnightPiece

  attr_accessor :row, :col, :piece, :config

  def initialize(row, col, config)
    @row = row
    @col = col
    @piece = 'K'
    @config = config
  end

  # list of tuples giving every possible knight move
  def possible_knight_moves
    [[@row + 2, @col + 1], [@row + 2, @col - 1],
     [@row + 1, @col + 2], [@row + 1, @col - 2],
     [@row - 1, @col + 2], [@row - 1, @col - 2],
     [@row - 2, @col + 1], [@row - 2, @col - 1]]
  end

  # validates that a piece can move to the given cell
  # checks if a cell is occupied and if it is inside the given board
  def can_move(chess_board_config, new_row, new_col)
    if chess_board_config.validate_cell(new_row,new_col)
      unless chess_board_config.occupied?(new_row, new_col)
        return true
      end
    end
    false
  end

  # gets all possible moves for a knight with a given board configuration
  # @config current ChessBoard configuration
  # @return an array of all possible knight move configurations
  def get_neighbors
    possible_move_configs = []
    possible_knight_moves.each do |move|
      if can_move(@config, move[0], move[1])
        new_config = ChessBoard.new(@config, @config.row_size, @config.col_size)
        possible_move_config = new_config.move(@config, move[0],move[1], @piece)
        knight = KnightPiece.new(move[0], move[1], possible_move_config)
        possible_move_configs.push(knight)
      end
    end
    possible_move_configs
  end
end