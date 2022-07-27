# frozen_string_literal: true

# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  (row = matrix.shift) ? row + spiral_order(matrix.transpose.reverse) : []
end

def spiral_order_v2(matrix)
  res = []
  return res if matrix.empty?

  row_start = 0
  row_end = matrix.length - 1
  col_start = 0
  col_end = matrix[0].length - 1

  while row_start <= row_end && col_start <= col_end
    # traverse right
    (col_start..col_end).each_with_index { |col| res << matrix[row_start][col] }
    row_start += 1

    # traverse down
    (row_start..row_end).each_with_index { |row| res << matrix[row][col_end] }
    col_end -= 1

    # traverse left
    if row_start <= row_end
      col = col_end
      while col >= col_start
        res << matrix[row_end][col]
        col -= 1
      end
    end
    row_end -= 1

    # traverse up
    if col_start <= col_end
      row = row_end
      while row >= row_start
        res << matrix[row][col_start]
        row -= 1
      end
    end
    col_start += 1
  end

  res
end

# Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
# Output: [1,2,3,6,9,8,7,4,5]

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts spiral_order_v2(matrix)
