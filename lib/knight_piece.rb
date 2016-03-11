require_relative 'chess_board'
require_relative 'chess_piece'
class KnightPiece < ChessPiece

  attr_accessor :piece, :config

  def initialize(row, col, config)
    super(row,col)
    @piece = 'K'
    @config = config
  end

  def get_current_cell
     return @row, @col
  end

  def set_new_cell(row, col)
    @row = row
    @col = col
  end

  # list of tuples giving every possible knight move
  def possible_knight_moves
    [[@row + 2, @col + 1], [@row + 2, @col - 1],
     [@row + 1, @col + 2], [@row + 1, @col - 2],
     [@row - 1, @col + 2], [@row - 1, @col - 2],
     [@row - 2, @col + 1], [@row - 2, @col - 1]]
  end

  # gets all possible moves for a knight with a given board configuration
  # @config current ChessBoard configuration
  # @return an array of all possible knight move configurations
  def get_neighbors
    possible_move_configs = []
    possible_knight_moves.each do |move|
      if can_move(@config, move[0], move[1])
        new_config = ChessBoard.new(@config)
        possible_move_config = new_config.move(@config, move[0],move[1], @piece)
        knight = KnightPiece.new(move[0], move[1], possible_move_config)
        possible_move_configs.push(knight)
      end
    end
    possible_move_configs
  end
end