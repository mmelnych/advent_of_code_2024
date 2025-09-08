# frozen_string_literal: true

module Day5
  class Task
    def initialize(sample)
      @sample = sample
    end

    def call1
      valid = pages.select do |page|
        page.each_with_index.all? do |number, i|
          page[i + 1..].all? { |a| rules[number]&.include?(a) }
        end
      end
      valid.map { |x| x[x.size / 2] }.sum
    end

    def call2; end

    def input
      @input ||= Input.call(@sample)
    end

    def rules
      @rules ||= input[:rules]
    end

    def pages
      @pages ||= input[:pages]
    end
  end
end
