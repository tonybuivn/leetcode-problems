# frozen_string_literal: true

require_relative './tree_node'
require 'pry'

# @param {TreeNode} root
# @return {TreeNode}
def increasing_bst(root)
  result_increasing_bst(root, nil)
end

def result_increasing_bst(curr, _next) # rubocop:disable Lint/UnderscorePrefixedVariableName
  return _next unless curr

  res = result_increasing_bst(curr.left, curr)

  curr.left = nil
  curr.right = result_increasing_bst(curr.right, _next)
  res
end

array = [5, 3, 6, 2, 4, 8, 1, 7, 9]
tree_node = TreeNode.new(array[0])
array.each { |el| tree_node = insert(tree_node, el) }

puts 'Before convert'
print_preorder_dfs(tree_node)
puts 'After convert...'
print_preorder_dfs(increasing_bst(tree_node))
