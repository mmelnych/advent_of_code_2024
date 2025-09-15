# frozen_string_literal: true

module Day7
  class Task
    OPERATORS_FOR_PART1 = ['+', '*'].freeze
    OPERATORS_FOR_PART2 = ['+', '*', '||'].freeze

    def initialize(sample)
      @sample = sample
    end

    def call1
      input.select { |entry| valid_expression?(entry, OPERATORS_FOR_PART1) }.sum { |x| x[:result] }
    end

    def call2
      input.select { |entry| valid_expression?(entry, OPERATORS_FOR_PART2) }.sum { |x| x[:result] }
    end

    private

    def input
      @input ||= Input.call(@sample)
    end

    def valid_expression?(entry, operators)
      operators.repeated_permutation(entry[:numbers].size - 1).any? do |ops|
        evaluate_expression(entry[:numbers], ops) == entry[:result]
      end
    end

    def evaluate_expression(numbers, ops)
      numbers[1..].each_with_index.reduce(numbers[0]) do |sum, (num, idx)|
        case ops[idx]
        when '||' then "#{sum}#{num}".to_i
        when '+'  then sum + num
        when '*'  then sum * num
        else raise "Unknown operator: #{ops[idx]}"
        end
      end
    end
  end
end
