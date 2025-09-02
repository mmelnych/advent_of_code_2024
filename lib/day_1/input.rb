# frozen_string_literal: true

module Day1
  class Input
    class << self
      INPUT_FILE_PATH = "#{__dir__}/input.txt"
      SAMPLE_INPUT_FILE_PATH = "#{__dir__}/input.sample.txt"

      def call(sample)
        first_column = []
        second_column = []

        File.foreach(data(sample)) do |line|
          col1, col2 = line.split(/\s+/)
          first_column << col1.to_i
          second_column << col2.to_i
        end
        { first_column: first_column, second_column: second_column }
      end

      def data(sample)
        sample ? SAMPLE_INPUT_FILE_PATH : INPUT_FILE_PATH
      end
    end
  end
end
