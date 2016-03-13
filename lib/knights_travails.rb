require_relative 'chess_board'
require_relative 'knight_solver'
require_relative 'knight_piece'

class KnightsTravails
  attr_accessor :start, :end_goal

  # finds the moves it takes for a knight to move from one point
  # to another on a chess board
  def run
    row_size, col_size = get_input

    path, chess_board = solve(row_size, col_size)

    print_final_configuration(path, chess_board)
  end

  # asks user to specify board dimensions, start, and end positions
  def get_input
    puts 'Please input row size in the following format: row col'

    dimensions = gets

    puts 'Please input the start position in the following format: row col'

    start = gets

    puts 'Please input the end position in the following format: row col'

    end_goal = gets

    dimensions = dimensions.split(' ')
    dimensions = dimensions.map { |num| num.to_i }

    start = start.split(' ')
    @start = start.map { |num| num.to_i }

    end_goal = end_goal.split(' ')
    @end_goal = end_goal.map { |num| num.to_i}

    return dimensions[0], dimensions[1]
  end

  # solves the moves it takes for a knight to move from one point to another
  def solve(row_size, col_size)
    begin
      chess_board = ChessBoard.new(nil,row_size,col_size)
      chess_board.build_board
      chess_board.put_piece(@start[0], @start[1], 'K')
      solver = KnightSolver.new(row_size,col_size)

      return solver.knight_moves(@start, @end_goal), chess_board

    rescue NoMethodError, NameError
      puts 'Invalid configuration'
    end
  end

  # prints the solution in the console
  def print_final_configuration(path, chess_board)
    begin

      puts "Solved in #{path.length} moves"

      path.each do |move|
        puts "#{move.row}, #{move.col}"
      end

      puts

      chess_board.build_finished_board(path, 'K')

      chess_board.row_size.times do |row|
        chess_board.col_size.times do |col|
          print chess_board.board[row][col]
        end
        puts
      end
    rescue NoMethodError
      puts 'Cannot solve this configuration'
    end
  end
end

KnightsTravails.new.run
