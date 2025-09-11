# frozen_string_literal: true

module Day7
  class Task
    def initialize(sample)
      @sample = sample
    end

    def call1
      result = input.select do |entry|
        operands = ['+', '*'].repeated_permutation(entry[:numbers].size - 1).to_a
        operands.any? do |ops|
          sum = entry[:numbers].first
          entry[:numbers][1..].each_with_index do |num, idx|
            sum = sum.send(ops[idx] == '+' ? :+ : :*, num)
          end
          sum == entry[:result]
        end
      end
      result.sum { |x| x[:result] }
    end

    def call2
      result = input.select do |entry|
        operands = ['+', '*', '||'].repeated_permutation(entry[:numbers].size - 1).to_a
        operands.any? do |ops|
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
      result.sum { |x| x[:result] }
    end

    def input
      @input ||= Input.call(@sample)
    end
  end
end
