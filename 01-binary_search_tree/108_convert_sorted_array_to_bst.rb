# frozen_string_literal: true

require_relative 'tree_node'
require 'pry'

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  len = nums.length
  return if len.zero?

  sorted_array_bst_helper(nums, 0, len - 1)
end

def sorted_array_bst_helper(nums, low, high)
  return if low > high

  mid = ((high.to_f + low.to_f) / 2).round
  curr = TreeNode.new(nums[mid])

  curr.left = sorted_array_bst_helper(nums, low, mid - 1)
  curr.right = sorted_array_bst_helper(nums, mid + 1, high)
  curr
end

array = [-10, -3, 0, 5, 9]

root = sorted_array_to_bst(array)
print_preorder_dfs(root)
