# frozen_string_literal: true

module Day3
  class Task
    def initialize(sample)
      @sample = sample
    end

    def call1
      sum_products(input)
    end

    def call2
      validated_input = filtered_commands_input(input)
      sum_products(validated_input)
    end

    def input
      @input ||= Input.call(@sample)
    end

    private

    def sum_products(input)
      input.scan(/mul\((\d{1,3}),(\d{1,3})\)/).sum { |a, b| a.to_i * b.to_i }
    end

    def filtered_commands_input(input)
      input.gsub(/don't\(\).*?do\(\)/m, '')
    end
  end
end
