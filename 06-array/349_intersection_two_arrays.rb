# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
# O(n)
def intersection(nums1, nums2)
  check_hash = {}
  result = []

  nums1.each { |num| check_hash[num] = check_hash[num].nil? ? 1 : check_hash[num] + 1 }
  nums2.each do |num|
    # binding.pry
    if check_hash[num] && check_hash[num] > 0
      result << num
      check_hash[num] = 0
    end
  end
  result
end

# O(nlogn)
def intersection_using_sort(nums1, nums2)
  nums1.sort!
  nums2.sort!
  res = []

  i = 0
  j = 0
  while i < nums1.size && j < nums2.size
    if nums1[i] > nums2[j]
      j += 1
    elsif nums1[i] < nums2[j]
      i += 1
    else
      res << nums1[i] if res.empty? || res[res.length - 1] != nums1[i]
      i += 1
      j += 1
    end
  end
  res
end

def intersection_binary_search(nums1, nums2)
  # TODO: Apply binary search
  # O(nlogn)
end

# nums1 = [1, 2, 2, 1]
# nums2 = [2, 2]
nums1 = [4, 9, 5]
nums2 = [9, 4, 9, 8, 4]

puts intersection_using_sort(nums1, nums2)
