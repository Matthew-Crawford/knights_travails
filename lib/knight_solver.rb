require_relative 'knights_travails'
require_relative 'knight_piece'

class KnightSolver

  attr_accessor :knight_piece

  # build an array representing the moves the knight would need to take
  def build_path(map, goal)
    path = Array.new
    current = goal
    while map.key(current) != current
      path.unshift(current)
      current = map.key(current)
    end
    path.push(current)
    path
  end

  def knight_moves(start, end_goal)
    path = Array.new
    knights = KnightsTravails.new
    map = Hash.new
    queue = Array.new

    map[start] = start
    queue.add(start)

    found = knights.at_goal?(start)

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