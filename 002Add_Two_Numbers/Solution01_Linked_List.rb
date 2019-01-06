class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# 数组生成单链表
def generate_list_node(array)
  pointer = nil
  l1 = nil
  array.each do |v|
    if l1 == nil
      l1 = ListNode.new(v)
      pointer = l1
      next
    end
    temp_list_node = ListNode.new(v)
    pointer.next = temp_list_node
    pointer = temp_list_node
  end
  l1
end

# 原地反转单链表
def reverse_list(l)
  p1 = nil
  p2 = nil
  temp = l
  loop do
    # 当前节点
    p1 = temp
    # temp 指向下一个节点
    temp = p1.next
    # 当前节点反转
    p1.next = p2
    # 去下一个节点进行反转
    p2 = p1
    if temp == nil
      l = p1
      break
    end
  end
  l
end

# 获取单链表对应的数字
def get_number_of_node_list(l)
  temp = l
  array = []
  loop do
    if temp == nil
      break
    end
    array << temp.val
    temp = temp.next
  end
  array.join.to_i
end

# 获取数字对应的单链表
def get_node_list_of_number(number)
  array = number.to_s.split("")
  generate_list_node array
end

array1 = [2, 4, 3]
array2 = [5, 6, 4]

l1 = generate_list_node(array1)
l2 = generate_list_node(array2)

def add_two_numbers(l1, l2)
  number1 = get_number_of_node_list reverse_list l1
  number2 = get_number_of_node_list reverse_list l2
  reverse_list get_node_list_of_number number1 + number2
end

l = add_two_numbers(l1, l2)
loop do
  puts l.val
  l = l.next
  if l == nil
    break
  end
end
