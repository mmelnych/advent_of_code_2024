# frozen_string_literal: true

module Day9
  class Task
    def initialize(sample)
      @sample = sample
    end

    def call1
      disk = build_disk
      compact(disk)
      calculate_sum(disk)
    end

    def call2; end

    private

    def build_disk
      disk = []
      input.each_with_index do |(present, empty), i|
        disk.concat([i] * present.to_i)
        disk.concat([nil] * empty.to_i)
      end
      disk
    end

    def compact(disk)
      disk.size.times do |i|
        next if disk[i]

        disk.pop while disk[-1].nil?
        disk[i] = disk.pop
      end
    end

    def calculate_sum(disk)
      disk.compact.map.with_index { |x, i| x * i }.sum
    end

    def input
      @input ||= Input.call(@sample)
    end
  end
end
