# frozen_string_literal: true

module Day20
  class Input
    class << self
      INPUT_FILE_PATH = "#{__dir__}/input.txt"
      SAMPLE_INPUT_FILE_PATH = "#{__dir__}/input.sample.txt"

      def call(sample)
        data(sample).split("\n")
      end

      def data(sample)
        sample ? File.read(SAMPLE_INPUT_FILE_PATH) : File.read(INPUT_FILE_PATH)
      end
    end
  end
end
