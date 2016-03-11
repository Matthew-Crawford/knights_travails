require_relative 'knights_travails'
require_relative 'knight_piece'

class KnightSolver

  attr_accessor :knight_piece

  # build an array representing the moves the knight would need to take
  def build_path(map, goal)
    path = Array.new
    current = goal
    while map[current] != current
      path.unshift(current)
      current = map[current]
    end
    path
  end

  def knight_moves(start, end_goal)
    path = Array.new
    knights = KnightsTravails.new(start, end_goal)
    map = Hash.new
    queue = Array.new

    start_chess_board = ChessBoard.new
    start_chess_board.initialize_piece(start[0], start[1], "K")

    map[start] = start
    initial_piece = KnightPiece.new(start[0],start[1], start_chess_board)
    queue.push(initial_piece)

    found = knights.at_goal?(initial_piece)

    while !queue.empty? && !found
      current = queue.shift
      current.get_neighbors.each do |neighbor|
        if knights.at_goal?(neighbor)
          map[neighbor] = current
          found = true
          path = build_path(map, neighbor)
        elsif !map.key?(neighbor)
          map[neighbor] = current
          queue.push(neighbor)
        end
      end
    end

    return path if found
    false
  end
end