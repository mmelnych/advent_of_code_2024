# frozen_string_literal: true

module Day6
  class Task
    DIRECTIONS_ORDER = %i[up right down left].freeze

    DIRECTIONS = {
      up: [-1, 0],
      right: [0, 1],
      down: [1, 0],
      left: [0, -1]
    }.freeze

    def initialize(sample)
      @sample = sample
      @visited = Set.new
    end

    def call1
      row, col, direction = find_guardian

      loop do
        return visited.size if out_of_bounds?(row, col)

        visited << [row, col]
        if obstacle_ahead?(row, col, direction)
          direction = turn_right(direction)
        else
          row, col = move(row, col, direction)
        end
      end
    end

    def call2; end

    attr_accessor :visited

    def input
      @input ||= Input.call(@sample)
    end

    private

    def find_guardian
      input.each_with_index do |row, i|
        row.each_with_index do |col, j|
          case col
          when '^' then return [i, j, :up]
          when '>' then return [i, j, :right]
          when 'v' then return [i, j, :down]
          when '<' then return [i, j, :left]
          end
        end
      end
    end

    def move(row, col, direction)
      dr, dc = DIRECTIONS[direction]

      [row + dr, col + dc]
    end

    def turn_right(direction)
      current_index = DIRECTIONS_ORDER.index(direction)
      new_index = (current_index + 1) % DIRECTIONS_ORDER.size
      DIRECTIONS_ORDER[new_index]
    end

    def obstacle_ahead?(row, col, direction)
      dr, dc = DIRECTIONS[direction]
      nr = row + dr
      nc = col + dc

      return false if out_of_bounds?(nr, nc)

      input[nr][nc] == '#'
    end

    def out_of_bounds?(row, col)
      row.negative? || col.negative? || row >= input.size || col >= input[0].size
    end
  end
end
