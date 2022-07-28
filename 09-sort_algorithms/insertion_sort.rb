# frozen_string_literal: true

require 'pry'

def insertion_sort(arr)
  i = 1
  while i < arr.length
    key = arr[i]
    j = i - 1
    while j >= 0 && key < arr[j]
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = key
    i += 1
  end
end

arr = [12, 11, 13, 5, 6]
insertion_sort(arr)
puts arr
