# frozen_string_literal: true

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max_water = 0
  left = 0
  right = height.length - 1
  while left < right
    max_water = [(right - left) * [height[left], height[right]].min, max_water].max
    if height[right] > height[left]
      left += 1
    elsif height[right] <= height[left]
      right -= 1
    end
  end

  max_water
end

# Input: height = [1,8,6,2,5,4,8,3,7]
# Output: 49
# Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7].
# In this case, the max area of water (blue section) the container can contain is 49.

height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
# height = [2, 2, 2]
puts max_area(height)
