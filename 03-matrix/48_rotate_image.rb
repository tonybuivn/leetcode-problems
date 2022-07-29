# frozen_string_literal: true

require 'pry'

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  len = matrix.length - 1
  mid = (len + 1) / 2

  i = 0
  while i < mid
    j = i
    while j < len - i
      temp = matrix[i][j]
      matrix[i][j] = matrix[len - j][i] # 0,1 = 2,0
      matrix[len - j][i] = matrix[len - i][len - j] # 2,0 = 3,2
      matrix[len - i][len - j] = matrix[j][len - i] # 3,2 = 1,3
      matrix[j][len - i] = temp # 1,3 = 0,1
      j += 1
    end
    i += 1
  end
end

# Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
# Output: [[7,4,1],[8,5,2],[9,6,3]]

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
rotate(matrix)

# TODO : https://leetcode.com/problems/rotate-image/discuss/18872/A-common-method-to-rotate-the-image
