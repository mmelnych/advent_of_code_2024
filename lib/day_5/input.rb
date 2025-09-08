# frozen_string_literal: true

module Day5
  class Input
    class << self
      INPUT_FILE_PATH = "#{__dir__}/input.txt"
      SAMPLE_INPUT_FILE_PATH = "#{__dir__}/input.sample.txt"

      def call(sample)
        rules, pages = data(sample).split("\n\n")

        rules = rules.split("\n").map do |line|
          line.split('|').map(&:to_i)
        end

        rules = rules.group_by(&:first).transform_values { |v| v.map(&:last) }

        pages = pages.split("\n").map do |line|
          line.split(',').map(&:to_i)
        end
        { rules: rules, pages: pages }
      end

      def data(sample)
        sample ? File.read(SAMPLE_INPUT_FILE_PATH) : File.read(INPUT_FILE_PATH)
      end
    end
  end
end
