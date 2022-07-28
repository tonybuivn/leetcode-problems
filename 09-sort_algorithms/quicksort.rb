# frozen_string_literal: true

def quicksort(arr, low, high)
  return unless low < high

  # pi is partitioning index, arr[pi] is now at right place
  pi = partition(arr, low, high)

  quicksort(arr, low, pi - 1) # Before pi
  quicksort(arr, pi + 1, high) # after pi
  arr
end

def partition(arr, low, high) # rubocop:disable Metrics/MethodLength
  pivot = arr[high]
  swap_index = low
  i = low

  while i < high
    if arr[i] < pivot
      swap(arr, i, swap_index)
      swap_index += 1
    end
    i += 1
  end

  swap(arr, swap_index, high)
  swap_index
end

def swap(arr, low, high)
  arr[low], arr[high] = arr[high], arr[low]
end

# test case
# array = [10, 80, 30, 90, 40, 50, 70]
# puts 'Before sorting..'
# puts array
# puts 'After sorting..'
# puts quicksort(array, 0, array.length - 1)
