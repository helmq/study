module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |num| num.positive? ? max : num }
      end

      def search(array, query)
        first = 0
        last = array.size - 1
        while first <= last
          middle_index = ((first + last) / 2).round
          middle_value = array[middle_index]
          return middle_index if middle_value == query

          if middle_value < query
            first = middle_index + 1
          else
            last = middle_index - 1
          end
        end
        -1
      end

      def search_recursive(array, query)
        iter = lambda do |first, last|
          return -1 if first > last

          middle_index = ((first + last) / 2).round
          middle_value = array[middle_index]

          return middle_index if middle_value == query

          if middle_value < query
            iter.call((first + last) / 2 + 1, last)
          else
            iter.call(first, (first + last) / 2 - 1)
          end
        end
        iter.call(0, array.size - 1)
      end
    end
  end
end
