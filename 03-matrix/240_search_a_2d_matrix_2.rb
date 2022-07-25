# frozen_string_literal: true

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.nil? || matrix.empty? || matrix[0].empty?

  col = matrix[0].length - 1
  row = 0

  while col >= 0 && row < matrix.length
    return true if matrix[row][col] == target

    if matrix[row][col] > target
      col -= 1
    elsif matrix[row][col] < target
      row += 1
    end
  end
  false
end

# Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
# Output: true

# matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
# puts search_matrix(matrix, 123)
