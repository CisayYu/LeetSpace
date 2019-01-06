def length_of_longest_substring(s)
  if s == ""
    return 0
  end
  array = s.split("")
  result_length = 0
  temp_index = -1
  temp_length = 0
  store_character = {}
  array.each_with_index do |value, index|
    if store_character[value] == nil || store_character[value] < temp_index
      if temp_index == -1
        temp_index = index
        temp_length = 1
        store_character[value] = index
        next
      end
      store_character[value] = index
      temp_length += 1
    else
      if temp_length > result_length
        result_length = temp_length
      end
      temp_length = index - store_character[value]
      temp_index = store_character[value] + 1
      store_character[value] = index
    end
  end

  if temp_length > result_length
    result_length = temp_length
  end

  result_length
end

puts length_of_longest_substring(s = "abba")