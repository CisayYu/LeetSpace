# 标准答案
def two_sum(nums, target)
  # 利用哈希表存储数组元素，方便查找
  hash_table = {}
  nums.each_with_index do |v1, k1|
    # 算出另一个数
    component = target - v1
    # 从哈希表查找此数对应的下标，找到则返回，否则将当前键值对存入哈希表
    index = hash_table.key(component)
    if index != nil && index != k1
      return [index, k1]
    end
    hash_table[k1] = v1
  end
end

# 不使用hash，通过数组的部分遍历来匹配
def two_sum_without_hash_table(nums, target)
  nums.each_with_index do |value, index|
    for i in 0...index
      if target - value == nums[i]
        return [i, index]
      end
    end
  end
end

# 不使用key方法，自己遍历hash表来检查元素
def two_sum_without_key_function(nums, target)
  hashTable = {}
  nums.each_with_index do |v1, k1|
    component = target - v1
    index = -1
    hashTable.each_key do |key|
      if hashTable[key] == component
        index = key
      end
    end
    if index != -1 && index != k1
      return [index, k1]
    end
    hashTable[k1] = v1
  end
end

# 48ms AC
def two_sum_shortest_time(nums, target)
  # 用哈希表存储数组的值-键对
  hash_table = nums.each_with_index.to_h
  component = nums.find.with_index do |value, key|
    # 找到符合条件的一对值，及其键
    component_index = hash_table[target - value]
    component_index and component_index != key
  end
  # 返回键
  [nums.index(component), hash_table[target - component]].sort
end

puts two_sum_shortest_time([2,5,5,11], 10)