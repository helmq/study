module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array.reduce { |max, el| el > max ? el : max }
        array.map { |num| num.positive? ? max_element : num }
      end

      def search(array, query, first = 0, last = array.size - 1)
        return -1 if first > last

        middle_index = ((first + last) / 2).round
        middle_value = array[middle_index]

        return search(array, query, (first + last) / 2 + 1, last) if middle_value < query
        return search(array, query, first, (first + last) / 2 - 1) if middle_value > query

        middle_index
      end
    end
  end
end
