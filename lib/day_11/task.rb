# frozen_string_literal: true

module Day11
  class Task
    def initialize(sample)
      @sample = sample
      @cache = Hash.new(0)
    end

    def call1
      perform_blinks(25)
    end

    def call2
      perform_blinks(75)
    end

    private

    def perform_blinks(loops_amount)
      input.each { |el| @cache[el] += 1 }

      loops_amount.times do
        calculate_stones_on_blink
      end
      @cache.values.sum
    end

    def calculate_stones_on_blink
      new_cache = Hash.new(0)
      @cache.each do |k, v|
        run_rules(k).each do |el|
          new_cache[el] += v
        end
      end
      @cache = new_cache
    end

    def run_rules(number)
      if number.zero?
        [1]
      elsif number.to_s.size.even?
        split(number)
      else
        [number * 2024]
      end
    end

    def split(number)
      number = number.to_s
      [number[0...number.size / 2], number[number.size / 2..]].map(&:to_i)
    end

    def input
      @input ||= Input.call(@sample)
    end
  end
end
