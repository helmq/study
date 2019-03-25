module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        iter = lambda do |arr|
          return self if arr.empty?

          val, *rest = arr
          yield(val)
          iter.call(rest)
        end
        iter.call(self)
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        cb = ->(element) { result << yield(element) }
        my_each(&cb)
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        cb = ->(element) { result << element unless element.nil? }
        my_each(&cb)
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil)
        first, *rest = self
        arr = init.nil? ? MyArray.new(rest) : self
        acc = init.nil? ? first : init
        cb = ->(element) { acc = yield(acc, element) }
        arr.my_each(&cb)
        acc
      end
    end
  end
end
