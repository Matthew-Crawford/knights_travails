require_relative 'knights_travails'
require_relative 'knight_piece'

# a move solver that provides methods to solve
class KnightSolver

  attr_accessor :row_size, :col_size

  def initialize(row_size, col_size)
    @row_size = row_size
    @col_size = col_size
  end

  # checks if the end location has been found
  def at_goal?(curr_config, end_goal)
    end_goal == [curr_config.row,curr_config.col]
  end

  # build an array representing the moves the knight would need to take
  def build_path(map, goal)
    path = Array.new
    current = goal
    until map[current] == current
      path.unshift(current)
      current = map[current]
    end
    path
  end

  # uses a BFS solving algorithm to find the path from one point to another
  def knight_moves(start, end_goal)
    map = Hash.new
    queue = Array.new

    start_chess_board = ChessBoard.new(nil, @row_size, @col_size)
    start_chess_board.put_piece(start[0], start[1], 'K')

    map[start] = start
    initial_piece = KnightPiece.new(start[0],start[1], start_chess_board)

    if start == end_goal
      return build_path(map, initial_piece)
    end

    queue.push(initial_piece)

    until queue.empty?
      current = queue.shift
      current.get_neighbors.each do |neighbor|
        if at_goal?(neighbor, end_goal)
          map[neighbor] = current
          return build_path(map, neighbor)
        elsif !map.key?(neighbor)
          map[neighbor] = current
          queue.push(neighbor)
        end
      end
    end
    false
  end
end