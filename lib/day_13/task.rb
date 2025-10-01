# frozen_string_literal: true

module Day13
  class Task
    def initialize(sample)
      @sample = sample
    end

    def call1 # rubocop:disable Metrics/AbcSize
      input.sum do |(a1, a2, b1, b2, x, y)|
        click_b = (a2 * x - y * a1) / (a2 * b1 - a1 * b2).to_f
        click_a = (x - b1 * click_b) / a1

        next 0 unless click_b.to_i == click_b && click_a.to_i == click_a

        click_b + click_a * 3
      end.to_i
    end

    def call2 # rubocop:disable Metrics/AbcSize
      input.sum do |(a1, a2, b1, b2, x, y)|
        x += 10_000_000_000_000
        y += 10_000_000_000_000

        click_b = (a2 * x - y * a1) / (a2 * b1 - a1 * b2).to_f
        click_a = (x - b1 * click_b) / a1

        next 0 unless click_b.to_i == click_b && click_a.to_i == click_a

        click_b + click_a * 3
      end.to_i
    end

    def input
      @input ||= Input.call(@sample)
    end
  end
end
