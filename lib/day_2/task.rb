module Day2
  class Task
    def initialize(sample)
      @sample = sample
    end

    def call1
      input.count do |line|
        valid_report?(line)
      end
    end

    def call2
      input.count do |line|
        valid_report?(line) || single_bad_level?(line)
      end
    end

    def input
      @input ||= Input.call(@sample)
    end

    private

    def valid_report?(line)
      diff = calculate_diff(line)

      (diff.all?(&:positive?) || diff.all?(&:negative?)) && diff.all? { |r| r.abs <= 3 }
    end

    def calculate_diff(line)
      line.each_cons(2).map { |a, b| a - b }
    end

    def single_bad_level?(line)
      [*0...line.length].any? do |i|
        valid_report?(line[0...i] + line[i + 1..])
      end
    end
  end
end
