# frozen_string_literal: true

module Day1
  class Task
    def initialize(sample)
      @sample = sample
    end

    def call1
      first_column  = input[:first_column].sort!
      second_column = input[:second_column].sort!

      first_column.zip(second_column).sum { |a, b| (a - b).abs }
    end

    def call2
      first_column  = input[:first_column]
      second_column = input[:second_column]

      first_column.sum { |el| second_column.count(el) * el }
    end

    def input
      @input ||= Input.call(@sample)
    end
  end
end
