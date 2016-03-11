require_relative 'chess_board'
require_relative 'knight_solver'
require_relative 'knight_piece'

class KnightsTravails
  attr_accessor :start, :end_goal

  def initialize(start, end_goal)
    @start = start
    @end_goal = end_goal
  end

  # checks if the end location has been found
  def at_goal?(curr_config)
    @end_goal == [curr_config.row,curr_config.col]
  end

  def run

    @start = start
    @end_goal = end_goal

    chess_board = ChessBoard.new(nil,5,5)
    chess_board.build_board
    chess_board.initialize_piece(start[0],start[1],'K')
    solver = KnightSolver.new

    path = solver.knight_moves(@start,@end_goal)

    path.each do |move|
      puts "#{move.row}, #{move.col}"
    end

    chess_board.build_finished_board(path, 'K')

    chess_board.row_size.times do |row|
      chess_board.col_size.times do |col|
        print chess_board.board[row][col]
      end
      puts
    end

  end

  KnightsTravails.new([3,3],[0,0]).run

end