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
        iter = lambda do |arr, acc|
          return MyArray.new(acc) if arr.empty?

          val, *rest = arr
          new_val = yield(val)
          iter.call(rest, [*acc, new_val])
        end
        iter.call(self, [])
      end

      # Написать свою функцию my_compact
      def my_compact
        iter = lambda do |arr, acc|
          return MyArray.new(acc) if arr.empty?

          val, *rest = arr
          new_acc = val.nil? ? acc : [*acc, val]
          iter.call(rest, new_acc)
        end
        iter.call(self, [])
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil)
        iter = lambda do |acc, arr|
          return acc if arr.empty?

          val, *rest = arr
          new_acc = yield(acc, val)
          iter.call(new_acc, rest)
        end
        first, *rest = self
        arr = init.nil? ? rest : self
        init ||= first
        iter.call(init, arr)
      end
    end
  end
end
