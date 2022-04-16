# frozen_string_literal: true

require_relative './tree_node'
require_relative './main'

# @param {TreeNode} root
# @return {TreeNode}
def convert_bst(root)
  convert(root, 0)
  root
end

def convert(curr, sum)
  return sum unless curr

  right = convert(curr.right, sum)
  curr.val += right
  convert(curr.left, curr.val)
end

def print_dfs(root)
  return unless root

  puts root.val
  print_dfs(root.left)
  print_dfs(root.right)
end

tree_node = TreeNode.new
array = [4, 1, 6, 0, 2, 5, 7, 3, 8]
array.each { |el| tree_node = insert(tree_node, el) }

print_dfs(tree_node)
puts 'After convert'
print_dfs(convert_bst(tree_node))
