# frozen_string_literal: true

module Day5
  class Input
    class << self
      INPUT_FILE_PATH = "#{__dir__}/input.txt"
      SAMPLE_INPUT_FILE_PATH = "#{__dir__}/input.sample.txt"

      def call(sample)
        rules_str, pages_str = data(sample).split("\n\n")
        rules = parse_rules(rules_str)
        pages = parse_pages(pages_str)
        { rules: rules, pages: pages }
      end

      private

      def parse_rules(rules_str)
        rules = rules_str.split("\n").map do |line|
          line.split('|').map(&:to_i)
        end
        rules.group_by(&:first).transform_values { |v| v.map(&:last) }
      end

      def parse_pages(pages_str)
        pages_str.split("\n").map do |line|
          line.split(',').map(&:to_i)
        end
      end

      def data(sample)
        sample ? File.read(SAMPLE_INPUT_FILE_PATH) : File.read(INPUT_FILE_PATH)
      end
    end
  end
end
