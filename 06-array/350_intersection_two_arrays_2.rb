# frozen_string_literal: true

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  nums1.sort!
  nums2.sort!
  res = []

  i = 0
  j = 0
  while i < nums1.length && j < nums2.length
    if nums1[i] < nums2[j]
      i += 1
    elsif nums1[i] > nums2[j]
      j += 1
    else
      res << nums1[i]
      i += 1
      j += 1
    end
  end
  res
end

# Follow-up questions
# Consider using external-sort

# nums1 = [1, 2, 2, 1]
# nums2 = [2, 2]
nums1 = [4, 9, 5]
nums2 = [9, 4, 9, 8, 4]

puts intersect(nums1, nums2)
