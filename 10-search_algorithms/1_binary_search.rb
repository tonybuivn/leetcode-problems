# frozen_string_literal: true

require 'pry'

def binary_search(nums, target)
  left = 0
  right = nums.length - 1
  while left <= right
    mid = (left + right) / 2
    return mid if nums[mid] == target

    if target > nums[mid]
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end

# Find index of the smallest number in array which larger than target
def bisearch_left(nums, target)
  if nums.length == 1
    return nums[0] >= target ? 0 : -1
  end

  left = 0
  right = nums.length - 1
  while left != right
    if left == right - 1
      return left if nums[left] >= target
      return right if nums[right] >= target

      return -1
    end

    mid = (left + right) / 2
    if nums[mid] < target
      left = mid
    elsif nums[mid] >= target
      right = mid
    end
  end
end

# nums = [2, 3, 6, 6, 8, 9]
# nums = [10]
# nums = [4, 10]
# puts bisearch_left(nums, 4)
