# frozen_string_literal: true

module Day5
  class Task
    def initialize(sample)
      @sample = sample
    end

    def call1
      valid_pages = input[:pages].select { |page| correctly_ordered?(page) }

      summirize_middle_elements(valid_pages)
    end

    def call2
      reordered_pages = input[:pages].filter_map do |page|
        next if correctly_ordered?(page)

        reorder_page(page)
      end
      summirize_middle_elements(reordered_pages)
    end

    private

    def input
      @input ||= Input.call(@sample)
    end

    def correctly_ordered?(page)
      page.each_with_index.all? do |number, i|
        page[i + 1..].all? { |a| input[:rules][number]&.include?(a) }
      end
    end

    def reorder_page(page)
      relevant_rules = input[:rules].slice(*page)

      page.each_with_object([]) do |number, valid|
        index = relevant_rules.count { |_k, v| v.include?(number) }
        valid[index] = number
      end
    end

    def summirize_middle_elements(array)
      array.sum { |x| x[x.size / 2] }
    end
  end
end
