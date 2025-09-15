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
      combinations = operators.repeated_permutation(entry[:numbers].size - 1).to_a

      combinations.any? do |ops|
        sum = entry[:numbers].first
        entry[:numbers][1..].each_with_index do |num, idx|
          sum = if ops[idx] == '||'
                  "#{sum}#{num}".to_i
                else
                  sum.send(ops[idx] == '+' ? :+ : :*, num)
                end
        end
        sum == entry[:result]
      end
    end
  end
end
