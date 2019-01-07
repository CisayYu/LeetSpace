# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  res = []
  if root == nil or root.val == nil
    return []
  end

  if root.left
    res << postorder_traversal(root.left)
  end

  if root.right
    res << postorder_traversal(root.right)
  end

  res << root.val

  res.flatten
end

class Stack
  attr_accessor :stack_array
  def initialize
    @stack_array = []
  end

  def push(node)
    stack_array << node
  end

  def peek
    stack_array[stack_array.count - 1]
  end

  def pop
    stack_array.delete_at(stack_array.count - 1)
  end

  def count
    stack_array.count
  end
end

def postorder_traversal_iterative(root)
  res = []
  if root == nil or root.val == nil
    return []
  end

  stack = Stack.new

  stack.push(root)

  while stack.count > 0
    current = stack.peek
    # 向左遍历
    if current.left
      stack.push(current.left)
      current.left = nil
      next
    end

    # 向右遍历
    if current.right
      stack.push(current.right)
      current.right = nil
      next
    end

    # 遍历父节点后返回
    res << stack.pop.val
  end

  res
end

#     1
#   2   4
# 3
root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.left.left = TreeNode.new(3)
root.right = TreeNode.new(4)

puts postorder_traversal_iterative(root)