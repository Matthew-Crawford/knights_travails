require_relative 'chess_board'
require_relative 'knight_solver'
require_relative 'knight_piece'

class KnightsTravails
  attr_accessor :start, :end_goal

  # checks if the end location has been found
  def at_goal?(curr_location)
    @end_goal.eql?(curr_location)
  end

  def run(start, end_goal)

    @start = start
    @end_goal = end_goal

    chess_board = ChessBoard.new
    chess_board.build_board
    chess_board.initialize_piece(0,0,"K")
    solver = KnightSolver.new

    path = solver.knight_moves(@start,@end_goal)
  end

  KnightsTravails.new.run([0,0], [3,3])

end