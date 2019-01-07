# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

class Queue
  attr_accessor :queue_array
  def initialize
    @queue_array = []
  end

  def enqueue(node)
    queue_array << node
  end

  def dequeue
    queue_array.delete_at(0)
  end

  def front_item
    queue_array[0]
  end

  def count
    queue_array.count
  end
end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  if root.nil?
    return []
  end

  res = []
  queue = Queue.new
  level = 0
  current_level_flag = 0
  current_level_total = 1
  child_level_flag = 0

  queue.enqueue(root)
  while queue.count > 0
    if res[level].nil?
      res[level] = []
    end
    res[level] << queue.front_item.val

    if queue.front_item.left
      child_level_flag += 1
      queue.enqueue(queue.front_item.left)
    end

    if queue.front_item.right
      child_level_flag += 1
      queue.enqueue(queue.front_item.right)
    end

    current_level_flag += 1
    if current_level_flag >= current_level_total
      level += 1
      current_level_total = child_level_flag
      current_level_flag = 0
      child_level_flag = 0
    end

    queue.dequeue
  end

  res
end

#     3
#   9   20
#      15 7
root = TreeNode.new(3)
root.left = TreeNode.new(9)
root.right = TreeNode.new(20)
root.right.left = TreeNode.new(15)
root.right.right = TreeNode.new(7)

puts level_order(nil).to_s