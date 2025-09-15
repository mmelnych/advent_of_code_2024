# frozen_string_literal: true

module Day9
  class Task
    def initialize(sample)
      @sample = sample
    end

    def call1
      disk = []
      input.with_index do |(present, empty), i|
        disk.concat([i] * present.to_i)
        disk.concat([nil] * empty.to_i)
      end
      disk.size.times do |i|
        next if disk[i]

        disk.pop while disk[-1].nil?

        disk[i] = disk.pop
      end
      disk.compact.map.with_index { |x, i| x * i }.sum
    end

    def call2; end

    def input
      @input ||= Input.call(@sample)
    end
  end
end
