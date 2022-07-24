# frozen_string_literal: true

require 'pry'

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  index_1 = bs_matrix_layer_1(matrix, target)

  return false if index_1 == -1

  binary_search(matrix[index_1], target)
end

def bs_matrix_layer_1(matrix, target)
  left = 0
  right = matrix.length - 1
  while left <= right
    mid = (left + right) / 2
    return mid if matrix[mid][0] <= target && matrix[mid][-1] >= target

    if matrix[mid][0] > target
      right = mid - 1
    elsif matrix[mid][-1] < target
      left = mid + 1
    end
  end
  -1
end

def binary_search(arr, target)
  left = 0
  right = arr.length - 1
  while left <= right
    mid = (left + right) / 2
    return true if arr[mid] == target

    if arr[mid] > target
      right = mid - 1
    else
      left = mid + 1
    end
  end
  false
end

def search_matrix_v2(matrix, target)
  matrix.flatten!
  binary_search(matrix, target)
end

# Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
# Output: true

# matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]
# puts bs_matrix_layer_1(matrix, 0)

# TODO: https://leetcode.com/problems/search-a-2d-matrix/discuss/26220/Don't-treat-it-as-a-2D-matrix-just-treat-it-as-a-sorted-list
