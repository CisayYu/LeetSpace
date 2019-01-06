def convert(s, num_rows)
  step = num_rows - 1
  str_array = s.split("")

  # 特殊情况特殊处理，字符串太短直接返回
  if str_array.count <= 1 or num_rows == 1
    return s
  end

  hash_table = {}
  str_array.each_with_index do |value, index|
    # 求除数和余数
    time = index/step
    component = index%step
    # 当除数为偶数时，当前元素需要被映射到余数所对应的hash
  	if time.even?
      if hash_table[component]
        hash_table[component] << value
      else
        hash_table[component] = [value]
      end
    else
      # 当除数为奇数时，当前元素需要被映射到步长减去余数所对应的hash
      if hash_table[step - component]
        hash_table[step - component] << value
      else
        hash_table[step - component] = [value]
      end
  	end
  end

  res = []
  for i in 0..step
    if hash_table[i] == nil
      break
    end
  	hash_table[i].each do |value|
      res << value
    end
  end

  res.join
end

puts convert("AB", 3)